package poly.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;

@WebListener
public class VisitorListener implements ServletContextListener, HttpSessionListener {

    private String storagePath(ServletContext ctx) {
        String p = ctx.getRealPath("/WEB-INF/visitors.txt");
        if (p == null) {
            p = System.getProperty("java.io.tmpdir") + File.separator + "visitors.txt";
        }
        return p;
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();
        long count = 0L;
        try {
            Path path = Path.of(storagePath(ctx));
            if (Files.exists(path)) {
                String s = Files.readString(path).trim();
                if (!s.isEmpty()) count = Long.parseLong(s);
            }
        } catch (Exception ignored) {
        }
        ctx.setAttribute("visitors", count);
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        ServletContext ctx = se.getSession().getServletContext();
        Object o = ctx.getAttribute("visitors");
        long count = 0L;
        if (o instanceof Number) {
            count = ((Number) o).longValue();
        } else if (o instanceof String) {
            try { count = Long.parseLong((String) o); } catch (Exception ignored) {}
        }
        ctx.setAttribute("visitors", count + 1);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();
        Object o = ctx.getAttribute("visitors");
        long count = 0L;
        if (o instanceof Number) {
            count = ((Number) o).longValue();
        } else if (o instanceof String) {
            try { count = Long.parseLong((String) o); } catch (Exception ignored) {}
        }
        try {
            Path path = Path.of(storagePath(ctx));
            Files.createDirectories(path.getParent());
            Files.writeString(path, Long.toString(count));
        } catch (Exception ignored) {
        }
    }
}
