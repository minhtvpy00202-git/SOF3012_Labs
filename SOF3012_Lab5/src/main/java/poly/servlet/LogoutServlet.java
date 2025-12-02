package poly.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rememberId = null;
        String rememberPassword = null;

        HttpSession oldSession = request.getSession(false);
        if (oldSession != null) {
            Object rid = oldSession.getAttribute("rememberId");
            Object rpw = oldSession.getAttribute("rememberPassword");
            rememberId = rid instanceof String ? (String) rid : null;
            rememberPassword = rpw instanceof String ? (String) rpw : null;
            oldSession.invalidate();
        }

        HttpSession newSession = request.getSession(true);
        if (rememberId != null) {
            newSession.setAttribute("rememberId", rememberId);
            newSession.setAttribute("rememberPassword", rememberPassword);
        }

        response.sendRedirect(request.getContextPath() + "/views/login.jsp");
    }
}
