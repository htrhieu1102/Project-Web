<%@ page import="vn.edu.hcmuaf.fit.Service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Product" %>
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
        <div class="container d-flex">
            <div class="filter w-25">
                <div class="price-filter filter-container">
                    <span class="title-dots"></span>
                    <p class="title-filter">Lọc theo giá</p>
                    <form action="">
                        <input type="range" class="range-filter" min="100000" max="10000000" step="100000"
                               value="100000">
                        <label>Giá: <span class="show-range-value"></span>₫</label>
                    </form>
                </div>
                <div class="filter-branch filter-container">
                    <span class="title-dots"></span>
                    <p class="title-filter">Lọc theo sản phẩm</p>
                    <form action="">
                        <input type="checkbox" name="" checked>
                        <label>Tất cả</label><br>
                        <input type="checkbox" name="">
                        <label>Windows</label><br>
                        <input type="checkbox" name="">
                        <label>Adobe</label><br>
                        <input type="checkbox" name="">
                        <label>Microsoft</label><br>
                        <input type="checkbox" name="">
                        <label>Anti Virus</label><br>
                    </form>
                </div>
                <div class="filter-duration filter-container">
                    <span class="title-dots"></span>
                    <p class="title-filter">Lọc theo thời hạn</p>
                    <form action="">
                        <input type="checkbox" name="" checked>
                        <label>Tất cả</label><br>
                        <input type="checkbox" name="">
                        <label>30 Ngày</label><br>
                        <input type="checkbox" name="">
                        <label>3 Tháng</label><br>
                        <input type="checkbox" name="">
                        <label>6 Tháng</label><br>
                        <input type="checkbox" name="">
                        <label>1 Năm</label><br>
                        <input type="checkbox" name="">
                        <label>Vĩnh viễn</label><br>
                    </form>
                </div>
                <div class="container-btn-filter">
                    <button class="btn-filter">LỌC</button>
                </div>
            </div>
            <div class="product-filter">
                <form class="woocommerce-ordering" action="">
                    <select class="order-by">
                        <option value="menu_order" selected="selected">Thứ tự mặc định</option>
                        <option value="date">Mới nhất</option>
                        <option value="popularity">Thứ tự theo mức độ phổ biến</option>
                        <option value="price">Thứ tự theo giá: thấp đến cao</option>
                        <option value="price-desc">Thứ tự theo giá: cao xuống thấp</option>
                    </select>

                </form>
                <div class="product-filter-container">
<%--                    <% List<Product> list = (List<Product>) request.getAttribute("listP");--%>
                    <% ProductService productService = new ProductService();
                        List<Product> list = productService.getProduct();
                        for (Product p : list) {%>
                    <div class="product-item">
                        <a href="detail.jsp?pid=<%=p.getId()%>">
                            <img class="product-image" src="<%= p.getImg()%>" alt="">
                        </a>
                        <p class="product-type"><%= p.getBranch()%>
                        </p>
                        <a href="detail.jsp?pid=<%=p.getId()%>"><p class="product-name"><%= p.getName()%></p></a>
                        <div class="product-star text-center">
                            <span class="number-of-stars">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </span>
                        </div>
                        <div class="product-price">
                            <del class="product-old-price"><%=p.getOldPrice()%><span class="currency">₫</span></del>
                            <span class="product-new-price"><%=p.getPrice()%><span class="currency">₫</span></span>
                        </div>
                        <div class="product-choose">
                            <button class="add-to-cart">
                                <i class="fa-solid fa-cart-plus"></i>Thêm Vào Giỏ
                            </button>
                        </div>
                    </div>
                    <%}%>
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/windows/windows-11-pro-mak-510x510.png"
                                 alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Windows 10 (Home/Edu/Pro)</p></a>
                        <div class="product-star text-center">
                            <span class="number-of-stars">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </span>
                        </div>
                        <div class="product-price">
                            <del class="product-old-price">100.000<span class="currency">₫</span></del>
                            <span class="product-new-price">100.000<span class="currency">₫</span></span>
                        </div>
                        <div class="product-choose">
                            <button class="add-to-cart">
                                <i class="fa-solid fa-cart-plus"></i>Thêm Vào Giỏ
                            </button>
                        </div>
                    </div>
                </div>
                <div class="page-numbers mt-4">
                    <button class="btn-number-pages" aria-checked="">1</button>
                    <button class="btn-number-pages">2</button>
                    <button class="btn-number-pages">></button>
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
<script src="js/range-filter.js"></script>

</body>
</html>
