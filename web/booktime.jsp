<%-- 
    Document   : bookticket
    Created on : Mar 8, 2024, 12:47:13 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Cinema" %>
<%@ page import="model.Film" %>
<%@ page import="model.Showtime" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="model.Account" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Showtimes</title>
        <style>
            body {
                background-color: #121212; /* Dark background */
            color: #fff; /* White text */
            font-family: Arial, sans-serif;
                margin: 0; /* Remove default margin */
                padding: 0; /* Remove default padding */
            }

            h1, h2 {
                color: #ffffff; /* White text for headings */
                text-align: center; /* Center align headings */
            }

            .showtime-box {
                padding: 15px 30px; /* Reduced padding */
                margin: 10px auto; /* Center boxes with automatic horizontal margins and space between them */
                background-color: #112d4e; /* Darker blue for the boxes */
                color: #dbe2ef; /* Lighter text color for contrast */
                border-radius: 10px; /* Rounded corners */
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Subtle box shadow for depth */
                width: 80%; /* Set width to 80% of the parent container */
                max-width: 800px; /* Maximum width so it doesn't get too wide on large screens */
                box-sizing: border-box; /* Include padding in the width */
            }

            a {
                text-decoration: none; /* Remove underline from links */
                color: inherit; /* Links will use the color of the parent */
            }

            /* Style for the containers holding date and time */
            .showtime-date, .showtime-time {
                margin: 5px 0; /* Margin for spacing between date and time */
            }

            /* Optional: Responsive design for smaller screens */
            @media (max-width: 768px) {
                .showtime-box {
                    width: 95%; /* Slightly wider on small screens */
                    padding: 15px; /* Less padding on small screens */
                }
            }
        </style>
    </head>
    <body>
        <% 
                    HttpSession sessionObj = request.getSession(false);
                    Account loggedInMember = null;
                    if (sessionObj != null) {
                        loggedInMember = (Account) sessionObj.getAttribute("loggedInAccount");
                    }
                    %>
        <h1>Showtimes</h1>

        <h2>Choose a Showtime:</h2>
        <div>
            <c:forEach var="showtime" items="${showtimes}">
                <div class="showtime-box">
                    <a href="seat?cinemaId=${showtime.roomId}&filmId=${showtime.filmId}&showtimeId=${showtime.showtimeId}&roomId=${showtime.roomId}">
                        <div>StartTime: <fmt:formatDate value="${showtime.startTime}" pattern="HH:mm:ss" /></div>
                        <div>Date: <fmt:formatDate value="${showtime.date}" pattern="dd/MM/yyyy" /></div>
                        <div>Room : ${showtime.roomId}</div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </body>
</html>