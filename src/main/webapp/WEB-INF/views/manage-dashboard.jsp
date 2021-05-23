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
<script src="https://kit.fontawesome.com/1ca40a0930.js" crossorigin="anonymous"></script>
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
<body class="zc-body">
	<jsp:include page="nav-bar.jsp" />
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
				text : [],
				callout : true,
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
				values : rate
			},
			series : [ {
				values : governmentRequests,
				text : '지표',
				zIndex : 6,
				alphaArea : 6,
				lineColor : '#ffffff',
				backgroundColor : '#33C4FF',
				marker : {
					size : '0px'
				}
			} ]
		};
		var cnt = 0;
		var max = 0;
		<c:forEach var="dateList" items="${dateList}">
	        cnt = "${dateList.cnt}"
	        <c:if test="cnt >= temp">
	        	max = cnt;
	        </c:if>
		</c:forEach>
		var rate = '0:' + max + ':20';
		
		const chart1 = chartConfig['scaleX'];
	    const label = chart1['labels'];
	    const chart2 = chartConfig['scaleY'];
	    const value = chart2['values'];
	    
	    console.log(value);
		
	    <c:forEach var="dateList" items="${dateList}">
	        var date = "${dateList.date}";
	        var cnt = "${dateList.cnt}"
	        label.push(date  + "\n" + cnt);
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