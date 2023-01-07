<%@ page import="vn.edu.hcmuaf.fit.Model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tr>
    <th>ID</th>
    <th>Email</th>
    <th>Tên</th>
    <th>Số điện thoại</th>
    <th>Ngày đăng ký</th>
    <th>Phân loại</th>
    <th style="text-align: center">Chức năng</th>
</tr>
<%
    List<User> list = (List<User>) request.getAttribute("listUser");
    for (User u : list) {
%>
<tr>
    <td><%=u.getId()%>
    </td>
    <td><%=u.getEmail()%>
    </td>
    <td><%=u.getName()%>
    </td>
    <td><%=u.getPhone()%>
    </td>
    <td><%=u.getCreatedAt()%>
    </td>
    <% if (u.getIsAdmin() == 0) {%>
    <td style="color: #0db20d">Người dùng</td>
    <%} else if (u.getIsAdmin() == 1) {%>
    <td style="color: red">Quản lý</td>
    <%}%>
    <td style="text-align: center">
        <a class="edit-admin" id="<%=u.getId()%>">
            <i class="mdi mdi-table-edit"></i>
        </a>
    </td>
</tr>
<%}%>