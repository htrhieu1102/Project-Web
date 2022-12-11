package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "loadFormEdit", value = "/loadFormEdit")
public class LoadFormEditProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid").substring(4);
        ProductService productService = new ProductService();
        Product p = productService.getProductDetail(Integer.parseInt(pid));
        request.setAttribute("product", p);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-form-edit.jsp").forward(request,response);
    }
}