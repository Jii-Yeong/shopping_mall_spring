<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String pageNumberStr = request.getParameter("user");
	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	

 %>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css">
</head>
<body>
<h2>회원 관리</h2>
<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>회원 ID</th>
				<th>이름</th>
				<th>나이</th>
				<th>가입일</th>
				<th>최근 방문일</th>
	      </tr>
      </thead>
<!--  TODO 변경해야함!! -->
	<c:forEach var="user" items="${temp}">
      <tbody>
   		<tr>
   			<td>${user.id}</td>
   			<td>${user.name}</td>
   			<td>${user.age}</td>
   			<td>${user.registerDate}</td>
   			<td>${user.lastVisitDate}</td>
    	</tr>
      </tbody>
      </c:forEach>
	</table>
	
	<c:forEach var ="pageNum" begin="1" end="${ pageTotalCount }">
	<a href="manage-user?page=${ pageNum }">[${ pageNum }]</a>
	</c:forEach>
	
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
</body>
</html>