package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.User;
import vn.edu.hcmuaf.fit.Service.LoginService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("uname");
        String pass = request.getParameter("pass");
        LoginService loginService = new LoginService();
        User u = loginService.login(user, pass);
        if (u == null) {
            request.setAttribute("error", "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "  Sai tài khoản hoặc mật khẩu!\n" +
                    "</div>");
            request.getRequestDispatcher(".").forward(request, response);
        } else {
            response.sendRedirect(".");
        }
    }
}
