<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    // Database credentials
    String dbURL = "jdbc:mysql://localhost:3306/hospital";
    String dbUser = "root";
    String dbPassword = "Panda@2003";

    // Retrieve form data
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    Connection con = null;
    PreparedStatement pst = null;

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish Connection
        con = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL Query to insert new patient
        String sql = "INSERT INTO patients (username, password, name, gender, phone, address) VALUES (?, ?, ?, ?, ?, ?)";
        pst = con.prepareStatement(sql);
        pst.setString(1, username);
        pst.setString(2, password);
        pst.setString(3, name);
        pst.setString(4, gender);
        pst.setString(5, phone);
        pst.setString(6, address);

        int rowsInserted = pst.executeUpdate();

        if (rowsInserted > 0) {
            // Successful registration → Redirect to patient login page
            response.sendRedirect("patient_login.jsp");
        } else {
            // Registration failed → Show error message
%>
            <script>
                alert("Registration failed. Please try again.");
                window.location.href = "patient_register.jsp";
            </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("Error: <%= e.getMessage() %>");
            window.location.href = "patient_register.jsp";
        </script>
<%
    } finally {
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
