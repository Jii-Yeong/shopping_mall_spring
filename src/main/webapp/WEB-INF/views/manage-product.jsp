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
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/shopping_mall/manage-page">관리자 페이지</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
     	 <li><a href="/shopping_mall/manage-page/manage-dashboard">대시 보드</a></li>
        <li><a href="/shopping_mall/manage-page/manage-user">회원 관리</a></li>
        <li><a href="/shopping_mall/manage-page/manage-review">리뷰 관리</a></li>
        <li class="active"><a href="/shopping_mall/manage-page/manage-product">상품 관리</a></li>
        <li><a href="/shopping_mall/manage-page/manage-upload">상품 추가</a></li>
        <li><a href="#">로그아웃</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/shopping_mall">Home</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
		<div class="form">
		<div class="container">
			<h1>상품 관리</h1>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.js"></script>
</body>
</html>