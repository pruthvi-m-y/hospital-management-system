<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    // Ensure doctor is logged in
    Integer doctorId = (Integer) session.getAttribute("doctor_id");
    String doctorName = (String) session.getAttribute("doctor_name");

    if (doctorId == null) {
        response.sendRedirect("doctor_login.jsp");
        return;
    }

    // Database Connection
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
    <title>Doctor Appointments | Hospital</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        /* Sidebar */
        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            background-color: #2c3e50;
            padding-top: 20px;
            color: white;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
        }
        .sidebar a:hover {
            background-color: #1a252f;
        }
        .content {
            margin-left: 260px;
            padding: 20px;
        }
        .logout-btn {
            color: red;
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #34495e;
            color: white;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2 style="text-align: center;">Doctor Panel</h2>
        <a href="doctor_dashboard.jsp">🏠 Dashboard</a>
        <a href="doctor_appointments.jsp">📅 View Appointments</a>
        <a href="doctor_logout.jsp" class="logout-btn">🔴 Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>📅 Your Appointments, Dr. <%= doctorName %></h2>
        <hr>

        <table>
            <tr>
                <th>Patient Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Appointment Date</th>
                <th>Appointment Time</th>
            </tr>

            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                    // Get all appointments for the logged-in doctor
                    String sql = "SELECT p.name, a.age, a.gender, a.appointment_date, a.appointment_time " +
                                 "FROM appointments a " +
                                 "JOIN patients p ON a.patient_id = p.id " +
                                 "WHERE a.doctor_id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, doctorId);
                    rs = pstmt.executeQuery();

                    boolean hasAppointments = false;
                    while (rs.next()) {
                        hasAppointments = true;
            %>
                        <tr>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getInt("age") %></td>
                            <td><%= rs.getString("gender") %></td>
                            <td><%= rs.getDate("appointment_date") %></td>
                            <td><%= rs.getTime("appointment_time") %></td>
                        </tr>
            <%
                    }
                    if (!hasAppointments) {
                        out.println("<tr><td colspan='5'>No appointments found.</td></tr>");
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
    </div>

</body>
</html>
