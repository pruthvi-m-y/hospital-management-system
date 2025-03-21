<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Registration | Hospital Management</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- External CSS -->
    <style>
        /* General Page Styling */
body {
    font-family: Arial, sans-serif;
    background: url('hospital_bg.jpg') no-repeat center center fixed;
    background-size: cover;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Form Container */
.container {
    background: rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(12px);
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    width: 380px;
    text-align: center;
}

/* Form Heading */
h2 {
    margin-bottom: 20px;
    font-size: 24px;
    color: black;
}

/* Input Fields */
input[type="text"],
input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: none;
    outline: none;
    border-radius: 6px;
    background: rgba(255, 255, 255, 0.7);
    font-size: 16px;
}

/* Submit Button */
button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 12px;
    width: 100%;
    font-size: 18px;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background-color: #218838;
    transform: scale(1.05);
}

/* Login Link */
.link {
    margin-top: 10px;
}

.link a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
}

.link a:hover {
    text-decoration: underline;
}

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
        <h2>Doctor Registration</h2>

        <form action="doctor_register_process.jsp" method="post">
    <input type="text" name="name" placeholder="Full Name" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="text" name="phone" placeholder="Phone Number" required>
    <input type="text" name="specialization" placeholder="Specialization" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Register</button>
</form>

        <div class="already-user">
            <a href="doctor_login.jsp">Already have an account? Login here</a>
        </div>
    </div>

    <!-- Font Awesome for icons -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>
