<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.co.shopping_mall.dao.QnaDao"%>
<%@page import="kr.co.shopping_mall.model.Qna"%>
<%@page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
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
		//script.println("history.back()");
		script.println("</script>");
	%>
</body>
</html>
