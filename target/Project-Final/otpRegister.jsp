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
                    <form action="OTPRegister" method="post" class="form-forgot">
                        <p>Vui lòng nhập mã OTP đã được gửi về email của bạn</p>
                        <%String error = (String) request.getAttribute("error");%>
                        <%=error == null ? "" : error%>
                        <div class="input-information">
                            <i class="fa-solid fa-user"></i>
                            <input type="number" name="otp-input" placeholder="Nhập mã OTP" class="input">
                        </div>
                        <div class="btn-login-container">
                            <button class="btn-login btn-sign-in" id="btn-send-email" type="submit">Xong</button>
                        </div>
                    </form>
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

</script>

</body>
</html>