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
    ResultSet rs = null;

    String name = "", specialization = "", doctorId = "", appointmentDate = "", appointmentTime = "", gender = "";
    int age = 0;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Panda@2003");

        // Fetch appointment details
        String query = "SELECT * FROM appointments WHERE id = ? AND patient_id = ?";
        ps = con.prepareStatement(query);
        ps.setInt(1, appointmentId);
        ps.setInt(2, patientId);
        rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            age = rs.getInt("age");
            gender = rs.getString("gender");
            specialization = rs.getString("specialization");
            doctorId = rs.getString("doctor_id");
            appointmentDate = rs.getString("appointment_date");
            appointmentTime = rs.getString("appointment_time");
        } else {
            session.setAttribute("message", "Invalid appointment ID.");
            response.sendRedirect("view_appointment.jsp");
            return;
        }

    } catch (Exception e) {
        out.println("<b>Error fetching appointment details:</b> " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Appointment</title>
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

        .content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 40px;
        }

        .form-container {
            width: 100%;
            max-width: 600px;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
        }

        .form-group {
            width: 100%;
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        label {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        button {
            width: 100%;
            background: #28a745;
            color: white;
            padding: 12px;
            border: none;
            cursor: pointer;
            font-size: 18px;
            border-radius: 5px;
            transition: 0.3s;
        }

        button:hover {
            background: #218838;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <a href="patient_dashboard.jsp"><i class="fa-solid fa-home"></i> Home</a>
        <a href="book_appointment.jsp"><i class="fa-solid fa-calendar-check"></i> Book Appointment</a>
        <a href="view_appointment.jsp"><i class="fa-solid fa-list"></i> View Appointments</a>
        <a href="view_bills.jsp"><i class="fa-solid fa-credit-card"></i> View Bills</a>
        <a href="health_tips.jsp"><i class="fa-solid fa-heartbeat"></i> Health Tips</a>
        <a href="logout.jsp" class="logout"><i class="fa-solid fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="content">
        <h2>Update Appointment</h2>

        <div class="form-container">
            <form action="save_updated_appointment.jsp" method="post">
                <input type="hidden" name="appointment_id" value="<%= appointmentId %>">

                <div class="form-group">
                    <label>Name:</label>
                    <input type="text" name="name" value="<%= name %>" readonly>
                </div>

                <div class="form-group">
                    <label>Age:</label>
                    <input type="number" name="age" value="<%= age %>" required>
                </div>

                <div class="form-group">
                    <label>Appointment Date:</label>
                    <input type="date" name="appointment_date" value="<%= appointmentDate %>" required>
                </div>

                <div class="form-group">
                    <label>Appointment Time:</label>
                    <input type="time" name="appointment_time" value="<%= appointmentTime %>" required>
                </div>

                <button type="submit">Update Appointment</button>
            </form>
        </div>
    </div>

</body>
</html>
