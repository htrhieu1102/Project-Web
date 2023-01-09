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