<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
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
			<h1>리뷰 관리</h1>
			<div class="container">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>순     서</th>
							<th>아  이  디</th>
							<th>파 일 이 름</th>
							<th>내      용</th>
							<th>리 뷰 삭 제</th>
				      </tr>
			      </thead>
				<c:forEach var="read" items="${ read }">
			      <tbody>
			   		<tr>
			   			<td>${read.num}</td>
			   			<td>${read.id}</td>
			   			<td>${read.fileName}</td>
			   			<td>${read.text}</td>
			   			<td><a href="/shopping_mall/manage-page/manage-review-delete?num=${read.num}">[ 삭제 ]</a></td>
			    	</tr>
			      </tbody>
			      </c:forEach>
				</table>
				<!-- Paging -->
			       <div style='position: absolute; left:50%'>
			       	<c:if test="${paging.startPage != 1}">
			       		<a href="/shopping_mall/manage-page/manage-review?nowPage=${paging.startPage - 1}">&lt;</a>
			       	</c:if>
			       	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			       		<c:choose>
			       			<c:when test="${p == paging.nowPage}">
			       				<b>${p}</b>
			       			</c:when>
			       			<c:when test="${p != paging.nowPage}">
			       				<a href="/shopping_mall/manage-page/manage-review?nowPage=${p}">${p}</a>
			       			</c:when>
			       		</c:choose>
			       	</c:forEach>
			       	<c:if test="${paging.endPage != paging.lastPage}">
			       		<a href="/shopping_mall/manage-page/manage-review?nowPage=${paging.endPage + 1}">&gt;</a>
			       	</c:if>
			       </div>
			     <!-- ./Paging -->
			</div>
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
</body>
</html>