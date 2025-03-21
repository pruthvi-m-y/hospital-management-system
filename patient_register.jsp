<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Registration | Hospital Management</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- External CSS -->
    <style>
        /* Full-screen background */
        body {
            background: url('hospital_bg.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* Glassmorphism registration container */
        .register-container {
            background: rgba(255, 255, 255, 0.3); /* Transparent effect */
            backdrop-filter: blur(12px); /* Blur for glass effect */
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 400px;
            color: black; /* Set text color to black */
        }

        /* Title Styling */
        .register-container h2 {
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

        .input-group input, .input-group select {
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

        /* Register button */
        .register-btn {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            transition: 0.3s;
        }

        .register-btn:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        /* Already have an account */
        .already-user {
            margin-top: 10px;
        }

        .already-user a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .already-user a:hover {
            text-decoration: underline;
        }
    </style>

    <script>
        function validateForm() {
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirm_password").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="register-container">
        <h2>Patient Registration</h2>

        <form action="patient_register_process.jsp" method="post" onsubmit="return validateForm();">
            <div class="input-group">
                <i class="fa fa-user"></i> <!-- User icon -->
                <input type="text" name="username" placeholder="Username" required>
            </div>

            <div class="input-group">
                <i class="fa fa-user"></i> <!-- User icon -->
                <input type="text" name="name" placeholder="Full Name" required>
            </div>

            <div class="input-group">
                <i class="fa fa-venus-mars"></i> <!-- Gender icon -->
                <select name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="input-group">
                <i class="fa fa-phone"></i> <!-- Phone icon -->
                <input type="text" name="phone" placeholder="Phone Number" required>
            </div>

            <div class="input-group">
                <i class="fa fa-home"></i> <!-- Address icon -->
                <input type="text" name="address" placeholder="Address" required>
            </div>

            <div class="input-group">
                <i class="fa fa-lock"></i> <!-- Lock icon -->
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>

            <div class="input-group">
                <i class="fa fa-lock"></i> <!-- Lock icon -->
                <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" required>
            </div>

            <button type="submit" class="register-btn">Register</button>
        </form>

        <div class="already-user">
            <a href="patient_login.jsp">Already have an account? Login here</a>
        </div>
    </div>

    <!-- Font Awesome for icons -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>
