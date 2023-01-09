package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.User;
import vn.edu.hcmuaf.fit.Service.LoginService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "changeInformation", value = "/changeInformation")
public class ChangeInformation extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int phone = Integer.parseInt(request.getParameter("phone"));
        User old = (User) request.getSession().getAttribute("user");
        LoginService loginService = new LoginService();
        loginService.changeInformation(id,name,phone);
        User newU = loginService.login(old.getEmail(), old.getPass());
        HttpSession session = request.getSession();
        session.setAttribute("user", newU);
        response.sendRedirect("userProfile.jsp");
    }
}
