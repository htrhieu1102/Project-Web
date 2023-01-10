package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.User;
import vn.edu.hcmuaf.fit.Service.LoginService;
import vn.edu.hcmuaf.fit.Service.RegisterService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "changePassword", value = "/changePassword")
public class ChangePassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String oldPass = request.getParameter("oldpass");
        String newPass = request.getParameter("newpass");
        User user = (User) request.getSession().getAttribute("user");
        RegisterService registerService = new RegisterService();
        LoginService loginService = new LoginService();
        if (oldPass.equals(user.getPass())) {
            registerService.changePassword(user.getEmail(), newPass);
            User newU = loginService.login(user.getEmail(), newPass);
            HttpSession session = request.getSession();
            session.setAttribute("user", newU);
            request.setAttribute("error", "<div class=\"alert alert-success\" role=\"alert\">\n" +
                    "  Đổi mật khẩu thành công!\n" +
                    "</div>");
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                    "  Mật khẩu cũ không đúng vui lòng nhập lại!\n" +
                    "</div>");
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
        }
    }
}
