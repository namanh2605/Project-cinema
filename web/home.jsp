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
            section {
                background-color: #1c1c1c;
                color: #ccc;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }

            .image-slider .slide {
                width: 978px;
                height: 447px;
                overflow: hidden;
                position: relative;
            }
            .image-slider .slide img {
                width: 100%;
                height: 100%;
                object-fit: contain;
                object-position: center;
            }
            .image-slider {
                position: relative;
                width: 978px;
                height: 447px;
                overflow: hidden;
                margin: auto;
            }

            .slider-controls {
                position: relative;
                bottom: 10px;
                left: 50%;
                transform: translateX(-50%);
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 10px; /* Điều chỉnh padding nếu cần */
            }

            .slider-controls button {
                background-color: transparent;
                color: white;
                border: none;
                border-radius: 50%;
                padding: 10px;
                font-size: 18px;
                cursor: pointer;
                margin: 0 5px;
                outline: none;
            }

            .slider-controls button:hover {
                background-color: rgba(255, 255, 255, 0.5);
            }
            .success-message {
                color: green; /* Thiết lập màu xanh lá cây cho văn bản */
                text-align: center; /* Căn giữa văn bản */
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
                        <li><a href="new" id="newsLink">Tin Mới & Ưu Đãi</a></li>
                        <li><a href="user.jsp" id="memberLink" style="padding-left: 40px" >Thành Viên</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <section>
            <div class="image-slider">
                <div class="slide"><img src="img/avenger.jpg" alt="Image 1"></div>
                <div class="slide"><img src="img/avatar.jpg" alt="Image 2"></div>
                <div class="slide"><img src="img/fight_club.jpg" alt="Image 3"></div>
                <div class="slide"><img src="img/titanic.jpg" alt="Image 4"></div>
                <div class="slide"><img src="img/the_lion_king.jpg" alt="Image 5"></div>
                <div class="slide"><img src="img/the_godfather.jpg" alt="Image 6"></div>
                <div class="slide"><img src="img/lord_of_the_rings.jpg" alt="Image 7"></div>
                <div class="slide"><img src="img/iron_man.jpg" alt="Image 8"></div>
                <!-- Thêm các slide ảnh khác tại đây -->
            </div>
            <div class="slider-controls">
                <button class="prev-slide">&#10094;</button>
                <button class="next-slide">&#10095;</button>
            </div>
            <% 
           String successParam = request.getParameter("success");
           if (successParam != null && successParam.equals("true")) {
            %>
            <div class="success-message">Ticket booked successfully!</div>
            <%
                }
            %>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script>
                            $(document).ready(function () {
                                var slider = $('.image-slider');
                                slider.slick({
                                    autoplay: true,
                                    autoplaySpeed: 2000,
                                    arrows: false,
                                    dots: true, // Add dots navigation
                                    infinite: true,
                                    slidesToShow: 1,
                                    slidesToScroll: 1
                                });

                                $('.prev-slide').click(function () {
                                    slider.slick('slickPrev');
                                });

                                $('.next-slide').click(function () {
                                    slider.slick('slickNext');
                                });
                            });
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var slides = document.querySelectorAll('.slide img');

                slides.forEach(function (slide) {
                    slide.addEventListener('click', function () {
                        window.location.href = 'film';
                    });
                });
            });
        </script>

    </body>
</html>
