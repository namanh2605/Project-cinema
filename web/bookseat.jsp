<%-- 
    Document   : bookticket
    Created on : Mar 9, 2024, 1:06:38 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Account" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chọn Ghế</title>
        <style>
            body {
                background-color: #121212; /* Màu nền tối */
                color: #fff; /* Màu văn bản trắng */
                font-family: Arial, sans-serif; /* Font-family */
                margin: 0; /* Remove default margin */
                padding: 0; /* Remove default padding */
            }

            .isOccupied {
                background-color: red; /* Hoặc màu khác tùy ý */
            }

            .isSelected {
                background-color: green; /* Màu cho các ghế đã chọn */
            }

            .isDisabled {
                background-color: red;
                color: currentColor;
                cursor: not-allowed;
                opacity: 0.2;
                text-decoration: none;
                pointer-events: none;
            }

            .info-room-chair {
                width: 50px;
                height: 50px;
                margin-left: 15px;
                margin-right: 15px;
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .chair-container {
                width: 100%;
                height: auto;
                text-align: center;
                padding: 20px;
            }

            .note {
                width: 30px;
                height: 30px;
            }

            .isDisabled {
                cursor: not-allowed;
                opacity: 0.5; /* Điều chỉnh độ mờ tùy ý */
            }

            .isDisabled:hover {
                opacity: 0.5; /* Tăng độ mờ khi rê chuột vào ghế đã đặt */
            }

            .btn {
                cursor: pointer;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
            }

            .btn:hover {
                background-color: #0056b3;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    </head>
    <body>
        <%HttpSession sessionObj = request.getSession(); // Lấy hoặc tạo session nếu chưa tồn tại
Account loggedInMember = null;
loggedInMember = (Account) sessionObj.getAttribute("loggedInAccount");
        %>
        <div class="container">
            <h1>Chọn Ghế</h1>
            <div class="chair-container">
                <div class="info-chair-room">
                    <h2>Room Name</h2>
                    <c:forEach var="seat" items="${seats}">
                        <button type="button" onclick="selectSeat(this, ${seat.seatId})" class="info-room-chair ${seat.isOccupied ? 'isDisabled' : ''}">
                            ${seat.seatName}
                        </button>
                    </c:forEach>
                </div>
            </div>
            <div class="col-sm-12">
                <label>Chú thích: </label><br>
                <button disabled class="btn btn-primary note" style="background: white"></button> Ghế trống
                <button disabled class="btn btn-warning note" style="background: red"></button> Ghế đã đặt
                <button disabled class="btn btn-primary note" style="background: green"></button> Ghế vừa chọn
            </div>
            <!-- Thêm phần hiển thị thông báo lỗi -->
            <c:if test="${not empty error}">
                <div style="color: red;">${error}</div>
            </c:if>

            <form id="bookForm" action="seat" method="post">
                <input type="hidden" id="cinemaId" name="cinemaId">
                <input type="hidden" id="filmId" name="filmId">
                <input type="hidden" id="showtimeId" name="showtimeId">
                <input type="hidden" id="roomId" name="roomId">
                <input type="hidden" id="selectedSeatsInput" name="selectedSeatsString">
                <button type="button" onclick="bookTickets()">Đặt vé</button>
            </form>
            <script>
             
                var selectedSeats = []; // Khởi tạo mảng lưu trữ các ghế được chọn

                function selectSeat(button, seatId) {
                    if (button.classList.contains('isSelected')) {
                        button.classList.remove('isSelected');
                        // Xóa ghế khỏi mảng selectedSeats nếu bỏ chọn
                        var index = selectedSeats.indexOf(seatId);
                        if (index !== -1) {
                            selectedSeats.splice(index, 1);
                        }
                    } else {
                        button.classList.add('isSelected');
                        // Thêm ghế vào mảng selectedSeats nếu chọn
                        selectedSeats.push(seatId);
                    }
                }

                function bookTickets() {
                    if (selectedSeats.length === 0) {
                        alert('Vui lòng chọn ghế trước khi đặt vé.');
                        return;
                    }

                    var urlParams = new URLSearchParams(window.location.search);
                    var cinemaId = urlParams.get('cinemaId');
                    var filmId = urlParams.get('filmId');
                    var showtimeId = urlParams.get('showtimeId');
                    var roomId = urlParams.get('roomId');
                    var selectedSeatsString = selectedSeats.join(',');

                    // Gán các giá trị cho các hidden input
                    document.getElementById('cinemaId').value = cinemaId;
                    document.getElementById('filmId').value = filmId;
                    document.getElementById('showtimeId').value = showtimeId;
                    document.getElementById('roomId').value = roomId;
                    document.getElementById('selectedSeatsInput').value = selectedSeatsString;

                    // Submit form
                    document.getElementById("bookForm").submit();
                }

            </script>

    </body>
</html>