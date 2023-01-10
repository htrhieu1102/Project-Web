<%@ page import="vn.edu.hcmuaf.fit.Service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.Controller.ListProduct" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.Service.CategoryService" %>
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
    <style>
        .list-category:hover,
        #get-all-product:hover{
            text-decoration: none;
            cursor: pointer;
        }
        .list-category:hover p,
        #get-all-product:hover p{
            color: #2dd100;
        }
        #search-by-name {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #c0c0c0;
        }
    </style>
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
                               value="10000000" oninput="FilterProductsByRange(this)">
                        <label>Giá: <span class="show-range-value"></span>₫</label>
                    </form>
                </div>
                <div class="filter-branch filter-container">
                    <span class="title-dots" style="color: #000000"></span>
                    <p class="title-filter">Danh mục</p>
                    <a id="get-all-product"><p class="text-center">Tất cả</p></a>
                    <% CategoryService categoryService = new CategoryService();
                        List<Category> listCat = categoryService.getAllCategory();
                        for (Category c : listCat) {
                    %>
                    <a id="<%=c.getCid()%>" class="list-category" style="color: #000000"><p class="text-center"><%=c.getCname()%></p></a>
                    <%}%>
                </div>
                <div class="container-btn-filter">
                    <button class="btn-filter">LỌC</button>
                </div>
            </div>
            <div class="product-filter">
                <form class="woocommerce-ordering" action="">
                    <input id="search-by-name" placeholder="Tìm kiếm sản phẩm" oninput="searchNameProduct(this)">

                </form>
                <div class="product-filter-container">
                    <% List<Product> list = (List<Product>) request.getAttribute("searchProduct");
                        for (Product p : list) {%>
                    <div class="product-item">
                        <a href="detail.jsp?pid=<%=p.getId()%>">
                            <img class="product-image" src="<%= p.getImg()%>" alt="">
                        </a>
                        <p class="product-type"><%= p.getBranch()%>
                        </p>
                        <a href="detail.jsp?pid=<%=p.getId()%>"><p class="product-name"><%= p.getName()%>
                        </p></a>
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
                            <%--                            <a href="AddToCart?id=<%= p.getId()%>">--%>
                            <%--                                --%>
                            <%--                            </a>--%>
                            <button class="add-to-cart">
                                <%--                                <a href="product.jsp?id=<%= p.getId()%>" >--%>
                                <a href="AddToCart?id=<%= p.getId()%>">
                                    <i class="fa-solid fa-cart-plus"></i>Thêm Vào Giỏ
                                </a>
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
                            <span class="product-new-price"><%= ListProduct.list.size()%>><span
                                    class="currency">₫</span></span>
                        </div>
                        <div class="product-choose">
                            <button class="add-to-cart">
                                <i class="fa-solid fa-cart-plus"></i>Thêm Vào Giỏ
                            </button>
                        </div>
                    </div>
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
<script>
    $('#get-all-product').click(function (e) {
        e.preventDefault();
        $.ajax({
            url: '/Project_Web_war/filterAllProduct',
            type: 'post',
            success: function (response){
                $('.product-filter-container').html(response)
            },
            error: function (){
                alert("Lỗi")
            }
        })
    })
    $('.list-category').each(function () {
        $(this).click(function (e) {
            e.preventDefault();
            let cid = $(this).attr("id");
            $.ajax({
                url: '/Project_Web_war/filterProductsByCategory',
                type: 'post',
                data: {
                    cid : cid
                },
                success: function (response){
                    $('.product-filter-container').html(response)
                },
                error: function (){
                    alert("Lỗi")
                }
            })
        })
    })
    function FilterProductsByRange(para) {
        let val = $(para).val();
        $.ajax({
            url: '/Project_Web_war/filterProductsByRange',
            type: 'post',
            data: {
                val : val
            },
            success: function (response){
                $('.product-filter-container').html(response)
            },
            error: function (){
                alert("Lỗi")
            }
        })
    }
    function searchNameProduct(para) {
        let val = $(para).val();
        $.ajax({
            url: '/Project_Web_war/filterProductsBySearch',
            type: 'post',
            data: {
                val : val
            },
            success: function (response){
                $('.product-filter-container').html(response)
            },
            error: function (){
                alert("Lỗi")
            }
        })
    }
</script>
</body>
</html>
