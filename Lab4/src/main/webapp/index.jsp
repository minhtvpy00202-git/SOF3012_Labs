<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lab 4 – Trang chính</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        h2 {
            text-align: center;
            margin-bottom: 15px;
            color: #2c3e50;
        }

        p {
            text-align: center;
            color: #333;
        }

        ul {
            list-style: none;
            padding: 0;
            margin-top: 30px;
            text-align: center;
        }

        ul li {
            margin: 12px 0;
        }

        a {
            text-decoration: none;
            padding: 10px 18px;
            background: #3498db;
            color: white;
            border-radius: 6px;
            transition: 0.25s;
        }

        a:hover {
            background: #2980b9;
        }

        .logout-box {
            text-align: center;
            margin-top: 25px;
        }

        .logout-box a {
            background: #e74c3c;
        }

        .logout-box a:hover {
            background: #c0392b;
        }
    </style>

</head>
<body>

<div class="container">

    <c:choose>


        <c:when test="${not empty sessionScope.user}">
            <h2>Xin chào, ${sessionScope.user.fullname}!</h2>
            <p>Đăng nhập thành công.</p>

            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/search">
                        Bài 3 – Tìm kiếm video theo từ khóa
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/share-report">
                        Bài 4 – Thống kê chia sẻ video
                    </a>
                </li>
            </ul>

            <div class="logout-box">
                <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
            </div>
        </c:when>


        <c:otherwise>
            <jsp:forward page="/views/login.jsp"/>
        </c:otherwise>

    </c:choose>

</div>

</body>
</html>
