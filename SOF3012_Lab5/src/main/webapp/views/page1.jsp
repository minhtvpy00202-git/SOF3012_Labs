<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thời sự - TinNhanh24h</title>
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
            background: linear-gradient(135deg, #ff6347 0%, #ff4500 100%);
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
            text-decoration: none;
            color: white;
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
            color: #ff6347;
            border-bottom-color: #ff6347;
        }
        /* Main Content */
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .breadcrumb {
            margin-bottom: 20px;
            font-size: 14px;
            color: #666;
        }
        .breadcrumb a {
            color: #ff6347;
            text-decoration: none;
        }
        .breadcrumb a:hover {
            text-decoration: underline;
        }
        .page-header {
            background: white;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .page-header h1 {
            color: #ff6347;
            font-size: 32px;
            margin-bottom: 10px;
        }
        .page-header p {
            color: #666;
            font-size: 16px;
        }
        /* Featured Article */
        .featured-article {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .featured-image {
            width: 100%;
            height: 400px;
            background: linear-gradient(135deg, #ff6347 0%, #ff4500 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 120px;
        }
        .featured-content {
            padding: 30px;
        }
        .article-category {
            display: inline-block;
            background: #ff6347;
            color: white;
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 13px;
            margin-bottom: 15px;
        }
        .article-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
            line-height: 1.3;
        }
        .article-meta {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            font-size: 14px;
            color: #999;
        }
        .article-body {
            color: #555;
            font-size: 16px;
            line-height: 1.8;
        }
        .article-body p {
            margin-bottom: 15px;
        }
        /* Article List */
        .article-list {
            display: grid;
            gap: 20px;
        }
        .article-item {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            display: flex;
            gap: 20px;
            transition: transform 0.3s;
        }
        .article-item:hover {
            transform: translateX(5px);
        }
        .article-icon {
            font-size: 50px;
            flex-shrink: 0;
        }
        .article-info h3 {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
        }
        .article-info p {
            color: #666;
            font-size: 15px;
            margin-bottom: 10px;
        }
        .article-time {
            font-size: 13px;
            color: #999;
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
            <a href="${pageContext.request.contextPath}/index.jsp" class="logo">TinNhanh24h</a>
            <div class="user-info">
                <div class="visitor-count">👥 ${applicationScope.visitors} lượt truy cập</div>
                <c:if test="${not empty sessionScope.user}">
                    <div class="user-welcome">👋 ${sessionScope.user.fullname}</div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Navigation -->
    <div class="nav">
        <div class="nav-content">
            <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a>
            <a href="${pageContext.request.contextPath}/views/page1.jsp" class="active">Thời sự</a>
            <a href="${pageContext.request.contextPath}/views/page2.jsp">Công nghệ</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="breadcrumb">
            <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a> / <span>Thời sự</span>
        </div>

        <div class="page-header">
            <h1>📰 Tin tức Thời sự</h1>
            <p>Cập nhật những tin tức chính trị, xã hội, sự kiện quan trọng trong và ngoài nước</p>
        </div>

        <!-- Featured Article -->
        <div class="featured-article">
            <div class="featured-image">🌍</div>
            <div class="featured-content">
                <span class="article-category">TIN NỔI BẬT</span>
                <h2 class="article-title">Hội nghị thượng đỉnh quốc tế diễn ra tại Hà Nội: Bước ngoặt mới trong quan hệ đối ngoại</h2>
                <div class="article-meta">
                    <span>✍️ Phóng viên Nguyễn Văn A</span>
                    <span>⏰ 2 giờ trước</span>
                    <span>👁️ 15,234 lượt xem</span>
                </div>
                <div class="article-body">
                    <p>
                        <strong>HÀ NỘI</strong> - Sáng nay, Hội nghị thượng đỉnh quốc tế với sự tham gia của các nhà lãnh đạo từ hơn 50 quốc gia đã chính thức khai mạc tại Trung tâm Hội nghị Quốc gia, Hà Nội. Đây được xem là một trong những sự kiện ngoại giao quan trọng nhất trong năm.
                    </p>
                    <p>
                        Phát biểu khai mạc, Thủ tướng Chính phủ nhấn mạnh tầm quan trọng của hợp tác đa phương trong bối cảnh thế giới đang đối mặt với nhiều thách thức toàn cầu. "Chúng ta cần đoàn kết, hợp tác để cùng nhau vượt qua khó khăn và xây dựng một tương lai tốt đẹp hơn cho thế hệ mai sau," Thủ tướng phát biểu.
                    </p>
                    <p>
                        Hội nghị sẽ diễn ra trong 3 ngày với nhiều phiên thảo luận về các vấn đề như biến đổi khí hậu, an ninh lương thực, chuyển đổi số và phát triển bền vững. Các nhà lãnh đạo cũng sẽ ký kết nhiều thỏa thuận hợp tác quan trọng trong các lĩnh vực kinh tế, thương mại và văn hóa.
                    </p>
                    <p>
                        Theo đánh giá của các chuyên gia, hội nghị này không chỉ khẳng định vị thế của Việt Nam trên trường quốc tế mà còn mở ra nhiều cơ hội hợp tác mới, góp phần thúc đẩy phát triển kinh tế - xã hội của đất nước.
                    </p>
                </div>
            </div>
        </div>

        <!-- More Articles -->
        <h2 style="margin: 30px 0 20px; color: #333;">Tin tức khác</h2>
        <div class="article-list">
            <div class="article-item">
                <div class="article-icon">🏛️</div>
                <div class="article-info">
                    <h3>Quốc hội thông qua nhiều nghị quyết quan trọng trong kỳ họp thứ 6</h3>
                    <p>Các nghị quyết liên quan đến phát triển kinh tế, cải cách hành chính và chính sách xã hội đã được thông qua với tỷ lệ tán thành cao...</p>
                    <div class="article-time">⏰ 3 giờ trước | 👁️ 8,456 lượt xem</div>
                </div>
            </div>

            <div class="article-item">
                <div class="article-icon">🚆</div>
                <div class="article-info">
                    <h3>Khởi công dự án đường sắt tốc độ cao Bắc - Nam</h3>
                    <p>Dự án trị giá hàng tỷ USD được kỳ vọng sẽ thay đổi bộ mặt giao thông vận tải của cả nước, rút ngắn thời gian di chuyển...</p>
                    <div class="article-time">⏰ 5 giờ trước | 👁️ 12,789 lượt xem</div>
                </div>
            </div>

            <div class="article-item">
                <div class="article-icon">🎓</div>
                <div class="article-info">
                    <h3>Bộ Giáo dục công bố chương trình giáo dục phổ thông mới</h3>
                    <p>Chương trình mới tập trung phát triển năng lực, phẩm chất học sinh, tích hợp kiến thức liên môn và ứng dụng công nghệ...</p>
                    <div class="article-time">⏰ 6 giờ trước | 👁️ 9,234 lượt xem</div>
                </div>
            </div>

            <div class="article-item">
                <div class="article-icon">🌾</div>
                <div class="article-info">
                    <h3>Nông dân miền Tây vui mùa lúa được giá</h3>
                    <p>Giá lúa tăng cao nhờ nhu cầu xuất khẩu tăng mạnh, người nông dân phấn khởi với thu nhập khả quan trong vụ mùa này...</p>
                    <div class="article-time">⏰ 7 giờ trước | 👁️ 6,123 lượt xem</div>
                </div>
            </div>

            <div class="article-item">
                <div class="article-icon">🏥</div>
                <div class="article-info">
                    <h3>Khánh thành bệnh viện đa khoa hiện đại tại TP.HCM</h3>
                    <p>Bệnh viện được trang bị công nghệ y tế tiên tiến, góp phần nâng cao chất lượng khám chữa bệnh cho người dân...</p>
                    <div class="article-time">⏰ 8 giờ trước | 👁️ 5,678 lượt xem</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 TinNhanh24h - Tin tức cập nhật 24/7</p>
        <p style="margin-top: 10px; font-size: 14px; opacity: 0.8;">Mọi thông tin và hình ảnh trên website đều được bảo vệ bản quyền</p>
    </div>
</body>
</html>
