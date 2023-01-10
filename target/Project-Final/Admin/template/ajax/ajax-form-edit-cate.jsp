<%@ page import="vn.edu.hcmuaf.fit.Model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="form-group">
    <% Category category = (Category) request.getAttribute("category");%>
    <label for="exampleInputName1" id="id-category">ID: <%=category.getCid()%></label>
    <input type="text" class="form-control" id="exampleInputName1"
           placeholder="Tên danh mục mới" value="<%=category.getCname()%>">
</div>
<button type="button" class="btn btn-primary me-2" id="btn-edit-cat">Sửa</button>
<button type="button" class="btn btn-primary me-2" id="btn-cancel">Hủy</button>

