<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    // Check if the doctor is logged in
    Integer doctorId = (Integer) session.getAttribute("doctor_id");
    String doctorName = (String) session.getAttribute("doctor_name");
    String specialization = (String) session.getAttribute("specialization");

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
    <title>Doctor Dashboard | Hospital</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        /* Sidebar Styling */
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
        .quote-box {
            background: #ecf0f1;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-style: italic;
            text-align: center;
            color: #2c3e50;
        }
        .btn {
            padding: 10px 15px;
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            display: block;
            margin: 20px auto;
            text-align: center;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        #appointmentSection {
            display: none; /* Initially hidden */
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2 style="text-align: center;">Doctor Panel</h2>
        <a href="doctor_dashboard.jsp">Dashboard</a>
        <a href="doctor_appointments.jsp">View Appointments</a>
        <a href="doctor_logout.jsp" class="logout-btn">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Welcome, Dr. <%= doctorName %></h2>
        <p><b>Specialization:</b> <%= specialization %></p>
        <hr>

        <!-- Motivational Quote -->
        <div class="quote-box">
            <p>"The best way to find yourself is to lose yourself in the service of others." – Mahatma Gandhi</p>
        </div>

        
</body>
</html>
