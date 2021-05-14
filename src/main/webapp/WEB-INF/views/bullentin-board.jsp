<%@page import="java.util.List"%>
<%@page import="review.Review"%>
<%@page import="review.ReviewDAO"%>
<%@page import="review.ReviewRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageSize = 15;
	
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	Review review = new Review();
	ReviewDAO dao = new ReviewDAO();
	ReviewRepository rr = new ReviewRepository(dao);
	List<Review> list = rr.reviewRead(startRow, endRow);
	int count = rr.reviewCount();
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="css/bulletin-board.css">
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
       		<%
       			if (count > 0) {
       				int number = count - (currentPage - 1) * pageSize;
	           		for (int i = 0; i < list.size(); i++) {
	           			review = list.get(i);
            %>
			            <!-- Team member -->
			           	<div class="col-xs-12 col-sm-6 col-md-4">
			                <div class="image-flip" >
			                    <div class="mainflip flip-0">
			                        <div class="frontside">
			                            <div class="card">
			                                <div class="card-body text-center">
			                                    <p><img class=" img-fluid" src="${pageContext.request.contextPath}/imageUpload/<%= review.getFileName() %>" alt="card image"></p>
			                                    <h4 class="card-title"><%= review.getId() %></h4>
			                                    <p class="card-text"><%= review.getText() %></p>
			                                    <a href="https://www.fiverr.com/share/qb8D02" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="backside">
			                            <div class="card">
			                                <div class="card-body text-center mt-4">
			                                    <h4 class="card-title"><%= review.getId() %></h4>
			                                    <p class="card-text"><%= review.getText() %></p>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <!-- ./Team member -->
            <%
           			}
	           	} else {
	        %>
	        		<p align="center"> 게시글이 없습니다.</p>
	       	<%
	           	}
            %>
        </div>
	    <form action="/shopping_mall/reviewUpload" method="post" enctype="multipart/form-data">
			아이디:<br>
			<input type="text" name="id" maxlength="30" placeholder="아이디" style="text-indunt:5px" required/> <br>
			내용:<br>
			<textarea name="text" placeholder="후기" style="resize:none;text-indunt:5px;width:11.4rem;height:10rem;" required></textarea><br><br>
			<input type="file" name="file" accept="image/*" onchange="chk_file_type(this)" required/> <br>
			<input type="submit" value="업로드" onclick="LoadingWithMask()" style="width:3.5rem;height:2rem;background:#000;color:#fff;border-radius:5px;font-size:14px"/>
		</form>
		<script type="text/javascript">
				function LoadingWithMask() {
				    //화면의 높이와 너비를 구합니다.
				    var maskHeight = $(document).height();
				    var maskWidth  = window.document.body.clientWidth;
				     
				    //화면에 출력할 마스크를 설정해줍니다.
				    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000; display:none; left:0; top:0;'></div>";
				    var loadingImg ='';
				      
				    loadingImg +="<div id='loadingImg'>";
				    loadingImg +=" <img src='images/loading.gif' style='position: absolute; display: block; margin: 0px auto;top:50%;left:50%;transfrom:translate(-50%, -50%)'/>";
				    loadingImg +="</div>"; 
				  
				    //화면에 레이어 추가
				    $('body')
				        .append(mask)
				        .append(loadingImg)
				        
				    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
				    $('#mask').css({
				            'width' : maskWidth
				            ,'height': maskHeight
				            ,'opacity' :'0.3'
				    });
				  
				    //마스크 표시
				    $('#mask').show();  
				  
				    //로딩중 이미지 표시
				    $('#loadingImg').show();
				    window.scrollTo(0,0);
				}
		</script>
		
		<table width="1130">
			<tr>
				<td colspan="6" align="center" >
					<%
						if (count > 0) {
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
							int pageBlock = 10;
							int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;
							
							if (endPage > pageBlock) {
					%>
								<a href="bullentin-board.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
					<%
							}
							
							for (int i = startPage; i <= endPage; i++) {
								if (i == currentPage) {
					%>				
									[<%=i %>]
					<%
								} else {
					%>
									<a href="bullentin-board.jsp?pageNum=<%=i %>">[<%=i %>]</a>
					<%				
								}
							}
						}
					%>
				</td>
			</tr>
		</table>
    </div>
</section>
</body>
</html>