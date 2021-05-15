<%@page import="kr.co.shopping_mall.review.ReviewService"%>
<%@page import="kr.co.shopping_mall.dao.ReviewDAO"%>
<%@page import="kr.co.shopping_mall.review.Review"%>
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
<title>Review</title>
</head>
<body class="animsition">
<section id="team" class="pb-5">
    <div class="container">
        <h5 class="section-title h1">Review</h5>
        <a href="/shopping_mall">HOME</a>
        <div class="row">
        	<c:if test="${ count > 0 }">
	        	<c:forEach var="read" items="${ read }">
		            <!-- Team member -->
		           	<div class="col-xs-12 col-sm-6 col-md-4">
		                <div class="image-flip" >
		                    <div class="mainflip flip-0">
		                        <div class="frontside">
		                            <div class="card">
		                                <div class="card-body text-center">
		                                    <img class=" img-fluid" src="${pageContext.request.contextPath}/resources/imageUpload/${ read.fileName }" alt="card image">
		                                    <h4 class="card-title">${ read.id }</h4>
		                                    <p class="card-text">${ read.text }</p>
		                                    <a href="https://www.fiverr.com/share/qb8D02" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="backside">
		                            <div class="card">
		                                <div class="card-body text-center mt-4">
		                                    <h4 class="card-title">${ read.id }</h4>
		                                    <p class="card-text">${ read.text }</p>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <!-- ./Team member -->
          		</c:forEach>
            </c:if>
            <c:if test="${ count <= 0 }">
            	<p>게시글이 없습니다.</p>
            </c:if>
        </div>
	    <form action="/shopping_mall/review" method="post" enctype="multipart/form-data">
			아이디:<br>
			<input type="text" name="id" maxlength="30" placeholder="아이디" style="text-indunt:5px" required/> <br>
			내용:<br>
			<textarea name="text" placeholder="후기" style="resize:none;text-indunt:5px;width:11.4rem;height:10rem;" required></textarea><br><br>
			<input type="file" name="fileName" accept="image/*" onchange="chk_file_type(this)" required/> <br>
			<input type="submit" value="업로드" onclick="LoadingWithMask()" style="width:3.5rem;height:2rem;background:#000;color:#fff;border-radius:5px;font-size:14px"/>
		</form>
		<script type="text/javascript">
				function LoadingWithMask() {
				    var maskHeight = $(document).height();
				    var maskWidth  = window.document.body.clientWidth;
				     
				    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000; display:none; left:0; top:0;'></div>";
				    var loadingImg ='';
				      
				    loadingImg +="<div id='loadingImg'>";
				    loadingImg +=" <img src='images/loading.gif' style='position: absolute; display: block; margin: 0px auto;top:50%;left:50%;transfrom:translate(-50%, -50%)'/>";
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