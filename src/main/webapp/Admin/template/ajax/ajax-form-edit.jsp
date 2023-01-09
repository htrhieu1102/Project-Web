<%@ page import="vn.edu.hcmuaf.fit.Service.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Product" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/8/2022
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-12">
    <div class="main__title">
        <h2>Thêm sản phẩm mới</h2>
    </div>
</div>

<!-- content -->
<div class="col-12">
    <% Product p = (Product) request.getAttribute("product");%>
    <form action="" class="form">
        <div class="row row--form">
            <!-- image upload -->
            <div class="col-12 col-md-5 form__cover">
                <div class="row row--form">
                    <div class="col-12 col-sm-6 col-md-12">
                        <div class="form__img">
                            <label for="form__img-upload">Thêm ảnh</label>
                            <input id="form__img-upload" name="form__img-upload" type="file"
                                   accept="image/*"
                                   onchange="document.getElementById('form__img').src = window.URL.createObjectURL(this.files[0])">
                            <img id="form__img" src="<%=p.getImg()%>" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-7 form__content">
                <div class="row row--form">
                    <div class="col-12">
                        <input id="id" type="number" class="form__input"
                               placeholder="Mã sản phẩm" name="id" value="<%=p.getId()%>" readonly>
                    </div>
                    <div class="col-12">
                        <input id="name" type="text" class="form__input"
                               placeholder="Tên sản phẩm" name="name" value="<%=p.getName()%>">
                    </div>
                    <div class="col-12 ">
                        <input id="old-price" type="text" class="form__input"
                               placeholder="Giá cũ" name="old-price" value="<%=p.getOldPrice()%>">
                    </div>

                    <div class="col-12">
                        <input id="price" type="text" class="form__input"
                               placeholder="Giá hiện tại" name="price" value="<%=p.getPrice()%>">
                    </div>
                    <div class="col-12">
                        <input id="branch" type="text" class="form__input" placeholder="Hãng"
                               name="branch" value="<%=p.getBranch()%>">
                    </div>
                    <div class="col-12">
                        <label style="padding: 0 20px">Loại sản phẩm:</label>
                        <select id="category"
                                style="margin-bottom: 20px; width: 30%; padding: 10px 5px; text-align: center; border-radius: 5px">
                            <% CategoryService categoryService = new CategoryService();
                                List<Category> categoryList = categoryService.getAllCategory();
                                for (Category c : categoryList) {%>
                            <option value="<%=c.getCid()%>"><%=c.getCname()%>
                            </option>
                            <% }%>
                        </select>
                    </div>
                    <div class="col-12">
                        <input id="device-number" type="text" class="form__input"
                               placeholder="Số lượng thiết bị" name="device-number" value="<%=p.getDeviceNumber()%>">
                    </div>
                    <div class="col-12">
                        <input id="amount" type="text" class="form__input"
                               placeholder="Số lượng" name="amount" value="<%=p.getAmount()%>">
                    </div>
                    <div class="col-12">
                        <textarea id="description" name="description" class="form__textarea"
                                  placeholder="Mô tả"><%=p.getDescription()%></textarea>
                        <script>
                            CKEDITOR.replace('description');
                        </script>
                    </div>
                </div>
            </div>

            <div class="col-12">
                <div class="row row--form">
                    <div class="col-12 d-flex justify-content-end">
                        <button id="btn__edit" type="button" class="form__btn mb-5">Sửa</button>
                    </div>
                </div>
            </div>

        </div>
    </form>
</div>
