<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Members" %>
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
                           // Kiểm tra xem session có tồn tại không trước khi sử dụng
                           HttpSession sessionObject = request.getSession(false);
                           Members loggedInMember = null;
                           if(sessionObject != null) {
                           loggedInMember = (Members) sessionObject.getAttribute("loggedInMember");
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
        </div>

                        <!-- Main header with navigation menu -->
                        <header class="site-header">
                            <img src="img/logoc.png" alt="Your Company Logo" class="logo" id="logo">
                            <div class="container">
                                <nav class="site-nav" id="siteNav">
                                    <ul>
                                        <li><a href="home"  id="scheduleLink"> Trang Chủ</a></li>
                                        <li><a href="movies" id="movieLink" >Phim Đang Chiếu</a></li>
                                        <li><a href="#" id="newsLink">Tin Mới & Ưu Đãi</a></li>
                                        <li><a href="#" id="memberLink" style="padding-left: 40px" >Thành Viên</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </header>
    

                        <section>


                            <!---movie-ticket-book-->


                            <div class="filter-search-box">

                                <div class="filters-box">

                                    <div class="all-filters filters">
                                        All formats <i class="fa fa-angle-down"></i>
                                    </div> 

                                    <div class="date-filters filters">
                                        By Date <i class="fa fa-angle-down"></i>
                                    </div> 

                                    <div class="category-filters filters">
                                        By category <i class="fa fa-angle-down"></i>
                                    </div> 

                                    <div class="category-filters filters">
                                        Coming soon
                                    </div> 

                                </div>

                                <div class="search-filters">
                                    <input type="text" placeholder="Search by name...">
                                    <i class="fa fa-search"></i>
                                </div> 

                                <div class="search-bar">
                                    <div class="bar"></div>
                                </div>

                            </div>
                            <!----filter-search-box---->


                            <div class="movie-card-section">

                                <div class="card">
                                    <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTCXgCV-ZNb3InBCTaLdED58dF6iZJxIvCOBurktiWxXrwGc8DB">

                                    <div class="card-content">
                                        <p class="movie-name">
                                            the mummy
                                        </p>

                                        <div class="movie-info">
                                            <p class="time">11:30 <span>14:45<span class="d3">3D</span> 16:05<span class="d3">3D</span></span> 18:40 21:00 23:15</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <img src="https://m.media-amazon.com/images/M/MV5BMTYzODQzYjQtNTczNC00MzZhLTg1ZWYtZDUxYmQ3ZTY4NzA1XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg">

                                    <div class="card-content">
                                        <p class="movie-name">
                                            Wonder Woman
                                        </p>

                                        <div class="movie-info">
                                            <p class="time">11:30 <span>14:45 16:05</span> 18:40 21:00</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSZeZdWD3S9rSzfwlSsnqBWERtgBHR4h_6kHb_fR_6J-BObyxfK">

                                    <div class="card-content">
                                        <p class="movie-name">
                                            Alien: Covenant
                                        </p>

                                        <div class="movie-info">
                                            <p class="time">11:30<span class="d3">3D</span> <span>14:45 16:05<span class="d3">3D</span></span> 18:40 21:00 23:15</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX2TBaWUUMpmbhcnr0zypXQltqtQmW9wED_Y8bYrynL98MM1Wq">

                                    <div class="card-content">
                                        <p class="movie-name">
                                            Baywatch
                                        </p>

                                        <div class="movie-info">
                                            <p class="time"><span>11:30 16:05<span class="d3">3D</span></span> 18:40 21:00 23:15</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXhEeDOpouHNg3A75Ngkgl-pQdWrr8ErxSuYCbb8-Tn7KcuD79">

                                    <div class="card-content">
                                        <p class="movie-name">
                                            Pirates of the Caribbean
                                        </p>

                                        <div class="movie-info">
                                            <p class="time">11:30 <span>14:45<span class="d3">3D</span> 16:05<span class="d3">3D</span></span> 18:40 21:00</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6NX1HzM5IkUhkwR1Yq7vkd9j5dqv0_Zaz5FCa2bzyJaUx9zOa">

                                    <div class="card-content">
                                        <p class="movie-name">
                                            transformers 5
                                        </p>

                                        <div class="movie-info">
                                            <p class="time">11:30 <span>14:45 16:05</span> 18:40 21:00</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ8wYlRSHxcAyi7TijH8FjeTLKcYsKi3qCzI8r_X0xKU8LkAn_">

                                    <div class="card-content">
                                        <p class="movie-name">
                                            Planet of the Apes
                                        </p>

                                        <div class="movie-info">
                                            <p class="time">11:30<span class="d3">3D</span> <span>14:45 16:05<span class="d3">3D</span></span> 18:40 21:00 23:15</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <img src="https://www.movienewsletters.net/photos/NZL_105934R1.jpg">

                                    <div class="card-content">
                                        <p class="movie-name">
                                            Dark Tower
                                        </p>

                                        <div class="movie-info">
                                            <p class="time"><span>11:30 16:05<span class="d3">3D</span></span> 18:40 21:00 23:15</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!---movie-card--->

                            <div class="show">
                                <div class="show-bar">
                                    <div class="bar"></div>
                                </div>
                                <button>Show more</button>
                            </div>
                            <!---bar--->


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
