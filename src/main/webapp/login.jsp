<%@ page import="vn.edu.hcmuaf.fit.Controller.AddToCart" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Cart" %>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="fontawesome/css/all.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
</head>
<body>
<div id="main">
    <!--    Begin Header-->
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
                    </ul>
                </div>
                <div class="menu-right col-2">
                    <span class="icon-item search">
                        <span id="icon-search"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <div id="search-container">
                            <div class="arrow-search"></div>
                            <p class="title-in-search text-center">TÌM KIẾM</p>
                            <div class="box-search d-flex">
                                <input type="search" placeholder="Nhập tìm kiếm ở đây">
                                <button class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                                <button class="btn-close"><i class="fa-solid fa-xmark"></i></button>
                            </div>
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
                            <a href="login.jsp">
                                <i class="fa-regular fa-user" class="btn btn-primary"></i>
                            </a>
                        </span>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="header.jsp"></jsp:include>
    <!--    End Header-->

    <!--    Begin Content-->
    <div id="content" class="login">
        <div class="container d-flex justify-content-center">
            <div class="body-container">
                <div class="title-login"><h3>Đăng nhập</h3></div>
                <div class="sign-in-container">
                    <form action="login" method="post">
                        <%String error = (String) request.getAttribute("error");%>
                        <%=error == null ? "" : error%>
                        <div class="input-information">
                            <i class="fa-solid fa-user"></i>
                            <input type="text" name="uname" placeholder="Tài khoản hoặc Email">
                        </div>
                        <div class="input-information">
                            <i class="fa-solid fa-lock"></i>
                            <input type="password" name="pass" placeholder="Mật khẩu">
                        </div>
                        <div class="remember-forgot">
                            <div class="remember">
                                <input type="checkbox" name="check">Nhớ mật khẩu
                            </div>
                            <a href="forgotPassword.jsp">Quên mật khẩu</a>
                        </div>
                        <div class="btn-login-container">
                            <button class="btn-login btn-sign-in" type="submit">Đăng nhập</button>
                        </div>
                    </form>

                </div>
                <p class="text-center mb-1">Hoặc</p>
                <div class="login-with">
                    <a href="#"><i class="fa-brands fa-facebook"></i></a>
                    <a href="#"><i class="fa-brands fa-google"></i></a>
                    <a href="#"><i class="fa-brands fa-github"></i></a>
                </div>
                <p class="text-center go-to-login-register"><a href="register.jsp">Đăng ký</a></p>
            </div>
        </div>
    </div>
    <!--    End Content-->

    <!--    Begin Footer-->
    <jsp:include page="footer.jsp"></jsp:include>
    <!--    End Footer-->
    <!--    Begin Back to top-->
    <div id="back-to-top">
        <a class="link-btt" href="#main"><i class="fa-sharp fa-solid fa-arrow-up"></i></a>
    </div>
    <!--    End Back to top-->

</div>

<!--    Script-->
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>