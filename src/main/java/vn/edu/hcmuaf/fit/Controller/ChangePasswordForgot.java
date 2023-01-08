package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.ForgotPassword;
import vn.edu.hcmuaf.fit.Service.RegisterService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "changePasswordForgot", value = "/changePasswordForgot")
public class ChangePasswordForgot extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        ForgotPassword forgotPassword = (ForgotPassword) request.getSession().getAttribute("emailCodeForgot");
        if (!pass.equals(repass)) {
            response.getWriter().println("<p>Vui lòng nhập mật khẩu mới của bạn</p>\n" +
                    "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "  Các mật khẩu không khớp!\n" +
                    "</div>\n" +
                    "<div class=\"input-information\">\n" +
                    "    <i class=\"fa-solid fa-user\"></i>\n" +
                    "    <input type=\"password\" name=\"password\" placeholder=\"Nhập mật khẩu mới\" class=\"input\" id=inputPass>\n" +
                    "</div>\n" +
                    "<div class=\"input-information\">\n" +
                    "    <i class=\"fa-solid fa-user\"></i>\n" +
                    "    <input type=\"password\" name=\"re-password\" placeholder=\"Nhập lại mật khẩu mới\" class=\"input\" id=\"inputRePass\">\n" +
                    "</div>\n" +
                    "<div class=\"btn-login-container\">\n" +
                    "    <button class=\"btn-login btn-sign-in\" id=\"btn-confirm\" type=\"button\">Hoàn Thành</button>\n" +
                    "</div>");
        } else if(pass.equals(repass)){
            RegisterService registerService = new RegisterService();
            registerService.changePassword(forgotPassword.getEmail(), pass);
            response.getWriter().println("<p>Vui lòng nhập mật khẩu mới của bạn</p>\n" +
                    "<div class=\"alert alert-success\" role=\"alert\">\n" +
                    "  Đổi mật khẩu thành công!\n" +
                    "</div>\n" +
                    "<div class=\"input-information\">\n" +
                    "    <i class=\"fa-solid fa-user\"></i>\n" +
                    "    <input type=\"password\" name=\"password\" placeholder=\"Nhập mật khẩu mới\" class=\"input\" id=inputPass>\n" +
                    "</div>\n" +
                    "<div class=\"input-information\">\n" +
                    "    <i class=\"fa-solid fa-user\"></i>\n" +
                    "    <input type=\"password\" name=\"re-password\" placeholder=\"Nhập lại mật khẩu mới\" class=\"input\" id=\"inputRePass\">\n" +
                    "</div>\n" +
                    "<div class=\"btn-login-container\">\n" +
                    "    <button class=\"btn-login btn-sign-in\" id=\"btn-confirm\" type=\"button\">Hoàn Thành</button>\n" +
                    "</div>" +
                    "<p class=\"text-center go-to-login-register\">\n" +
                    "     <a href=\"login.jsp\"><i class=\"fa-solid fa-arrow-left mr-2\"></i>Đăng nhập</a>\n" +
                    " </p>");
        }
    }
}
