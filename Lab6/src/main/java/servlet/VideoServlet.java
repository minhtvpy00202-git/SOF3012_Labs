package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet({
        "/video/list",
        "/video/detail/*",
        "/video/like/*",
        "/video/share/*"
})
public class VideoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getRequestURI();

        if (uri.contains("/video/list")) {
            request.setAttribute("message", "Trang danh sách video");
        } else if (uri.contains("/video/detail")) {
            request.setAttribute("message", "Trang chi tiết video");
        } else if (uri.contains("/video/like")) {
            request.setAttribute("message", "Xử lý like video");
        } else if (uri.contains("/video/share")) {
            request.setAttribute("message", "Xử lý share video");
        }

        request.getRequestDispatcher("/views/page.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
