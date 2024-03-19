<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.Ticket" %>
<%@ page import="dal.TicketDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.Film" %>
<%@ page import="dal.FilmDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    TicketDAO ticketDAO = new TicketDAO();
    List<Ticket> ticketList = ticketDAO.getAllTickets();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Film Revenue Report</title>
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
            .content {
            width: 60%; /* Đặt chiều rộng của nội dung */
            margin: 0 auto; /* Đặt margin trên và dưới là 0, và căn giữa theo chiều ngang */
            padding: 20px; /* Đặt padding cho nội dung */
            padding-left: 40px;
        }

           table {
            font-family: Arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        /* Thiết lập màu nền và border cho header của bảng */
        th {
            background-color: #4CAF50;
            color: white;
        }

        /* Thiết lập padding và border cho các ô trong bảng */
        td, th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        /* Đổi màu nền của các hàng chẵn trong bảng */
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Đổi màu khi hover vào hàng trong bảng */
        tr:hover {
            background-color: #ddd;
        }

        /* Thiết lập border cho cột cuối cùng */
        th:last-child, td:last-child {
            border-right: none;
        }

        /* Thiết lập border cho hàng cuối cùng */
        th:last-child, tr:last-child td {
            border-bottom: none;
        }

        /* Thiết lập chiều rộng cho cột đầu tiên */
        th:first-child, td:first-child {
            width: 30%;
        }

        /* Thiết lập cách căn giữa nội dung trong các ô */
        td {
            text-align: center;
        }

         .logout-btn {
            display: block; /* Chuyển nút đăng xuất thành phần block để nó chiếm toàn bộ chiều rộng của phần tử chứa nó */
            width: 100%; /* Đặt chiều rộng của nút là 100% để chiếm toàn bộ chiều rộng của thanh điều hướng */
            padding: 10px 0; /* Đặt khoảng cách padding ở trên và dưới của nút */
            text-align: center; /* Căn giữa văn bản trong nút */
            background-color: #4CAF50; /* Màu nền của nút */
            color: white; /* Màu văn bản của nút */
            text-decoration: none; /* Loại bỏ gạch chân trên liên kết */
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
                        <a href="ticketSales" class="nav-link"> 
                            <i class="nav-icon fas fa-chart-bar"></i> 
                            <span>Thống kê phim</span>
                        </a>
                    </li>
                </ul>
            </nav>
             <a href="logout.jsp" class="logout-btn">Đăng Xuất</a>
        </div>
        <div class="content">
            <h2>Film Revenue Report</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>Film Name</th>
                        <th>Total Income</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (Ticket ticket : ticketList) {
                    %>
                    <tr>
                        <td><%= ticket.getFilm().getFilmName() %></td>
                        <td><%= ticket.getPrice() %> VND</td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
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