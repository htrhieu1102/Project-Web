<%@ page import="vn.edu.hcmuaf.fit.Service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.Controller.ListProduct" %>
<%@ page import="vn.edu.hcmuaf.fit.Controller.AddToCart" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.Service.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Category" %>
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
                <div class="filter-duration filter-container">
                    <span class="title-dots"></span>
<%--                <div class="price-filter filter-container">--%>
<%--                    <span class="title-dots"></span>--%>
                    <p class="title-filter">Lọc theo giá</p>
<%--                    <form action="">--%>
<%--                        <input type="range" class="range-filter" min="100000" max="10000000" step="100000"--%>
<%--                               value="100000">--%>
<%--                        <label>Giá: <span class="show-range-value"></span>₫</label>--%>
<%--                    </form>--%>
                    <form action="">
<<<<<<< HEAD
                        <input type="checkbox" name="" checked>
                        <label>Tất cả</label><br>
                        <input type="checkbox" name="">
                        <label>Dưới 1 triệu</label><br>
                        <input type="checkbox" name="">
                        <label>Từ 1-3 triệu</label><br>
                        <input type="checkbox" name="">
                        <label>Từ 3-5 triệu</label><br>
                        <input type="checkbox" name="">
                        <label>Trên 5 triệu</label><br>
                    </form>
                </div>
                <div class="filter-branch filter-container">
                    <span class="title-dots"></span>
                    <c:set var="checkId" value="${requestScope.checkId}"/>
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
<%--                <div class="filter-duration filter-container">--%>
<%--                    <span class="title-dots"></span>--%>
<%--                    <p class="title-filter">Lọc theo thời hạn</p>--%>
<%--                    <form action="">--%>
<%--                        <input type="checkbox" name="" checked>--%>
<%--                        <label>Tất cả</label><br>--%>
<%--                        <input type="checkbox" name="">--%>
<%--                        <label>30 Ngày</label><br>--%>
<%--                        <input type="checkbox" name="">--%>
<%--                        <label>3 Tháng</label><br>--%>
<%--                        <input type="checkbox" name="">--%>
<%--                        <label>6 Tháng</label><br>--%>
<%--                        <input type="checkbox" name="">--%>
<%--                        <label>1 Năm</label><br>--%>
<%--                        <input type="checkbox" name="">--%>
<%--                        <label>Vĩnh viễn</label><br>--%>
<%--                    </form>--%>
<%--                </div>--%>
                <div class="container-btn-filter">
                    <button class="btn-filter">LỌC</button>
=======
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
>>>>>>> 8df66b6f1f2bb1171f3f076c77faef235b058fe1
                </div>
            </div>
            <div class="product-filter">
                <form class="woocommerce-ordering" action="">
                    <input id="search-by-name" placeholder="Tìm kiếm sản phẩm" oninput="searchNameProduct(this)">

                </form>
                <div class="product-filter-container">
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
                        <div class="product-price">
                            <del class="product-old-price"><%=p.getOldPrice()%><span class="currency">₫</span></del>
                            <span class="product-new-price"><%=p.getPrice()%><span class="currency">₫</span></span>
                        </div>
                        <div class="product-choose">
                                <button class="add-to-cart">
                                <a href="AddToCart?id=<%= p.getId()%>">
                                    <i class="fa-solid fa-cart-plus"></i>Thêm Vào Giỏ
                                </a>
                                </button>
                        </div>
                    </div>
                    <%}%>
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
<<<<<<< HEAD
<script>type="text/javascript"
    function setCheck(obj) {
        var fries = document.getElementsByName('cid');
        if ((obj.id == '') && (fries[0].checked == true)) {
            for (var i = 1; i < fries.length; i++)
                fries[i].check = false;
        } else {
            for (var i = 1; i < fries.length; i++) {
                if (fries[i].checked == true) {
                    fries[0].check = false;
                    break;
                }
            }
        }
        document.getElementById('f1').submit();
=======

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
>>>>>>> 8df66b6f1f2bb1171f3f076c77faef235b058fe1
    }
</script>
</body>
</html>
