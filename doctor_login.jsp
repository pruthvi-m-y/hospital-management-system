<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Login | Hospital Management</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- External CSS -->
    <style>
        /* Full-screen background */
        body {
            background: url('doctor_bg.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* Glassmorphism login container */
        .login-container {
            background: rgba(255, 255, 255, 0.3); /* Transparent effect */
            backdrop-filter: blur(12px); /* Blur for glass effect */
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 350px;
            color: black; /* Set text color to black */
        }

        /* Title Styling */
        .login-container h2 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
            color: black; /* Set title color to black */
        }

        /* Input field design */
        .input-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            background: rgba(255, 255, 255, 0.5); /* Semi-transparent background */
            border-radius: 8px;
            padding: 10px;
        }

        .input-group input {
            border: none;
            outline: none;
            background: none;
            width: 100%;
            font-size: 16px;
            color: black; /* Input text in black */
            padding: 5px;
        }

        .input-group i {
            margin-right: 10px;
            color: black; /* Icons in black */
        }

        /* Placeholder color */
        ::placeholder {
            color: rgba(0, 0, 0, 0.7);
        }

        /* Login button */
        .login-btn {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            transition: 0.3s;
        }

        .login-btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* New Doctor Registration Link */
        .new-user {
            margin-top: 10px;
        }

        .new-user a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .new-user a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Doctor Login</h2>

        <form action="doctor_authenticate.jsp" method="post">
            <div class="input-group">
                <i class="fa fa-user-md"></i> <!-- Doctor icon -->
                <input type="text" name="email" placeholder="Email" required>
            </div>

            <div class="input-group">
                <i class="fa fa-lock"></i> <!-- Lock icon -->
                <input type="password" name="password" placeholder="Password" required>
            </div>

            <button type="submit" class="login-btn">Login</button>
        </form>

        <div class="new-user">
            <a href="doctor_register.jsp">New Doctor? Register Here</a>
        </div>
    </div>

    <!-- Font Awesome for icons -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>
