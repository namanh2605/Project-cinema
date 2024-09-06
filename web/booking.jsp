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
 HttpSession sessionObj = request.getSession(); 
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
                background-color: #1c1c1c; 
                color: #ccc; 
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }

            .container {
                width: 80%;
                margin: auto;
                padding: 20px;
                background-color: #262626; 
                border-radius: 10px; 
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); 
            }

            .movie-header h1 {
                border-bottom: 2px solid #E50914; 
                padding-bottom: 10px;
                margin-bottom: 20px;
                color: #fff; 
            }

            .movie-details {
                display: flex;
                align-items: flex-start;
                justify-content: space-between;
                padding-bottom: 20px;
            }

            .movie-details img {
                margin-right: 20px; 
                border: 6px solid #E50914; 
            }

            .movie-details .text-details {
                max-width: 60%; 
            }

            .movie-details h2 {
                color: #E50914; 
                margin-bottom: 10px;
            }

            .movie-details p {
                margin: 5px 0;
            }

            .button {
                background-color: #E50914; 
                color: white;
                padding: 15px 30px; 
                text-decoration: none;
                border: none;
                cursor: pointer;
                border-radius: 25px; 
                font-size: 18px; 
                font-weight: bold; 
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
                transition: all 0.2s ease-in-out; 
                border: 2px solid transparent; 
            }

            .button:hover, .button:focus {
                background-color: #f21e0a; 
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); 
                transform: scale(1.05); 
                border-color: #fff; 
            }

            .rating {
                background-color: #333;
                color: white;
                padding: 5px 10px;
                border-radius: 5px; 
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
    out.println("Không tìm thấy thông tin phim.");
}
%>