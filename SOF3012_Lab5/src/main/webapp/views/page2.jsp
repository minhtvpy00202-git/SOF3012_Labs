<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Công nghệ - TinNhanh24h</title>
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
            background: linear-gradient(135deg, #ff6347 0%, #ff4500 100%);
            color: white;
            padding: 40px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .page-header h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }
        .page-header p {
            font-size: 16px;
            opacity: 0.9;
        }
        /* Tech Grid */
        .tech-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }
        .tech-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .tech-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        .tech-image {
            width: 100%;
            height: 200px;
            background: linear-gradient(135deg, #ff6347 0%, #ff4500 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 80px;
        }
        .tech-content {
            padding: 25px;
        }
        .tech-category {
            display: inline-block;
            background: #ff6347;
            color: white;
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 12px;
            margin-bottom: 12px;
        }
        .tech-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 12px;
            line-height: 1.4;
        }
        .tech-excerpt {
            color: #666;
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 15px;
        }
        .tech-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            color: #999;
            padding-top: 15px;
            border-top: 1px solid #eee;
        }
        /* Trending Section */
        .trending {
            background: white;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .trending h2 {
            color: #333;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .trending-list {
            display: grid;
            gap: 15px;
        }
        .trending-item {
            display: flex;
            gap: 15px;
            padding: 15px;
            border-radius: 8px;
            background: #f8f9fa;
            transition: background 0.3s;
        }
        .trending-item:hover {
            background: #e9ecef;
        }
        .trending-number {
            font-size: 24px;
            font-weight: bold;
            color: #ff6347;
            min-width: 40px;
        }
        .trending-info h4 {
            font-size: 16px;
            color: #333;
            margin-bottom: 5px;
        }
        .trending-info p {
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
            <a href="${pageContext.request.contextPath}/views/page1.jsp">Thời sự</a>
            <a href="${pageContext.request.contextPath}/views/page2.jsp" class="active">Công nghệ</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="breadcrumb">
            <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a> / <span>Công nghệ</span>
        </div>

        <div class="page-header">
            <h1>💻 Tin tức Công nghệ</h1>
            <p>Cập nhật xu hướng công nghệ mới nhất, đánh giá sản phẩm và hướng dẫn sử dụng</p>
        </div>

        <!-- Trending Section -->
        <div class="trending">
            <h2>🔥 Xu hướng công nghệ hot nhất</h2>
            <div class="trending-list">
                <div class="trending-item">
                    <div class="trending-number">#1</div>
                    <div class="trending-info">
                        <h4>AI tạo sinh đang thay đổi cách chúng ta làm việc</h4>
                        <p>⏰ 1 giờ trước | 👁️ 25,678 lượt xem</p>
                    </div>
                </div>
                <div class="trending-item">
                    <div class="trending-number">#2</div>
                    <div class="trending-info">
                        <h4>iPhone 16 Pro Max: Đánh giá chi tiết sau 1 tháng sử dụng</h4>
                        <p>⏰ 2 giờ trước | 👁️ 18,234 lượt xem</p>
                    </div>
                </div>
                <div class="trending-item">
                    <div class="trending-number">#3</div>
                    <div class="trending-info">
                        <h4>Công nghệ 6G: Tương lai của kết nối không dây</h4>
                        <p>⏰ 3 giờ trước | 👁️ 12,456 lượt xem</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tech Articles Grid -->
        <h2 style="margin-bottom: 20px; color: #333;">📱 Tin tức mới nhất</h2>
        <div class="tech-grid">
            <div class="tech-card">
                <div class="tech-image">🤖</div>
                <div class="tech-content">
                    <span class="tech-category">TRÍ TUỆ NHÂN TẠO</span>
                    <div class="tech-title">Ra mắt mô hình AI mới với khả năng học tập vượt trội</div>
                    <div class="tech-excerpt">
                        Các nhà khoa học vừa công bố mô hình AI thế hệ mới với khả năng xử lý ngôn ngữ tự nhiên tiên tiến, có thể hiểu và tạo ra nội dung phức tạp với độ chính xác cao hơn 95%.
                    </div>
                    <div class="tech-meta">
                        <span>⏰ 4 giờ trước</span>
                        <span>👁️ 15,234 lượt xem</span>
                    </div>
                </div>
            </div>

            <div class="tech-card">
                <div class="tech-image">📱</div>
                <div class="tech-content">
                    <span class="tech-category">SMARTPHONE</span>
                    <div class="tech-title">Samsung Galaxy S24 Ultra: Đột phá camera AI và hiệu năng</div>
                    <div class="tech-excerpt">
                        Flagship mới nhất của Samsung mang đến nhiều cải tiến đáng giá với camera 200MP tích hợp AI, chip Snapdragon 8 Gen 3 mạnh mẽ và pin 5000mAh.
                    </div>
                    <div class="tech-meta">
                        <span>⏰ 5 giờ trước</span>
                        <span>👁️ 13,567 lượt xem</span>
                    </div>
                </div>
            </div>

            <div class="tech-card">
                <div class="tech-image">💻</div>
                <div class="tech-content">
                    <span class="tech-category">LAPTOP</span>
                    <div class="tech-title">MacBook Pro M3: Hiệu năng đỉnh cao cho dân chuyên nghiệp</div>
                    <div class="tech-excerpt">
                        Apple tiếp tục khẳng định vị thế với chip M3 mới, mang lại hiệu năng vượt trội gấp 2 lần so với thế hệ trước, đặc biệt trong xử lý đồ họa và video.
                    </div>
                    <div class="tech-meta">
                        <span>⏰ 6 giờ trước</span>
                        <span>👁️ 11,234 lượt xem</span>
                    </div>
                </div>
            </div>

            <div class="tech-card">
                <div class="tech-image">🎮</div>
                <div class="tech-content">
                    <span class="tech-category">GAMING</span>
                    <div class="tech-title">PlayStation 5 Pro chính thức ra mắt với nhiều nâng cấp</div>
                    <div class="tech-excerpt">
                        Sony công bố phiên bản Pro của PS5 với GPU mạnh hơn 45%, hỗ trợ ray tracing nâng cao và khả năng chơi game ở độ phân giải 8K.
                    </div>
                    <div class="tech-meta">
                        <span>⏰ 7 giờ trước</span>
                        <span>👁️ 16,789 lượt xem</span>
                    </div>
                </div>
            </div>

            <div class="tech-card">
                <div class="tech-image">🔐</div>
                <div class="tech-content">
                    <span class="tech-category">BẢO MẬT</span>
                    <div class="tech-title">Cảnh báo lỗ hổng bảo mật nghiêm trọng trên Windows</div>
                    <div class="tech-excerpt">
                        Microsoft khuyến cáo người dùng cập nhật ngay bản vá mới nhất để khắc phục lỗ hổng bảo mật có thể cho phép hacker chiếm quyền điều khiển hệ thống.
                    </div>
                    <div class="tech-meta">
                        <span>⏰ 8 giờ trước</span>
                        <span>👁️ 9,456 lượt xem</span>
                    </div>
                </div>
            </div>

            <div class="tech-card">
                <div class="tech-image">🚗</div>
                <div class="tech-content">
                    <span class="tech-category">XE ĐIỆN</span>
                    <div class="tech-title">Tesla Model Y 2024: Pin mới tăng phạm vi hoạt động 30%</div>
                    <div class="tech-excerpt">
                        Phiên bản cập nhật của Model Y sử dụng công nghệ pin 4680 mới, cho phép di chuyển xa hơn với một lần sạc và sạc nhanh hơn 20%.
                    </div>
                    <div class="tech-meta">
                        <span>⏰ 9 giờ trước</span>
                        <span>👁️ 14,123 lượt xem</span>
                    </div>
                </div>
            </div>

            <div class="tech-card">
                <div class="tech-image">⌚</div>
                <div class="tech-content">
                    <span class="tech-category">WEARABLE</span>
                    <div class="tech-title">Apple Watch Series 10: Theo dõi sức khỏe toàn diện</div>
                    <div class="tech-excerpt">
                        Thế hệ mới của Apple Watch bổ sung cảm biến đo đường huyết không xâm lấn, theo dõi giấc ngủ chi tiết và pin kéo dài 48 giờ.
                    </div>
                    <div class="tech-meta">
                        <span>⏰ 10 giờ trước</span>
                        <span>👁️ 8,234 lượt xem</span>
                    </div>
                </div>
            </div>

            <div class="tech-card">
                <div class="tech-image">🌐</div>
                <div class="tech-content">
                    <span class="tech-category">INTERNET</span>
                    <div class="tech-title">Việt Nam triển khai mạng 5G trên toàn quốc</div>
                    <div class="tech-excerpt">
                        Các nhà mạng lớn đã hoàn tất việc phủ sóng 5G tại 63 tỉnh thành, mang đến tốc độ internet di động nhanh gấp 10 lần so với 4G.
                    </div>
                    <div class="tech-meta">
                        <span>⏰ 11 giờ trước</span>
                        <span>👁️ 10,567 lượt xem</span>
                    </div>
                </div>
            </div>

            <div class="tech-card">
                <div class="tech-image">🎧</div>
                <div class="tech-content">
                    <span class="tech-category">AUDIO</span>
                    <div class="tech-title">AirPods Pro 3: Chống ồn thông minh và âm thanh không gian</div>
                    <div class="tech-excerpt">
                        Apple nâng cấp tai nghe với chip H3 mới, chống ồn chủ động thích ứng và tính năng âm thanh không gian được cải thiện đáng kể.
                    </div>
                    <div class="tech-meta">
                        <span>⏰ 12 giờ trước</span>
                        <span>👁️ 7,890 lượt xem</span>
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
</body>
</html>
