<%-- 
    Document   : ticket
    Created on : Mar 12, 2024, 2:24:49 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body>
        <div class="ticket">
            <!-- Nội dung vé của bạn sẽ được đặt ở đây -->
            <h2>Ticket Information</h2>
            <!-- Đây là các giá trị mẫu, bạn cần thay thế chúng bằng dữ liệu thực từ server của bạn -->
            <p><strong>Tên người đặt vé:</strong> John Doe</p>
            <p><strong>Ngày tháng:</strong> 27/09/16</p>
            <p><strong>Giờ:</strong> 18:20</p>
            <p><strong>Cơ sở phim:</strong> Twinkl Cinema</p>
            <p><strong>Số phòng:</strong> 5</p>
            <p><strong>Ghế số:</strong> 27</p>
        </div>
    </body>
</html>