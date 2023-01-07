
<%@ page import="vn.edu.hcmuaf.fit.Model.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/6/2022
  Time: 11:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<tr>
    <th>ID</th>
    <th>Tên</th>
    <th>Ảnh</th>
    <th>Số lượng</th>
    <th>Giá</th>
    <th>Loại key</th>
    <th>Chức năng</th>
</tr>
<%
    List<Product> list = (List<Product>) request.getAttribute("delete");
    for (Product p : list) {%>
<tr>
    <td><%=p.getId()%>
    </td>
    <td><%=p.getName()%>
    </td>
    <td>
        <img src="<%=p.getImg()%>">
    </td>
    <td><%=p.getAmount()%>
    </td>
    <td><%=p.getPrice()%>
    </td>
    <td><%=p.getBranch()%>
    </td>
    <td>
        <a class="delete-product" id="delete<%=p.getId()%>"style="color: red"><i class="mdi mdi-delete "></i></a>
        <a class="edit-product" id="edit<%=p.getId()%>"><i
                class="mdi mdi-grease-pencil"></i></a>
    </td>
</tr>
<%}%>
