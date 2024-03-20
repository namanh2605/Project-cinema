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
                padding: 200px;
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
    <script>function changeLanguage() {
            var languageIcon = document.querySelector(".language-icon");
            var currentLanguage = languageIcon.alt;

            // Nếu ngôn ngữ hiện tại là tiếng Anh, chuyển sang tiếng Việt và ngược lại
            if (currentLanguage === "Vietnamese") {
                languageIcon.src = "img/united-kingdom.png";
                languageIcon.alt = "English";
                // Thay đổi các văn bản trong phần footer
                document.getElementById("aboutUsLink").innerText = "About us";
                document.getElementById("cinemaText").innerText = "Cinema";
                document.getElementById("cinemaLocationLink").innerText = "Cinemas Hoa Lac - Hotline 0333 333 333";
                document.getElementById("connectText").innerText = "CONNECT WITH US";
                document.getElementById("contactText").innerText = "CONTACT";
                document.getElementById("companyText").innerText = "Hoa Lac Company";

                // Thay đổi các văn bản trong phần header
                document.getElementById("scheduleLink").innerText = "Home";
                document.getElementById("movieLink").innerText = "Now Showing";
                document.getElementById("newsLink").innerText = "News & Offers";
                document.getElementById("memberLink").innerText = "Members";

                // Thay đổi các văn bản trong phần pre-header
                document.getElementById("loginLink").innerText = "Login";
                document.getElementById("registerLink").innerText = "Register";
                document.getElementById("cotent1").innerText = "Coming Soon";
            } else {
                // Nếu ngôn ngữ hiện tại là tiếng Việt, chuyển sang tiếng Anh
                languageIcon.src = "img/vietnam.png";
                languageIcon.alt = "Vietnamese";
                // Thay đổi các văn bản trong phần footer
                document.getElementById("aboutUsLink").innerText = "Về chúng tôi";
                document.getElementById("cinemaText").innerText = "Rạp Chiếu Phim";
                document.getElementById("cinemaLocationLink").innerText = "Rạp Chiếu Phim Hoa Lac - Hotline 0333 333 333";
                document.getElementById("connectText").innerText = "KẾT NỐI VỚI CHÚNG TÔI";
                document.getElementById("contactText").innerText = "LIÊN HỆ";
                document.getElementById("companyText").innerText = "Công Ty Hoa Lac";

                // Thay đổi các văn bản trong phần header
                document.getElementById("scheduleLink").innerText = "Trang chủ";
                document.getElementById("movieLink").innerText = "Phim Đang Chiếu";
                document.getElementById("newsLink").innerText = "Tin Mới & Ưu Đãi";
                document.getElementById("memberLink").innerText = "Thành Viên";

                // Thay đổi các văn bản trong phần pre-header
                document.getElementById("loginLink").innerText = "Đăng nhập";
                document.getElementById("registerLink").innerText = "Đăng ký";
                document.getElementById("cotent1").innerText = "Sắp ra mắt";
            }
        }
    </script>
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
            <p id="cotent1">Coming Soon</p>
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