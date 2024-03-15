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
        <title>Login</title>
    </head>
    <body>

        <div class="auth-container">
            <h2>Login</h2>
            <form action="login" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
            <p>Do not have an account <a href="register.jsp">Register now</a></p>
            <p>Forgot password?<a href="forgotpassword.jsp">Click here</a></p>
        </div>

        <% 
        String error = request.getParameter("error");
        if (error != null && error.equals("1")) {
        %>
        <p style="color: red;">Account or password is incorrect. Please try again.</p>
        <% } %>

        <%
        String registrationSuccess = request.getParameter("registrationSuccess");
        if (registrationSuccess != null && registrationSuccess.equals("true")) {
        %>
        <p style="color: red;
           font-weight: bold;">
            Sign Up Success!
        </p>
        <%
        }
        %>
        <%
        Boolean passwordChanged = (Boolean) request.getSession().getAttribute("passwordChanged");
        if (passwordChanged != null && passwordChanged) {
        %>
        <p style="color: green;">Password was successfully changed. Please log in again.</p>
        <%
        request.getSession().removeAttribute("passwordChanged");
        }
        %>
    </body>
</html>
