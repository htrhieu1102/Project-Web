package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.User;
import vn.edu.hcmuaf.fit.Service.LoginService;
import vn.edu.hcmuaf.fit.Service.RegisterService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "register", value = "/register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email-sign-up");
        String name = request.getParameter("name-sign-up");
        String phone = request.getParameter("phone-sign-up");
        String pass = request.getParameter("pass-sign-up");
        String repass = request.getParameter("re-pass-sign-up");
        RegisterService registerService = new RegisterService();
        User user = registerService.checkUserExist(email);
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
                registerService.register(email,pass,name ,phone);
                LoginService loginService = new LoginService();
                User u = loginService.login(email, pass);
                HttpSession session = request.getSession();
                session.setAttribute("user", u);
                response.sendRedirect("index.jsp");
            }
        }
    }
}
