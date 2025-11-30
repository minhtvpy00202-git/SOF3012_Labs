
package poly.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.persistence.EntityManager;
import poly.DAO.VideoDAO;
import poly.DAO.Impl.VideoDAOImpl;
import poly.entity.Video;
import poly.utils.JpaUtils;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/search")
public class SearchVideoServlet extends HttpServlet {

    private VideoDAO videoDAO;

    @Override
    public void init() throws ServletException {
        EntityManager em = JpaUtils.getEntityManager();
        videoDAO = new VideoDAOImpl(em);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        List<Video> videos = Collections.emptyList();

        if (keyword != null && !keyword.isBlank()) {
            videos = videoDAO.findByKeyword(keyword);
        }

        request.setAttribute("keyword", keyword);
        request.setAttribute("videos", videos);

        request.getRequestDispatcher("/views/search.jsp")
                .forward(request, response);
    }

    @Override
    public void destroy() {

    }
}
