<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo cáo chia sẻ video</title>
</head>
<body>
<div>Khách truy cập: ${applicationScope.visitors}</div>
<c:if test="${not empty sessionScope.user}">
    <p>Đã đăng nhập: ${sessionScope.user.fullname}</p>
</c:if>
<h2>Thông tin chia sẻ tổng hợp của từng video</h2>

<table border="1" cellpadding="5" cellspacing="0">
    <thead>
    <tr>
        <th>STT</th>
        <th>Mã video</th>
        <th>Tiêu đề</th>
        <th>Số lượt chia sẻ</th>
        <th>Ngày chia sẻ đầu tiên</th>
        <th>Ngày chia sẻ cuối cùng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${reports}" varStatus="st">
        <tr>
            <td>${st.index + 1}</td>
            <td>${r.videoId}</td>
            <td>${r.title}</td>
            <td>${r.shareCount}</td>
            <td>
                <fmt:formatDate value="${r.firstShareDate}" pattern="dd/MM/yyyy"/>
            </td>
            <td>
                <fmt:formatDate value="${r.lastShareDate}" pattern="dd/MM/yyyy"/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
