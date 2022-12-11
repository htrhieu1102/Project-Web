<%@ page import="vn.edu.hcmuaf.fit.Controller.AddToCart" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Cart" %>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="fontawesome/css/all.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
</head>
<body>
<div id="main">
<<<<<<< HEAD
    <!--    Begin Header-->
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
    <!--    End Header-->
=======
    <!-- Begin Header-->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- End Header-->
>>>>>>> 2f725d8ab6521540bdf93557d513e5e09ad58ea3
    <!--    Begin SlideShow-->
    <div id="slideShow">
        <div class="position-relative">
            <img class="mySlides" src="image/slideshow/win11-2-compressed.jpg" alt="">
            <img class="mySlides" src="image/slideshow/office-365-1-compressed.jpg" alt="">
            <img class="mySlides" src="image/slideshow/adobe%201-compressed.jpg" alt="">
            <div class="dotList">
                <span class="dot" onclick="currentDiv(1)"></span>
                <span class="dot" onclick="currentDiv(2)"></span>
                <span class="dot" onclick="currentDiv(3)"></span>
            </div>
        </div>
    </div>
    <!--    End SlideShow-->
    <!--    Begin Content-->
    <div id="content">
        <div class="container pt-4 d-flex justify-content-center row pb-4 ml-auto mr-auto">
            <div class="brand col-lg-2">
                <a href="">
                    <img src="image/brand/office-365.png" alt="">
                    <p>Window</p>
                </a>
            </div>
            <div class="brand col-lg-2">
                <a href="">
                    <img src="image/brand/adobe.png" alt="">
                    <p>Adobe</p>
                </a>
            </div>
            <div class="brand col-lg-2">
                <a href="">
                    <img src="image/brand/office-365.png" alt="">
                    <p>Office</p>
                </a>
            </div>
            <div class="brand col-lg-2">
                <a href="">
                    <img src="image/brand/google.png" alt="">
                    <p>Google</p>
                </a>
            </div>
            <div class="brand col-lg-2">
                <a href="">
                    <img src="image/brand/phan-mem.png" alt="">
                    <p>Phầm mềm</p>
                </a>
            </div>
        </div>
        <div class="container">
            <div class="products-new">
                <div class="product-title">
                    <h3 class="section-title"><i class="fa-solid fa-bolt"></i>Sản Phẩm Mới</h3>
                    <a class="more-product" href="">Xem thêm</a>
                </div>
                <span class="heading_divider"></span>
                <div class="products">
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/windows/windows-11-pro-mak-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Windows 11 Pro Mak</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/windows/Windows-11-Home-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Windows 11 Home</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/windows/windows-11-enterprise-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Windows 11 Enterprise</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/office/office-365-gia-re-min-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Office 365 Peronal (5 Thiết bị)</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/office/office-2021-professional-plus-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Office 2021 Professional Plus</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/office/outlook-2021-ban-quyen-min-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Outlock 2021</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/design/affinity-designer-min-1-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Affinity Designer</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/other(entertainment)/youtube-premium-gia-re-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Youtube Premium</p></a>
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

            </div>
            <div class="products-trend">
                <div class="product-title d-flex justify-content-between">
                    <h3 class="section-title mb-0"><i class="fa-solid fa-arrow-trend-up"></i>Sản Phẩm Thịnh Hành</h3>
                    <a class="more-product" href="">Xem thêm</a>
                </div>
                <div class="products">
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/windows/windows-10-eduction-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Windows 10 Education</p></a>

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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/windows/windows-10-pro-1-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Windows 10 Pro</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/office/Office-2019-Home-And-Business-win-600x600.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Office Home & Business</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/office/offcie-2019-home-student-gia-re-min-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Office 2019 Home & Student</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/antivirus/5819_bkav_pro_internet_security_1.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Bkav Professsional</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/antivirus/McAfee-Internet-Security-2018.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">McAfee Internet Security</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/office/office-2016-pro-plus-1-510x510.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Office 2016 Professional Plus</p></a>
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
                    <div class="product-item">
                        <a href="detail.jsp">
                            <img class="product-image" src="image/product-image/windows/windows-10-home.png" alt="">
                        </a>
                        <p class="product-type">Windows</p>
                        <a href="detail.jsp"><p class="product-name">Windows 10 Home</p></a>
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

            </div>
        </div>
    </div>
    <!--    Begin Footer-->
    <jsp:include page="footer.jsp"></jsp:include>
    <!--    End Footer-->
    <!--    Begin Back to top-->
    <div id="back-to-top">
        <a class="link-btt" href="#main"><i class="fa-sharp fa-solid fa-arrow-up"></i></a>
    </div>
    <!--    End Back to top-->
    <!--    End Content-->
</div>
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="js/slideShow.js"></script>
</body>
</html>