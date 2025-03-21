<%@ page session="true" %>
<%
    if (session.getAttribute("patient_id") == null) {
        response.sendRedirect("patient_login.jsp");
    }
    String patientName = (String) session.getAttribute("patient_name");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard</title>
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
            padding: 20px;
        }

        header {
            font-size: 2.5rem;
            font-weight: 600;
            background: linear-gradient(45deg, #ff758c, #ff7eb3);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 20px;
        }

        .welcome-message {
            font-size: 1.8rem;
            font-weight: 500;
            color: #555;
            background: #f9f9f9;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            max-width: 80%;
            text-align: center;
        }

        .quote {
            font-size: 1.3rem;
            font-style: italic;
            color: #007bff;
            margin-top: 15px;
        }

    </style>
</head>
<body>
    <div class="sidebar">
        <a href="patient_dashboard.jsp"><i class="fa-solid fa-calendar-check"></i> Home</a>
        <a href="book_appointment.jsp"><i class="fa-solid fa-calendar-check"></i> Book Appointment</a>
        <a href="view_appointments.jsp"><i class="fa-solid fa-list"></i> View Appointments</a>
        <a href="health_tips.jsp"><i class="fa-solid fa-heartbeat"></i> Health Tips</a>
        <a href="logout.jsp" class="logout"><i class="fa-solid fa-sign-out-alt"></i> Logout</a>
    </div>
    
    <div class="content">
        <header>Welcome, <%= patientName %> 👋</header>
        <div class="welcome-message">
            "Your health is your greatest wealth. Take care, stay strong, and embrace every new day with positivity!"
            <div class="quote">— Stay healthy, stay happy! 🌿</div>
        </div>
    </div>
</body>
</html>
