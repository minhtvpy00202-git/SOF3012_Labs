package poly.servlet;

import poly.DAO.Impl.FavouriteDAOImpl;
import poly.DAO.FavouriteDAO;
import poly.entity.Favourite;

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

@WebServlet("/videos")
public class VideoListServlet extends HttpServlet {

    private FavouriteDAO favouriteDAO;
    private EntityManager em;

    @Override
    public void init() throws ServletException {
        super.init();
        // Tạo EntityManager
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("PolyOE");
        em = emf.createEntityManager();

        // Khởi tạo DAO
        favouriteDAO = new FavouriteDAOImpl(em);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy danh sách tất cả các Favourite
        List<Favourite> favourites = favouriteDAO.findAll();

        // Gửi sang JSP
        request.setAttribute("favourites", favourites);

        // UTF-8 để hiển thị tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.getRequestDispatcher("/video-list.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        if (em != null) {
            em.close();
        }
        super.destroy();
    }
}
