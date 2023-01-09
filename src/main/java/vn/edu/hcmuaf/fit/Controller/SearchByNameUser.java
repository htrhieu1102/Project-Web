package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.User;
import vn.edu.hcmuaf.fit.Service.LoginService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "searchByNameUser", value = "/searchByNameUser")
public class SearchByNameUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String text = request.getParameter("text");
        LoginService loginService = new LoginService();
        List<User> list = loginService.searchNameUser(text);
        request.setAttribute("listUser", list);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-table-user.jsp").forward(request, response);
    }
}
