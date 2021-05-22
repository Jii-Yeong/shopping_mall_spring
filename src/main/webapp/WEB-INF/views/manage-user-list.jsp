<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
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
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/shopping_mall/manage-page">관리자 페이지</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/shopping_mall/manage-page/manage-dashboard">대시 보드</a></li>
					<li class="active"><a href="/shopping_mall/manage-page/manage-user">회원 관리</a></li>
					<li><a href="/shopping_mall/manage-page/manage-review">리뷰 관리</a></li>
					<li><a href="/shopping_mall/manage-page/manage-product">상품 관리</a></li>
					<li><a href="/shopping_mall/manage-page/manage-upload">상품 추가</a></li>
					<li><a href="#">로그아웃</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/shopping_mall">Home</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
		<div class="form">
			<div class="container">
				<h1>회원 관리</h1>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>회 원 번 호</th>
							<th>아 이 디</th>
							<th>이 름</th>
							<th>생 년 월 일</th>
							<th>전 화 번 호</th>
							<th>주 소</th>
							<th>가 입 날 짜</th>
							<th>회 원 등 급</th>
							<th>회 원 수 정</th>
							<th>회 원 삭 제</th>
				      </tr>
			      </thead>
				<c:forEach var="user_list" items="${ user_list }">
			      <tbody>
			   		<tr>
			   			<td>${user_list.user_num}</td>
			   			<td>${user_list.id}</td>
			   			<td>${user_list.name}</td>
			   			<td>${user_list.birth}</td>
			   			<td>${user_list.phone_num}</td>
			   			<td>${user_list.address}</td>
			   			<td>${user_list.join_date}</td>
			   			<td>${user_list.grade}</td>
			   			
			   			<td><a href="manage-user-update?user_num=${user_list.user_num}">[ 수정 ]</a></td>
			   			<td><a href="manage-user-delete?user_num=${user_list.user_num}">[ 삭제 ]</a></td>
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