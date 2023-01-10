package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.OTPRegister;
import vn.edu.hcmuaf.fit.Model.User;
import vn.edu.hcmuaf.fit.Service.EmailService;
import vn.edu.hcmuaf.fit.Service.LoginService;
import vn.edu.hcmuaf.fit.Service.RegisterService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "register", value = "/register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email-sign-up");
        String name = request.getParameter("name-sign-up");
        int phone = Integer.parseInt(request.getParameter("phone-sign-up"));
        String pass = request.getParameter("pass-sign-up");
        String repass = request.getParameter("re-pass-sign-up");
        RegisterService registerService = new RegisterService();
        User user = registerService.checkUserExist(email);
        Random random = new Random();
        int code = random.nextInt(100000,999999);
        if (!pass.equals(repass)) {
            request.setAttribute("error", "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "  Các mật khẩu không khớp!\n" +
                    "</div>");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            if (user != null){
                request.setAttribute("error", "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                        "  Email đã tồn tại!\n" +
                        "</div>");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                User u = new User(0,email,pass,name,phone,null,0);
                OTPRegister otpRegister = new OTPRegister(u, code);
                EmailService emailService = new EmailService();
                emailService.OTPRegister(otpRegister);
                HttpSession session = request.getSession();
                session.setAttribute("otp", otpRegister);
                response.sendRedirect("otpRegister.jsp");
            }
        }
    }
}
