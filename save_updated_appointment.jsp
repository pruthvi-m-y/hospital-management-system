<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    // Check if user is logged in
    if (session.getAttribute("patient_id") == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }

    int patientId = (int) session.getAttribute("patient_id");

    // Get appointment details from form
    int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));
    String appointmentDate = request.getParameter("appointment_date");
    String appointmentTime = request.getParameter("appointment_time");
    int age = Integer.parseInt(request.getParameter("age"));

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Panda@2003");

        // Update appointment
        String query = "UPDATE appointments SET appointment_date = ?, appointment_time = ?, age = ? WHERE id = ? AND patient_id = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, appointmentDate);
        ps.setString(2, appointmentTime);
        ps.setInt(3, age);
        ps.setInt(4, appointmentId);
        ps.setInt(5, patientId);

        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            session.setAttribute("message", "Appointment updated successfully!");
        } else {
            session.setAttribute("message", "Failed to update appointment. Please try again.");
        }

    } catch (Exception e) {
        session.setAttribute("message", "Error: " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }

    response.sendRedirect("view_appointments.jsp");
%>
