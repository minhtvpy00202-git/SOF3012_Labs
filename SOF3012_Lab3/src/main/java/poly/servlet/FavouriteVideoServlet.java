package poly.servlet;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import poly.DAO.Impl.UserDAOImpl;
import poly.DAO.UserDAO;
import poly.entity.Favourite;
import poly.entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/favourite-videos")
public class FavouriteVideoServlet extends HttpServlet {
    private UserDAO userDAO;
    private EntityManager em;

    @Override
    public void init() throws ServletException {
        super.init();
        // Tạo EntityManager
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE"); // tên persistence-unit
        em = emf.createEntityManager();

        // Khởi tạo DAO
        userDAO = new UserDAOImpl(em);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy userId từ request (ví dụ: ?userId=user01)
        String userId = request.getParameter("userId");

        if (userId == null || userId.isEmpty()) {
            response.getWriter().println("User ID không hợp lệ!");
            return;
        }

        // Lấy User từ DAO
        User user = userDAO.findById(userId);
        if (user == null) {
            response.getWriter().println("Người dùng không tồn tại!");
            return;
        }

        // Lấy danh sách Favourite
        List<Favourite> favorites = user.getFavourites(); // mapping trong entity User

        // Gửi sang JSP
        request.setAttribute("user", user);
        request.setAttribute("favourites", favorites);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");


        request.getRequestDispatcher("/favourite-videos.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        if (em != null) {
            em.close();
        }
        super.destroy();
    }
}

