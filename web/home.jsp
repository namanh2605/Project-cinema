<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Account" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style1.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <title>Your Movie Theater - Home</title>
    </head>
    <script>
        function changeLanguage() {
            var languageIcon = document.querySelector(".language-icon");
            var currentLanguage = languageIcon.alt;

            // Nếu ngôn ngữ hiện tại là tiếng Anh, chuyển sang tiếng Việt và ngược lại
            if (currentLanguage === "English") {
                languageIcon.src = "img/vietnam.png";
                languageIcon.alt = "Tiếng Việt";
                // Thay đổi tất cả các văn bản trong trang sang tiếng Việt
                document.getElementById("loginLink").innerText = "Đăng nhập";
                document.getElementById("registerLink").innerText = "Đăng ký";
                document.getElementById("scheduleLink").innerText = "Lịch Chiếu Theo Rạp";
                document.getElementById("movieLink").innerText = "Phim";
                document.getElementById("theaterLink").innerText = "Rạp";
                document.getElementById("priceLink").innerText = "Giá Vé";
                document.getElementById("newsLink").innerText = "Tin Tức & Ưu Đãi";
                document.getElementById("franchiseLink").innerText = "Nhượng Quyền";
                document.getElementById("memberLink").innerText = "Thành Viên";
                document.getElementById("welcomeText").innerText = "Chào mừng bạn đến với rạp chiếu phim ";
                document.getElementById("discoverText").innerText = "Khám phá những bộ phim mới nhất.";
                document.getElementById("exploreBtn").innerText = "Khám Phá Ngay";
                document.getElementById("movieTitle").innerText = "Tiêu đề Phim";
                document.getElementById("movieGenre").innerText = "Thể loại: Tâm lý, Tình cảm";
                document.getElementById("movieLength").innerText = "Thời lượng: 131 phút";
                document.getElementById("buyTicketBtn").innerText = "Đặt Vé";
                document.getElementById("aboutUsLink").innerText = "Về chúng tôi";
                document.getElementById("cinemaText").innerText = "Rạp Chiếu Phim";
                document.getElementById("cinemaLocationLink").innerText = "Rạp Chiếu Phim Hoa Lac - Hotline 0333 333 333";
                document.getElementById("connectText").innerText = "KẾT NỐI VỚI CHÚNG TÔI";
                document.getElementById("contactText").innerText = "LIÊN HỆ";
                document.getElementById("companyText").innerText = "Công Ty Hoa Lac";
            } else {
                // Nếu ngôn ngữ hiện tại là tiếng Việt, chuyển sang tiếng Anh
                languageIcon.src = "img/united-kingdom.png";
                languageIcon.alt = "English";
                // Thay đổi tất cả các văn bản trong trang sang tiếng Anh
                document.getElementById("loginLink").innerText = "Login";
                document.getElementById("registerLink").innerText = "Register";
                document.getElementById("scheduleLink").innerText = "Schedule By Theater";
                document.getElementById("movieLink").innerText = "Movies";
                document.getElementById("theaterLink").innerText = "Theaters";
                document.getElementById("priceLink").innerText = "Ticket Prices";
                document.getElementById("newsLink").innerText = "News & Offers";
                document.getElementById("franchiseLink").innerText = "Franchise";
                document.getElementById("memberLink").innerText = "Members";
                document.getElementById("welcomeText").innerText = "Welcome to Your Movie Theater";
                document.getElementById("discoverText").innerText = "Discover the latest movies and book your tickets online.";
                document.getElementById("exploreBtn").innerText = "Explore Now";
                document.getElementById("movieTitle").innerText = "Movie Title";
                document.getElementById("movieGenre").innerText = "Genre: Drama, Romance";
                document.getElementById("movieLength").innerText = "Length: 131 minutes";
                document.getElementById("buyTicketBtn").innerText = "BUY TICKET";
                document.getElementById("aboutUsLink").innerText = "About us";
                document.getElementById("cinemaText").innerText = "Cinema";
                document.getElementById("cinemaLocationLink").innerText = "Cinemas Hoa Lac - Hotline 0333 333 333";
                document.getElementById("connectText").innerText = "CONNECT WITH US";
                document.getElementById("contactText").innerText = "CONTACT";
                document.getElementById("companyText").innerText = "Hoa Lac Company";
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
                    <li><a href="#" id="memberLink" style="padding-left: 40px" >Thành Viên</a></li>
                </ul>
            </nav>
        </div>
    </header>


    <section>




        
    </section>

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
