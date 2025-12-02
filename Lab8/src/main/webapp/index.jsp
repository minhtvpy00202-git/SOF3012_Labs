<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lab 8 - WebSocket</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff6347 0%, #ff8c69 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(255, 99, 71, 0.3);
            padding: 40px;
            max-width: 600px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #ff6347;
            font-size: 32px;
            margin-bottom: 30px;
            font-weight: 700;
        }

        .links-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top: 30px;
        }

        .link-card {
            background: linear-gradient(135deg, #fff5f3 0%, #ffe8e4 100%);
            border: 2px solid #ff6347;
            border-radius: 15px;
            padding: 25px;
            transition: all 0.3s ease;
            text-decoration: none;
            display: block;
        }

        .link-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(255, 99, 71, 0.3);
            border-color: #ff4500;
        }

        .link-card a {
            color: #ff4500;
            text-decoration: none;
            font-size: 18px;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .link-card a:hover {
            color: #ff6347;
        }

        .emoji {
            font-size: 24px;
        }

        .subtitle {
            color: #666;
            font-size: 14px;
            margin-top: 10px;
        }

        .badge {
            display: inline-block;
            background: linear-gradient(135deg, #ff6347 0%, #ff4500 100%);
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>🚀 Lab 8 - WebSocket Chat</h2>
        <p style="color: #666; font-size: 16px; margin-bottom: 20px;">
            Chọn một phòng chat để bắt đầu trò chuyện
        </p>

        <div class="links-container">
            <div class="link-card">
                <a href="json-chat.html">
                    <span class="emoji">💬</span>
                    <span>JSON Chat</span>
                </a>
                <div class="subtitle">Chat với định dạng JSON</div>
                <span class="badge">Recommended</span>
            </div>

            <div class="link-card">
                <a href="websocket-client.html">
                    <span class="emoji">📝</span>
                    <span>Simple Chat</span>
                </a>
                <div class="subtitle">Chat văn bản đơn giản</div>
            </div>
        </div>
    </div>
</body>
</html>
