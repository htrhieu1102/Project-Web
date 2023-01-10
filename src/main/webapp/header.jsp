
<%@ page import="vn.edu.hcmuaf.fit.Model.User" %>
<%@ page import="vn.edu.hcmuaf.fit.Controller.AddToCart" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Begin Header-->
<div id="header">
    <div class="config-top-banner">
        <p class="slogan">
            Xài Key bản quyền
            <span class="icon-slogan mr-1 ml-1">
                            <i class="fa-sharp fa-solid fa-key"></i>
                        </span>, nói không với crack!
        </p>
    </div>
    <div class="container pt-3">
        <div class="menu row">
            <div class="col-2">
                <img src="image/logoShopKey.png" alt="logo">
            </div>
            <div class="col-8">
                <ul class="drop-menu">
                    <li class="menu-item"><a class="p-3" href="index.jsp">Trang Chủ</a></li>
                    <li class="menu-item"><a class="p-3" href="product.jsp">Sản Phẩm</a></li>
                    <li class="menu-item"><a class="p-3" href="about-us.jsp">Giới Thiệu</a></li>
                    <li class="menu-item"><a class="p-3" href="contact.jsp">Liên Hệ</a></li>
                    <% User user = (User) request.getSession().getAttribute("user");
                        if (user!= null && user.getIsAdmin() == 1) {%>
                    <li class="menu-item"><a class="p-3" href="Admin/template">Admin</a></li>
                    <%} else if ( user!= null && user.getIsAdmin() == 0){
                    }%>
                    <% if(user!=null) {%>
                    <li class="menu-item"><a class="p-3" href="signOut" id="sign-out">Đăng xuất</a></li>
                    <%} else {

                    }%>
                </ul>
            </div>
            <div class="menu-right col-2 p-0">
                <span class="icon-item search">
                    <span id="icon-search">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </span>
                    <div id="search-container">
                        <div class="arrow-search"></div>
                        <p class="title-in-search text-center">TÌM KIẾM</p>
                        <form action="searchProduct" method="post">
                            <div class="box-search d-flex">
                            <input type="search" name="search" placeholder="Nhập tìm kiếm ở đây">
                            <button class="btn-search" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                            <button class="btn-close"><i class="fa-solid fa-xmark"></i></button>
                        </div>
                        </form>
                    </div>
                </span>
                <span class="icon-item">
                        <a href="cart.jsp">
                            <span class="icon-cart">
                            <i class="fa-solid fa-bag-shopping"></i>
                             <span class="amount-cart"><%=AddToCart.carts.size()%></span>
                        </span>
                    </a>
                </span>
                <span class="icon-item">
                    <span>
                        <%
                            if (user == null) {%>
                        <a href="login.jsp">
                            <i class="fa-regular fa-user" class="btn btn-primary"></i>
                        </a>
                        <%} else if (user != null) {%>
                        <a href="userProfile.jsp">Chào, <%=user.getName().substring(user.getName().lastIndexOf(" "))%></a>
                        <%}%>

                    </span>
                </span>
            </div>
        </div>
    </div>
</div>
<!-- End Header-->