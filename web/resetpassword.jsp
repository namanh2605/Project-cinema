<%-- 
    Document   : resetpassword
    Created on : Mar 15, 2024, 11:05:27 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/register.css">
    </head>
   <body>
    <h2>Reset Password</h2>
    <div class="auth-container">
    <form action="resetpassword" method="post">
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required><br>
        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>
        <input type="hidden" name="email" value="<%= request.getSession().getAttribute("email") %>">
        <button type="submit">Reset Password</button>
    </form>
    </div>
</body>
</html>