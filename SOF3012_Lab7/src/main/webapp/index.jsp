<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>LAB 7 - JAVA 4</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f0f2f5;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 600px;
                margin: 60px auto;
                padding: 30px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            h1.title {
                margin-bottom: 10px;
                color: #333;
                font-size: 28px;
            }

            .lab-list a {
                display: block;
                padding: 12px;
                margin: 10px 0;
                background: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 6px;
                font-size: 18px;
                transition: 0.2s;
            }

            .lab-list a:hover {
                background: #0056b3;
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