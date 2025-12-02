package poly.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.DispatcherType;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import poly.DAO.Impl.LogDAOImpl;
import poly.DAO.LogDAO;
import poly.entity.Log;
import poly.entity.User;
import poly.utils.JpaUtils;

import java.io.IOException;
import java.util.Date;

@WebFilter(urlPatterns = "/*", dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.FORWARD})
public class AppFilter implements Filter {

    private LogDAO logDAO;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        logDAO = new LogDAOImpl(JpaUtils.getEntityManager());
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String qs = req.getQueryString();
        String url = qs == null ? uri : uri + "?" + qs;

        String username = null;
        HttpSession session = req.getSession(false);
        if (session != null) {
            Object u = session.getAttribute("user");
            if (u instanceof User) {
                username = ((User) u).getId();
            }
        }

        Log log = new Log();
        log.setUrl(url);
        log.setAccessTime(new Date());
        log.setUsername(username);
        try {
            logDAO.create(log);
        } catch (Exception ignored) {
        }

        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {
    }
}
