<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Account" %>
<%
    HttpSession sessionObj = request.getSession();
    Account loggedInMember = (Account) sessionObj.getAttribute("loggedInAccount");
    if (loggedInMember == null) {
        // Redirect to login page if not logged in
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Films</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            .sidebar {
                position: fixed;
                left: 0;
                top: 0;
                height: 100%;
                width: 250px;
                background-color: #343a40;
                padding-top: 20px;
                color: #fff;
            }

            .sidebar a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 18px;
                display: block;
            }

            .sidebar a:hover {
                background-color: #495057;
            }

            .sidebar .nav-icon {
                margin-right: 10px;
            }

            .sidebar .right {
                float: right;
            }

            .sidebar .nav-link.active {
                background-color: #adb5bd;
            }

            .sidebar .nav-treeview {
                padding-left: 20px;
            }

            .sidebar .nav-treeview .nav-link {
                padding-left: 30px;
            }
             .logout-btn {
            display: block; 
            width: 100%; 
            padding: 10px 0; 
            text-align: center; 
            background-color: #4CAF50; 
            color: white;
            text-decoration: none; 
        }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <nav class="mt-2">
                <ul class="nav flex-column nav-sidebar" data-widget="treeview" role="menu" data-accordion="false">
                    <li class="nav-item has-treeview" id="menu-movie">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <span>Quản lý phim</span>
                            <i class="right fas fa-angle-left"></i>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="adminfilm" class="nav-link active">
                                    <i class="far fa-circle nav-icon"></i>
                                    <span>Danh sách các bộ phim</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="addFilm" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <span>Thêm mới bộ phim</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="ticketSales" class="nav-link"> <!-- Thêm liên kết mới -->
                            <i class="nav-icon fas fa-chart-bar"></i> <!-- Icon của biểu đồ hoặc biểu đồ -->
                            <span>Thống kê phim</span>
                        </a>
                    </li>
                </ul>
            </nav>
             <a href="logout.jsp" class="logout-btn">Đăng Xuất</a>
        </div>
        <div style="text-align: center; margin-top: 20px;">
            <% if ("true".equals(request.getParameter("deleteSuccess"))) { %>
            <p style="color: green;">Xoá phim thành công</p>
            <% } else if ("false".equals(request.getParameter("deleteSuccess"))) { %>
            <p style="color: red;">Đã xảy ra lỗi khi xoá phim</p>
            <% } %>
        </div>
        <div style="text-align: center; margin-top: 20px;">
            <% if ("true".equals(request.getParameter("updateSuccess"))) { %>
            <p style="color: green;">Cập nhât thành công</p>
            <% } else if ("false".equals(request.getParameter("updateSuccess"))) { %>
            <p style="color: red;">Đã xảy ra lỗi khi cập nhật</p>
            <% } %>
        </div> 
        <div style="text-align: center; margin-top: 20px;">
            <% if ("true".equals(request.getParameter("addSuccess"))) { %>
            <p style="color: green;">Thêm phim thành công</p>
            <% } else if ("false".equals(request.getParameter("addSuccess"))) { %>
            <p style="color: red;">Đã xảy ra lỗi khi thêm phim</p>
            <% } %>
        </div> 

    </body>
</html>
<script>
    $(document).ready(function () {
        $('.nav-link.active').click(function () {
            $(this).toggleClass('active'); // Thêm hoặc loại bỏ lớp 'active' cho nút
            $(this).find('.right').toggleClass('fa-angle-left fa-angle-down'); // Chuyển đổi biểu tượng giữa mở và đóng
            $(this).siblings('.nav-treeview').slideToggle(); // Hiển thị hoặc ẩn danh sách con
        });
    });
</script>
