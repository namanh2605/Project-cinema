<%-- 
    Document   : register
    Created on : Feb 15, 2024, 11:24:09 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
        <link rel="stylesheet" href="css/register.css">
    </head>
    <body>

<div class="auth-container">
    <h2>Đăng ký</h2>
    <form action="register" method="post">
        <div class="form-group">
            <label for="name">Tên:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Đăng ký</button>
    </form>
    <p>Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a></p>
</div>

</body>
</html>
