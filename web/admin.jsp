<%-- 
    Document   : admin
    Created on : Mar 7, 2024, 12:48:38 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Film" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }
            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #2a2a2a;
                overflow-x: hidden;
                padding-top: 20px;
            }
            .sidebar h2 {
                color: white;
                text-align: center;
            }
            .sidebar a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 16px;
                color: white;
                display: block;
                border-bottom: 1px solid #444;
            }
            .sidebar a:hover {
                background-color: #575757;
            }
            .content {
                margin-left: 250px;
                padding: 20px;
                height: auto;
                background-color: #fff;
            }
            .header {
                background-color: #333;
                color: white;
                text-align: right;
                padding: 10px 20px;
                position: fixed;
                width: calc(100% - 250px);
                top: 0;
                right: 0;
            }
            .header a {
                color: white;
                text-decoration: none;
            }
            .header a:hover {
                text-decoration: underline;
            }
            .sub-menu {
                display: none;
            }
            .sub-menu a {
                padding-left: 20px;
                color: white;
            }
        </style>
    </head>
    <body>
        <%HttpSession sessionObj = request.getSession(); // Lấy hoặc tạo session nếu chưa tồn tại
 Account loggedInMember = null;
loggedInMember = (Account) sessionObj.getAttribute("loggedInAccount");%>
        <div class="sidebar">
            <h2>Admin</h2>
            <a href="" id="manageMoviesLink">Quản lý phim <i class="fas fa-angle-down"></i></a>
            <div class="sub-menu" id="movieSubMenu">
                <a href="adminfilm" id="showMoviesLink">Hiển thị danh sách phim</a>
                <a href="#" id="addMovieLink">Thêm phim mới</a>
                <a href="#" id="deleteMovieLink">Xóa phim</a>
            </div>
            <a href="#manageCinemas">Quản lý rạp chiếu phim</a>
            <a href="#manageSchedules">Quản lý lịch chiếu phim</a>
            <a href="#statistics">Báo cáo thống kê</a>
            <!-- Additional sidebar items can be added here -->
        </div>

        <div class="header">
            <a href="logout.jsp">Đăng xuất</a>
        </div>

        <div class="content">
            <table>
                <thead>
                    <tr>
                        <th>Danh sách phim</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${films}" var="film">
                        <tr>
                            <td><a href="adminfilm?filmID=${film.getFilmId()}">${film.getFilmName()}</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div id="filmDetails" style="float: right; margin-right: 20px;">
            <c:if test="${not empty film}">
                <table class="table2" border="0" style="border-collapse: collapse;">
                    <caption style="text-decoration: underline">THÔNG TIN PHIM:</caption>
                    <tbody>
                        <tr>
                            <td style="padding: 8px;">Mã phim</td>
                            <td style="padding: 8px;"><span>${film.getFilmId()}</span></td>
                        </tr>
                        <tr>
                            <td style="padding: 8px;">Tên phim</td>
                            <td style="padding: 8px;"><span>${film.getFilmName()}</span></td>
                        </tr>
                        <tr>
                            <td style="padding: 8px;">Thời lượng</td>
                            <td style="padding: 8px;"><span>${film.getDuration()}</span></td>
                        </tr>
                        <!-- Thêm các trường thông tin khác của bộ phim nếu cần -->
                    </tbody>
                </table>
            </c:if>
        </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var manageMoviesLink = document.getElementById('manageMoviesLink');
            var movieSubMenu = document.getElementById('movieSubMenu');

            manageMoviesLink.addEventListener('click', function (event) {
                event.preventDefault();     // Ngăn chặn hành động mặc định của thẻ a

                // Hiển thị hoặc ẩn submenu của quản lý phim
                if (movieSubMenu.style.display === 'none') {
                    movieSubMenu.style.display = 'block';
                } else {
                    movieSubMenu.style.display = 'none';
                }
            });
        });
         document.addEventListener('DOMContentLoaded', function () {
        var filmLinks = document.querySelectorAll('.film-link');
        var filmDetailsContainer = document.getElementById('filmDetails');

        filmLinks.forEach(function (filmLink) {
            filmLink.addEventListener('click', function (event) {
                event.preventDefault();
                var filmId = this.getAttribute('data-film-id');
                // Gửi yêu cầu AJAX để lấy thông tin chi tiết của phim
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            // Hiển thị thông tin chi tiết của phim trong #filmDetails
                            filmDetailsContainer.innerHTML = xhr.responseText;
                        } else {
                            console.error('Đã xảy ra lỗi khi tải dữ liệu phim.');
                        }
                    }
                };
                xhr.open('GET', 'getFilmDetails?filmId=' + filmId, true);
                xhr.send();
            });
        });
    });
    </script>

</body>
</html>