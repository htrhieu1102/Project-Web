package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "editProduct", value = "/editProduct")
public class EditProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int category = Integer.parseInt(request.getParameter("category"));
        String img = request.getParameter("img");
        String name = request.getParameter("name");
        int oldPrice = Integer.parseInt(request.getParameter("oldPrice"));
        int price = Integer.parseInt(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String branch = request.getParameter("branch");
        int deviceNumber = Integer.parseInt(request.getParameter("deviceNumber"));
        String description = request.getParameter("description");
        int id = Integer.parseInt(request.getParameter("id"));
        ProductService productService = new ProductService();
        productService.editProduct(category,img,name,oldPrice,price,amount,branch,deviceNumber,description,id);
        List<Product> list = productService.getProduct();
        request.setAttribute("delete",list);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-delete.jsp").forward(request,response);
    }
}
