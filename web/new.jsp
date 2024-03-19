<%-- 
    Document   : new
    Created on : Mar 19, 2024, 4:36:32 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Account" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <link rel="stylesheet" href="css/style1.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css"/>
        <title>Your Movie Theater - Home</title>
        <style>
            .container {
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Space between cards */
            justify-content: center;
        }
            .content {
    background-color: #121212;
    color: white;
    text-align: center;
    padding: 100px;
    font-size: 24px;
}

.content p {
    animation: blinker 1s linear infinite;
}

@keyframes blinker {
    50% {
        opacity: 0;
    }
}
        </style>
    </head>
    <body>
        <div class="pre-header">
            <div class="container">
                <div class="header-right">
                    <% 
                    HttpSession sessionObj = request.getSession(false);
                    Account loggedInMember = null;
                    if (sessionObj != null) {
                        loggedInMember = (Account) sessionObj.getAttribute("loggedInAccount");
                    }
                    %>
                    <div class="language-selector">
                        <img src="img/vietnam.png" alt="Vietnamese" class="language-icon" onclick="changeLanguage()">
                    </div>
                    <% if (loggedInMember != null) { %>
                    <p class="auth-link" id="loggedInUser" style="padding-top: 11px"><%= loggedInMember.getUsername() %></p>
                    <a href="logout.jsp" class="auth-link">Đăng xuất</a>
                    <% } else { %>
                    <a href="login.jsp" class="auth-link" id="loginLink">Đăng nhập</a>
                    <a href="register.jsp" class="auth-link" id="registerLink">Đăng ký</a>
                    <% } %>
                </div>
            </div>
        </div>
        <!-- Main header with navigation menu -->
        <header class="site-header">
            <img src="img/logoc.png" alt="Your Company Logo" class="logo" id="logo">
            <div class="container">
                <nav class="site-nav" id="siteNav">
                    <ul>
                        <li><a href="home"  id="scheduleLink"> Trang Chủ</a></li>
                        <li><a href="film" id="movieLink" >Phim Đang Chiếu</a></li>
                        <li><a href="#" id="newsLink">Tin Mới & Ưu Đãi</a></li>
                        <li><a href="user.jsp" id="memberLink" style="padding-left: 40px" >Thành Viên</a></li>
                    </ul>
                </nav>
            </div>
        </header>

    <div class="content">
        <p>Coming Soon</p>
    </div>

    <footer class="site-footer bg-dark text-light pt-4">
            <div class="container">
                <div class="row footer-content pb-3">
                    <div class="col-md-3 footer-section">
                        <img src="img/logoc.png" alt="Cinema Hoa Lac" class="footer-logo mb-2">
                        <ul class="list-unstyled">
                            <li><a href="#" class="text-light" id="aboutUsLink" style="padding-left: 33px">Về chúng tôi</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 footer-section">
                        <h3 id="cinemaText">Rạp Chiếu Phim</h3>
                        <ul class="list-unstyled">
                            <li><a href="#" class="text-light" id="cinemaLocationLink">Rạp Chiếu Phim Hoa Lac - Hotline 0333 333 333</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 footer-section">
                        <h3 id="connectText">Kết Nối Với Chúng Tôi</h3>
                    </div>
                    <div class="col-md-3 footer-section">
                        <h3 id="contactText">Liên Hệ</h3>
                        <p id="companyText">Công Ty Hoa Lac</p>
                    </div>
                </div>
                <div class="row" style="padding-bottom: 40px">
                    <div class="col-12 text-center text-light py-3">
                        © 2024 Công Ty Hoa Lac. All rights reserved.
                    </div>
                </div>
            </div>
        </footer>
</body>
</html>