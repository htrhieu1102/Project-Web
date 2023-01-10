package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Category;
import vn.edu.hcmuaf.fit.Service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "editCategory", value = "/editCategory")
public class EditCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid").substring(4));
        String cname = request.getParameter("cname");
        CategoryService categoryService = new CategoryService();
        categoryService.editCategory(cid, cname);
        List<Category> list = categoryService.getAllCategory();
        request.setAttribute("listCat", list);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-table-category.jsp").forward(request,response);
    }
}
