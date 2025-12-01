<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lab 4 – Trang chính</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            background: #f5f7fb;
            color: #333;
        }
        .wrapper {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 16px;
        }
        .page-title {
            text-align: center;
            margin-bottom: 24px;
            font-size: 26px;
            color: #2c3e50;
        }
        .card {
            background: #fff;
            border-radius: 10px;
            padding: 24px 28px;
            box-shadow: 0 4px 18px rgba(0,0,0,.06);
        }
        .welcome {
            margin-bottom: 16px;
        }
        .welcome h2 {
            margin: 0 0 6px;
            font-size: 22px;
            color: #27ae60;
        }
        .welcome p {
            margin: 0;
            color: #555;
        }
        .link-list {
            margin: 20px 0;
            padding: 0;
            list-style: none;
        }
        .link-list li {
            margin-bottom: 10px;
        }
        .link-list a {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
            background: #3498db;
            color: #fff;
            transition: background .2s, transform .1s;
        }
        .link-list a:hover {
            background: #2980b9;
            transform: translateY(-1px);
        }
        .logout {
            margin-top: 12px;
        }
        .logout a {
            font-size: 14px;
            color: #e74c3c;
            text-decoration: none;
        }
        .logout a:hover {
            text-decoration: underline;
        }
        .note {
            text-align: center;
            color: #777;
            margin-top: 16px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<p style="text-align:center">Lượt truy cập: ${applicationScope.visitors}</p>
<div class="wrapper">
    <h1 class="page-title">Lab 4 – PolyOE</h1>

    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <div class="card">
                <div class="welcome">
                    <h2>Xin chào, ${sessionScope.user.fullname}!</h2>
                    <p>Đăng nhập thành công. Hãy chọn bài Lab bên dưới để xem kết quả.</p>
                </div>

                <ul class="link-list">
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

                <div class="logout">
                    <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                </div>
            </div>


        </c:when>

        <c:otherwise>
            <jsp:forward page="/views/login.jsp"/>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
