<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    if (session.getAttribute("patient_id") == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }
    int patientId = (int) session.getAttribute("patient_id");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Appointments</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

body {
    font-family: 'Poppins', sans-serif;
    color: #333;
    margin: 0;
    padding: 0;
    display: flex;
    height: 100vh;
    background: #ffffff;
}

.sidebar {
    width: 250px;
    background: #007bff;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 15px;
    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
}

.sidebar a {
    width: 90%;
    padding: 15px;
    font-size: 18px;
    font-weight: bold;
    color: white;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 10px;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 10px;
    transition: 0.3s;
}

.sidebar a:hover {
    background: rgba(255, 255, 255, 0.4);
    transform: scale(1.05);
}

.logout {
    background: rgba(255, 0, 0, 0.8);
}

.logout:hover {
    background: rgba(255, 0, 0, 1);
}

h2 {
    font-size: 26px;
    color: #007bff;
    margin-bottom: 20px;
}

.content {
    flex-grow: 1;
    padding: 40px;
    text-align: center;
}

/* Table Styling */
.appointments-table {
    width: 100%;
    max-width: 800px;
    margin: auto;
    border-collapse: collapse;
    background: white;
    border-radius: 10px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
}

.appointments-table th, 
.appointments-table td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
    text-align: left;
    white-space: nowrap; /* Prevents text from wrapping */
}

/* Header Row */
.appointments-table th {
    background: #007bff;
    color: white;
}

/* Fixes Button Layout */
.appointments-table td:last-child {
    width: 180px; /* Adjusted width for better button spacing */
    text-align: center;
}

/* Button Styling */
.btn {
    padding: 8px 12px;
    border: none;
    cursor: pointer;
    font-size: 14px;
    border-radius: 5px;
    transition: 0.3s;
    display: inline-block;
    margin: 2px; /* Added spacing between buttons */
}

.btn-update {
    background: #ffc107;
    color: black;
}

.btn-update:hover {
    background: #e0a800;
}

.btn-delete {
    background: #dc3545;
    color: white;
}

.btn-delete:hover {
    background: #c82333;
}

    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="patient_dashboard.jsp"><i class="fa-solid fa-home"></i> Home</a>
        <a href="book_appointment.jsp"><i class="fa-solid fa-calendar-check"></i> Book Appointment</a>
        <a href="view_appointment.jsp"><i class="fa-solid fa-list"></i> View Appointments</a>
        <a href="health_tips.jsp"><i class="fa-solid fa-heartbeat"></i> Health Tips</a>
        <a href="logout.jsp" class="logout"><i class="fa-solid fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Content -->
    <div class="content">
        <h2>Your Appointments</h2>

        <table class="appointments-table">
            <tr>
                <th>Name</th>
                <th>Doctor</th>
                <th>Specialization</th>
                <th>Date</th>
                <th>Time</th>
                <th>Actions</th>
            </tr>

            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Panda@2003");

                    String query = "SELECT a.id, a.name, d.name AS doctor_name, d.specialization, a.appointment_date, a.appointment_time " +
                                   "FROM appointments a " +
                                   "JOIN doctors d ON a.doctor_id = d.id " +
                                   "WHERE a.patient_id = ?";
                    ps = con.prepareStatement(query);
                    ps.setInt(1, patientId);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        int appointmentId = rs.getInt("id");
                        String patientName = rs.getString("name");
                        String doctorName = rs.getString("doctor_name");
                        String specialization = rs.getString("specialization");
                        String appointmentDate = rs.getString("appointment_date");
                        String appointmentTime = rs.getString("appointment_time");
            %>
            <tr>
                <td><%= patientName %></td>
                <td><%= doctorName %></td>
                <td><%= specialization %></td>
                <td><%= appointmentDate %></td>
                <td><%= appointmentTime %></td>
                <td>
                    <a href="update_appointment.jsp?id=<%= appointmentId %>" class="btn btn-update">Update</a>
                    <a href="delete_appointment.jsp?id=<%= appointmentId %>" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this appointment?')">Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<b>Error fetching appointments:</b> " + e.getMessage());
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                }
            %>
        </table>
    </div>

</body>
</html>
