<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Xóa thông tin người dùng khỏi session và đóng session
    session.removeAttribute("loggedInMember");
    session.invalidate(); // Xóa toàn bộ session
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <script>
        // Chuyển hướng trang sau khi đăng xuất
        window.location.href = "home";
    </script>
</head>
<body>
</body>
</html>
