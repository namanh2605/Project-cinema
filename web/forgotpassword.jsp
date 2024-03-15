<%-- 
    Document   : forgotpassword
    Created on : Mar 14, 2024, 2:33:30 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/register.css"/>
    </head>
    <body>
    <h2>Forgot Password</h2>
    <div class="auth-container">
    <form action="forgotpassword" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <button type="submit">Send Verification Code</button>
    </form>
    </div>
</body>
</html>