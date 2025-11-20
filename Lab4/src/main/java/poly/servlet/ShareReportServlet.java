// src/main/java/poly/servlet/ShareReportServlet.java
package poly.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.persistence.EntityManager;
import poly.DAO.ShareDAO;
import poly.DAO.Impl.ShareDAOImpl;
import poly.model.ShareReport;
import poly.utils.JpaUtils;

import java.io.IOException;
import java.util.List;

@WebServlet("/share-report")
public class ShareReportServlet extends HttpServlet {

    private ShareDAO shareDAO;

    @Override
    public void init() throws ServletException {
        EntityManager em = JpaUtils.getEntityManager();
        shareDAO = new ShareDAOImpl(em);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<ShareReport> reports = shareDAO.getShareReports();
        request.setAttribute("reports", reports);

        request.getRequestDispatcher("/views/shareReport.jsp")
                .forward(request, response);
    }
}
