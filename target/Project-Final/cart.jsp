<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.Service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.Database.DbCon" %>
<%@ page import="vn.edu.hcmuaf.fit.Controller.AddToCart" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

</head>
<body>


<jsp:include page="header.jsp"></jsp:include>



<!--Begin Content-->
<div id="wrapper">
    <div class="container">
        <div class="cart">
            <div class="title">
                <h3>Giỏ hàng</h3>
                <div class="return_button">
                    <a href="index.jsp">Trở lại <i class="fas fa-caret-square-right ml-2"></i></a>
                </div>
            </div>
            <div class="title_cart">
                <div class="product_name"><p>Tên sản phẩm</p></div>
                <div class="product_price"><p>Giá tiền</p></div>
                <div class="product_quantity"><p>Số lượng</p></div>
                <div class="product_total"><p>Tổng cộng</p></div>
                <div class="remove_button">&nbsp;</div>
            </div>
            <div id="products">
            </div>
            <div class="total_price">
<%--                <div class="discount_code">--%>
<%--                    <div class="discount_contain">--%>
<%--                        <p>Nhập mã giảm giá tại đây:</p>--%>
<%--                        <form action="discount" method="post">--%>
<%--                            <input type="text" id="discount" placeholder="Mã giảm giá" name="discount_name">--%>
<%--                            <button><i class="fas fa-chevron-right"></i></button>--%>
<%--                            <%String error_discount = (String) request.getAttribute("error_discount");%>--%>
<%--                            <%=error_discount == null ? "" : error_discount%>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div id="total_contain" class="subtotal cf">
                    <div class="total_contain">
                        <ul>
                            <li class="totalRow_P"><span class="label">Tổng cộng:</span><span
                                    class="value" id="totalBill">

                            </span></li>
                            <li class="totalRow"><span class="label">Chi phí vận chuyển:</span><span class="value">Miễn phí</span>
                            </li>
                            <li class="totalRow_V"><span class="label">Thuế VAT (10%):</span><span class="value" id="vatBill"></span>
                            </li>
                            <li class="totalRow_final"><span class="label">Thành tiền:</span><span class="value" id="sumBill"></span>
                            </li>
                            <li class="totalRow_button"><a href="checkout.jsp" class="btn_payment">Thanh toán</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End Content-->
<style>
    #wrapper .container .cart .total_price div{
        flex-basis: 100%;
    }
    #wrapper .container .cart .total_price .subtotal{
        padding-left: 700px;
    }
</style>
<!--    Begin Footer-->
<jsp:include page="footer.jsp"></jsp:include>

<%--<div id="footer">--%>
<%--    <div class="container footer-main">--%>
<%--        <div class="footer-left footer-column">--%>
<%--            <div class="footer-logo ">--%>
<%--                <a href="index.jsp">--%>
<%--                    <img src="image/logoShopKey.png" alt="">--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="text-intro">--%>
<%--                <p>Đăng kí ngay để nhận được các thông tin ưu đãi,--%>
<%--                    khuyến mãi đến từ cửa hàng và cũng như cập nhật các tin tức thông tin--%>
<%--                    về sản phẩm.--%>
<%--                </p>--%>
<%--            </div>--%>
<%--            <div class="newsletter-sign-up">--%>
<%--                <h2 class="newsletter-title">Đăng kí bản tin</h2>--%>
<%--                <input class="newsletter-input" type="text" name="" id="" placeholder="Email">--%>
<%--                <button class="newsletter-button">Gửi</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="footer-center footer-column">--%>
<%--            <div class="footer-space"></div>--%>
<%--            <h4 class="footer-title">Sản Phẩm</h4>--%>
<%--            <div class="footer-list-product">--%>
<%--                <a class="footer-product-item" href=""><i class="fa-solid fa-chevron-right"></i>Windows</a>--%>
<%--                <a class="footer-product-item" href=""><i class="fa-solid fa-chevron-right"></i>Office</a>--%>
<%--                <a class="footer-product-item" href=""><i class="fa-solid fa-chevron-right"></i>Adobe</a>--%>
<%--                <a class="footer-product-item" href=""><i class="fa-solid fa-chevron-right"></i>Anti Virus</a>--%>
<%--                <a class="footer-product-item" href=""><i class="fa-solid fa-chevron-right"></i>Google</a>--%>
<%--                <a class="footer-product-item" href=""><i class="fa-solid fa-chevron-right"></i>Khác</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="footer-right footer-column">--%>
<%--            <div class="footer-space"></div>--%>
<%--            <h4 class="footer-title">Liên Hệ</h4>--%>
<%--            <div class="footer-contact">--%>
<%--                <p class="footer-information"><i class="fa-solid fa-location-dot"></i>Đại học Nông Lâm TpHCM</p>--%>
<%--                <p class="footer-information"><i class="fa-solid fa-phone"></i>(+84) 852995378</p>--%>
<%--                <p class="footer-information"><i class="fa-solid fa-envelope"></i>20130260@st.hcmuaf.edu.vn</p>--%>
<%--            </div>--%>
<%--            <div class="footer-social">--%>
<%--                <a href=""><i class="fa-brands fa-facebook"></i></a>--%>
<%--                <a href=""><i class="fa-brands fa-twitter"></i></a>--%>
<%--                <a href=""><i class="fa-brands fa-instagram"></i></a>--%>
<%--                <a href=""><i class="fa-brands fa-linkedin"></i></a>--%>
<%--                <a href=""><i class="fa-brands fa-github"></i></a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<!--    End Footer-->
<!--    Begin Back to top-->
<div id="back-to-top">
    <a class="link-btt" href="#main"><i class="fa-sharp fa-solid fa-arrow-up"></i></a>
</div>
<!--    End Back to top-->
<!--    Script-->
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="js/slideShow.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
        integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="./js/cart.js"></script>
</body>
</html>