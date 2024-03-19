<%-- 
    Document   : ticket
    Created on : Mar 12, 2024, 2:24:49 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Account" %>
<%@ page import="model.Film" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Ticket Information</title>
        <style>
            body {
                background-color: #121212; /* Chọn màu nền tương tự như vé */
                font-family: 'Arial', sans-serif; /* Đặt phông chữ */
                display: flex; /* Bật chế độ hiển thị flex */
                justify-content: center; /* Căn chỉnh nội dung chính xác giữa theo chiều ngang */
                align-items: center; /* Căn chỉnh nội dung chính xác giữa theo chiều dọc */
                height: 100vh; /* Đặt chiều cao của body bằng với chiều cao của viewport */
                margin: 0; /* Xóa bỏ các khoảng cách mặc định */
            }

            .ticket {
                width: 650px; /* Tăng chiều rộng của ticket */
                height: 300px; /* Tăng chiều cao của ticket */
                background-color: #ff6c00; /* Màu nền cam cho ticket */
                color: #ffffff; /* Màu chữ trắng */
                padding: 20px; /* Đặt khoảng cách bên trong ticket */
                border-radius: 8px; /* Làm tròn góc */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Thêm bóng cho ticket */
                text-align: center; /* Căn chữ giữa */
                position: relative; /* Để sau này có thể sử dụng vị trí tuyệt đối cho các phần tử bên trong */
                border: 2px solid #000000; /* Viền màu đen và dày hơn */
            }
            /* Thêm các thuộc tính cho các phần tử con nếu cần */
        </style>

    </head>

   <% 
    HttpSession sessionObj = request.getSession(false);
    Account loggedInMember = (Account) session.getAttribute("loggedInAccount");

    // Kiểm tra xem loggedInMember có tồn tại và có thuộc tính "name" không
    String customerName = (loggedInMember != null) ? loggedInMember.getName() : "Unknown";
    request.setAttribute("customerName", customerName); // Chuyển giá trị vào phạm vi của request
%>
   
    <body>
       

    <body>
    <div class="ticket">
        <h2>Ticket Information</h2>
        <p><strong>Tên người đặt vé:</strong> ${customerName}</p>
        <p><strong>Tên bộ phim:</strong> ${film.filmName}</p>
        <p><strong>Ngày chiếu:</strong> ${formattedDate}</p>
        <p><strong>Giờ đặt vé:</strong> ${showtime.startTime}</p>
        <p><strong>Phòng:</strong> ${room.roomName}</p>
        <p><strong>Ghế số:</strong> ${selectedSeats}</p>
    </div>
    <form action="ticket" method="post">
        <input type="hidden" name="username" value="${loggedInAccount.getUsername()}">
        <input type="hidden" name="showtimeId" value="${showtime.getShowtimeId()}">
        <input type="hidden" name="selectedSeats" value="${param.selectedSeats}">
        <button type="submit">Confirm</button>
    </form>
</body>
</html>
