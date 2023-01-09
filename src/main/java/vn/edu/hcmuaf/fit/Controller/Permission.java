package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.User;
import vn.edu.hcmuaf.fit.Service.LoginService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "permission", value = "/permission")
public class Permission extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        LoginService loginService = new LoginService();
        List<User> listUser = loginService.getAllUser();
        for (int i = 0; i < listUser.size(); i++) {
            if (listUser.get(i).getId() == id) {
                if (listUser.get(i).getIsAdmin() == 0) {
                    loginService.permission(id, 1);
                } else if (listUser.get(i).getIsAdmin() == 1) {
                    loginService.permission(id, 0);
                }
            }
        }
        List<User> list = loginService.getAllUser();
        request.setAttribute("listUser", list);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-table-user.jsp").forward(request, response);
    }
}
