package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Category1", urlPatterns = {"category1"})
public class Category1 extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Title</title>");
        }
    }

    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService d = new ProductService();
        List<Product> list = d.getAll();
        String[] pp={"Dưới 1 triệu",
                "Từ 1-3 triệu",
                "Từ 3-5 triệu",
                "Trên 5 triệu"};
        boolean[] pb = new boolean[pp.length+1];
        pb[0]=true;
        List<Product> expensive=d.getExpensiveProducts();
        List<Product> cheap=d.getCheapProducts();
        boolean[] checkId = new boolean[list.size()+1];
        checkId[0]=true;
        request.setAttribute("data", list);
        request.setAttribute("expensive", expensive);
        request.setAttribute("cheap", cheap);
        request.setAttribute("pp", pp);
        request.setAttribute("pb", pb);
        request.setAttribute("cid", 0);
        request.setAttribute("checkId", checkId);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

}
