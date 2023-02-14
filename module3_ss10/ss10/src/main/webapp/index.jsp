<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 2/10/2023
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
  <title>index</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <style>
  </style>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <title>Danh sách khách hàng</title>
<%--  bootstrap off--%>
<%--  <link rel="stylesheet" href="./css/bootstrap.css">--%>
</head>
<body>
<%--<form action="/CustomersListServlet" method="post">--%>
<a style="width: 20px;height: 10px" href="Customers">Hiển thị danh sách khách hàng</a>
<table class="table">
  <thead>
  <tr>
    <th>ID</th>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th >Ảnh</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="customer" items="${customerList}">
    <tr>
      <td>${customer.id}</td>
      <td>${customer.name}</td>
      <td>${customer.dateOfBirth}</td>
      <td>${customer.dateOfBirth}</td>
      <td><img style="width: 120px " src="${customer.img}"></td>
    </tr>
  </c:forEach>
<%--  <c:forEach var="customers" items="${customerList} " varStatus="loop">--%>
<%--    <tr>--%>
<%--      <td>${loop.count}</td>--%>
<%--&lt;%&ndash;      <td>${customer.id}</td>&ndash;%&gt;--%>
<%--      <td>${customers.name}</td>--%>
<%--      <td>${customers.dateOfBirth}</td>--%>
<%--      <td>${customers.dateOfBirth}</td>--%>
<%--      <td><img src="${customers.img}"></td>--%>
<%--    </tr>--%>
<%--  </c:forEach>--%>
  </tbody>
</table>

</form>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>