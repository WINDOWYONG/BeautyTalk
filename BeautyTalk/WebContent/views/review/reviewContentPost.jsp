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
div, input {
	box-sizing: border-box;
}

.wrap {
	width: 1100px;
	height: 120px;
	margin: auto;
}

img {
	width: 100%;
}

#header {
	width: 100%;
	height: 100%;
}

/* #header, #header1, #header2, #header3{
        border: 1px solid red;
    } */
#header>div {
	height: 100%;
	float: left;
	box-sizing: border-box;
}

#header1 {
	height: 100%;
	width: 20%;
}

#header2 {
	height: 100%;
	width: 60%;
}

#header3 {
	width: 20%;
}

#header1 {
	width: 20%;
	display: flex;
	align-items: center; /* 세로 중앙 정렬 */
	justify-content: center; /* 가로 중앙 정렬 */
}

#header1 img {
	width: 200px;
}

#header_2 {
	position: relative;
}

#header2 {
	display: flex;
	justify-content: center;
	align-items: center;
}

#search_form {
	width: 80%;
	height: 35px;
	display: flex;
	align-items: center;
	border: 2px solid rgb(232, 97, 140);
	border-radius: 25px;
	overflow: hidden;
}

#search_text {
	flex: 1;
}

#search_text input {
	width: 100%;
	height: 100%;
	border: none;
	padding: 0 15px;
	outline: none;
}

#search_btn {
	width: 100px;
	height: 100%;
}

#search_btn input {
	width: 100%;
	height: 100%;
	background-color: rgb(232, 97, 140);
	border: none;
	color: white;
	font-weight: bold;
	cursor: pointer;
}

#header3 {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
}

#header3_top {
	display: flex;
	align-items: center;
	gap: 10px; /* 아이콘 및 텍스트 간격 */
	color: gray;
	font-size: 14px;
}

#header3_top img {
	width: 20px; /* 아이콘 크기 */
	height: 20px;
}

#header3_top a {
	text-decoration: none;
	color: gray;
}

#header3_top span {
	color: lightgray;
}

#header3_bottom {
	display: flex;
	align-items: center;
	gap: 8px; /* 텍스트와 프로필 사진 간격 */
	margin-top: 5px;
}

#header3_bottom .username {
	color: rgb(232, 97, 140);
	font-weight: bold;
}

#header3_bottom img {
	width: 40px; /* 프로필 사진 크기 */
	height: 40px;
	border-radius: 50%; /* 동그랗게 만들기 */
	object-fit: cover;
}

* {
	box-sizing: border-box;
}

#header3_bottom span {
	white-space: nowrap; /* 개별 요소 줄 바꿈 방지 */
}

#bnavigator {
	position: relative;
	width: 100%;
	min-width: 1020px;
	height: 47px;
	background: #fff;
	border-top: 1px solid #ddd;
	border-bottom: 2px solid palevioletred;
	z-index: 10;
}

#navigator {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 1020px;
	margin: 0 auto;
	position: relative;
}

#category {
	display: flex;
	align-items: center;
	gap: 5px;
	width: 120px;
	height: 44px;
	padding-left: 10px;
	line-height: 44px;
	color: black;
	font-size: 15px;
	font-weight: 700;
	text-align: left;
	text-decoration: none;
	transition: background 0.3s ease, color 0.3s ease;
}

#category:hover {
	background: palevioletred;
	color: white;
}

.category-menu {
	position: absolute;
	top: 29px;
	left: 75px;
	width: 120px;
	background: white;
	border: 1px solid palevioletred;
	display: none;
	padding: 10px;
	z-index: 100;
}

.category-menu a {
	display: block;
	padding: 8px 12px;
	text-decoration: none;
	color: black;
	transition: background 0.3s ease, color 0.3s ease;
}

.category-menu a:hover {
	background: palevioletred;
	color: white;
}

#navi {
	margin-left: auto;
	display: flex;
	justify-content: flex-end;
	list-style: none;
	margin: 0;
	padding: 0;
}

#navi>li {
	width: 150px;
	text-align: center;
}

#navi a {
	text-decoration: none;
	color: black;
	font-size: 15px;
	font-weight: 900;
	display: block;
	width: 100%;
	height: 100%;
	line-height: 44px;
}

#navi a:hover {
	color: palevioletred;
}

.category-menu>li {
	list-style: none;
}

.content {
	width: 1020px;
	height: 100%;
	margin: 0 auto;
}

.main_banner {
	width: 100%;
	height: 450px;
	position: relative;
	float: left;
	display: block;
}

.banner_link {
	height: 450px;
}

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

#review_content_thumnail img{
	width: 280px;
	height: 250px;
	box-sizing: border-box;
}

#review_content_thumnail {
	cursor:pointer;
}
.review_CreateDate{
	font-size: 14px;
	font-weight: 700;
}
.review_title1, .review_title2{
	font-size: 14px;
	font-weight: 700;
}

</style>
</head>
<body>

	<%@ include file="../common/headerNav.jsp" %>
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
				<% for(Review rv : list) { %>
					<tr>
						<td><%= rv.getTitle() %></td>
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