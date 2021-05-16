<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세 페이지</title>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<form action="update.do" method=post>
	<table border=1 width=600>
		<tr>
            <td>회 원 번 호</td>
            <td><input name="user_num" value="${user_info.user_num}" readonly="readonly" readonly="readonly"></td>
        </tr>
        <tr>
            <td>아 이 디</td>
            <td><input name="id" value="${user_info.id}" readonly="readonly" ></td>
        </tr>
        <tr>
            <td>이 름</td>
            <td><input name="name" value="${user_info.name}" readonly="readonly"></td>
        </tr>
        <tr>
            <td>생 년 월 일</td>
            <td><input name="birth" value="${user_info.birth}" readonly="readonly"></td>
        </tr>
        <tr>
            <td>전 화 번 호</td>
            <td><input name="phone_num" value="${user_info.phone_num}" readonly="readonly"></td>
        </tr>
        <tr>
            <td>주 소</td>
            <td><input name="address" value="${user_info.address}" readonly="readonly"></td>
        </tr>
        <tr>
            <td>가 입 날 짜</td>
            <td>
                ${user_info.join_date}
            </td>
        </tr>
        <tr>
            <td>회 원 등 급</td>
            <td><input name="grade" value="${user_info.grade}"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="완료" id="btnUpdate">
                <input type="button" onclick="location.href='list.do'" value="취소" id="btnDelete">
            </td>
        </tr>
	   	</table>
	</form>
</body>
</html>