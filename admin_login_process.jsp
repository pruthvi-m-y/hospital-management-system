<%@ page import="java.sql.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String jdbcURL = "jdbc:mysql://localhost:3306/hospital";
    String dbUser = "root";
    String dbPassword = "Panda@2003";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "SELECT id, name FROM admin WHERE username=? AND password=SHA2(?, 256)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            session.setAttribute("admin_id", rs.getInt("id"));
            session.setAttribute("admin_name", rs.getString("name"));
            response.sendRedirect("admin_dashboard.jsp");
        } else {
            response.sendRedirect("admin_login.jsp?error=1");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
