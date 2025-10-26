<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital Management System</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
    <style>
        /* Apply full-page background */
        body {
            background-image: url('main.jpg');
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Transparent container */
        .welcome-container {
            background: rgba(255, 255, 255, 0.2); /* Fully transparent white */
            backdrop-filter: blur(10px); /* Glassmorphism effect */
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 400px; /* Larger container */
        }

        /* Title styling */
        .title {
            font-size: 28px;
            font-weight: bold;
            color: #ffffff; /* White text for visibility */
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
            margin-bottom: 20px;
        }

        /* Role selection buttons */
        .role-selection button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px;
            cursor: pointer;
            margin: 10px 0;
            width: 100%;
            font-size: 18px;
            transition: 0.3s;
        }

        .role-selection button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body style="background-color:main.jpg">
    <div class="welcome-container">
        <div class="title">Hospital Management System</div>
        <p style="color: #fff; font-size: 18px;">Please choose your role to continue:</p>
        
        <div class="role-selection">
            <button onclick="window.location.href='doctor_login.jsp'">Continue as Doctor</button>
            <button onclick="window.location.href='patient_login.jsp'">Continue as Patient</button>
            <button onclick="window.location.href='admin_login.jsp'">Continue as Admin</button>
        </div>
    </div>
</body>
</html>


