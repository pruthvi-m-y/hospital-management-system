<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String message = "";
    if (request.getParameter("error") != null) {
        message = "❌ Invalid Username or Password!";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login | Hospital</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        body {
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #2c3e50;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn-login {
            background-color: #2c3e50;
            color: white;
            width: 100%;
        }
        .btn-login:hover {
            background-color: #1a252f;
        }
        .error-message {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>🔐 Admin Login</h2>
        
        <% if (!message.isEmpty()) { %>
            <p class="error-message"><%= message %></p>
        <% } %>

        <form action="admin_login_process.jsp" method="POST">
            <input type="text" name="username" class="form-control" placeholder="Username" required>
            <input type="password" name="password" class="form-control" placeholder="Password" required>
            <button type="submit" class="btn btn-login">Login</button>
        </form>
    </div>

</body>
</html>
