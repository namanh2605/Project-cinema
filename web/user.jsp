<%-- 
    Document   : user
    Created on : Mar 19, 2024, 12:50:56 PM
    Author     : admin
--%>
<%@ page import="java.sql.*, model.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page import="dal.TicketDAO" %>
<%@ page import="model.Showtime" %>
<%@ page import="model.Seat" %>
<%@ page import="model.Room" %>
<%@ page import="model.Film" %>
<%@ page import="model.Cinema" %>
<%@ page import="model.Account" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* CSS styles for the sub menu */
            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #333;
                padding-top: 20px;
            }

            .sidebar a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 18px;
                color: #fff;
                display: block;
            }

            .sidebar a:hover {
                background-color: #555;
            }

            /* CSS styles for the main content area */
            .content {
                margin-left: 250px;
                padding: 20px;
                background-color: #f4f4f4;
            }

            h1 {
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #333;
                color: #fff;
            }

            tr:hover {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <!-- Sidebar with sub menu -->
        <div class="sidebar">
            <a href="home">Trang chủ</a>
            <a href="film">Đặt vé</a>
            <a href="user.jsp">Lịch sử đặt vé</a>
            <!-- Add more links for other sections if needed -->
        </div>
        <%
            HttpSession sessionObj = request.getSession(false);
            if (sessionObj == null || sessionObj.getAttribute("loggedInAccount") == null) {
                // Phiên đăng nhập không tồn tại hoặc không chứa thông tin đăng nhập
                // Chuyển hướng người dùng đến trang đăng nhập
                response.sendRedirect("login.jsp");
            } else {
                // Phiên đăng nhập hợp lệ, tiếp tục thực hiện các thao tác khác
                Account loggedInAccount = (Account) sessionObj.getAttribute("loggedInAccount");
                String customerId = loggedInAccount.getUsername();
                TicketDAO ticketDAO = new TicketDAO();
                List<Ticket> ticketList = ticketDAO.getTicketsByCustomerId(customerId);
        %>

        <!-- Main content area -->
        <div class="content">
            <!-- Content for viewing booking history -->
            <h1 style="text-align: center">Booking History</h1>
            <table border="2">
                <tr>
                    <th>Ticket Number</th>
                    <th>Show Date</th>
                    <th>Show Time</th>
                    <th>Room</th>
                    <th>Seat</th>
                    <th>Film</th>
                    <th>Cinema</th>
                </tr>
                <% for (Ticket ticket : ticketList) { %>
                <tr>
                    <td><%= ticket.getTicketId() %></td>
                    <td><% 
                        Showtime showtime = ticket.getShowtime();
                            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                            out.println(dateFormat.format(showtime.getDate()));
                        %></td>
                    <td><% 
                            out.println(showtime.getStartTime());
                        %></td>
                    <td><%= ticket.getRoom().getRoomName() %></td>
                    <td><%= ticket.getSeat().getSeatName() %></td>
                    <td>
                        <%= ticket.getFilm().getFilmName() %>
                    </td>
                    <td><%= ticket.getCinema().getCinemaName() %></td>
                </tr>
                <% } %>
            </table>
        </div>
        <% } %>
    </body>
</html>