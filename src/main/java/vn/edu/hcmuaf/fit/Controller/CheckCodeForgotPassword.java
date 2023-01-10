package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.ForgotPassword;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "checkCodeForgotPassword", value = "/checkCodeForgotPassword")
public class CheckCodeForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int code = Integer.parseInt(request.getParameter("code"));
        ForgotPassword forgotPassword = (ForgotPassword) request.getSession().getAttribute("emailCodeForgot");
        if (forgotPassword.getCode() == code) {
            response.getWriter().println("<p>Vui lòng nhập mật khẩu mới của bạn</p>\n" +
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
        } else {
            response.getWriter().println("<p>Nhập mã code đã được gửi về email của bạn</p>\n" +
                    "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "  Mã code không đúng vui lòng nhập lại!\n" +
                    "</div>\n" +
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
