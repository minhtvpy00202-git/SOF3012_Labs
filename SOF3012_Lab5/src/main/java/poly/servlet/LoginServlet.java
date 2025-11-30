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

        String username = request.getParameter("username");
        String password  = request.getParameter("password");

        if (username == null) username = "";
        if (password == null)  password  = "";

        User user = userDAO.findById(username);

        if (user == null) {
            request.setAttribute("error", "Sai username!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        if (!password.equals(user.getPassword())) {
            request.setAttribute("error", "Sai password!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        request.getSession().setAttribute("user", user);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
