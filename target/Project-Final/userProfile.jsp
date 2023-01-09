<%@ page import="vn.edu.hcmuaf.fit.Model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="fontawesome/css/all.css">

    <style>
        .form-control:focus {
            box-shadow: none;
            border-color: #BA68C8
        }

        .profile-button {
            background: #2dd100;
            box-shadow: none;
            border: none
        }

        .profile-button:hover {
            background: #682773
        }

        .profile-button:focus {
            background: #682773;
            box-shadow: none
        }

        .profile-button:active {
            background: #682773;
            box-shadow: none
        }

        .back:hover {
            color: #682773;
            cursor: pointer;
        }

        .labels {
            font-size: 16px;
            margin-top: 10px;
        }

        .add-experience:hover {
            background: #BA68C8;
            color: #fff;
            cursor: pointer;
            border: solid 1px #BA68C8
        }
    </style>
</head>
<body>
<!--    Begin Header-->
<div id="main">
    <jsp:include page="header.jsp"></jsp:include>
    <!--    End Header-->
    <div class="container rounded bg-white mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <% User user = (User) request.getSession().getAttribute("user");%>
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                    <span class="font-weight-bold"><%=user.getName()%></span>
                    <span class="text-black-50"><%=user.getEmail()%></span>
                    <span> </span>
                </div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <form action="changeInformation" method="post">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Chỉnh sửa thông tin cá nhân</h4>
                        </div>
                        <input type="hidden" value="<%=user.getId()%>" name="id">
                        <div class="row mt-2">
                            <div class="col-md-12">
                                <label class="labels">Tên</label>
                                <input type="text" class="form-control" placeholder="first name" name="name" value="<%=user.getName()%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label class="labels">Số điện thoại</label>
                                <input type="number" class="form-control" placeholder="enter phone number" name="phone" value="<%=user.getPhone()%>">
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Ngày đăng ký: <%=user.getCreatedAt()%></label>
<%--                                <input type="text" class="form-control" placeholder="enter address line 1" value="">--%>
                            </div>
                            <div class="col-md-12">
                                <%  if(user.getIsAdmin() == 1) {%>
                                <label class="labels">Quyền: Quản lý</label>
                                <%} else if(user.getIsAdmin() == 0) {%>
                                <label class="labels">Quyền: Người dùng</label>
                                <%}%>
                            </div>
                        </div>
                        <div class="mt-5 text-center">
                            <button class="btn btn-primary profile-button" type="submit" id="change-infor">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-3 py-5">
                    <form action="changePassword" method="post">
                        <div class="d-flex justify-content-between align-items-center experience">
                            <h4>Đổi mật khẩu</h4>
                        </div><br>
                        <input type="hidden" value="<%=user.getId()%>" name="id">
                        <%String error = (String) request.getAttribute("error");%>
                        <%=error == null ? "" : error%>
                        <div class="col-md-12">
                            <label class="labels">Mật khẩu cũ</label>
                            <input type="text" class="form-control" name="oldpass" placeholder="Mật khẩu cũ" required>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Mật khẩu mới</label>
                            <input type="text" class="form-control" name="newpass" placeholder="Mật khẩu mới" required>
                        </div>
                        <div class="mt-5 text-center">
                            <button class="btn btn-primary profile-button" type="submit" id="change-pass">Đổi mật khẩu</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--    Begin Footer-->
    <jsp:include page="footer.jsp"></jsp:include>
    <!--    End Footer-->
</div>
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>
