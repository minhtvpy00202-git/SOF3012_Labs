<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách Video</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #ccc; padding: 8px 12px; text-align: left; }
        th { background-color: #f4f4f4; }
    </style>
</head>
<body>
    <h2>Danh sách video</h2>
    <table>
        <thead>
            <tr>
                <th>Video title</th>
                <th>Người thích</th>
                <th>Ngày thích</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="fav" items="${favourites}">
                <tr>
                    <td>${fav.video.title}</td>
                    <td>${fav.user.fullname}</td>
                    <td>${fav.likeDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
