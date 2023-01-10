package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "delete", value = "/delete")
public class DeleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = (String) request.getParameter("pid").substring(6);
        ProductService productService = new ProductService();
        productService.deleteProduct(Integer.parseInt(pid));
        List<Product> list = productService.getProduct();
        request.setAttribute("delete",list);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-delete.jsp").forward(request,response);
    }
}
