<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Account" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="model.Film" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            if (currentLanguage === "Vietnamese") {
                languageIcon.src = "img/united-kingdom.png";
                languageIcon.alt = "English";
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

                document.getElementById("loginLink").innerText = "Login";
                document.getElementById("registerLink").innerText = "Register";
                document.getElementById("filmshow1").innerText = "Movies Now Showing";

            } else {
                // Nếu ngôn ngữ hiện tại là tiếng Việt, chuyển sang tiếng Anh
                languageIcon.src = "img/vietnam.png";
                languageIcon.alt = "Vietnamese";
                // Thay đổi tất cả các văn bản trong trang sang tiếng Anh
                document.getElementById("aboutUsLink").innerText = "Về chúng tôi";
                document.getElementById("cinemaText").innerText = "Rạp Chiếu Phim";
                document.getElementById("cinemaLocationLink").innerText = "Rạp Chiếu Phim Hoa Lac - Hotline 0333 333 333";
                document.getElementById("connectText").innerText = "KẾT NỐI VỚI CHÚNG TÔI";
                document.getElementById("contactText").innerText = "LIÊN HỆ";
                document.getElementById("companyText").innerText = "Công Ty Hoa Lac";
                document.getElementById("scheduleLink").innerText = "Trang chủ";
                document.getElementById("movieLink").innerText = "Phim Đang Chiếu";
                document.getElementById("newsLink").innerText = "Tin Mới & Ưu Đãi";
                document.getElementById("memberLink").innerText = "Thành Viên";

                document.getElementById("loginLink").innerText = "Đăng nhập";
                document.getElementById("registerLink").innerText = "Đăng ký";
                document.getElementById("filmshow1").innerText = "Phim Đang Chiếu";
            }
        }
        function showVideo() {
            var videoDiv = document.getElementById("video");
            videoDiv.style.display = "block";

            var videoFrame = document.getElementById("videoFrame");
            videoFrame.src = "https://www.youtube.com/embed/TcMBFSGVi1c?rel=0";
        }
        function buyTicket(filmId) {
            window.location.href = "booking.jsp?filmId=" + filmId;
        }
    </script>
    <style>
        body {
            background-color: #121212; /* Dark background */
            color: #fff; /* White text */
            font-family: Arial, sans-serif;
        }
        .container {
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Space between cards */
            justify-content: center;
        }
        .card {
            width: 260px; /* Card width */
            background-color: #1e1e1e; /* Dark card background */
            border: 6px solid #000; /* Black border */
            border-radius: 10px; /* Rounded corners */
        }
        .card img {
            width: 100%; /* Make image fill the card */
            border-top-left-radius: 4px; /* Rounded corners for image */
            border-top-right-radius: 4px;
        }
        .card-body {
            padding: 15px;
        }
        .card-title {
            margin: 0;
            font-size: 18px; /* Larger title font */
            font-weight: bold;
        }
        .card-text {
            margin: 5px 0; /* Spacing around text */
            font-weight: bold;
        }
        .buy-ticket-button {
            background-color: #f90; /* Orange button */
            color: #000; /* Black text on button */
            border: none;
            border-radius: 5px; /* Rounded button edges */
            padding: 10px 20px; /* Adjust button padding */
            font-weight: bold;
            cursor: pointer;
            display: block; /* Change to inline-block */
            max-width: 100%; /* Ensure button doesn't exceed container width */
            margin: 10px 80px;
            text-align: center; /* Center button text */
        }
    </style>
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
                    <p class="auth-link" id="loggedInUser"><%= loggedInMember.getUsername() %></p>
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
                        <li><a href="home"  id="scheduleLink"> Trang chủ</a></li>
                        <li><a href="film" id="movieLink" >Phim Đang Chiếu</a></li>
                        <li><a href="new" id="newsLink">Tin Mới & Ưu Đãi</a></li>
                        <li><a href="user.jsp" id="memberLink" style="padding-left: 40px" >Thành Viên</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <section>
            <div class="container">
                <h1 id="filmshow1">Phim Đang Chiếu</h1><br/>
                <div class="horizontal-bar"></div><br/>
                <div class="row">
                    <c:if test="${not empty films}">
                        <c:forEach var="movie" items="${films}">
                            <div class="col-md-4">
                                <div class="card mb-4 dark-bg">
                                    <a href="${movie.trailer}" target="_blank">
                                        <img src="img/${movie.image}" class="card-img-top" alt="${movie.filmName}" height="260px" width="185px" style="border: 6px solid #000000; display: inline-table;">
                                    </a>
                                    <div class="card-body">
                                        <h5 class="card-title" style="color: #333; font-size: 15px; font-weight: bold; text-transform: none;">${movie.filmName}</h5>
                                        <p class="card-text" style="font-weight: bold; font-size: 13px;">Duration: ${movie.duration} minutes</p>
                                    </div>
                                </div>
                                <button class="buy-ticket-button" style="padding-bottom: 10px" onclick="buyTicket(${movie.filmId})">Chi tiết</button><br/>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty films}">
                        <p>No movies found.</p>
                    </c:if>
                </div>
            </div>
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
    <style>
        .horizontal-bar {
            width: 100%; /* Full width of the container */
            height: 5px; /* Height of the bar */
            background-color: #000; /* Black background color */
            border-top: 1px solid black; /* Red top border */
            border-bottom: 1px solid black; /* Red bottom border */
        }
    </style>
</html>
