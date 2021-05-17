<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
	</div>
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active">
			<p class="welcome-admin">환영합니다 admin 님</p>
		</div>
	</div>
<script> 
	function setThumbnail(event) { 
		for (var image of event.target.files) { 
			var reader = new FileReader(); reader.onload = function(event) { 
				var img = document.createElement("img"); 
				img.setAttribute("src", event.target.result)
				img.setAttribute("class", "img-responsive img-thumbnail");
				document.querySelector("div#image_container").appendChild(img); 
				}; 
				reader.readAsDataURL(image); 
		} 
	} 
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.js"></script>

</body>
</html>