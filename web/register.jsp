<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/register.css">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
    function validateForm() {
        var username = document.getElementById("username").value;
        var email = document.getElementById("email").value;
        var name = document.getElementById("name").value;
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var response = grecaptcha.getResponse();

        if (username === '' ) {
            alert("Please fill in username.");
            return false;
        }
        if ( email === '') {
            alert("Please fill in email.");
            return false;
        }
        if ( name === '') {
            alert("Please fill in name.");
            return false;
        }
        if ( password === '' ) {
            alert("Please fill in password.");
            return false;
        }
        if ( confirmPassword === '') {
            alert("Please fill in confirmPassword.");
            return false;
        }
        if (!validateEmail(email)) {
            alert("Please enter a valid email address.");
            return false;
        }

        if (password !== confirmPassword) {
            alert("Password and confirm password must be the same.");
            return false;
        }

        if (response.length === 0) {
            alert("Vui lòng tích vào ô Captcha.");
            return false;
        }

        return true;
    }

    function validateEmail(email) {
        var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
    }
</script>
    </head>
    <body>

        <div class="auth-container">
            <h2>Register</h2>
            <form action="register" method="post" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" required><br>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                <div class="g-recaptcha" data-sitekey="6LeAkOgUAAAAACcy3uY6N9H9SJMS27n3Zx2OOnYK" style="padding: 10px"></div>
                <button type="submit" class="btn btn-primary">Register</button>
            </form>
            <p>Do you already have an account? <a href="login.jsp">Login</a></p>
        </div>
        <% String error = request.getParameter("error");
if (error != null && error.equals("1")) { %>
        <p style=" color: red;
           font-weight: bold;">Registration failed. Please try again. (Duplicate account name or email!)</p>
        <% } %>

    </body>
</html>
