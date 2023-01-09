package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Service.DiscountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "discount", value = "/discount")
public class Discount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String discount_code = request.getParameter("discount_name");
        DiscountService discountService = new DiscountService();
        vn.edu.hcmuaf.fit.Model.Discount discount = discountService.getDiscount(discount_code);
        float rate = discount.getRate();

        if (discount == null){
            request.setAttribute("error_discount", "<div class= error_discount>\n" +
                    " <p>Mã giảm giá không hợp lệ!</p> \n" +
                    "</div>");
            request.setAttribute("rate_discount", rate);
            request.getRequestDispatcher("cart.jsp").forward(request, response);

        } else {
            response.sendRedirect("cart.jsp");
        }
    }
}
