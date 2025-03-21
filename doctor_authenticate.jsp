<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Get email and password from the form
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/hospital";
    String dbUser = "root";  
    String dbPassword = "Panda@2003";  

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish Connection
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Prepare SQL Query
        String sql = "SELECT * FROM doctors WHERE email = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, email);
        pstmt.setString(2, password);

        // Execute Query
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Successful login: Store doctor details in session
            session.setAttribute("doctor_id", rs.getInt("id"));
            session.setAttribute("doctor_name", rs.getString("name"));
            session.setAttribute("specialization", rs.getString("specialization"));
            
            // Redirect to doctor dashboard
            response.sendRedirect("doctor_dashboard.jsp");
        } else {
%>
            <script>
                alert("Invalid Email or Password!");
                window.location.href = "doctor_login.jsp";
            </script>
<%
        }
    } catch (Exception e) {
        out.println("<h3>Database Connection Error: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) {}
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
        try { if (conn != null) conn.close(); } catch (SQLException e) {}
    }
%>
