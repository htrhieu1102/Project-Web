package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Category;
import vn.edu.hcmuaf.fit.Service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "deleteCategory", value = "/deleteCategory")
public class DeleteCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid").substring(6);
        CategoryService categoryService = new CategoryService();
        categoryService.deleteCategory(Integer.parseInt(cid));
        List<Category> list = categoryService.getAllCategory();
        request.setAttribute("listCat", list);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-table-category.jsp").forward(request,response);
    }
}
