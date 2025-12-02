<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Đăng nhập</h1>

        <!-- Hiện thông báo lỗi / thành công nếu có -->
        <c:if test="${not empty message}">
            <p style="color:red;">${message}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/account/sign-in" method="post">
            <div>
                <label for="id">Username:</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div>
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Đăng nhập</button>
        </form>
    </div>
</body>
</html>
