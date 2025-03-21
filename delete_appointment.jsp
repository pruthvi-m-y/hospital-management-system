<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    // Check if user is logged in
    if (session.getAttribute("patient_id") == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }

    int patientId = (int) session.getAttribute("patient_id");
    int appointmentId = Integer.parseInt(request.getParameter("id"));

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Panda@2003");

        // Delete query
        String query = "DELETE FROM appointments WHERE id = ? AND patient_id = ?";
        ps = con.prepareStatement(query);
        ps.setInt(1, appointmentId);
        ps.setInt(2, patientId);

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            session.setAttribute("message", "Appointment deleted successfully!");
        } else {
            session.setAttribute("message", "Error: Unable to delete appointment.");
        }

        response.sendRedirect("view_appointments.jsp");

    } catch (Exception e) {
        out.println("<b>Error deleting appointment:</b> " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
