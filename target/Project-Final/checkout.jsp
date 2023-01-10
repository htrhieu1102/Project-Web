<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="vn.edu.hcmuaf.fit.Controller.AddToCart" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.User" %>
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

<jsp:include page="header.jsp"></jsp:include>


<!--Begin Content-->
<div id="checkout_content">
  <div class="container">
    <div class="form_checkout">
      <form action="Checkout" method="post" class="payment_form">
<%--        <div class="form_title">--%>
<%--          <h3>Thông tin vận chuyển</h3>--%>
<%--        </div>--%>
<%--        <div class="form_element">--%>
<%--          <label for="form_username">Họ và tên:</label>--%>
<%--          <input type="text" id="form_username" name="name">--%>
<%--        </div>--%>
<%--        <div class="form_element">--%>
<%--          <label for="form_phone">Số điện thoại:</label>--%>
<%--          <input type="text" id="form_phone" name="phone">--%>
<%--        </div>--%>
<%--        <div class="form_element">--%>
<%--          <label for="form_email">Email:</label>--%>
<%--          <input type="text" id="form_email" name="email">--%>
<%--        </div>--%>
<%--        <div class="form_address">--%>
<%--          <div class="street">--%>
<%--            <label for="street_address">Số nhà & tên đường:</label>--%>
<%--            <input type="text" id="street_address" name="street">--%>
<%--          </div>--%>
<%--          <div class="district">--%>
<%--            <label for="district_address">Quận/Huyện:</label>--%>
<%--            <input type="text" id="district_address" name="district">--%>
<%--          </div>--%>
<%--          <div class="city">--%>
<%--            <label for="city_address">Thành phố/Tỉnh:</label>--%>
<%--            <input type="text" id="city_address" name="city">--%>
<%--          </div>--%>
<%--        </div>--%>
        <div class="form_title">
          <h3>Thông tin thanh toán</h3>
        </div>
<%--        <div class="payment_option">--%>
<%--          <div class="radio_select">--%>
<%--            <input type="radio" id="radio1" name="payment">--%>
<%--            <label for="radio2"><i class="fas fa-money-bill-wave"></i> Tiền mặt</label>--%>
<%--          </div>--%>
<%--          <div class="radio_select">--%>
<%--            <input type="radio" id="radio2" name="payment">--%>
<%--            <label for="radio2"><i class="fas fa-credit-card"></i> Thẻ ngân hàng</label>--%>
<%--          </div>--%>
<%--          <div class="radio_select">--%>
<%--            <input type="radio" id="radio3" name="payment">--%>
<%--            <label for="radio3"><i class="fab fa-cc-visa"></i> Thẻ tín dụng</label>--%>
<%--          </div>--%>
<%--        </div>--%>
        <div class="form_element">
<%--          <label for="form_card">Mã số thẻ ngân hàng:</label>--%>
  <% User user = (User) request.getSession().getAttribute("user");%>
  <input value="<%=user.getId()%>" id="idUser" hidden />
  <label for="form_card">Mã số thẻ ngân hàng:</label>
          <input type="text" id="form_card" name="card">
        </div>
        <div class="card_details">
          <div class="details">
            <label for="bank_name">Tên ngân hàng:</label>
            <input type="text" id="bank_name" name="bank">
          </div>
<%--          <div class="details">--%>
<%--            <label for="start_date">Ngày hết hạn:</label>--%>
<%--            <input type="text" id="expire_date" name="enddate">--%>
<%--          </div>--%>
        </div>
        <style>
          #checkout_content .container .form_checkout .card_details .details input{
            width: 300px;
          }
        </style>
        <div class="button_section">
          <ul>
            <li><a  onclick="checkout()" class="payment_button">Thanh toán</a></li>
            <li><a href="cart.jsp" class="return_cart">Quay lại giỏ hàng</a></li>
          </ul>
        </div>
          <%String message = (String) request.getAttribute("message");%>
          <%=message == null ? "" : message%>
<%--        <div class="message">--%>
<%--          <p>Message:</p>--%>
<%--        </div>--%>
        <style>
          #checkout_content .container .form_checkout .message{
            /*margin-left: 30px;*/
            /*padding: 10px 20px;*/
          }

          #checkout_content .container .form_checkout .message p{
            color: red;
            text-align: center;
          }

        </style>

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
        String price = null;
        String totalPrice = null;
        String priceDisplay = null;
        String totalPriceDisplay = null;
        int total = 0;

        for (int i = 0; i < AddToCart.carts.size(); i++) {
          Cart c = AddToCart.carts.get(i);
      %>
      <div class="product_contain">
        <input hidden id="valueCart" value="<%=c.getPro().getId()%>-<%=c.getPro().getPrice()%>-<%=c.getQuantity()%>-<%=c.getQuantity()*c.getPro().getPrice()%>"/>

        <div class="image">
          <img src="<%= c.getPro().getImg()%>">
        </div>
        <div class="product_details">
          <div class="name"><%= c.getPro().getName()%>
          </div>
        </div>
        <div class="price"><p>
          <%  price = String.valueOf(c.getPro().getPrice());
            if (price.length() >6){
              priceDisplay = price.substring(0, price.length() - 6) + "." + price.substring(price.length() - 6, price.length() - 3) + "." + price.substring(price.length() - 3);
            }else {
              priceDisplay = price.substring(0, price.length() - 6)  + price.substring(price.length() - 6, price.length() - 3) + "." + price.substring(price.length() - 3);
            }
          %>
          <%=priceDisplay%>đ</p></div>
        <div class="quantity">
<%--          <a href="" class="dec_button"><i class="fa-solid fa-minus"></i></a>--%>
          <input type="number" value="<%= c.getQuantity()%>" min="1">
<%--          <a href="" class="inc_button"><i class="fa-solid fa-plus"></i></a>--%>
          <style>
            #checkout_content .container .checkout_cart{
              height: 900px;
            }
            #checkout_content .container .checkout_cart .product_contain .price {
              margin-left: 70px;
            }
            #checkout_content .container .checkout_cart .product_contain .quantity{
              padding-left: 0px;
            }
            #checkout_content .container .checkout_cart .product_contain .quantity .dec_button{
              color: black;
              font-size: 15px;
              padding: 5px 5px;
            }
            #checkout_content .container .checkout_cart .product_contain .quantity .inc_button{
              color: black;
              font-size: 15px;
              padding: 5px 5px;
            }
            #checkout_content .container .checkout_cart .product_contain .total p{
              padding-left: 20px;
            }
          </style>
        </div>
        <div class="total">
          <p>
            <%  total = c.getPro().getPrice() * c.getQuantity();
              totalPrice = String.valueOf(total);
              if (totalPrice.length() > 6){
                totalPriceDisplay = totalPrice.substring(0, totalPrice.length() - 6) + "." + totalPrice.substring(totalPrice.length() - 6, totalPrice.length() - 3) + "." + totalPrice.substring(totalPrice.length() - 3);
              } else {
                totalPriceDisplay = totalPrice.substring(0, totalPrice.length() - 6) + totalPrice.substring(totalPrice.length() - 6, totalPrice.length() - 3) + "." + totalPrice.substring(totalPrice.length() - 3);
              }
            %>
            <%=totalPriceDisplay%> VND</p>
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
<%--        <div class="discount_code">--%>
<%--          <div class="discount_contain">--%>
<%--            <p>Nhập mã giảm giá tại đây:</p>--%>
<%--            <input type="text" id="discount" placeholder="Mã giảm giá">--%>
<%--            <button><i class="fas fa-chevron-right"></i></button>--%>
<%--          </div>--%>
<%--        </div>--%>
        <div class="subtotal cf">
          <div class="total_contain">
            <ul>
              <li class="totalRow"><span class="label">Tổng cộng:</span><span
                      class="value">
                                <%
                                  String totalS = null;
                                  String vatS = null;
                                  String totalAllS = null;

                                  String totalPDisplay = null;
                                  String vatDisplay = null;
                                  String totalAllDisplay = null;
                                  int totalP = 0;
                                  int vat = 0;
                                  int totalAll = 0;
                                  for (int i = 0; i < AddToCart.carts.size(); i++) {
                                    Cart c = AddToCart.carts.get(i);

                                    totalP = totalP + (c.getPro().getPrice() * c.getQuantity());
                                    totalS = String.valueOf(totalP);
                                    if (totalS.length() > 6) {
                                      totalPDisplay = totalS.substring(0, totalS.length() - 6) + "." + totalS.substring(totalS.length() - 6, totalS.length() - 3) + "." + totalS.substring(totalS.length() - 3);
                                    } else {
                                      totalPDisplay = totalS.substring(0, totalS.length() - 6) + totalS.substring(totalS.length() - 6, totalS.length() - 3) + "." + totalS.substring(totalS.length() - 3);
                                    }
//                                    totalS = String.valueOf(totalP);
////                                    if (totalS.length() > 6){
////                                        totalPDisplay = totalS.substring(0, totalS.length() - 6) + "." + totalS.substring(totalS.length() - 6, totalS.length() - 3) + "." + totalS.substring(totalS.length() - 3);
////                                    } else {
////                                        totalPDisplay = totalS.substring(0, totalS.length() - 6) + totalS.substring(totalS.length() - 6, totalS.length() - 3) + "." + totalS.substring(totalS.length() - 3);
////                                    }
//
//                                    if (totalS.length() > 6){
//                                        totalPDisplay = totalS.substring(0, totalS.length() - 6) + "." + totalS.substring(totalS.length() - 6, totalS.length() - 3) + "." + totalS.substring(totalS.length() - 3);
//                                    } else {
//                                        totalPDisplay = totalS.substring(0, totalS.length() - 6) + totalS.substring(totalS.length() - 6, totalS.length() - 3) + "." + totalS.substring(totalS.length() - 3);
//                                    }
//
                                    vat = (int) (totalP * 0.1);
                                    vatS = String.valueOf(vat);
                                    if (vatS.length() > 6) {
                                      vatDisplay = vatS.substring(0, vatS.length() - 6) + "." + vatS.substring(vatS.length() - 6, vatS.length() - 3) + "." + vatS.substring(vatS.length() - 3);
                                    } else {
                                      vatDisplay = vatS.substring(0, vatS.length() - 6) + vatS.substring(vatS.length() - 6, vatS.length() - 3) + "." + vatS.substring(vatS.length() - 3);
                                    }

                                    totalAll = totalP + vat;
                                    totalAllS = String.valueOf(totalAll);
                                    if (totalAllS.length() > 6) {
                                      totalAllDisplay = totalAllS.substring(0, totalAllS.length() - 6) + "." + totalAllS.substring(totalAllS.length() - 6, totalAllS.length() - 3) + "." + totalAllS.substring(totalAllS.length() - 3);
                                    } else {
                                      totalAllDisplay = totalAllS.substring(0, totalAllS.length() - 6) + totalAllS.substring(totalAllS.length() - 6, totalAllS.length() - 3) + "." + totalAllS.substring(totalAllS.length() - 3);
                                    }

                                  }
                                %>
                                <%=totalPDisplay%> VND
                            </span></li>
              <li class="totalRow"><span class="label">Chi phí vận chuyển:</span><span class="value">Miễn phí</span></li>
              <li class="totalRow"><span class="label">Thuế VAT (10%):</span><span class="value"><%= vatDisplay%> VND</span></li>
              <li class="totalRow final"><span class="label">Thành tiền:</span><span class="value"><%=totalAllDisplay%> VND</span></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--End Content-->
<style>
    #checkout_content .container .checkout_cart .total_price .subtotal{
        padding-left: 280px;
    }
    #checkout_content .container .checkout_cart .product_contain .quantity input{
        margin-left: 30px;
    }
</style>
<!--    Begin Footer-->
<jsp:include page="footer.jsp"></jsp:include>

<!--    End Footer-->
<!--    Begin Back to top-->
<div id="back-to-top">
  <a class="link-btt" href="#main"><i class="fa-sharp fa-solid fa-arrow-up"></i></a>
</div>
<!--    End Back to top-->
<!--    Script-->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="js/slideShow.js"></script>
<script src="js/checkout.js"></script>

</body>
</html>