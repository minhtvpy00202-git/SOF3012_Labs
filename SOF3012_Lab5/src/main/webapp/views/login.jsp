<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }
        .login-box {
            width: 360px;
            margin: 80px auto;
            padding: 24px 28px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,.08);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 8px 0 4px;
        }
        input[type=text],
        input[type=password] {
            width: 100%;
            padding: 8px 10px;
            box-sizing: border-box;
        }
        .error {
            color: #c0392b;
            margin: 8px 0;
        }
        .btn {
            margin-top: 14px;
            width: 100%;
            padding: 8px 10px;
            border: none;
            cursor: pointer;
            background: #3498db;
            color: #fff;
        }
        .btn:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
<div style="text-align:center;color:#555;">Khách truy cập: ${applicationScope.visitors}</div>
<div class="login-box">
    <h2>Đăng nhập</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login">
        <label for="id">Username</label>
        <input type="text" id="id" name="id"
               value="${empty id ? sessionScope.rememberId : id}" />

        <label for="password">Mật khẩu</label>
        <input type="password" id="password" name="password"
               value="${sessionScope.rememberPassword}" />

        <label style="margin-top:8px; display:block">
            <input type="checkbox" id="remember" name="remember" /> Remember me
        </label>

        <button type="submit" class="btn">Đăng nhập</button>
    </form>
</div>
</body>
</html>
