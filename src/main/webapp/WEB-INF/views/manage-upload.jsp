<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/manage-page.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/manager-upload.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">

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
					<li><a href="/shopping_mall/manage-page/manage-user">회원 관리</a></li>
					<li><a href="/shopping_mall/manage-page/manage-review">리뷰 관리</a></li>
					<li><a href="/shopping_mall/manage-page/manage-product">상품 관리</a></li>
					<li class="active"><a href="/shopping_mall/manage-page/manage-upload">상품 추가</a></li>
					<li><a href="#">로그아웃</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Home</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
		<div class="form">
			<div class="container">
		<form action="/shopping_mall/manage-page/manage-upload"
			method="post" enctype="multipart/form-data">
			<h1>상품 추가</h1>
			<div class="form-group">
				<label>제목</label> <input type="text" class="form-control"
					placeholder="제목" name="product-title" required />
			</div>
			<div class="form-group">
				<label for="InputFile">파일 업로드</label> <input type="file"
					id="InputFile" name="product-file1" accept="image/*"
					onchange="setThumbnail(event);" required /> <input type="file"
					id="InputFile" name="product-file2" accept="image/*"
					onchange="setThumbnail(event);" /> <input type="file"
					id="InputFile" name="product-file3" accept="image/*"
					onchange="setThumbnail(event);" />
				<div id="image_container"></div>

				<p class="help-block">제품 사진을 올리세요.</p>
			</div>
			<div class="form-group">
				<div class="input-group">
					<label class="sr-only" for="InputAmount">가격</label>
					<div class="input-group-addon">&#8361;</div>
					<input type="text" class="form-control" id="InputAmount"
						placeholder="가격" name="product-price" required>
				</div>
			</div>
			<div class="form-group">
				<label>상세 내용</label>
				<textarea class="form-control" rows="5" placeholder="상세 내용"
					name="product-content" required></textarea>
			</div>
			<div class="form-group">
				<label>색상과 컬러</label>
				<p onclick="addTag(${count})">추가하기</p>
				<table id="color_table">
					<tr>
						<td>컬러</td>
						<td>S</td>
						<td>M</td>
						<td>L</td>
						<td>등록</td>
					</tr>
					<tr>

					</tr>
				</table>
			</div>
			<button type="submit" class="btn btn-default">상품 등록</button>
			</form>
		</div>
		</div>

	<script type="text/javascript">
	function addTag(${count}) {
		console.log(${count});
		var table = document.getElementById("color_table");
		var tr = document.createElement("tr");
		var td = [];
		var input = [];
		for (var i = 0; i < 5; i++) {
			td.push(document.createElement("td"));
			input.push(document.createElement("input"));
			tr.append(td[i]);
			input[i].setAttribute("type", "text");
			input[i].setAttribute("required", "true");
		}
		input[0].setAttribute("name", "color_input");
		input[1].setAttribute("name", "color_s");
		input[2].setAttribute("name", "color_m");
		input[3].setAttribute("name", "color_l");
		
		
		var button = document.createElement("p");
		button.innerHTML = "ok";
		button.setAttribute("onclick", "setColor(color)");
		
		td[0].append(input[0]);
		td[1].append(input[1]);
		td[2].append(input[2]);
		td[3].append(input[3]);
		td[4].append(button);
		console.log(td);
		console.log(tr);
		table.append(tr);
	}
	
	function setColor(color) {
		console.log(color);
	}
	
</script>

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
</body>
</html>


