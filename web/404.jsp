<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <title>Error 404 - Page Not Found</title>
    <style>
        html, body {
            height: 100%; 
            margin: 0;
        }
        .error-container {
            display: flex; 
            flex-direction: column; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            text-align: center;
            background-color: #333;
        }
        .error-image {
            width: 200px; 
            height: auto; 
            margin-bottom: 20px;
        }
        .error-message {
            font-size: 24px; /* Điều chỉnh kích thước chữ */
            color: red; /* Đổi màu chữ */
            font-weight: bold; /* Đậm chữ */
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %> <!-- Include header -->
    <div class="error-container">
        <img src="img/404.png" alt="404 Error Image" class="error-image">
        <p class="error-message">Error page not found</p>
    </div>
    <%@ include file="footer.jsp" %> <!-- Include footer -->
</body>
</html>