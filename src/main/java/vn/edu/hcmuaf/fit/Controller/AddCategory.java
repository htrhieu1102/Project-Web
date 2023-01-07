package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Category;
import vn.edu.hcmuaf.fit.Service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "addCategory", value = "/addCategory")
public class AddCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        CategoryService categoryService = new CategoryService();
        categoryService.addCategory(name);
        List<Category> list = categoryService.getAllCategory();
        request.setAttribute("listCat", list);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-table-category.jsp").forward(request,response);
    }
}
