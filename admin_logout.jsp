<%@ page session="true" %>
<%
    // Invalidate the session to log out the admin
    session.invalidate();
    
    // Redirect to admin login page
    response.sendRedirect("index.jsp");
%>
