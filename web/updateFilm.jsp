<%-- 
    Document   : updateFilm
    Created on : Mar 19, 2024, 10:45:36 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Film Form</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #000;
        }

        form {
            background-color: #333;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            width: 400px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: #fff;
            margin-bottom: 5px;
        }

        .form-group input[type="text"], 
        .form-group input[type="date"],
        .form-group textarea {
            width: 80%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .form-group textarea {
            height: 100px;
        }

        .form-group button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
    </head>
    <body>
        <form action="updateFilm" method="post">
            <div class="form-group">
                <label for="filmName">Film Name:</label>
                <input type="text" id="filmName" name="filmName" value="${film.filmName}">
            </div>
            <div class="form-group">
                <label for="duration">Duration:</label>
                <input type="text" id="duration" name="duration" value="${film.duration}">
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description">${film.description}</textarea>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="text" id="image" name="image" value="${film.image}">
            </div>
            <div class="form-group">
                <label for="trailer">Trailer:</label>
                <input type="text" id="trailer" name="trailer" value="${film.trailer}">
            </div>
            <div class="form-group">
                <label for="genreId">Genre ID:</label>
                <input type="text" id="genreId" name="genreId" value="${film.genreId}">
            </div>
            <div class="form-group">
                <label for="director">Director:</label>
                <input type="text" id="director" name="director" value="${film.director}">
            </div>
            <div class="form-group">
                <label for="cast">Cast:</label>
                <input type="text" id="cast" name="cast" value="${film.cast}">
            </div>
            <div class="form-group">
                <label for="releaseDate">Release Date:</label>
                <input type="text" id="releaseDate" name="releaseDate" value="${film.releaseDate}">
            </div>
            <div class="form-group">
                <label for="ageRating">Age Rating:</label>
                <input type="text" id="ageRating" name="ageRating" value="${film.ageRating}">
            </div>
            <input type="hidden" name="filmId" value="${film.filmId}">
            <div class="form-group">
                <button type="submit">Update</button>
            </div>
        </form>
    </body>
</html>