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
<%-- 
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 사용 가능합니다.')");
			script.println("location.href = 'login.html'");
			script.println("</script>");
		} else {
			if (qna.getTitle() == null || qna.getContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				QnaDao qnaDao = new QnaDao();
				int result = QnaDao.qnaAdd(new Qna(userID, qna.getTitle(), qna.getContent(), qna.getDate()));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='qna-board.jsp'");
					//script.println("history.back()");
					script.println("</script>");
				}
			}
		}
	%>
 --%>
	<%
		//int result = QnaDao.addQna(new Qna(qna.getId(), qna.getTitle(), qna.getContent(), qna.getDate()));
		/*
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
		*/
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='/shopping_mall/qna'");
			//script.println("history.back()");
			script.println("</script>");
		/* } */
	%>

</body>
</html>
