package poly.servlet;

import poly.DAO.Impl.UserDAOImpl;
import poly.DAO.UserDAO;
import poly.entity.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/users")
public class UserListServlet extends HttpServlet {

    private UserDAO userDAO;
    private EntityManager em;

    @Override
    public void init() throws ServletException {
        super.init();
        // Tạo EntityManager
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
        em = emf.createEntityManager();
        // Khởi tạo DAO với EntityManager
        userDAO = new UserDAOImpl(em);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = userDAO.findAll();
        request.setAttribute("users", users);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.getRequestDispatcher("/user-list.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        if (em != null) {
            em.close();
        }
        super.destroy();
    }
}
