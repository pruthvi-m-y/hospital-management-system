<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
// Ensure proper encoding
request.setCharacterEncoding("UTF-8");

// Retrieve Patient ID from Session
Integer patientId = (Integer) session.getAttribute("patient_id");

// If session expired or user is not logged in, show alert and stay on page
if (patientId == null) {
    out.println("<script>alert('Error: You must be logged in to book an appointment!'); window.history.back();</script>");
    return;
}

// Retrieve Form Data
String name = request.getParameter("name");
String ageStr = request.getParameter("age");
String gender = request.getParameter("gender");
String specialization = request.getParameter("specialization");
String doctorIdStr = request.getParameter("doctor_id");
String appointmentDate = request.getParameter("appointment_date");
String appointmentTime = request.getParameter("appointment_time");

// Validate Input
if (name == null || name.trim().isEmpty() ||
    ageStr == null || ageStr.trim().isEmpty() ||
    gender == null || gender.trim().isEmpty() ||
    specialization == null || specialization.trim().isEmpty() ||
    doctorIdStr == null || doctorIdStr.trim().isEmpty() ||
    appointmentDate == null || appointmentDate.trim().isEmpty() ||
    appointmentTime == null || appointmentTime.trim().isEmpty()) {
    
    out.println("<script>alert('Error: All fields are required!'); window.history.back();</script>");
    return;
}

int age, doctorId;
try {
    age = Integer.parseInt(ageStr);
    doctorId = Integer.parseInt(doctorIdStr);
} catch (NumberFormatException e) {
    out.println("<script>alert('Error: Invalid age or doctor selection!'); window.history.back();</script>");
    return;
}

// Database Connection
Connection conn = null;
PreparedStatement stmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Panda@2003");

    // Insert appointment into database
    String sql = "INSERT INTO appointments (patient_id, name, age, gender, specialization, doctor_id, appointment_date, appointment_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    stmt = conn.prepareStatement(sql);
    stmt.setInt(1, patientId);
    stmt.setString(2, name);
    stmt.setInt(3, age);
    stmt.setString(4, gender);
    stmt.setString(5, specialization);
    stmt.setInt(6, doctorId);
    stmt.setString(7, appointmentDate);
    stmt.setString(8, appointmentTime);

    int rowsInserted = stmt.executeUpdate();
    
    if (rowsInserted > 0) {
        out.println("<script>alert('Appointment booked successfully!'); window.location.href='book_appointment.jsp';</script>");
    } else {
        out.println("<script>alert('Error: Unable to book appointment. Please try again.'); window.history.back();</script>");
    }
} catch (Exception e) {
    e.printStackTrace();
    out.println("<script>alert('Database error: " + e.getMessage() + "'); window.history.back();</script>");
} finally {
    try { if (stmt != null) stmt.close(); } catch (SQLException e) {}
    try { if (conn != null) conn.close(); } catch (SQLException e) {}
}
%>
