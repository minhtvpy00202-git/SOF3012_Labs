package poly.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.atomic.AtomicInteger;

@WebListener
public class VisitorListener implements ServletContextListener, HttpSessionListener {

    private Path storagePath;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String base = System.getProperty("catalina.base", System.getProperty("java.io.tmpdir"));
        storagePath = Paths.get(base, "visitors.txt");

        int count = 0;
        try {
            if (Files.exists(storagePath)) {
                String s = Files.readString(storagePath, StandardCharsets.UTF_8).trim();
                if (!s.isEmpty()) count = Integer.parseInt(s);
            }
        } catch (Exception ignored) {
        }

        ServletContext ctx = sce.getServletContext();
        ctx.setAttribute("visitors", new AtomicInteger(count));
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        ServletContext ctx = se.getSession().getServletContext();
        Object obj = ctx.getAttribute("visitors");
        if (obj instanceof AtomicInteger ai) {
            ai.incrementAndGet();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();
        Object obj = ctx.getAttribute("visitors");
        int count = 0;
        if (obj instanceof AtomicInteger ai) {
            count = ai.get();
        }
        try {
            if (storagePath == null) {
                String base = System.getProperty("catalina.base", System.getProperty("java.io.tmpdir"));
                storagePath = Paths.get(base, "visitors.txt");
            }
            Files.writeString(storagePath, Integer.toString(count), StandardCharsets.UTF_8);
        } catch (Exception ignored) {
        }
    }
}
