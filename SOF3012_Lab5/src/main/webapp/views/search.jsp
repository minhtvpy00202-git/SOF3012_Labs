<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm video</title>
</head>
<body>
<c:if test="${not empty sessionScope.user}">
    <p>Họ và tên: ${sessionScope.user.fullname}</p>
</c:if>
<h2>Tìm kiếm video theo từ khóa (title)</h2>

<form action="${pageContext.request.contextPath}/search" method="get">
    <input type="text" name="keyword" placeholder="Nhập từ khóa..."
           value="${fn:escapeXml(param.keyword)}"/>
    <button type="submit">Tìm kiếm</button>
</form>

<hr/>

<c:choose>
    <c:when test="${not empty videos}">
        <table border="1" cellpadding="5" cellspacing="0">
            <thead>
            <tr>
                <th>Mã</th>
                <th>Tiêu đề</th>
                <th>Poster</th>
                <th>Lượt xem</th>
                <th>Đang hoạt động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="v" items="${videos}">
                <tr>
                    <td>${v.id}</td>
                    <td>${v.title}</td>
                    <td>${v.poster}</td>
                    <td>${v.views}</td>
                    <td><c:out value="${v.active ? 'Yes' : 'No'}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:when>

    <c:when test="${not empty param.keyword}">
        <p>Không tìm thấy video nào với từ khóa:
            "<strong>${param.keyword}</strong>".</p>
    </c:when>

    <c:otherwise>
        <p>Nhập từ khóa rồi bấm "Tìm kiếm".</p>
    </c:otherwise>
</c:choose>

</body>
</html>
