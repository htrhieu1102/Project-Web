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
<!--    Begin Header-->
<jsp:include page="header.jsp"></jsp:include>
<!--    End Header-->

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
			<div class="product_contain">
				<div class="image">
					<img src="image/product-image/windows/key-windows-11-pro-1-510x510.png">
				</div>
				<div class="product_details">
					<div class="name">Key bản quyền Win 11 Pro</div>
					<p>Key kích hoạt Windows 11 phiên bản professional</p>
				</div>
				<div class="price"><p>400.000 VND</p></div>
				<div class="quantity">
					<input type="number" value="1" min="1">
				</div>
				<div class="total">
					<p>400.000 VND</p>
				</div>
				<div class="remove">
					<button><i class="fas fa-trash-alt"></i></button>
				</div>
			</div>
			<div class="product_contain">
				<div class="image">
					<img src="image/product-image/design/autodesk-revit-ban-quyen.png">
				</div>
				<div class="product_details">
					<div class="name">Key bản quyền Autodesk Revit</div>
					<p>Key kích hoạt phần mềm Autodesk Revit</p>
				</div>
				<div class="price"><p>300.000 VND</p></div>
				<div class="quantity">
					<input type="number" value="2" min="1">
				</div>
				<div class="total">
					<p>600.000 VND</p>
				</div>
				<div class="remove">
					<button><i class="fas fa-trash-alt"></i></button>
				</div>
			</div>
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
							<li class="totalRow_button"><a href="checkout.jsp" class="btn_payment">Thanh toán</a></li>
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