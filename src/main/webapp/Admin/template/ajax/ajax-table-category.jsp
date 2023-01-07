<%@ page import="vn.edu.hcmuaf.fit.Model.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tr>
  <th>ID</th>
  <th>Tên danh mục</th>
  <th>Chức năng</th>
</tr>
<%
  List<Category> list = (List<Category>) request.getAttribute("listCat");
  for (Category category : list) {%>
<tr>
  <td><%=category.getCid()%></td>
  <td><%=category.getCname()%></td>
  <td>
    <a class="delete-category" id="delete<%=category.getCid()%>" style="color: red"><i
            class="mdi mdi-delete"></i></a>
    <a class="edit-category" id="edit<%=category.getCid()%>"><i
            class="mdi mdi-grease-pencil"></i></a>
  </td>
</tr>
<%}%>

