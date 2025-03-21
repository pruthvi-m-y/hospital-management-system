<%@ page session="true" %>

<%
    // Invalidate the session to log out the doctor
    session.invalidate();
%>

<script>
    alert("You have been logged out successfully.");
    window.location.href = "index.jsp"; // Redirect to login page
</script>
