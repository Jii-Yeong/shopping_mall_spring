<%@page import="kr.co.shopping_mall.service.QnaService"%>
<%@page import="kr.co.shopping_mall.dao.QnaDao"%>
<%@page import="kr.co.shopping_mall.model.Qna"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bulletin-board.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Q & A</title>
</head>
<body class="animsition">
	<section id="team" class="pb-5">

		<!-- 네비게이션  -->
		<nav class="navbar fixed-top navbar-light bg-light">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="bs-example-navbar-collapse-1">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/shopping_mall">메인페이지</a>
				</div>
				<div class="collapse navbar-collapse"
					id="#bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="qna">Q & A 게시판</a></li>
					</ul>

					<%-- <% //로긴안된경우
				if (userID == null) {
				%> --%>

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">로그인</a></li>
								<li><a href="#">회원가입</a></li>
							</ul></li>
					</ul>
					<%-- <%
				} else {
				%>
	
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
					</li>
				</ul>
	
				<%
					}
				%> --%>
				</div>
			</div>
		</nav>

		<!-- 게시판 -->
		<div class="container">
			<c:if test="${ count <= 0 }">
				<p>게시글이 없습니다.</p>
			</c:if>
			<div class="row">
				<c:if test="${ count > 0 }">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">번호</th>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;">작성일</th>
							</tr>
						</thead>
					</table>
					<c:forEach var="read" items="${ read }">
						<!-- 		           	<div class="col-xs-12 col-sm-6 col-md-4"> -->
						<!--                         <div class="frontside"> -->
						<!--                             <div class="card"> -->
						<!-- 		                    <div class="card-body text-center"> -->
						<%-- 		                        <img class=" img-fluid" src="${pageContext.request.contextPath}/resources/imageUpload/${ read.fileName }" alt="card image"> --%>
						<%-- 		                        <h4 class="card-title">${ read.id }</h4> --%>
						<%-- 		                        <p class="card-text">${ read.text }</p> --%>
						<!-- 		                        <a href="https://www.fiverr.com/share/qb8D02" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a> -->
						<!-- 		                    </div> -->
						<!--                             </div> -->
						<!-- 		                <div class="backside"> -->
						<!-- 		                    <div class="card"> -->
						<!-- 		                        <div class="card-body text-center mt-4"> -->
						<%-- 		                            <h4 class="card-title">${ read.id }</h4> --%>
						<%-- 		                            <p class="card-text">${ read.text }</p> --%>
						<!-- 		                        </div> -->
						<!-- 		                    </div> -->
						<!-- 		                </div> -->
						<!--                         </div> -->
						<!-- 		            </div> -->
					</c:forEach>
				</c:if>
			</div>
			<a href="/shopping_mall/qna/qna-write"
				class="btn btn-primary pull-right">글쓰기</a> <br> <br>
			<!-- 페이징처리 -->
			<div style='position: absolute; left: 50%'>
				<c:if test="${paging.startPage != 1}">
					<a href="/shopping_mall/qna?nowPage=${paging.startPage - 1}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<b>${p}</b>
						</c:when>
						<c:when test="${p != paging.nowPage}">
							<a href="/shopping_mall/qna?nowPage=${p}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/shopping_mall/qna?nowPage=${paging.endPage + 1}">&gt;</a>
				</c:if>
			</div>
			<!-- ./Paging -->
		</div>
	</section>
</body>
</html>