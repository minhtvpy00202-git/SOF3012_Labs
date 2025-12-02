package servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ajax/employee")
public class EmployeeJsonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Thiết lập encoding + kiểu dữ liệu JSON
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        //Chuỗi JSOn
        String json = """
    {
        "manv": "TEONV",
        "hoTen": "Nguyễn Văn Tèo",
        "gioiTinh": "true",
        "luong": 950.5
    }
    """;

        resp.getWriter().print(json);
    }

}
