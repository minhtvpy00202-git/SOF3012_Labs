<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TinNhanh24h - Tin tức cập nhật mới nhất</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }
        /* Header */
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            font-size: 28px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .logo::before {
            content: "📰";
            font-size: 32px;
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 14px;
        }
        .visitor-count {
            background: rgba(255,255,255,0.2);
            padding: 5px 12px;
            border-radius: 20px;
        }
        .user-welcome {
            background: rgba(255,255,255,0.2);
            padding: 5px 12px;
            border-radius: 20px;
        }
        .logout-btn {
            background: #e74c3c;
            color: white;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s;
        }
        .logout-btn:hover {
            background: #c0392b;
        }
        /* Navigation */
        .nav {
            background: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .nav-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            gap: 30px;
        }
        .nav a {
            display: block;
            padding: 15px 0;
            color: #333;
            text-decoration: none;
            font-weight: 500;
            border-bottom: 3px solid transparent;
            transition: all 0.3s;
        }
        .nav a:hover, .nav a.active {
            color: #667eea;
            border-bottom-color: #667eea;
        }
        /* Main Content */
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .hero {
            background: white;
            border-radius: 10px;
            padding: 40px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            text-align: center;
        }
        .hero h1 {
            color: #667eea;
            font-size: 36px;
            margin-bottom: 15px;
        }
        .hero p {
            color: #666;
            font-size: 18px;
        }
        /* News Grid */
        .news-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }
        .news-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }
        .news-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .news-image {
            width: 100%;
            height: 200px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 60px;
        }
        .news-content {
            padding: 20px;
        }
        .news-category {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 4px 12px;
            border-radius: 15px;
            font-size: 12px;
            margin-bottom: 10px;
        }
        .news-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .news-excerpt {
            color: #666;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 15px;
        }
        .news-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            color: #999;
        }
        .read-more {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }
        .read-more:hover {
            text-decoration: underline;
        }
        /* Footer */
        .footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 30px 20px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="header-content">
            <div class="logo">TinNhanh24h</div>
            <div class="user-info">
                <div class="visitor-count">👥 ${applicationScope.visitors} lượt truy cập</div>
                <c:if test="${not empty sessionScope.user}">
                    <div class="user-welcome">👋 ${sessionScope.user.fullname}</div>
                    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Đăng xuất</a>
                </c:if>
            </div>
        </div>
    </div>

    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <!-- Navigation -->
            <div class="nav">
                <div class="nav-content">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="active">Trang chủ</a>
                    <a href="${pageContext.request.contextPath}/views/page1.jsp">Thời sự</a>
                    <a href="${pageContext.request.contextPath}/views/page2.jsp">Công nghệ</a>
                </div>
            </div>

            <!-- Main Content -->
            <div class="container">
                <div class="hero">
                    <h1>Chào mừng đến với TinNhanh24h</h1>
                    <p>Cập nhật tin tức nóng hổi mỗi ngày - Nhanh chóng, chính xác, đáng tin cậy</p>
                </div>

                <h2 style="margin-bottom: 20px; color: #333;">📌 Tin nổi bật</h2>
                <div class="news-grid">
                    <div class="news-card">
                        <div class="news-image">🌍</div>
                        <div class="news-content">
                            <span class="news-category">Thời sự</span>
                            <div class="news-title">Hội nghị thượng đỉnh quốc tế diễn ra tại Hà Nội</div>
                            <div class="news-excerpt">
                                Hội nghị quy tụ các nhà lãnh đạo từ hơn 50 quốc gia, thảo luận về các vấn đề toàn cầu quan trọng...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 2 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page1.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>

                    <div class="news-card">
                        <div class="news-image">💻</div>
                        <div class="news-content">
                            <span class="news-category">Công nghệ</span>
                            <div class="news-title">Ra mắt công nghệ AI mới có khả năng học tập vượt trội</div>
                            <div class="news-excerpt">
                                Các nhà khoa học vừa công bố mô hình AI thế hệ mới với khả năng xử lý ngôn ngữ tự nhiên tiên tiến...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 4 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page2.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>

                    <div class="news-card">
                        <div class="news-image">⚽</div>
                        <div class="news-content">
                            <span class="news-category">Thể thao</span>
                            <div class="news-title">Đội tuyển Việt Nam giành chiến thắng ấn tượng</div>
                            <div class="news-excerpt">
                                Trong trận đấu kịch tính tối qua, đội tuyển Việt Nam đã có màn trình diễn xuất sắc và giành chiến thắng...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 5 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page1.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>

                    <div class="news-card">
                        <div class="news-image">🎬</div>
                        <div class="news-content">
                            <span class="news-category">Giải trí</span>
                            <div class="news-title">Phim Việt đạt doanh thu kỷ lục trong tuần đầu công chiếu</div>
                            <div class="news-excerpt">
                                Bộ phim mới nhất của đạo diễn nổi tiếng đã thu hút hàng triệu khán giả và phá vỡ nhiều kỷ lục phòng vé...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 6 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page1.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>

                    <div class="news-card">
                        <div class="news-image">💰</div>
                        <div class="news-content">
                            <span class="news-category">Kinh tế</span>
                            <div class="news-title">Thị trường chứng khoán tăng điểm mạnh trong phiên sáng</div>
                            <div class="news-excerpt">
                                VN-Index tăng hơn 20 điểm nhờ dòng tiền mạnh đổ vào các cổ phiếu ngân hàng và bất động sản...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 7 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page2.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>

                    <div class="news-card">
                        <div class="news-image">🏥</div>
                        <div class="news-content">
                            <span class="news-category">Sức khỏe</span>
                            <div class="news-title">Phát hiện phương pháp điều trị mới cho bệnh hiểm nghèo</div>
                            <div class="news-excerpt">
                                Các bác sĩ tại Bệnh viện Trung ương đã thành công trong việc áp dụng kỹ thuật điều trị tiên tiến...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 8 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page1.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="footer">
                <p>&copy; 2024 TinNhanh24h - Tin tức cập nhật 24/7</p>
                <p style="margin-top: 10px; font-size: 14px; opacity: 0.8;">Mọi thông tin và hình ảnh trên website đều được bảo vệ bản quyền</p>
            </div>
        </c:when>

        <c:otherwise>
            <jsp:forward page="/views/login.jsp"/>
        </c:otherwise>
    </c:choose>
</body>
</html>
