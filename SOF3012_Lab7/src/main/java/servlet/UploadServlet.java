package servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@MultipartConfig
@WebServlet("/ajax/fetch/upload")
public class UploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("photo");
        String name = part.getSubmittedFileName(); //ten file
        long size = part.getSize(); //kich thuoc file
        String type = part.getContentType(); //kieu file

        String filename = req.getServletContext().getRealPath("/files/" + name);
        part.write(filename); //luu vao file tren Server

        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json");
        String format = "{\"name\":\"%s\",\"type\":\"%s\",\"size\":%d}";
        String responseData = String.format(format, name, type, size);
        resp.getWriter().print(responseData);

    }
}
