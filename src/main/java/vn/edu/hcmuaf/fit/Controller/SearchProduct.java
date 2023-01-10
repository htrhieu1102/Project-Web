package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "searchProduct", value = "/searchProduct")
public class SearchProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        ProductService productService = new ProductService();
//        List<Product> list = productService.searchNameProduct(search);
//        request.setAttribute("searchProduct", list);
        request.getRequestDispatcher("searchProduct.jsp").forward(request, response);
    }
}
