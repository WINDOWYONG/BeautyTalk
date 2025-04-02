<%@page import="com.kh.post.model.vo.Post"%>
<%@page import="com.kh.post.model.vo.Image2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.awt.font.ImageGraphicAttribute"%>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Post> list = (ArrayList<Post>)request.getAttribute("list");
	ArrayList<Image2> list1 = (ArrayList<Image2>)request.getAttribute("list1");

	int reviewLimit = pi.getreviewLimit();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int listCount = pi.getListCount();
	int pageLimit = pi.getPageLimit();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
</script>
<style>
.img_content {
	margin: 0 auto;
	box-sizing: border-box;
	position: absolute;
	width: 100%;
	height: 450px
}

.banner_link {
	text-decoration: none;
	height: 450px;
	width: 100%;
	color: #666;
	margin: 0;
	padding: 0;
	border: 0;
	display: block;
}

<!-- postContentPost -->
#reviewForm_CP1 * {
	border: 5px solid black;
	margin: auto;
	margin-top: 10px;
}

#reviewTable_CP1 {
	margin: auto;
	margin-top: 10px;
}

.reviewMP_td1 {
	color: palevioletred;
	font-size: 25px;
	font-weight: 900;
}

.review_rating {
	color: palevioletred;
	font-size: 15px;
	font-weight: 900;
	z-index: 0;
	position: relative;
}

.review_rating::before {
	z-index: -1;
	content: attr(data-content);
	position: absolute;
	left: 0;
	/* 글자 바깥쪽으로 나갔으면 하는 테두리 크기의 두 배 */
	-webkit-text-stroke: 0.2px black;
}

.reviewContent_btn {
	border: none;
	border-radius: 20px;
	background-color: palevioletred;
	padding: 10px;
	cursor: pointer;
	color: white;
	font-size: 14px;
	font-weight: 700;
	width: 120px;
}

.reviewContent_btn2 {
	border: none;
	border-radius: 20px;
	background-color: palevioletred;
	padding: 10px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 700;
	color: lightgray;
	width: 120px;
}

.review_img2 {
	width: 250px;
	height: 250px;
	box-sizing: border-box;
}

.reviewPostNo_img, .reviewTr_img1, .reviewTr_img2, .reviewTr_img3 {
	cursor: pointer;
}

.reviewPostNo_img img{
	width: 280px;
	height: 250px;
}

.review_CreateDate, .review_title1, .review_title2 {
	font-size: 14px;
	font-weight: 700;
}

.reviewTD_img1, .reviewTD_img2, .reviewTD_img3 {
	align-content: end;
	font-size: 14px;
	font-weight: 700;
}

</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<div id="bnavigator">
		<div id="navigator">
			<a href="#" id="category">☰ 카테고리</a>
			<ul class="category-menu">
				<li><a href="skincare.html">스킨케어</a></li>
				<li><a href="makeup.html">메이크업</a></li>
				<li><a href="haircare.html">헤어케어</a></li>
			</ul>
			<ul id="navi">
				<li><a href="index.html">HOME</a></li>
				<li><a href="<%= contextPath %>/review.li?">Reviews</a></li>
				<li><a href="<%= contextPath %>/post.list">Posts</a></li>
				<li><a href="people.html">People</a></li>
				<li><a href="ranking.html">상품 랭킹</a></li>
			</ul>
		</div>
	</div>


	<script>
        document.addEventListener("DOMContentLoaded", function () {
        const categoryBtn = document.querySelector("#category");
        const categoryMenu = document.querySelector(".category-menu");
        
        categoryBtn.addEventListener("click", function (event) {
            event.preventDefault();
            categoryMenu.style.display = categoryMenu.style.display === "block" ? "none" : "block";
        });
        
        document.addEventListener("click", function (event) {
            if (!categoryBtn.contains(event.target) && !categoryMenu.contains(event.target)) {
            categoryMenu.style.display = "none";
            }
        });
        });
    </script>

<!-- 포스트 콘텐츠 -->
	<form action="" id="reviewForm_CP1" method="get">
		<table id="reviewTable_CP1">
			<tr>
				<td height="50"></td>
				<td colspan="11"class="reviewMP_td1">Post 게시글</td>

			</tr>
			<tr>
				<td colspan="12" style="color: lightgray;" height="0">
					————————————————————————————————————————————————————————————</td>
			</tr>

			<tr>
				<td colspan="11"></td>
				<td>
					<% if(loginUser != null) { %>
						<button type="button" class="reviewContent_btn" onclick="location.href='<%= contextPath %>/postList.wr'">
							+포스트 작성
						</button>
					<% }else { %>
						<button type="button" class="reviewContent_btn2" onclick="location.href='<%= contextPath %>/loginForm.me'">
							+ 포스트 작성
						</button>
					<% } %>
				</td>
			</tr>

			<!-- 게시글이 없는 경우 -->
			<% if(list.isEmpty()) { %>
				<tr>
					<td rowspan="6" colspan="6">
						<p>조회된 게시글이 없습니다.</p>
					</td>
				</tr>	
				
			<!-- 게시글이 있는 경우  -->
			<% }else { %>
			<% for(Post po : list) { %>
			<tr class="reviewPostNo_img">
				<% for(Image2 img: po.getImages()) { %>
				<td class="reviewTr_img1" colspan="3" rowspan="5" align="center" style="width: 250px; height: 250px;">
					<div>
						<% if(img.getRefBno() == po.getMemNo()) { %>
						<img src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
						<% }else if(img.getRefBno() == 0){ %>
						<img src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
						<% }else { %>
						<img src="<%= contextPath %>/resources/images/LOGO.jpg">
						<% } %>
					</div>
				</td>
				<td class="reviewTD_img1"><%= po.getPostNo() %></td>
				
				<td class="reviewTr_img2" colspan="3" rowspan="5" align="center" style="width: 250px; height: 250px;">
					<div>
						<% if(img.getRefBno() == po.getMemNo()) { %>
						<img src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
						<% }else if(img.getRefBno() == 0){ %>
						<img src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
						<% }else { %>
						<img src="<%= contextPath %>/resources/images/LOGO.jpg">
						<% } %>
					</div>
				</td>
				<td class="reviewTD_img2"><%= po.getPostNo() %></td>
				
				<td class="reviewTr_img3" colspan="3" rowspan="5" align="center" style="width: 250px; height: 250px;">
					<div>
						<% if(img.getRefBno() == po.getMemNo()) { %>
						<img src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
						<% }else { %>
						<img src="<%= contextPath %>/resources/images/LOGO.jpg">
						<% } %>
					</div>
				</td>
				<td class="reviewTD_img3"><%= po.getPostNo() %></td>
				<% } %>
			</tr>

			
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
 			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td colspan="3"><%= po.getCreateDate() %></td>
				<td></td>
				<td colspan="3"><%= po.getCreateDate() %></td>
				<td></td>
				<td colspan="3"><%= po.getCreateDate() %></td>
				<td></td>
			</tr>
			
			<tr class="review_image_tr">
				<td colspan="2"><%= po.getTitle() %></td>
				<td><%= po.getLikePost() %></td>
				<td></td>

				<td colspan="2"><%= po.getTitle() %></td>
				<td><%= po.getLikePost() %></td>
				<td></td>

				<td colspan="2"><%= po.getTitle() %></td>
				<td><%= po.getLikePost() %></td>
				<td></td>
			</tr>
			
			<tr>
				<td colspan="12" style="color: lightgray;">————————————————————————————————————————————————————————————</td>
			</tr>
			<% } %>
		<% } %>
		</table>

		
		<script>
			$(function(){
				$("#review_content_thumnail").on("click", function(){
					location.href='<%= contextPath %>/detail.po?bno=' + $(this);
				})
			})
			
			$(function(){
			    $(".reviewPostNo_img").on("click", function(){
					location.href = '<%= contextPath %>/detail.po?bno=' + $(this).children().eq(3).text();
		    	})
			})
			
			$(function(){
			    $(".reviewContent_btn2").on("click", function(){
			    	alert("로그인을 해주세요.");
		    	})
			})
		</script>

		<div class="paging-area" align="center">
			<% if(currentPage == 1) { %>
			<!-- 이전버튼 -->
				<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=1'">
            		&lt;
           	 	</button>
            <% }else if(currentPage > 1){ %>
           	 	<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= currentPage - 1 %>'">
            		&lt;
           	 	</button>
            <% } %>
            
			<% for(int i=startPage; i<=endPage; i++) { %>
            	<% if(i == currentPage) { %>
            		<button type="button" disabled>
            			<%= i %>
           			</button>
           		<% }else { %>
         			 <button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= i %>'">
           				<%= i %>
           			</button>
           		<% } %>
            <% } %>
            
            <% if(currentPage == maxPage) { %>
            <!-- 다음버튼 -->
            	<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= maxPage %>'">
            		&gt;
           	 	</button>
			<% }else if(currentPage > 0){ %>
				<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= currentPage + 1 %>'">
            		&gt;
           	 	</button> 
           	<% } %>
		</div>

	</form>

</body>
</html>