<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Members" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="model.Movies" %>
<%@ page import="java.util.List" %>
<%@ page import="dal.MoviesDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Movie Information</title>
        <style>
            .container {
                width: 80%;
                margin: auto;
                padding: 20px;
                font-family: Arial, sans-serif;
            }

            .movie-header h1 {
                border-bottom: 2px solid #000;
                padding-bottom: 10px;
                margin-bottom: 20px;
                color: #333;
            }

            .movie-details {
                display: flex;
                flex-wrap: wrap;
                align-items: flex-start;
                justify-content: space-between;
            }

            .movie-details img {
                border: 6px solid #000000;
                height: 260px;
                width: 185px;
            }

            .movie-details h2 {
                color: #E50914; /* Adjust the color as needed */
                margin: 0;
            }

            .movie-details p {
                margin: 5px 0;
                color: #333;
            }

            /* Button styles */
            .button {
                background-color: #E50914; /* Button background color */
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                display: inline-block;
                margin-top: 20px;
                border: none;
                cursor: pointer;
            }

            .button:hover {
                background-color: #C40812; /* Button hover color change */
            }

            /* Movie rating badge */
            .rating {
                background-color: #333;
                color: white;
                padding: 5px;
                display: inline-block;
            }

            /* Social media interaction styles */
            .social-interaction {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .social-interaction .like-count {
                display: inline-block;
                background: #ddd;
                padding: 5px 10px;
                border-radius: 5px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="movie-header">
                <h1>Nội Dung Phim</h1>
            </div>
            <div class="movie-details">
                <%
            String movieId = request.getParameter("movieId"); 
            MoviesDAO movieDAO = new MoviesDAO(); 
            Movies movie = movieDAO.getMovieById(movieId); 
                %>
                <img src="img/<%= movie.getPoster() %>" class="card-img-top" alt="<%= movie.getTitle() %>" height="260px" width="185px" style="border: 6px solid #000000; display: inline-table;">
                 <div class="text-details">
                <h2><%= movie.getTitle() %></h2>
                <p>Đạo diễn: <%= movie.getDirector() %></p>
                <div
                <!-- Movie description and other details go here -->
            </div>

            <div>
                <button>MUA VÉ</button>
                <!-- Additional buttons and links can be added here -->
            </div>
            <!-- More content can be added here -->
        </div>
    </body>
</html>
