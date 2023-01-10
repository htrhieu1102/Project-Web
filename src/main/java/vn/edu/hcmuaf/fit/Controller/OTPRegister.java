package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.User;
import vn.edu.hcmuaf.fit.Service.LoginService;
import vn.edu.hcmuaf.fit.Service.RegisterService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OTPRegister", value = "/OTPRegister")
public class OTPRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int otp = Integer.parseInt(request.getParameter("otp-input"));
        vn.edu.hcmuaf.fit.Model.OTPRegister otpRegister = (vn.edu.hcmuaf.fit.Model.OTPRegister) request.getSession().getAttribute("otp");
        if (otpRegister.getCode() != otp) {
            request.setAttribute("error", "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "  Mã OTP không đúng!\n" +
                    "</div>");
            request.getRequestDispatcher("otpRegister.jsp").forward(request,response);
        } else if (otpRegister.getCode() == otp){
            RegisterService registerService = new RegisterService();
            registerService.register(otpRegister.getUser().getEmail(),otpRegister.getUser().getPass(),otpRegister.getUser().getName(),otpRegister.getUser().getPhone());
            LoginService loginService = new LoginService();
            User user = loginService.login(otpRegister.getUser().getEmail(), otpRegister.getUser().getPass());
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");
        }
    }
}
