package filter;

import entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebFilter({
        "/admin/*",
        "/account/change-password",
        "/account/edit-profile",
        "/video/like/*",
        "/video/share/*"
})
public class AuthFilter implements Filter {

    public static final String SECURITY_URI = "securityUri";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req  = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");
        String uri = req.getRequestURI();
        String query = req.getQueryString();
        String fullUri = uri + (query != null ? "?" + query : "");

        // --- 1. CHƯA ĐĂNG NHẬP ---
        if (user == null) {
            // Lưu lại URL mà người dùng định vào
            session.setAttribute(SECURITY_URI, fullUri);

            // Trả về một trang HTML nhỏ có alert + redirect sang login
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html><head><meta charset='UTF-8'></head><body>");
            out.println("<script>");
            out.println("alert('Bạn chưa đăng nhập nên không thể thực hiện chức năng này. Hãy đăng nhập.');");
            out.println("window.location = '" + req.getContextPath() + "/account/sign-in';");
            out.println("</script>");
            out.println("</body></html>");
            out.flush();
            return;
        }

        // --- 2. ĐÃ ĐĂNG NHẬP nhưng không phải ADMIN mà vào /admin/* ---
        boolean isAdminUrl = uri.contains("/admin/");
        boolean isAdmin = Boolean.TRUE.equals(user.getAdmin());

        if (isAdminUrl && !isAdmin) {
            resp.setContentType("text/html; charset=UTF-8");
            PrintWriter out = resp.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html><head><meta charset='UTF-8'></head><body>");
            out.println("<script>");
            out.println("alert('Tài khoản của bạn không có quyền truy cập trang này');");
            // Quay lại trang trước đó, không cho vào servlet admin
            out.println("window.history.back();");
            out.println("</script>");
            out.println("</body></html>");
            out.flush();
            return;
        }

        // --- 3. Đã đăng nhập hợp lệ -> cho đi tiếp ---
        chain.doFilter(request, response);
    }
}
