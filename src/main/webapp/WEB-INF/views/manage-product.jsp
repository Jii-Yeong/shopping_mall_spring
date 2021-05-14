<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/manage-upload.css">
</head>
<body>
<div class="form">
<h1>상품 관리</h1>
<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>상 품 번 호</th>
				<th>상 품 명</th>
				<th>사 진 1</th>
				<th>사 진 2</th>
				<th>사 진 3</th>
				<th>금 액</th>
				<th>상 세 설 명</th>
				<th>상 품 수 정</th>
				<th>상 품 삭 제</th>
	      </tr>
      </thead>
	<c:forEach var="product_list" items="${ product_list }">
      <tbody>
   		<tr>
   			<td>${product.product_id}</td>
   			<td>${product.name}</td>
   			<td>${product.photo_1}</td>
   			<td>${product.photo_2}</td>
   			<td>${product.photo_3}</td>
   			<td>${product.price}</td>
   			<td>${product.description}</td>
   			<td><a href="manage-user.jsp?product.id=${ user_list.user_num }">[ 수정 ]</a></td>
   			<td><a href="manage-user.jsp?product.id=${ user_list.user_num }">[ 삭제 ]</a></td>
    	</tr>
      </tbody>
      </c:forEach>
	</table>
	
	<c:forEach var ="pageNum" begin="1" end="${ pageTotalCount }">
	<a href="manage-user?page=${ pageNum }">[${ pageNum }]</a>
	</c:forEach>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
</body>
</html>