<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Film Detail</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h2>Film Detail</h2>
            <table class="table">
                <tbody>
                    <tr>
                        <td>Film ID</td>
                        <td>${film.filmId}</td>
                    </tr>
                    <tr>
                        <td>Film Name</td>
                        <td>${film.filmName}</td>
                    </tr>
                    <tr>
                        <td>Duration</td>
                        <td>${film.duration}</td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td>${film.description}</td>
                    </tr>
                    <tr>
                        <td>Image</td>
                        <td><img src="img/${film.image}" alt="Film Image"></td>
                    </tr>
                    <tr>
                        <td>Trailer</td>
                        <td>${film.trailer}</td>
                    </tr>
                    <tr>
                        <td>Genre ID</td>
                        <td>${film.genreId}</td>
                    </tr>
                    <tr>
                        <td>Director</td>
                        <td>${film.director}</td>
                    </tr>
                    <tr>
                        <td>Cast</td>
                        <td>${film.cast}</td>
                    </tr>
                    <tr>
                        <td>Release Date</td>
                        <td>${film.releaseDate}</td>
                    </tr>
                    <tr>
                        <td>Age Rating</td>
                        <td>${film.ageRating}</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <form action="adminfilmdetail" method="post">
                                <input type="hidden" name="filmId" value="${film.filmId}">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                        <td colspan="2">
                            <form action="updateFilm" method="get">
                                <input type="hidden" name="image" value="${film.image}">
                                <input type="hidden" name="filmId" value="${film.filmId}">
                                <input type="hidden" name="filmName" value="${film.filmName}">
                                <input type="hidden" name="duration" value="${film.duration}">
                                <input type="hidden" name="description" value="${film.description}">
                                <input type="hidden" name="trailer" value="${film.trailer}">
                                <input type="hidden" name="genreId" value="${film.genreId}">
                                <input type="hidden" name="director" value="${film.director}">
                                <input type="hidden" name="cast" value="${film.cast}">
                                <input type="hidden" name="releaseDate" value="${film.releaseDate}">
                                <input type="hidden" name="ageRating" value="${film.ageRating}">
                                
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
