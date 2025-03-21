<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    if (session.getAttribute("patient_id") == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }
    String patientName = (String) session.getAttribute("patient_name");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment</title>
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

        /* Appointment Form */
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
    max-width: 600px;  /* Increased width */
    padding: 30px;  /* Adjusted padding */
    background: white;
    border-radius: 10px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: stretch;  /* Ensures full-width alignment */
    margin: auto;  /* Centers the container */
}

.form-group {
    width: 100%;  /* Makes sure form fields take full width */
    margin-bottom: 15px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;  /* Aligns labels and inputs properly */
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

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="patient_dashboard.jsp"><i class="fa-solid fa-home"></i> Home</a>
        <a href="book_appointment.jsp"><i class="fa-solid fa-calendar-check"></i> Book Appointment</a>
        <a href="view_appointments.jsp"><i class="fa-solid fa-list"></i> View Appointments</a>
        <a href="health_tips.jsp"><i class="fa-solid fa-heartbeat"></i> Health Tips</a>
        <a href="logout.jsp" class="logout"><i class="fa-solid fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Appointment Booking Form -->
    <div class="content">
        <h2>Book an Appointment</h2>

        <div class="form-container">
            <form action="save_appointment.jsp" method="post">
                <div class="form-group">
                    <label>Name:</label>
                    <input type="text" name="name" value="<%= patientName %>" readonly>
                </div>

                <div class="form-group">
                    <label>Age:</label>
                    <input type="number" name="age" required>
                </div>

                <div class="form-group">
                    <label>Gender:</label>
                    <select name="gender" required>
                        <option value="">-- Select Gender --</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Select Specialization:</label>
                    <select name="specialization" required>
                        <option value="">-- Select Specialization --</option>
                        <option value="General Consultant">General Consultant</option>
                        <option value="Gynecologist">Gynecologist</option>
                        <option value="Cardiologist">Cardiologist</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Select Doctor:</label>
                    <select name="doctor_id" required>
                        <option value="">-- Select Doctor --</option>
                        <%
                            Connection con = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Panda@2003");

                                String query = "SELECT id, name, specialization FROM doctors";
                                ps = con.prepareStatement(query);
                                rs = ps.executeQuery();

                                while (rs.next()) {
                                    int doctorId = rs.getInt("id");
                                    String doctorName = rs.getString("name");
                                    String specialization = rs.getString("specialization");
                        %>
                                    <option value="<%= doctorId %>"><%= doctorName %> - <%= specialization %></option>
                        <%
                                }
                            } catch (Exception e) {
                                out.println("<b>Error fetching doctors:</b> " + e.getMessage());
                            } finally {
                                if (rs != null) rs.close();
                                if (ps != null) ps.close();
                                if (con != null) con.close();
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label>Appointment Date:</label>
                    <input type="date" name="appointment_date" required>
                </div>

                <div class="form-group">
                    <label>Appointment Time:</label>
                    <input type="time" name="appointment_time" required>
                </div>

                <button type="submit">Book Appointment</button>
            </form>
        </div>
    </div>

</body>
</html>
