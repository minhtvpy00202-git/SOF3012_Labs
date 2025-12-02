package poly.servlet;

import java.io.IOException;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import poly.DAO.Impl.UserDAOImpl;
import poly.DAO.UserDAO;
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

        String id = request.getParameter("id");
        String password = request.getParameter("password");
        boolean remember = request.getParameter("remember") != null;

        if (id == null) id = "";
        if (password == null) password = "";

        User user = userDAO.findById(id);

        if (user == null) {
            request.setAttribute("error", "Sai username");
            request.setAttribute("id", id);
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        if (!password.equals(user.getPassword())) {
            request.setAttribute("error", "Sai password");
            request.setAttribute("id", id);
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        if (remember) {
            session.setAttribute("rememberId", id);
            session.setAttribute("rememberPassword", password);
        } else {
            session.removeAttribute("rememberId");
            session.removeAttribute("rememberPassword");
        }
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
