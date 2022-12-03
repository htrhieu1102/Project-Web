package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.User;
import vn.edu.hcmuaf.fit.Service.SignUpService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "signup", value = "/signup")
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email-sign-up");
        String phone = request.getParameter("phone-sign-up");
        String pass = request.getParameter("pass-sign-up");
        String repass = request.getParameter("re-pass-sign-up");
        SignUpService signUpService = new SignUpService();
        User user = signUpService.checkUserExist(email);
        if (!pass.equals(repass)) {
            request.getRequestDispatcher(".").forward(request, response);
        } else {
            if (user == null){
                signUpService.signUp(email,pass,phone);
                response.sendRedirect(".");
            }
        }
    }
}
