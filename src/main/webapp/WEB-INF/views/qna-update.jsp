<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="kr.co.shopping_mall.dao.QnaDao"%>
<%@page import="kr.co.shopping_mall.model.Qna"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.css">
<title>Q & A</title>
</head>
<body>
<%-- 
	<% //로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} 

		//로그인 안한 경우
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 사용 가능합니다.')");
			script.println("location.href = 'login.html'");
			script.println("</script>");
		}
		<%
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}

		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'qna'");
			script.println("</script>");
		}

		Qna qna = new QnaDao().getQna(bbsID);

		if (!userID.equals(qna.getId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'qna'");
			script.println("</script>");				
		}
	%>
 --%>

	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/shopping_mall">메인페이지</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/shopping_mall/qna">Q & A 게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">MENU<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	<!-- 게시판 --> 
	<div class="container">
		<div class="row">
			<form method="post" action="/shopping_mall/qna/qna-updateAction" onsubmit="return(check());">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">글 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="col-xs-6 col-sm-3">
										<input type="text" class="form-control" placeholder="닉네임" name="id" id="id" style="height: 25px; width: 200px;"/>
								</div>
								<div class="col-xs-6 col-sm-3">
										<input type="password" class="form-control" placeholder="비밀번호" name="password" id="password" style="height: 25px; width: 200px;"/>
								</div>
								<!-- qna_num을 받아오기위한 hidden타입 인풋 -->
								<input type="hidden" name="qna_num" value="${ view.qna_num }"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" class="form-control" placeholder="글 제목"
										name="title" id="title" maxlength="50" >
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="form-control" placeholder="글 내용" name="content" id="content" maxlength="2048" style="height: 350px;" ></textarea>
							</td>
						</tr>
					</tbody>
				</table>	
				<button type="submit" class="btn btn-primary pull-right" >글 수정</button>
			</form>
		</div>
	</div>

	<!-- 빈칸만 입력 막는 js함수 -->
	<script type="text/javascript">
		function check() {
			var titleCheck = document.getElementById('title');
			var contentCheck = document.getElementById('content');
			// null 금지
			if (titleCheck.value == '' || titleCheck.value == null) {
			    alert('제목을 입력해 주세요.');
			    return false;
			}
			
			if (contentCheck.value == '' || contentCheck.value == null) {
			    alert('내용을 입력해 주세요.');
			    return false;
			}
			// 공백만 입력 금지
			var blank_pattern = /^\s+|\s+$/g; // 정규표현식, 앞뒤 공백 제거
			if (titleCheck.value.replace(blank_pattern, '') == "") {
			    alert('제목을 입력해 주세요.');
			    return false;
			}
			
			if (contentCheck.value.replace(blank_pattern, '') == "") {
			    alert('내용을 입력해 주세요.');
			    return false;
			}
		}
	</script>
	
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.js"></script>
</body>
</html>
