package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Cart;
import vn.edu.hcmuaf.fit.Service.CheckoutService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Checkout", value = "/Checkout")
public class Checkout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
//        List<vn.edu.hcmuaf.fit.Model.Cart> cart_list = AddToCart.carts;
//
//        String name = request.getParameter("name");
//        String phone = request.getParameter("phone");
//        String email = request.getParameter("email");
//        String street = request.getParameter("street");
//        String district = request.getParameter("district");
//        String city = request.getParameter("city");
        String cardnumber = request.getParameter("cardnumber");
        String bank = request.getParameter("bank");

        CheckoutService checkoutService = new CheckoutService();
        if (AddToCart.carts == null){
            request.setAttribute("message",
                    "<div  class= message>\n" +
                            "<p>Vui lòng chọn thêm các sản phẩm!</p>\n" +
                       "</div>");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }else {
            if (cardnumber.equals("") || bank.equals("") ){
                request.setAttribute("message",
                        "<div  class= message>\n" +
                                "<p>Vui lòng điền đầy đủ các thông tin!</p>\n" +
                                "</div>");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
            else {
                checkoutService.addCheckout(cardnumber, bank);
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
        }
    }


}
