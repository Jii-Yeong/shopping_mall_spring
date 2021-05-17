<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상 품 상 세</title>
</head>
<body>
	<h1>상 품 수 정</h1>
	<form action="manage-product-update" method=post>
	<table border=1 width=1000>
		<tr>
            <td>상 품 번 호</td>
            <td><input name="product_number" value="${product_info.product_id}" readonly="readonly"></td>
        </tr>
        <tr>
            <td>상 품 명</td>
            <td><input name="name" value="${product_info.name}"></td>
        </tr>
        <tr>
            <td>사 진 1</td>
            <td><img id="product_photo1" src="http://localhost:8080/shopping_mall/resources/imageUpload/${product_list.photo_1}" alt="IMG1-PRODUCT" width="100" height="120" ></td>
            <td><input type="file" id="InputFile" name="product-file1" accept="image/*" onchange="setThumbnail(event);"/>
        </tr>
        <tr>
            <td>사 진 2</td>
            <td><img id="product_photo1" src="http://localhost:8080/shopping_mall/resources/imageUpload/${product_list.photo_2}" alt="IMG2-PRODUCT" width="100" height="120" ></td>
            <td><input type="file" id="InputFile" name="product-file2" accept="image/*" onchange="setThumbnail(event);"/>
        </tr>
        <tr>
            <td>사 진 3</td>
            <td><img id="product_photo1" src="http://localhost:8080/shopping_mall/resources/imageUpload/${product_list.photo_3}" alt="IMG3-PRODUCT" width="100" height="120" ></td>
            <td><input type="file" id="InputFile" name="product-file3" accept="image/*" onchange="setThumbnail(event);"/>
        </tr>
        <tr>
            <td>가 격</td>
            <td><input name="price" value="${product_info.price}"></td>
        </tr>
        <tr>
            <td>상 세 설 명</td>
            <td><input name="description" value="${product_info.description}"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="완료" id="btnUpdate">
                <input type="button" onclick="location.href='manage-product'" value="취소" id="btnDelete">
            </td>
        </tr>
	   	</table>
	</form>
</body>
</html> 