<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String specialization = request.getParameter("specialization");
    String password = request.getParameter("password");

    String jdbcURL = "jdbc:mysql://localhost:3306/hospital";
    String dbUser = "root";
    String dbPassword = "Panda@2003";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Check if email or phone already exists
        String checkQuery = "SELECT * FROM doctors WHERE email = ? OR phone = ?";
        pstmt = conn.prepareStatement(checkQuery);
        pstmt.setString(1, email);
        pstmt.setString(2, phone);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
%>
            <script>
                alert("Email or Phone already exists!");
                window.location.href = "doctor_register.jsp";
            </script>
<%
        } else {
            // Insert doctor details into the database
            String sql = "INSERT INTO doctors (name, specialization, email, phone, password) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, specialization);
            pstmt.setString(3, email);
            pstmt.setString(4, phone);
            pstmt.setString(5, password); // Save password directly (hash it for security)

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
%>
                <script>
                    alert("Registration successful! Please login.");
                    window.location.href = "doctor_login.jsp";
                </script>
<%
            } else {
%>
                <script>
                    alert("Registration failed. Try again.");
                    window.location.href = "doctor_register.jsp";
                </script>
<%
            }
        }
    } catch (Exception e) {
        out.println("<h3>Database Connection Error: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
        try { if (conn != null) conn.close(); } catch (SQLException e) {}
    }
%>
