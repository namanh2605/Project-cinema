<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="css/register.css">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>
      function validateForm() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var response = grecaptcha.getResponse();

        if (password !== confirmPassword) {
            alert("Mật khẩu và xác nhận mật khẩu phải giống nhau.");
            return false;
        }

        if (response.length === 0) {
            alert("Vui lòng tích vào ô Captcha.");
            return false;
        }

        return true;
    }
</script>
</head>
<body>

<div class="auth-container">
    <h2>Đăng ký</h2>
    <form action="register" method="post"  onsubmit="return validateForm()">
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
        <!-- Trường xác nhận mật khẩu -->
        <div class="form-group">
            <label for="confirmPassword">Xác nhận mật khẩu:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <!-- Thêm reCAPTCHA -->
        <div class="g-recaptcha" data-sitekey="6LeAkOgUAAAAACcy3uY6N9H9SJMS27n3Zx2OOnYK" style="padding: 10px"></div>
        <button type="submit" class="btn btn-primary">Đăng ký</button>
    </form>
    <p>Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a></p>
</div>
  <% String error = request.getParameter("error");
if (error != null && error.equals("1")) { %>
<p style=" color: red;
    font-weight: bold;">Đăng ký không thành công. Vui lòng thử lại.</p>
<% } %>

</body>
</html>
