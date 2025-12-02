<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>LAB 7 - JAVA 4</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #fff5f5 0%, #ffe5e5 100%);
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }

            .container {
                max-width: 600px;
                margin: 60px auto;
                padding: 30px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 20px rgba(255, 99, 71, 0.2);
                text-align: center;
                border: 2px solid #ffcccb;
            }

            h1.title {
                margin-bottom: 10px;
                color: tomato;
                font-size: 28px;
                text-shadow: 1px 1px 2px rgba(255, 99, 71, 0.1);
            }

            .container > p {
                color: #ff6347;
                font-weight: 500;
            }

            .lab-list a {
                display: block;
                padding: 12px;
                margin: 10px 0;
                background: tomato;
                color: white;
                text-decoration: none;
                border-radius: 6px;
                font-size: 18px;
                transition: all 0.3s ease;
                box-shadow: 0 2px 8px rgba(255, 99, 71, 0.3);
            }

            .lab-list a:hover {
                background: #ff4520;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(255, 99, 71, 0.4);
            }
        </style>

    </head>

    <body>

        <div class="container">
            <h1 class="title">LAB 7 - JAVA 4</h1>
            <p>Chọn bài thực hành:</p>

            <div class="lab-list">
                <a href="${pageContext.request.contextPath}/employee-fetch.html">Bài 1 – Fetch JSON</a>
            </div>

            <div class="lab-list">
                <a href="${pageContext.request.contextPath}/uploadFile.html">Bài 2 – Upload file với Fetch API - CLient
                    Side</a>
            </div>

            <div class="lab-list">
                <a href="${pageContext.request.contextPath}/employee-rest-client.html">Bài 4 – employee rest client</a>
            </div>

        </div>

    </body>

    </html>