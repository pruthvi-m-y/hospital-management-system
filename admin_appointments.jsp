<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    Integer adminId = (Integer) session.getAttribute("admin_id");

    if (adminId == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

    String jdbcURL = "jdbc:mysql://localhost:3306/hospital";
    String dbUser = "root";
    String dbPassword = "Panda@2003";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin | View Appointments</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>📅 All Appointments</h2>
        <table class="table table-bordered">
            <tr>
                <th>Patient Name</th>
                <th>Doctor</th>
                <th>Specialization</th>
                <th>Appointment Date</th>
                <th>Time</th>
            </tr>

            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                    String sql = "SELECT p.name AS patient_name, d.name AS doctor_name, d.specialization, " +
                                 "a.appointment_date, a.appointment_time " +
                                 "FROM appointments a " +
                                 "JOIN patients p ON a.patient_id = p.id " +
                                 "JOIN doctors d ON a.doctor_id = d.id";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getString("patient_name") %></td>
                            <td><%= rs.getString("doctor_name") %></td>
                            <td><%= rs.getString("specialization") %></td>
                            <td><%= rs.getDate("appointment_date") %></td>
                            <td><%= rs.getTime("appointment_time") %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </table>

        <a href="admin_dashboard.jsp" class="btn btn-secondary">⬅ Back to Dashboard</a>
    </div>
</body>
</html>
