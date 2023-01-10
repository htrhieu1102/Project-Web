package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "searchByNameProduct", value = "/searchByNameProduct")
public class SearchByNameProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String text = request.getParameter("text");
        ProductService productService = new ProductService();
//        List<Product> list = productService.searchNameProduct(text);
//        request.setAttribute("delete",list);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-delete.jsp").forward(request,response);
    }
}
