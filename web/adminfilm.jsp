<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Movies</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Danh sách các bộ phim</h2>
        <div class="row">
            <div class="col-md-6">
                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Film Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="film" items="${films}">
                            <tr>
                                <td>${film.filmId}</td>
                                <td><a href="adminfilmdetail?id=${film.filmId}">${film.filmName}</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <div id="film-details">
                </div>
            </div>
        </div>
    </div>
</body>
</html>