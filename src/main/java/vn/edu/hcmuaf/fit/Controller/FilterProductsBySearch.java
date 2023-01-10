package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "filterProductsBySearch", value = "/filterProductsBySearch")
public class FilterProductsBySearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String val = request.getParameter("val");
        ProductService productService = new ProductService();
        List<Product> list = productService.searchNameProduct(val);
        for (Product p : list) {
            response.getWriter().println("<div class=\"product-item\">\n" +
                    "                        <a href=\"detail.jsp?pid="+p.getId()+"\">\n" +
                    "                            <img class=\"product-image\" src=\""+p.getImg()+"\" alt=\"\">\n" +
                    "                        </a>\n" +
                    "                        <p class=\"product-type\">"+p.getBranch()+"\n" +
                    "                        </p>\n" +
                    "                        <a href=\"detail.jsp?pid="+p.getId()+"\"><p class=\"product-name\">"+p.getName()+"</p></a>\n" +
                    "                        <div class=\"product-price\">\n" +
                    "                            <del class=\"product-old-price\">"+p.getOldPrice()+"<span class=\"currency\">₫</span></del>\n" +
                    "                            <span class=\"product-new-price\">"+p.getPrice()+"<span class=\"currency\">₫</span></span>\n" +
                    "                        </div>\n" +
                    "                        <div class=\"product-choose\">\n" +
                    "                                <button class=\"add-to-cart\">\n" +
                    "                                <a href=\"AddToCart?id="+p.getId()+"\">\n" +
                    "                                    <i class=\"fa-solid fa-cart-plus\"></i>Thêm Vào Giỏ\n" +
                    "                                </a>\n" +
                    "                                </button>\n" +
                    "                        </div>\n" +
                    "                    </div>");
        }
    }
}
