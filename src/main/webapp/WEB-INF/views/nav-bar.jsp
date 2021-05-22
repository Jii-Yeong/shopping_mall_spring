<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">관리자 페이지</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/shopping_mall">Home</a></li>
				<li><a href="#">로그아웃</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<ul class="left-nav">
	<a href="/shopping_mall/manage-page/manage-dashboard">
		<li class="nav-bar">
		<i class="fas fa-chart-bar"></i>
			<p>대시 보드</p>
		</li>
	</a>
	<a href="#">
		<li class="nav-bar">
		<i class="fas fa-box"></i>
			<p>주문 정보</p>
		</li>
	</a>
	
	<a href="/shopping_mall/manage-page/manage-user">
		<li class="nav-bar">
		<i class="fas fa-users"></i>
			<p class="user-manage-text">회원 관리</p>
		</li>
	</a>

	<a href="/shopping_mall/manage-page/manage-upload">
		<li class="nav-bar">
		<i class="far fa-plus-square"></i>
			<p>상품 추가</p>
		</li>
	</a>
	<a href="/shopping_mall/manage-page/manage-product">
		<li class="nav-bar">
		<i class="fab fa-product-hunt"></i>
			<p class="product-manage-text">상품 관리</p>
		</li>
	</a>

	<a href="/shopping_mall/manage-page/manage-review">
		<li class="nav-bar">
		<i class="fas fa-sticky-note"></i>
			<p class="review-manage-text">리뷰 관리</p>
		</li>
	</a>
</ul>