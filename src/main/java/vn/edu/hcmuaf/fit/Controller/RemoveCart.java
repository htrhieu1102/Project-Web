package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "RemoveCart", value = "/RemoveCart")
public class RemoveCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            if (id >= 1){
                List<Cart> cart_list = AddToCart.carts;
                if (cart_list != null){
                    for (vn.edu.hcmuaf.fit.Model.Cart c: cart_list){
                        if (c.getPro().getId() == id){
                            cart_list.remove(cart_list.indexOf(c));
                            break;
                        }
                    }
                    response.sendRedirect("cart.jsp");
                }
            }else {
                response.sendRedirect("cart.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
