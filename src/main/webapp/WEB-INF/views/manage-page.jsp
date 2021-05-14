<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/manage-page.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/manager-upload.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">

</head>
<body>
	<header>관리자 페이지</header>
	<div class="container-inner">
	<div class="nav-inner">
		<ul class="nav nav-stacked">
  			<li role="presentation"><a href="#manage_user" aria-controls="hi" role="tab" data-toggle="tab">회원 관리</a></li>
  			<li role="presentation"><a href="#product_add" aria-controls="product_add" role="tab" data-toggle="tab">상품 추가</a></li>
  			<li role="presentation"><a >상품 관리</a></li>
 			<li role="presentation"><a>로그아웃</a></li>
		</ul>
	</div>
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active">
			<p class="welcome-admin">환영합니다 admin 님</p>
		</div>
		<div role="tabpanel" class="tab-pane" id="product_add">
			<%@ include file="manage-upload.jsp" %>
		</div>
		<div role="tabpanel" class="tab-pane" id="manage_user">
			<%@ include file="manage-user.jsp" %>
		</div>
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
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>

</body>
</html>