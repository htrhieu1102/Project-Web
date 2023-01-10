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
                <div class="title-login"><h3>Quên mật khẩu</h3></div>
                <div class="sign-in-container">
                    <form action="" class="form-forgot">
                        <p>Vui lòng nhập email để tiến hành quên mật khẩu</p>
                        <div class="input-information">
                            <i class="fa-solid fa-user"></i>
                            <input type="text" name="send-email" placeholder="Nhập email của bạn" class="input">
                        </div>
                        <div class="btn-login-container">
                            <button class="btn-login btn-sign-in" id="btn-send-email" type="button">Tiếp</button>
                        </div>
                    </form>
<%--                    <form action="" class="form-forgot">--%>
<%--                        <p>Nhập mã code đã được gửi về email của bạn</p>--%>
<%--                        <div class="input-information">--%>
<%--                            <i class="fa-solid fa-user"></i>--%>
<%--                            <input type="text" name="code" placeholder="Nhập mã code" class="input">--%>
<%--                        </div>--%>
<%--                        <div class="btn-login-container">--%>
<%--                            <button class="btn-login btn-sign-in" id="btn-code" type="button">Tiếp</button>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                    <form action="" class="form-forgot">--%>
<%--                        <p>Vui lòng nhập mật khẩu mới của bạn</p>--%>
<%--                        <div class="input-information">--%>
<%--                            <i class="fa-solid fa-user"></i>--%>
<%--                            <input type="password" name="password" placeholder="Nhập mật khẩu mới" class="input" id=inputPass>--%>
<%--                        </div>--%>
<%--                        <div class="input-information">--%>
<%--                            <i class="fa-solid fa-user"></i>--%>
<%--                            <input type="password" name="re-password" placeholder="Nhập lại mật khẩu mới" class="input" id="inputRePass">--%>
<%--                        </div>--%>
<%--                        <div class="btn-login-container">--%>
<%--                            <button class="btn-login btn-sign-in" id="btn-confirm" type="button">Hoàn Thành</button>--%>
<%--                        </div>--%>
<%--                    </form>--%>
                </div>
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
<script>
    $(document).ready(function () {
        sendEmail();
    })

    function sendEmail() {
        $('#btn-send-email').click(function () {
            let email = $('.input').val();
            $.ajax({
                url: '/Project_Web_war/sendMailForgotPassword',
                type: 'post',
                data: {
                    email: email
                },
                success: function (response) {
                    $('.form-forgot').html(response);
                    sendEmail();
                    checkCode();
                },
                error: function () {
                    alert("Lỗi")
                }
            })
        })
    }
    function checkCode() {
        $('#btn-code').click(function (){
            let code = $('.input').val();
            $.ajax({
                url: '/Project_Web_war/checkCodeForgotPassword',
                type: 'post',
                data: {
                    code : code
                },
                success: function (response) {
                    $('.form-forgot').html(response);
                    checkCode();
                    changePasswordForgot();
                },
                error: function () {
                    alert("Lỗi")
                }
            })
        })
    }
    function changePasswordForgot() {
        $('#btn-confirm').click(function () {
            let pass =  $('#inputPass').val();
            let repass = $('#inputRePass').val();
            $.ajax({
                url: '/Project_Web_war/changePasswordForgot',
                type: 'post',
                data: {
                    pass: pass,
                    repass: repass
                },
                success: function (response) {
                    $('.form-forgot').html(response);
                    changePasswordForgot();
                },
                error: function () {
                    alert("Lỗi")
                }
            })
        })
    }
</script>

</body>
</html>