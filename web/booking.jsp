<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Account" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="model.Film" %>
<%@ page import="java.util.List" %>
<%@ page import="dal.FilmDAO" %>
<%@ page import="dal.GenreDAO" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

    <%
 HttpSession sessionObj = request.getSession(); // Lấy hoặc tạo session nếu chưa tồn tại
 Account loggedInMember = null;
   loggedInMember = (Account) sessionObj.getAttribute("loggedInAccount");
 String filmIdStr = request.getParameter("filmId");
 int filmId = 0;
 if (filmIdStr != null && !filmIdStr.isEmpty()) {
     try {
         filmId = Integer.parseInt(filmIdStr);
     } catch (NumberFormatException e) {
         e.printStackTrace();
     }
 }

 FilmDAO filmDAO = new FilmDAO();
 Film movie = filmDAO.getFilmById(filmId);
 if (movie != null) {
    %>
    <head>
        <meta charset="UTF-8">
        <title>Movie Information</title>
        <style>
            body {
                background-color: #1c1c1c; /* Dark background for the whole page */
                color: #ccc; /* Light grey text color for general text */
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }

            .container {
                width: 80%;
                margin: auto;
                padding: 20px;
                background-color: #262626; /* Slightly lighter dark background for the container */
                border-radius: 10px; /* Rounded corners for the container */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Soft shadow around the container */
            }

            .movie-header h1 {
                border-bottom: 2px solid #E50914; /* Red bottom border for the header */
                padding-bottom: 10px;
                margin-bottom: 20px;
                color: #fff; /* White color for the header */
            }

            .movie-details {
                display: flex;
                align-items: flex-start;
                justify-content: space-between;
                padding-bottom: 20px;
            }

            .movie-details img {
                margin-right: 20px; /* Add space between image and text */
                border: 6px solid #E50914; /* Red border for the image */
            }

            .movie-details .text-details {
                max-width: 60%; /* Limit width of the text details to make room for the image */
            }

            .movie-details h2 {
                color: #E50914; /* Red color for the movie title */
                margin-bottom: 10px;
            }

            .movie-details p {
                margin: 5px 0;
            }

            .button {
                background-color: #E50914; /* Red background color */
                color: white;
                padding: 15px 30px; /* Larger padding for a bigger button */
                text-decoration: none;
                border: none;
                cursor: pointer;
                border-radius: 25px; /* More pronounced rounded corners */
                font-size: 18px; /* Larger font size for better readability */
                font-weight: bold; /* Make the text bold */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
                transition: all 0.2s ease-in-out; /* Smooth transition for all hover effects */
                border: 2px solid transparent; /* Transparent border for a solid-state transition */
            }

            .button:hover, .button:focus {
                background-color: #f21e0a; /* A lighter red for hover state */
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); /* Larger shadow for hover effect */
                transform: scale(1.05); /* Slightly increase the button size */
                border-color: #fff; /* White border on hover/focus */
            }

            .rating {
                background-color: #333;
                color: white;
                padding: 5px 10px;
                border-radius: 5px; /* Rounded corners for the rating badge */
                margin-bottom: 10px;
            }

            .social-interaction {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-top: 20px;
            }

            .social-interaction .like-count {
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
                <a href="<%= movie.getTrailer() %>" target="_blank">
                    <img src="img/<%= movie.getImage() %>" class="card-img-top" alt="<%= movie.getFilmName() %>" height="260px" width="185px" style="border: 6px solid #000000; display: inline-table;">
                </a>
                <div class="text-details">
                    <h2><%= movie.getFilmName() %></h2>
                    <p>Director: <%= movie.getDirector() %></p>
                    <p>Duration: <%= movie.getDuration() %></p>
                    <% 
                        GenreDAO genreDAO = new GenreDAO();
                        String genreName = genreDAO.getGenreNameById(movie.getGenreId());
                    %>
                    <p>Genre: <%= genreName %></p>
                    <p>Cast: <%= movie.getCast() %></p>
                    <p>Release Date: <%= movie.getReleaseDate() %></p>
                    <p>Age Rating: <%= movie.getAgeRating() %></p>
                    <p>Description: <%= movie.getDescription() %></p>
                    <!-- Các thông tin khác về phim -->
                </div>
            </div>
            <div>
                <% 
     if (loggedInMember != null && loggedInMember.getUsername() != null) {
                %>
                <!-- Hiển thị nút "Đặt vé" chỉ khi đã đăng nhập -->
                <form action="chooseCinema" method="get">
                    <input type="hidden" name="filmId" value="<%= filmId %>">
                    <button type="submit">Đặt Vé</button>
                </form>
                <% 
                    } else {
                        // Nếu chưa đăng nhập, hiển thị thông báo yêu cầu đăng nhập
                        out.println("<h1 style=\"color:red\">Please login to booking ticket.</h1>");
                        out.println("<form action=\"login.jsp\" method=\"get\">");
                        out.println("<button type=\"submit\">Go to Login</button>");
                        out.println("</form>");
                    }
                %>
            </div>
        </div>
    </body>
</html>
<%
} else {
    // Nếu không tìm thấy thông tin phim, hiển thị thông báo
    out.println("Không tìm thấy thông tin phim.");
}
%>