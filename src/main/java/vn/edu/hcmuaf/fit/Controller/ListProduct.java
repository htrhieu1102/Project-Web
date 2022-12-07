package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Cart;
import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import vn.edu.hcmuaf.fit.Service.ProductService;

@WebServlet(name = "product", value = "/product")
public class ListProduct extends HttpServlet {
    public static List<Cart> list = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService();
        List<Product> productList = productService.getProduct();
//        List<Product> productList = ProductDAO.getAllProducts();
        request.setAttribute("listP", productList);

        request.getRequestDispatcher("product.jsp").forward(request,response);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");

//        Cookie arr[] = request.getCookies();
//        Cart cart = new Cart();
////        List<Product> list = new ArrayList<>();
//        ProductService ps = new ProductService();
//
//        for (Cookie o: arr){
//            String txt[] = o.getValue().split(",");
//            for (String s :txt){
//                cart.setPro((Product) ps.getProduct());
//                cart.setQuantity(1);
//                list.add(cart);
//            }
//        }
//        for (int i = 0; i< list.size(); i ++){
//            int count =1;
//            for (int j = i+1; j<list.size(); j++){
//                if (list.get(i).getPro().getId() == list.get(j).getPro().getId()){
//                    count++;
//                    list.remove(j);
//                    j--;
//                    list.get(i).setQuantity(count);
//                }
//            }
//        }
//        for (Cookie o : arr){
//            o.setMaxAge(0);
//            response.addCookie(o);
//        }
//        response.sendRedirect("product.jsp");


//        ProductService ps = new ProductService();
//        Cart cart = new Cart();
//        Product pro = null;
//        String id = null;
//
//        try (PrintWriter out = response.getWriter()) {
//            String action = request.getParameter("action");
//            if (action == null || action.equals("")){
//                request.getRequestDispatcher("product.jsp").forward(request, response);
//                return;
//            }
//            switch (action){
//                case "AddCart":
//
//                    id = request.getParameter("id");
//                    out.println(id);
//                    pro = ps.findById(id);
//                    if (pro != null){
//
//                    }
//
//                    request.getRequestDispatcher("product.jsp").forward(request, response);
//                    break;
//            }
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
