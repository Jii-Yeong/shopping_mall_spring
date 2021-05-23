<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보 페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manage-page.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css">
<script src="https://kit.fontawesome.com/1ca40a0930.js" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="nav-bar.jsp" />
	<div class="form">
		<div class="container">
			<h2>주문 관리</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>주 문 번 호</th>
						<th>상 품 번 호</th>
						<th>유저 아이디</th>
						<th>컬러</th>
						<th>사이즈</th>
						<th>수량</th>
						<th>총 가격</th>
			      </tr>
		      </thead>
		      <tbody>
				<c:forEach var="order" items="${ order_list }">
		   			<tr>
		   			<td>${ order.number }</td>
		   			<td>${ order.productNum }</td>
		   			<td>${ order.userId }</td>
		   			<td>${ order.color }</td>
		   			<td>${ order.size }</td>
		   			<td>${ order.amount }</td>
		   			<td>${ order.totalPrice }</td>
		   			<td><a href="manage-order-update?productNum=${ order.number }">[ 수정 ]</a></td>
		   			<td><a href="manage-order-delete?productNum=${ order.number }">[ 삭제 ]</a></td>
		    	</tr>
		     </c:forEach>
		      </tbody>
			</table>
			<c:forEach var ="pageNum" begin="1" end="${ pageTotalCount }">
			<a href="manage-product?page=${ pageNum }">[${ pageNum }]</a>
			</c:forEach>
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.js"></script>
</body>
</html>