package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet({"/account/sign-up", "/account/change-password","/account/edit-profile"})
public class AccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String uri = request.getRequestURI();

        // Gửi thêm message để phân biệt tạm các chức năng
        if (uri.contains("sign-up")) {
            request.setAttribute("message", "Trang đăng ký tài khoản");
        } else if (uri.contains("change-password")) {
            request.setAttribute("message", "Trang đổi mật khẩu");
        } else if (uri.contains("edit-profile")) {
            request.setAttribute("message", "Trang chỉnh sửa hồ sơ");
        }

        // Chuyển đến trang chung
        request.getRequestDispatcher("/views/page.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        // Tạm thời xử lý giống GET
        doGet(request, response);
    }
}
