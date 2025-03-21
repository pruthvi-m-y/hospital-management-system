<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    // Check if admin is logged in
    Integer adminId = (Integer) session.getAttribute("admin_id");
    String adminName = (String) session.getAttribute("admin_name");

    if (adminId == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

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
    <title>Admin Dashboard | Hospital</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Welcome, <%= adminName %></h2>
        <hr>
        
        <h3>📌 Doctor Details</h3>
        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Specialization</th>
                <th>Email</th>
                <th>Phone</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                    
                    // Fetch all doctors
                    String sql = "SELECT * FROM doctors";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("specialization") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("phone") %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </table>

        <h3>📌 Patient Details</h3>
        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Phone</th>
                <th>Address</th>
            </tr>
            <%
                try {
                    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                    
                    // Fetch all patients
                    String sql = "SELECT * FROM patients";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("gender") %></td>
                            <td><%= rs.getString("phone") %></td>
                            <td><%= rs.getString("address") %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </table>

        <a href="admin_appointments.jsp" class="btn btn-primary">📅 View Appointments</a>
        <a href="admin_logout.jsp" class="btn btn-danger">🚪 Logout</a>
    </div>
</body>
</html>
