package vn.edu.hcmuaf.fit.Controller;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.Model.Cart;
import vn.edu.hcmuaf.fit.Service.CheckoutService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "checkout", value = "/checkout")
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
        String action = request.getParameter("action");
        if(action!= null && action.equals("addorder")){
            addOrder(request,response);
        }



        CheckoutService checkoutService = new CheckoutService();
//        if (AddToCart.carts == null){
//            request.setAttribute("message",
//                    "<div  class= message>\n" +
//                            "<p>Vui lòng chọn thêm các sản phẩm!</p>\n" +
//                       "</div>");
//            request.getRequestDispatcher("checkout.jsp").forward(request, response);
//        }else {
//            if (card.equals("") || bank.equals("") ){
//                request.setAttribute("message",
//                        "<div  class= message>\n" +
//                                "<p>Vui lòng điền đầy đủ các thông tin!</p>\n" +
//                                "</div>");
//                request.getRequestDispatcher("checkout.jsp").forward(request, response);
//            }
//            else {
//                checkoutService.addCheckout(card, bank);
//                request.getRequestDispatcher("checkout.jsp").forward(request, response);
//            }
//        }
    }

    protected void addOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String card = request.getParameter("card");
        String bank = request.getParameter("bank");
        String user = request.getParameter("user");

        if(card.equals("") || bank.equals("") || user.equals("")){
            response.getWriter().write(new Gson().toJson(0));
            return;
        }
        int rs = new CheckoutService().addCheckout(Integer.valueOf(user), card,bank);

        if(rs ==1 ){
            int idOder = new CheckoutService().getOrderNew();
            String dataBody = request.getParameter("dataBody");
            if(dataBody != null){
                String[] carts = request.getParameter("dataBody").split("\\|");
                for (int i = 0; i < carts.length ; i++) {
                    String[] splitParam = carts[i].split("-");
                    int idPost = Integer.valueOf(splitParam[0]);
                    int price = Integer.valueOf(splitParam[1]);
                    int quantity = Integer.valueOf(splitParam[2]);

                   new CheckoutService().addOrderDetails(idOder,idPost,price,quantity);

                }
                response.getWriter().write(new Gson().toJson(1));
                return;
            }else{
                response.getWriter().write(new Gson().toJson(0));
                return;
            }


        }
        response.getWriter().write(new Gson().toJson(0));

        return;

    }

}
