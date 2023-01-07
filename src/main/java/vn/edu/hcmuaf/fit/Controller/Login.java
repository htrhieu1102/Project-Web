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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("uname");
        String pass = request.getParameter("pass");
        LoginService loginService = new LoginService();
        User u = loginService.login(email, pass);
        if (u == null) {
            request.setAttribute("error", "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "  Tài khoản hoặc mật khẩu không đúng!\n" +
                    "</div>");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", u);
            response.sendRedirect("index.jsp");
        }
    }
}
