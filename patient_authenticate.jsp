<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Get username and password from the form
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/hospital";
    String dbUser = "root";  // Change this if your DB has a different username
    String dbPassword = "Panda@2003";  // Change this if your DB has a password

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish Connection
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Prepare SQL Query
        String sql = "SELECT * FROM patients WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        // Execute Query
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Successful login: Store user details in session
            session.setAttribute("patient_id", rs.getInt("id"));
            session.setAttribute("patient_name", rs.getString("name"));
            session.setAttribute("username", username);
            
            // Redirect to patient dashboard
            response.sendRedirect("patient_dashboard.jsp");
        } else {
            // Failed login: Show error message
%>
            <script>
                alert("Invalid Username or Password!");
                window.location.href = "patient_login.jsp";
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
