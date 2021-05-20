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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bulletin-board.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Q & A</title>
</head>
<body class="animsition">
<section id="team" class="pb-5">
	
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span>
				<span class="icon-bar"></span>
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
					</ul>
				</li>
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
	</nav>
	
	<!-- 게시판 -->
    <div class="container">
        <h5 class="section-title h1">Q & A</h5>
        <c:if test="${ count <= 0 }">
        	<p>게시글이 없습니다.</p>
        </c:if>
        <div class="row">
        	<c:if test="${ count > 0 }">
	        	<c:forEach var="read" items="${ read }">
		            <!-- Team member -->
		           	<div class="col-xs-12 col-sm-6 col-md-4">
		                <div class="image-flip" >
		                    <div class="mainflip flip-0">
		                        <div class="frontside">
		                            <div class="card">
<!-- 		                                <div class="card-body text-center"> -->
<%-- 		                                    <img class=" img-fluid" src="${pageContext.request.contextPath}/resources/imageUpload/${ read.fileName }" alt="card image"> --%>
<%-- 		                                    <h4 class="card-title">${ read.id }</h4> --%>
<%-- 		                                    <p class="card-text">${ read.text }</p> --%>
<!-- 		                                    <a href="https://www.fiverr.com/share/qb8D02" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a> -->
<!-- 		                                </div> -->
		                            </div>
		                        </div>
<!-- 		                        <div class="backside"> -->
<!-- 		                            <div class="card"> -->
<!-- 		                                <div class="card-body text-center mt-4"> -->
<%-- 		                                    <h4 class="card-title">${ read.id }</h4> --%>
<%-- 		                                    <p class="card-text">${ read.text }</p> --%>
<!-- 		                                </div> -->
<!-- 		                            </div> -->
<!-- 		                        </div> -->
		                    </div>
		                </div>
		            </div>
		            <!-- ./Team member -->
          		</c:forEach>
            </c:if>
        </div>
        <!-- Paging -->
           <div style='position: absolute; left:50%'>
           	<c:if test="${paging.startPage != 1}">
           		<a href="/shopping_mall/qna?nowPage=${paging.startPage - 1}">&lt;</a>
           	</c:if>
           	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
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
        <div>
		    <form action="/shopping_mall/qna" method="post" enctype="multipart/form-data">
				아이디:<br>
				<input type="text" name="id" maxlength="30" placeholder="아이디" style="text-indunt:5px" required/> <br>
				내용:<br>
				<textarea name="text" placeholder="후기" style="resize:none;text-indunt:5px;width:11.4rem;height:10rem;" required></textarea><br><br>
				<input type="file" name="fileName" accept="image/*" onchange="chk_file_type(this)" required/> <br>
				<input type="submit" value="업로드" onclick="LoadingWithMask()" style="width:3.5rem;height:2rem;background:#000;color:#fff;border-radius:5px;font-size:14px"/>
			</form>
        </div>
		<script type="text/javascript">
			function LoadingWithMask() {
			    var maskHeight = $(document).height();
			    var maskWidth  = window.document.body.clientWidth;
			     
			    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000; display:none; left:0; top:0;'></div>";
			    var loadingImg ='';
			      
			    loadingImg +="<div id='loadingImg'>";
			    loadingImg +=" <img src='resources/images/loading.gif' style='position: absolute; display: block; margin: 0px auto; top: 50%; left: 50%'/>";
			    loadingImg +="</div>"; 
			  
			    $('body')
			        .append(mask)
			        .append(loadingImg)
			        
			    $('#mask').css({
			            'width' : maskWidth
			            ,'height': maskHeight
			            ,'opacity' :'0.3'
			    });
			  
			    $('#mask').show();  
			  
			    $('#loadingImg').show();
			    window.scrollTo(0,0);
			}
		</script>
    </div>
</section>
</body>
</html>