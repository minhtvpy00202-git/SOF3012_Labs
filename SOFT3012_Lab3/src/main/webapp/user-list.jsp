<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách User</title>
    <style>
        table { border-collapse: collapse; width: 50%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #eee; }
        a.button { padding: 4px 8px; background-color: #4CAF50; color: white; text-decoration: none; border-radius: 4px; }
        a.button:hover { background-color: #45a049; }
    </style>
</head>
<body>
    <h2>Danh sách User</h2>
    <table>
        <thead>
            <tr>
                <th>Fullname</th>
                <th>Video đã thích</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.fullname}</td>
                    <td>
                        <a class="button" href="favourite-videos?userId=${user.id}">Video đã thích</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
