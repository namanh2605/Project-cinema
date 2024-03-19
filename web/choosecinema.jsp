<%-- 
    Document   : choosecinema
    Created on : Mar 7, 2024, 1:56:50 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Cinema" %>
<%@ page import="model.Film" %>
<%@ page import="model.Account" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chọn Rạp</title>

    </head>
    <% 
                    HttpSession sessionObj = request.getSession(false);
                    Account loggedInMember = null;
                    if (sessionObj != null) {
                        loggedInMember = (Account) sessionObj.getAttribute("loggedInAccount");
                    }
    %>
    <body>
        <div class="cinema-container">
            <h1>Chọn Rạp</h1>
            <div class="cinema-list">

                <c:forEach var="cinema" items="${cinemas}">
                    <a href="showtime?cinemaId=${cinema.cinemaId}&filmId=${param.filmId}" class="cinema-item">
                        <div>
                            <p class="cinema-name">${cinema.cinemaName}</p>
                            <p class="cinema-address">${cinema.address}</p>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </body>
    <style>
        body {
            background-color: #121212; /* Dark background */
            color: #fff; /* White text */
            font-family: Arial, sans-serif;
        }
        .cinema-container {
            text-align: center;
        }

        .cinema-list {
            display: flex;
            flex-direction: column; /* Stack them vertically */
            align-items: center; /* Center-align the items */
        }

        .cinema-item {
            display: block; /* Ensure it's a block element */
            background-color: #ffffff; /* White background */
            margin: 10px;
            padding: 20px; /* More padding for button-like appearance */
            border: 1px solid #ccc; /* Grey border */
            border-radius: 10px; /* Rounded corners */
            width: 300px; /* Fixed width, adjust as necessary */
            text-align: center; /* Center the text */
            color: black; /* Text color */
            text-decoration: none; /* Remove underline from links */
            transition: background-color 0.3s, transform 0.3s; /* Smooth transition for hover effects */
        }

        .cinema-item:hover {
            background-color: #f5f5f5; /* Light grey background on hover */
            transform: scale(1.05); /* Slight increase in size on hover */
        }

        .cinema-name {
            font-weight: bold;
            margin-bottom: 5px; /* Space between name and address */
        }

        .cinema-address {
            color: #666;
            font-size: smaller; /* Smaller font size for the address */
        }
    </style>
</html>