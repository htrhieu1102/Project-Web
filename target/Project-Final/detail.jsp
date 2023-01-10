<%@ page import="vn.edu.hcmuaf.fit.Model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.Service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.User" %>
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
    <jsp:include page="header.jsp"></jsp:include>
    <!--    End Header-->
    <!--    Begin Content-->
    <div id="content">
        <div class="container">
            <div class="row">
                <% ProductService productService = new ProductService();
                    String pid = (String) request.getParameter("pid");
                    Product product = productService.getProductDetail(Integer.parseInt(pid));%>
                <div class="col-lg-6 col-md-12 detail-img-product">
                    <img src="<%=product.getImg()%>" alt="">
                </div>
                <div class="col-lg-6 col-md-12 entry-summary">
                    <h1 class="entry-title"><%=product.getName()%></h1>
                    <div class="entry-rating">
                        <span class="star-rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                        </span>
                        <span class="review-rating">(36 đánh giá từ khách hàng)</span>
                    </div>
                    <%  String price = String.valueOf(product.getPrice());
                        String priceDisplay = "";
                        if (price.length() >6){
                            priceDisplay = price.substring(0, price.length() - 6) + "." + price.substring(price.length() - 6, price.length() - 3) + "." + price.substring(price.length() - 3);
                        }else {
                            priceDisplay = price.substring(0, price.length() - 6)  + price.substring(price.length() - 6, price.length() - 3) + "." + price.substring(price.length() - 3);
                        }
                    %>
                    <p class="entry-price"><%=priceDisplay%> <span class="entry-currency">VND</span></p>
                    <div class="product-details-short-description">
                        <h3>Thông tin chi tiết sản phẩm</h3>
                        <p>
                            <b><span>Thương hiệu:</span></b><span>&nbsp;&nbsp;<%=product.getBranch()%></span><br>
                            <b><span>Trình trạng:</span></b><span>&nbsp;&nbsp;<%=(product.getAmount() >0) ? "Còn hàng" : "Hết hàng"%></span><br>
                            <b><span>Thời hạn cấp phép:</span></b><span>&nbsp;&nbsp;1 Năm</span><br>
                            <b><span>Số lượng thiết bị:</span></b><span>&nbsp;&nbsp;<%=product.getDeviceNumber()%></span><br>
                            <b><span>Loại Phương tiện: </span></b><span>&nbsp;&nbsp;Key và Tải xuống – Hướng dẫn sẽ được gửi qua email cho bạn.</span><br>
                        </p>
                        <div class="category-product">
                            <p class="mb-0">
                                <b>Sản phẩm tương tự:&nbsp;&nbsp;</b>
                                <a href="product.jsp">Key Windows</a>
                            </p>
                        </div>
                        <form class="detail-add-product-to-cart">
                            <input type="number" name="quantity" min="1" step="1" value="1" readonly="readonly">
                            <button><a href="AddToCart?id=<%= product.getId()%>">Thêm vào giỏ hàng</a></button>
                        </form>
                        <style>
                            #content .entry-summary .detail-add-product-to-cart button a{
                                text-decoration: none;
                                color: white;
                            }
                        </style>
                    </div>
                </div>
                <div class="description">
                    <div class="tab">
                        <button class="tablinks" onclick="openSection(event, 'description_content')">Mô tả</button>
                        <button class="tablinks" onclick="openSection(event, 'rated_content')">Đánh giá</button>
                    </div>
                    <div class="tabcontent" id="description_content" role="tabpanel"
                         aria-labelledby="description_title">
                        <%=product.getDescription()%>
                    </div>
                    <div class="tabcontent" id="rated_content" role="tabpanel" aria-labelledby="rated_title" style="display: none">
                        <% User user = (User) request.getSession().getAttribute("user");
                            if (user!= null) {%>
                        <form>
                            <h3>Đánh giá sản phẩm</h3>
                            <textarea class="rate_input" placeholder="Nội dung"></textarea>
                            <button type="button">Gửi</button>
                        </form>
                        <%} else {}%>
                        <div class="user_rate">
                            <div class="image_rate">
                                <img src="Admin/template/images/faces/face1.jpg" alt="">
                            </div>
                            <div class="info_rate">
                                <h4>Ngô Công Dũng</h4>
                                <p>Đã đánh giá: 25/10/2022</p>
                                <p>Bộ office kích hoạt rất nhanh chóng và sử dụng ổn định.</p>
                            </div>
                        </div>
                        <div class="user_rate">
                            <div class="image_rate">
                                <img src="Admin/template/images/faces/face10.jpg" alt="">
                            </div>
                            <div class="info_rate">
                                <h3>Đào Kim Ngọc</h3>
                                <p>Đã đánh giá: 12/10/2022</p>
                                <p>Key adobe photoshop rất dễ kích hoạt và sử dụng.</p>
                            </div>
                        </div>
                        <div class="user_rate">
                            <div class="image_rate">
                                <img src="Admin/template/images/faces/face9.jpg" alt="">
                            </div>
                            <div class="info_rate">
                                <h3>Trần Thanh Hải</h3>
                                <p>Đã đánh giá: 30/09/2022</p>
                                <p>Bộ key windows 5 thiết bị dùng cho gia đình quá là tiết kiệm.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  End Content-->
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
<script src="js/slideShow.js"></script>
</div>
</body>
</html>