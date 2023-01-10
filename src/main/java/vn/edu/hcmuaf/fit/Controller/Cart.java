package vn.edu.hcmuaf.fit.Controller;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "cart", value = "/cart")
public class Cart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<vn.edu.hcmuaf.fit.Model.Cart> carts = (ArrayList<vn.edu.hcmuaf.fit.Model.Cart>) AddToCart.carts;
        response.getWriter().write(new Gson().toJson(carts));
    }

    protected void removeItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        String idp = request.getParameter("id");
        String action = request.getParameter("action");
        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(idp);
            if (action.equals("del")){
                if (id >= 1){
                    List<vn.edu.hcmuaf.fit.Model.Cart> cart_list = AddToCart.carts;
                    if (cart_list != null){
                        for (vn.edu.hcmuaf.fit.Model.Cart c: cart_list){
                            if (c.getPro().getId() == id){
                                cart_list.remove(cart_list.indexOf(c));
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
    protected void changeQuantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idp = request.getParameter("id");
        String action = request.getParameter("action");

        if(idp != null){
            int id = Integer.parseInt(idp);
            if ( id >= 1) {
                vn.edu.hcmuaf.fit.Model.Cart cart = null;
                if (action.equals("inc")) {
                    for (vn.edu.hcmuaf.fit.Model.Cart c : AddToCart.carts) {
                        System.out.println(c);

                        if (c.getPro().getId() == id) {
                            int quantity = c.getQuantity();
                            quantity++;
                            c.setQuantity(quantity);
                            cart = c;
                            break;
                        }
                    }
                }
                if (action.equals("dec")) {
                    for (vn.edu.hcmuaf.fit.Model.Cart c : AddToCart.carts) {
                        if (c.getPro().getId() == id && c.getQuantity() > 1) {
                            int quantity = c.getQuantity();
                            quantity--;
                            c.setQuantity(quantity);
                            cart = c;
                            break;
                        }
                    }
                }
                Gson gson = new Gson();
                response.getWriter().write(gson.toJson(cart));
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        if(action != null){
            if(action.equals("inc") || action.equals("dec")){
                changeQuantity(request,response);
            }
            if(action.equals("del")){
                removeItem(request,response);
            }
        }
    }
}
