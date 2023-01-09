package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Category;
import vn.edu.hcmuaf.fit.Service.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "loadFormEditCategory", value = "/loadFormEditCategory")
public class LoadFormEditCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid").substring(4));
        CategoryService categoryService = new CategoryService();
        Category category = categoryService.getDetailCategory(cid);
        request.setAttribute("category", category);
        request.getRequestDispatcher("/Admin/template/ajax/ajax-form-edit-cate.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
