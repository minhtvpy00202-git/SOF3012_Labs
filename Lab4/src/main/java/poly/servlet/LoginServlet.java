package poly.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.persistence.EntityManager;
import java.io.IOException;

import poly.DAO.UserDAO;
import poly.DAO.Impl.UserDAOImpl;
import poly.entity.User;
import poly.utils.JpaUtils;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        // Khởi tạo DAO dùng EntityManager chung
        EntityManager em = JpaUtils.getEntityManager();
        userDAO = new UserDAOImpl(em);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Chuyển tới trang login.jsp
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idOrEmail = request.getParameter("idOrEmail");
        String password  = request.getParameter("password");

        if (idOrEmail == null) idOrEmail = "";
        if (password == null)  password  = "";

        User user = userDAO.login(idOrEmail, password);

        if (user == null) {
            // Sai thông tin đăng nhập
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            request.setAttribute("idOrEmail", idOrEmail);
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        } else {
            // Đăng nhập thành công: lưu user vào session rồi quay về index.jsp
            request.getSession().setAttribute("user", user);

            // contextPath = /Lab4 => /Lab4/index.jsp
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}
