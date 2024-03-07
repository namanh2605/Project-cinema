<%-- 
    Document   : admin
    Created on : Mar 7, 2024, 12:48:38 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
    </style>
</head>
<body>

<div class="sidebar">
    <h2>Admin</h2>
    <a href="#manageMovies">Quản lý phim</a>
    <a href="#manageCinemas">Quản lý rạp chiếu phim</a>
    <a href="#manageSchedules">Quản lý lịch chiếu phim</a>
    <a href="#statistics">Báo cáo thống kê</a>
    <a href="#manageStaff">Quản lý nhân viên</a>
</div>

<div class="header">
    <a href="logout.jsp">Đăng xuất</a>
</div>

<div class="content">
    <!-- Content here -->
</div>

</body>
</html>