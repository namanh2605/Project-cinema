<%-- 
    Document   : login
    Created on : Jan 20, 2024, 2:26:54 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login1.css">
    <title>Đăng nhập</title>
</head>
<body>

<div class="auth-container">
    <h2>Đăng nhập</h2>
    <form action="login" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Đăng nhập</button>
    </form>
    <p>Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a></p>
</div>
    <% 
    String error = request.getParameter("error");
    if (error != null && error.equals("1")) {
%>
    <p style="color: red;">Tài khoản hoặc mật khẩu không đúng. Vui lòng thử lại.</p>
<% } %>

     <%
String registrationSuccess = request.getParameter("registrationSuccess");
if (registrationSuccess != null && registrationSuccess.equals("true")) {
%>
<p style="color: red;
    font-weight: bold;">
        Đăng ký thành công!
    </p>
<%
}
%>

</body>
</html>
