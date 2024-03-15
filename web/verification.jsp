<%-- 
    Document   : verification
    Created on : Mar 15, 2024, 11:04:55 PM
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
        <div class="auth-container">
    <h2>Verification</h2>
    <form action="verifycode" method="post">
        <label for="verificationCode">Mã xác nhận:</label>
        <input type="text" id="verificationCode" name="verificationCode" required><br>
        <button type="submit">Xác minh</button>
    </form>
        </div>
    <% 
    String error =(String) request.getAttribute("error");
    if (error != null) {
    %>
    <p style="color: red;"><%= error %></p>
    <% } %>
</body>
</html>