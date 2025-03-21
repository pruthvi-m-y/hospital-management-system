<%@ page session="true" %>
<%
    // Invalidate the session
    session.invalidate();

    // Redirect to index.jsp
    response.sendRedirect("index.jsp");
%>
