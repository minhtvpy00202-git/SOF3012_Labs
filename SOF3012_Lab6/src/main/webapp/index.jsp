<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Trang Chủ - Lab 6 Java 4</h1>

        <!-- Khu vực login/logout -->
        <div class="user-info">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <span>Bạn chưa đăng nhập.</span>
                    <a href="${pageContext.request.contextPath}/account/sign-in">Đăng nhập</a>
                </c:when>
                <c:otherwise>
                    <span>Xin chào, ${sessionScope.user.id}</span>
                    <a href="${pageContext.request.contextPath}/account/logout">Đăng xuất</a>
                </c:otherwise>
            </c:choose>
        </div>

        <hr/>

        <h2>Account</h2>
        <ul>
            <li><a href="/Lab6/account/sign-up">Đăng ký</a></li>
            <li><a href="/Lab6/account/change-password">Đổi mật khẩu</a></li>
            <li><a href="/Lab6/account/edit-profile">Chỉnh sửa hồ sơ</a></li>
        </ul>

        <h2>Video</h2>
        <ul>
            <li><a href="/Lab6/video/list">Danh sách video</a></li>
            <li><a href="/Lab6/video/detail/123">Chi tiết video (ví dụ: id=123)</a></li>
            <li><a href="/Lab6/video/like/123">Like video (id=123)</a></li>
            <li><a href="/Lab6/video/share/123">Share video (id=123)</a></li>
        </ul>

        <h2>Admin</h2>
        <ul>
            <li><a href="/Lab6/admin/video">Quản trị video</a></li>
            <li><a href="/Lab6/admin/user">Quản trị người dùng</a></li>
            <li><a href="/Lab6/admin/like">Quản trị lượt like</a></li>
            <li><a href="/Lab6/admin/share">Quản trị lượt share</a></li>
        </ul>
    </div>
</body>
</html>
