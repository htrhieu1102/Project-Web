package vn.edu.hcmuaf.fit.Controller;
import vn.edu.hcmuaf.fit.Model.Cart;
import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddToCart", value = "/AddToCart")
public class AddToCart extends HttpServlet {
    public static List<Cart> carts = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        ProductService productService = new ProductService();
        Product pro = productService.findById(id);
            if (pro != null) {
                boolean check = false;
                    for(Cart tmp : carts){
                        if(tmp.getPro().getId() == (pro.getId())){
                            tmp.setQuantity(tmp.getQuantity() +1);
                            check = true;
                            break;
                        }
                    }
                    if(!check){
                        Cart cart = new Cart();
                        cart.setPro(pro);
                        cart.setQuantity(1);
                        carts.add(cart);
                    }

            }

            request.getRequestDispatcher("product.jsp").forward(request, response);
        }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
