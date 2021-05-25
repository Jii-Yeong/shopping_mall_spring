<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.co.shopping_mall.dao.QnaDao"%>
<%@page import="kr.co.shopping_mall.model.Qna"%>
<%@page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="qna" class="kr.co.shopping_mall.model.Qna" scope="page" />
<!-- // Bbs bbs = new Bbs(); -->
<jsp:setProperty name="qna" property="title" />
<!-- bbs.setBbsTitle(requrst) -->
<jsp:setProperty name="qna" property="content" />

<%
	System.out.println(qna);
	Qna qna2 = new Qna();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q & A</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='/shopping_mall/qna'");
		script.println("</script>");
	%>

</body>
</html>
