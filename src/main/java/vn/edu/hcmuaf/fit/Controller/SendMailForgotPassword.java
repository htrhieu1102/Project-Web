package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.ForgotPassword;
import vn.edu.hcmuaf.fit.Model.User;
import vn.edu.hcmuaf.fit.Service.EmailService;
import vn.edu.hcmuaf.fit.Service.RegisterService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "sendMailForgotPassword", value = "/sendMailForgotPassword")
public class SendMailForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        RegisterService register = new RegisterService();
        User user = register.checkUserExist(email);
        Random random = new Random();
        int code = random.nextInt(100000,999999);
        if (user == null) {
            response.getWriter().println("<p>Vui lòng nhập email để tiến hành quên mật khẩu</p>\n" +
                    "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "  Địa chỉ Email không đúng!\n" +
                    "</div>\n" +
                    " <div class=\"input-information\">\n" +
                    "     <i class=\"fa-solid fa-user\"></i>\n" +
                    "     <input type=\"text\" name=\"send-email\" placeholder=\"Nhập email của bạn\" class=\"input\">\n" +
                    " </div>\n" +
                    " <div class=\"btn-login-container\">\n" +
                    "     <button class=\"btn-login btn-sign-in\" id=\"btn-send-email\" type=\"button\">Tiếp</button>\n" +
                    " </div>");
        } else {
            ForgotPassword forgotPassword = new ForgotPassword(email, code);
            EmailService emailService = new EmailService();
            emailService.sendMail(forgotPassword);
            HttpSession session = request.getSession();
            session.setAttribute("emailCodeForgot", forgotPassword);
            response.getWriter().println("<p>Nhập mã code đã được gửi về email của bạn</p>\n" +
                    "<div class=\"input-information\">\n" +
                    "    <i class=\"fa-solid fa-user\"></i>\n" +
                    "    <input type=\"number\" name=\"code\" placeholder=\"Nhập mã code\" class=\"input\">\n" +
                    "</div>\n" +
                    "<div class=\"btn-login-container\">\n" +
                    "    <button class=\"btn-login btn-sign-in\" id=\"btn-code\" type=\"button\">Tiếp</button>\n" +
                    "</div>");
        }
    }
}
