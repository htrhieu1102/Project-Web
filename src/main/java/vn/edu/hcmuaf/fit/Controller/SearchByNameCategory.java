package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Category;
import vn.edu.hcmuaf.fit.Service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "searchByNameCategory", value = "/searchByNameCategory")
public class SearchByNameCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String text = request.getParameter("text");
        CategoryService categoryService = new CategoryService();
        List<Category> list = categoryService.searchNameCategory(text);
        request.setAttribute("listCat", list);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-table-category.jsp").forward(request,response);
    }
}
