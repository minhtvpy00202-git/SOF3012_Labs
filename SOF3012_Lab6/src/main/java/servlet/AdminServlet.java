package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet({
        "/admin/video",
        "/admin/user",
        "/admin/like",
        "/admin/share"
})
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getRequestURI();

        if (uri.contains("/admin/video")) {
            request.setAttribute("message", "Quản trị video");
        } else if (uri.contains("/admin/user")) {
            request.setAttribute("message", "Quản trị người dùng");
        } else if (uri.contains("/admin/like")) {
            request.setAttribute("message", "Thống kê/QL lượt like");
        } else if (uri.contains("/admin/share")) {
            request.setAttribute("message", "Thống kê/QL lượt share");
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
