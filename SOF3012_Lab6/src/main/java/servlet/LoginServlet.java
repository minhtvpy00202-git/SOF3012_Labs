package servlet;

import dao.UserDao;
import dao.Impl.UserDaoImpl;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import filter.AuthFilter;

import java.io.IOException;

@WebServlet("/account/sign-in")
public class LoginServlet extends HttpServlet {

    private UserDao userDAO;

    @Override
    public void init() throws ServletException {
        // Không cần EntityManager ở đây nữa
        userDAO = new UserDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/views/login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        // Dùng luôn hàm bạn đã viết trong DAO
        User user = userDAO.findByIdAndPassword(id, password);

        if (user == null) {
            request.setAttribute("message", "Sai username hoặc mật khẩu!");
            request.getRequestDispatcher("/views/login.jsp")
                    .forward(request, response);
            return;
        }

        // Đăng nhập thành công -> lưu user vào session
        session.setAttribute("user", user);

        // Lấy lại URL bảo mật được lưu bởi AuthFilter
        String securityUri = (String) session.getAttribute(AuthFilter.SECURITY_URI);
        if (securityUri != null) {
            session.removeAttribute(AuthFilter.SECURITY_URI);
            response.sendRedirect(securityUri);
        } else {
            // Không có URL được lưu thì cho về trang chủ
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
