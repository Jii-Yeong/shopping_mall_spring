<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manage-upload.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manage-page.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager-upload.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
</head>
<body>
<header>관리자 페이지</header>
	<div class="container-inner">
		<div class="nav-inner">
			<ul class="nav nav-stacked">
	  			<li role="presentation"><a href="/shopping_mall/manage-page/manage-user">회원 관리</a></li>
	  			<li role="presentation"><a href="/shopping_mall/manage-page/manage-review">리뷰 관리</a></li>
	  			<li role="presentation"><a href="/shopping_mall/manage-page/manage-product">상품 관리</a></li>
	  			<li role="presentation"><a href="/shopping_mall/manage-page/manage-upload">상품 추가</a></li>
	 			<li role="presentation"><a>로그아웃</a></li>
			</ul>
		</div>
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
		   			<td>${product_list.product_id}</td>
		   			<td>${product_list.name}</td>
		   			<td><img id="product_photo1" src="http://localhost:8080/shopping_mall/resources/imageUpload/${product_list.photo_1}" alt="IMG1-PRODUCT" width="80" height="90" ></td>
		   			<td><img id="product_photo2" src="http://localhost:8080/shopping_mall/resources/imageUpload/${product_list.photo_2}" alt="IMG2-PRODUCT" width="80" height="90" ></td>
		   			<td><img id="product_photo3" src="http://localhost:8080/shopping_mall/resources/imageUpload/${product_list.photo_3}" alt="IMG3-PRODUCT" width="80" height="90" ></td>
		   			<td>${product_list.price}</td>
		   			<td>${product_list.description}</td>
		   			<td><a href="manage-product-update?productId=${ product_list.product_id }">[ 수정 ]</a></td>
		   			<td><a href="manage-product-delete?productId=${ product_list.product_id }">[ 삭제 ]</a></td>
		    	</tr>
		      </tbody>
		      </c:forEach>
			</table>
			
			<c:forEach var ="pageNum" begin="1" end="${ pageTotalCount }">
			<a href="manage-product?page=${ pageNum }">[${ pageNum }]</a>
			</c:forEach>
		</div>
	</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.js"></script>
</body>
</html>