<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
<title>대시 보드</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manage-page.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager-upload.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<style>
	.zc-body {
		background: #fff;
	}
	
	.chart--container {
		height: 100%;
		width: 100%;
		min-height: 530px;
	}
	
	.zc-ref {
		display: none;
	}
</style>
</head>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/shopping_mall/manage-page/">관리자 페이지</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      	<li><a href="/shopping_mall/manage-page/manage-dashboard">대시 보드</a></li>
        <li><a href="/shopping_mall/manage-page/manage-user">회원 관리</a></li>
        <li><a href="/shopping_mall/manage-page/manage-review">리뷰 관리</a></li>
        <li><a href="/shopping_mall/manage-page/manage-product">상품 관리</a></li>
        <li><a href="/shopping_mall/manage-page/manage-upload">상품 추가</a></li>
        <li><a href="#">로그아웃</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/shopping_mall">Home</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<body class="zc-body">
	<div id="myChart" class="chart--container">
		<a href="https://www.zingchart.com/" rel="noopener" class="zc-ref">방문자 요약</a>
	</div>
	<script type="text/javascript">
		let governmentRequests = [];

		// Chart Configuration
		let chartConfig = {
			type : 'area',
			globals : {
				fontFamily : 'Poppins',
				fontColor : '#333'
			},
			title : {
				text : '방문자 수',
				align : 'center',
				padding : '5px'
			},
			subtitle : {
				text : '일별 평균 방문 수',
				align : 'center',
				fontColor : '#505050',
				padding : '10px'
			},
			legend : {
				align : 'center',
				verticalAlign : 'bottom',
				layout : '3x2',
				border : 'none',
				item : {
					fontSize : '18px'
				},
				marker : {
					type : 'circle'
				}
			},
			tooltip : {
				callout : true,
				text : '숫자',
				backgroundColor : '#F7F9FA',
				fontColor : '#505050',
				fontSize : '18px',
				padding : '20px 35px',
				borderRadius : '4px'
			},
			plot : {
				aspect : 'spline'
			},
			scaleX : {
				labels : []
			},
			scaleY : {
				values : '0:100:20'
			},
			series : [ {
				values : governmentRequests,
				text : '지표',
				zIndex : 6,
				alphaArea : 1,
				lineColor : '#ffffff',
				backgroundColor : '#33C4FF',
				marker : {
					size : '0px'
				}
			} ]
		};
		
		const chart = chartConfig['scaleX'];
	    const label = chart['labels'];
	    <c:forEach var="dateList" items="${dateList}">
	        var date = "${dateList.date}";
	        label.push(date);
   		</c:forEach>
   		
   		<c:forEach var="dateList" items="${dateList}">
			var visitorsNum = Number("${dateList.cnt}");
			governmentRequests.push(visitorsNum);
		</c:forEach>

		// Render Method
		zingchart.render({
			id : 'myChart',
			data : chartConfig,
			height : '80%',
			width : '50%',
		});
	</script>
</body>
</html>