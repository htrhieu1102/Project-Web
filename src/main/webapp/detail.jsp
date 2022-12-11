<%@ page import="vn.edu.hcmuaf.fit.Model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.Service.ProductService" %>
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
                    <p class="entry-price"><%=product.getPrice()%> <span class="entry-currency">VND</span></p>
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
                            <input type="number" name="quantity" min="1" step="1" value="1">
                            <button>Thêm vào giỏ hàng</button>
                        </form>
                    </div>
                </div>
                <div class="description">
                    <div class="tab">
                        <button class="tablinks" onclick="openSection(event, 'description_content')">Mô tả</button>
                        <button class="tablinks" onclick="openSection(event, 'rated_content')">Đánh giá</button>
                    </div>
                    <div class="tabcontent" id="description_content" role="tabpanel"
                         aria-labelledby="description_title">
                        <h3>Tổng quan về Windows 11</h3>
                        <p>Phiên bản Windows 11 hiện đang là từ khóa hot nhất được tìm kiếm nhiều nhất hiện nay, mọi
                            người đang sử dụng Windows đề đang đổ dồn sự chú ý về key Windows 11 mới nhất này. Mặc dù
                            trước đây, Microsoft đã từng tuyên bố Windows 10 sẽ là phiên bản hệ điều hành cuối cùng
                            nhưng vào thời điểm hiện tại Microsoft đã cho ra mắt key Windows 11 bản quyền với nhiều tính
                            năng mới mẻ, thú vị mang tính cá nhân hóa cao.</p>
                        <img src="image/detail_image.jpg" alt="">
                        <p>Phiên bản Key bản quyền Windows 11 có thiết kế giao diện hoàn toàn mới so với Windows 10,
                            người dùng sẽ được trải nghiệm những tính năng mới, thông minh và tiện ích nhất mà Microsoft
                            mang lại. Đồng thời, trong phiên bản này có những điểm đặc biệt nổi bật như: Menu Start mới,
                            nâng cấp bàn phím ảo, các biểu tượng hệ thống mới, giao diện Microsoft Store mới, thanh
                            Taskbar mới, cải thiện tính năng nhập liệu bằng giọng nói, giao diện Action Center mới,…
                            Thiết kế này khá tương đồng với Windows 10X, hứa hẹn sẽ cạnh tranh mạnh mẽ với Chrome
                            OS.</p>
                    </div>
                    <div class="tabcontent" id="rated_content" role="tabpanel" aria-labelledby="rated_title">
                        <div class="user_rate">
                            <div class="image_rate">
                                <img src="Admin/template/images/faces/face1.jpg" alt="">
                            </div>
                            <div class="info_rate">
                                <h3>Ngô Công Dũng</h3>
                                <p>Đã đánh giá: 25/10/2022</p>
                                <p>Bộ office kích hoạt rất nhanh chóng và sử dụng ổn định.</p>
                            </div>
                            <div class="star">
                                <img src="image/5-gold-star.png" alt="">
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
                            <div class="star">
                                <img src="image/5-gold-star.png" alt="">
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
                            <div class="star">
                                <img src="image/5-gold-star.png" alt="">
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