<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Video Yêu Thích</title>
</head>
<body>
    <h2>${user.fullname}</h2>
    <p>Các video đã thích:</p>
    <ul>
        <c:forEach var="favourite" items="${favourites}">
            <li>${favourite.video.title}</li>
        </c:forEach>
    </ul>
</body>
</html>
