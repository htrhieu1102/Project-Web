<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="vn.edu.hcmuaf.fit.Controller.AddToCart" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Cart" %>
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
<!--    Begin Header-->
<<<<<<< HEAD
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
                            <%
                              int number =0;
                              for (int i=0; i<AddToCart.carts.size(); i++){
                                Cart c = AddToCart.carts.get(i);
                                number += c.getQuantity();
                              }
                            %>
                            <span class="amount-cart"><%=number%></span>
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

<!--Begin Content-->
<div id="checkout_content">
  <div class="container">
    <div class="form_checkout">
      <form action="" class="payment_form">
        <div class="form_title">
          <h3>Thông tin vận chuyển</h3>
        </div>
        <div class="form_element">
          <label for="form_username">Họ và tên:</label>
          <input type="text" id="form_username">
        </div>
        <div class="form_element">
          <label for="form_phone">Số điện thoại:</label>
          <input type="text" id="form_phone">
        </div>
        <div class="form_element">
          <label for="form_email">Email:</label>
          <input type="text" id="form_email">
        </div>
        <div class="form_address">
          <div class="street">
            <label for="street_address">Số nhà & tên đường:</label>
            <input type="text" id="street_address">
          </div>
          <div class="district">
            <label for="district_address">Quận/Huyện:</label>
            <input type="text" id="district_address">
          </div>
          <div class="city">
            <label for="city_address">Thành phố/Tỉnh:</label>
            <input type="text" id="city_address">
          </div>
        </div>
        <div class="form_title">
          <h3>Phương thức thanh toán</h3>
        </div>
        <div class="payment_option">
          <div class="radio_select">
            <input type="radio" id="radio1" name="payment">
            <label for="radio2"><i class="fas fa-money-bill-wave"></i> Tiền mặt</label>
          </div>
          <div class="radio_select">
            <input type="radio" id="radio2" name="payment">
            <label for="radio2"><i class="fas fa-credit-card"></i> Thẻ ngân hàng</label>
          </div>
          <div class="radio_select">
            <input type="radio" id="radio3" name="payment">
            <label for="radio3"><i class="fab fa-cc-visa"></i> Thẻ tín dụng</label>
          </div>
        </div>
        <div class="form_element">
          <label for="form_card">Mã số thẻ (đối với thẻ ngân hàng/tín dụng):</label>
          <input type="text" id="form_card">
        </div>
        <div class="card_details">
          <div class="details">
            <label for="start_date">Ngày cấp:</label>
            <input type="text" id="start_date">
          </div>
          <div class="details">
            <label for="start_date">Ngày hết hạn:</label>
            <input type="text" id="expire_date">
          </div>
        </div>
        <div class="button_section">
          <ul>
            <li><a href="" class="payment_button">Thanh toán</a></li>
            <li><a href="cart.jsp" class="return_cart">Quay lại giỏ hàng</a></li>
          </ul>
        </div>
      </form>
    </div>
  </div>
  <div class="container">
    <div class="checkout_cart">
      <div class="title">
        <h3>Giỏ hàng</h3>
        <!--          <div class="return_button">-->
        <!--            <ul>-->
        <!--              <li><a href="index.jsp">Trở lại giỏ hàng <i class="fas fa-undo"></i></a></li>-->
        <!--            </ul>-->
        <!--          </div>-->
      </div>
      <div class="title_cart">
        <div class="product_name"><p>Tên sản phẩm</p></div>
        <div class="product_price"><p>Giá tiền</p></div>
        <div class="product_quantity"><p>Số lượng</p></div>
        <div class="product_total"><p>Tổng cộng</p></div>
        <!--        <div class="remove_button">&nbsp;</div>-->
      </div>
      <%
        //				if (cart_list != null) {
//					for (Cart c : cartProduct) {
        for (int i = 0; i < AddToCart.carts.size(); i++) {
          Cart c = AddToCart.carts.get(i);
      %>
      <div class="product_contain">
        <div class="image">
          <img src="<%= c.getPro().getImg()%>">
        </div>
        <div class="product_details">
          <div class="name"><%= c.getPro().getName()%></div>
        </div>
        <div class="price"><p><%= c.getPro().getPrice()%></p></div>
        <div class="quantity">
          <input type="number" value="<%= c.getQuantity()%>" min="1">
        </div>
        <div class="total">
          <p><%= c.getPro().getPrice() * c.getQuantity()%></p>
        </div>
        <!--        <div class="remove">-->
        <!--          <button><i class="fas fa-trash-alt"></i></button>-->
        <!--        </div>-->
      </div>
      <%}
      %>
<%--      <div class="product_contain">--%>
<%--        <div class="image">--%>
<%--          <img src="image/product-image/design/autodesk-revit-ban-quyen.png">--%>
<%--        </div>--%>
<%--        <div class="product_details">--%>
<%--          <div class="name">Key bản quyền Autodesk Revit</div>--%>
<%--        </div>--%>
<%--        <div class="price"><p>300.000 VND</p></div>--%>
<%--        <div class="quantity">--%>
<%--          <input type="number" value="2" min="1">--%>
<%--        </div>--%>
<%--        <div class="total">--%>
<%--          <p>600.000 VND</p>--%>
<%--        </div>--%>
<%--        <!--        <div class="remove">-->--%>
<%--        <!--          <button><i class="fas fa-trash-alt"></i></button>-->--%>
<%--        <!--        </div>-->--%>
<%--      </div>--%>
      <div class="total_price">
        <div class="discount_code">
          <div class="discount_contain">
            <p>Nhập mã giảm giá tại đây:</p>
            <input type="text" id="discount" placeholder="Mã giảm giá">
            <button><i class="fas fa-chevron-right"></i></button>
          </div>
        </div>
        <div class="subtotal cf">
          <div class="total_contain">
            <ul>
              <li class="totalRow"><span class="label">Tổng cộng:</span><span class="value">1.000.000 VND</span></li>
              <li class="totalRow"><span class="label">Chi phí vận chuyển:</span><span class="value">Miễn phí</span></li>
              <li class="totalRow"><span class="label">Thuế VAT (10%):</span><span class="value">100.000 VND</span></li>
              <li class="totalRow final"><span class="label">Thành tiền:</span><span class="value">1.100.000 VND</span></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--End Content-->

<!--    Begin Footer-->
<jsp:include page="footer.jsp"></jsp:include>
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

</body>
</html>