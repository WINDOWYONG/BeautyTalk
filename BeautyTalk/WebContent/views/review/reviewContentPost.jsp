<%@page import="com.kh.review.model.vo.Image"%>
<%@page import="com.kh.review.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.awt.font.ImageGraphicAttribute"%>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	Image img = (Image)request.getAttribute("img");
	
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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

<!-- reviewContentPost -->
#reviewForm_CP1 {
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

.reviewContent_btn{
	border: none;
	border-radius: 20px;
	background-color: palevioletred;
	padding: 10px;
	cursor : pointer;
	color: white;
	font-size: 14px;
	font-weight: 700;
	width: 120px;
}

.reviewContent_btn2{
	border: none;
	border-radius: 20px;
	background-color: palevioletred;
	padding: 10px;
	cursor : pointer;
	font-size: 14px;
	font-weight: 700;
	color:lightgray;
	width: 120px;
}

#review_content_thumnail{
	width: 280px;
	height: 250px;
	box-sizing: border-box;
	cursor:pointer;
}

#review_content_thumnail img{
	width: 280px;
	height: 250px;
	box-sizing: border-box;
	cursor:pointer;
}

.review_title1, .review_title2, .review_CreateDate{
	font-size: 14px;
	font-weight: 700;
	cursor: pointer;
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

<!-- 리뷰 콘텐츠 -->
	<form action="" id="reviewForm_CP1" method="get">
		<table id="reviewTable_CP1">
			<tr>
				<td height="50"></td>
				<td colspan="5" class="reviewMP_td1">Review 리뷰</td>
			</tr>
			<tr>
				<td colspan="6" style="color: lightgray;" height="0">
					————————————————————————————————————————————————————————————</td>
			</tr>

			<tr>
				<td colspan="5"></td>
				<td>
					<% if(loginUser != null) { %>
						<button type="button" class="reviewContent_btn" onclick="location.href='<%= contextPath %>/review.wr'">
							+ 리뷰 작성
						</button>
					<% }else { %>
						<button type="button" class="reviewContent_btn2" onclick="location.href='<%= contextPath %>/loginForm.me'">
							+ 리뷰 작성
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
			
			<!-- 게시글이 있는 경우 -->
			<% }else { %>
			<% for(Review rv1 : list) { %>	
			<tr class="reviewTr_img1">
				<td id="review_content_thumnail" rowspan="6" align="center" style="width: 250px; height: 250px;">
					<input type="hidden" name="MEM_NO" value="<%= rv1.getReviewNo() %>">
					<% for(Image image : rv1.getImages()) { %>
					<div>
						<% if(rv1.getImages().equals(list) == true) { %>
							<img src="<%= contextPath %>/resources/images/kakao.png">
						<% }else { %>
							<img src="<%= contextPath %>/<%= image.getFilePath() + image.getChangeName() %>">
						<% } %>
					</div>
					<% } %>		
				</td>
				<td colspan="3" class="review_CreateDate"><%= rv1.getCreateDate() %></td>

				
				<td></td>
				<td></td>


			</tr>
				
			<tr class="reviewTr_img2">
				<td class="review_title1"><%= rv1.getReviewNo() %></td>
				<td class="review_title2"><%= rv1.getTitle() %></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>

				<td colspan="4" style="color: gray;">
					———————————————————————————————————</td>


				
				<td></td>
			</tr>
			<tr>

				<td colspan="4"><textarea cols="80" rows="10" style="resize: none; border-color: white;" disabled><%= rv1.getContent() %></textarea>
				</td>



				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td style="width: 50px;"></td>
				<td class="review_rating" style="width: 100px;"
					data-content="가격 : <%= rv1.getPrRating() %>">가격 : <%= rv1.getPrRating() %>
				</td>
				<td class="review_rating" style="width: 100px;"
					data-content="성분 : <%= rv1.getpRating() %>">성분 : <%= rv1.getpRating() %>
				</td>
				<td class="review_rating" style="width: 100px;"
					data-content="재구매 : <%= rv1.getrRating() %>">재구매 : <%= rv1.getrRating() %>
				</td>
				<td class="review_rating" style="width: 60px;"
					data-content="👍 : <%= rv1.getLikeReview() %>">👍 : <%= rv1.getLikeReview() %>
				</td>
			</tr>
			<tr>
				<td colspan="6" style="color: lightgray;">
					————————————————————————————————————————————————————————————</td>





			</tr>
		<% } %>
		<% } %>
		</table>
		
		<script>
			$(function(){
			    $(".reviewContent_btn2").on("click", function(){
			    	alert("로그인을 해주세요.");
		    	})
			})
		</script>
		
		<script>
			$(function(){
			    $(".reviewTr_img1").on("click", function(){
					location.href = '<%= contextPath %>/detail.re?bno=' + $(this).children().children().eq(0).val();
		    	})
			})
			$(function(){
			    $(".reviewTr_img2").on("click", function(){
					location.href = '<%= contextPath %>/detail.re?bno=' + $(this).children().eq(0).text();
		    	})
			})
		</script>

		<div class="paging-area" align="center">
			<% if(currentPage == 1) { %>
			<!-- 이전버튼 -->
				<button type="button" onclick="location.href='<%= contextPath %>/review.li?cpage=1'">
            		&lt;
           	 	</button>
            <% }else if(currentPage > 1){ %>
           	 	<button type="button" onclick="location.href='<%= contextPath %>/review.li?cpage=<%= currentPage - 1 %>'">
            		&lt;
           	 	</button>
            <% } %>
            
			<% for(int i=startPage; i<=endPage; i++) { %>
            	<% if(i == currentPage) { %>
            		<button type="button" disabled>
            			<%= i %>
           			</button>
           		<% }else { %>
         			 <button type="button" onclick="location.href='<%= contextPath %>/review.li?cpage=<%= i %>'">
           				<%= i %>
           			</button>
           		<% } %>
            <% } %>
            
            <% if(currentPage == maxPage) { %>
            <!-- 다음버튼 -->
            	<button type="button" onclick="location.href='<%= contextPath %>/review.li?cpage=<%= maxPage %>'">
            		&gt;
           	 	</button>
			<% }else if(currentPage > 0){ %>
				<button type="button" onclick="location.href='<%= contextPath %>/review.li?cpage=<%= currentPage + 1 %>'">
            		&gt;
           	 	</button> 
           	<% } %>
		</div>

	</form>

</body>
</html>