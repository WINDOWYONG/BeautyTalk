<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Member> peopleList = (ArrayList<Member>)request.getAttribute("peopleList");
	// 회원 번호, 회원 이름, 팔로워 수 (프로필사진 추가해야할듯..)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <style>
    body {
      font-family: sans-serif;
      background: #fff;
      margin: 0;
      padding: 30px;
    }

    .container {
      width: 900px; /* 중앙 배치용 */
      margin: 0 auto;  /* 이걸로 가운데 정렬 */
    }

    .rank-item {
      margin-bottom: 50px;
      border-bottom: 1px solid #ddd;
      padding-bottom: 20px;
    }

    .user-row {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 15px;
    }

    .user-left {
      display: flex;
      align-items: center;
    }

    .rank-num {
      font-size: 20px;
      width: 30px;
      text-align: center;
    }

    .profile-img {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      object-fit: cover;
      background-color: #ddd;
      margin-right: 15px;
    }

    .user-info {
      display: flex;
      flex-direction: column;
    }

    .user-name {
      font-weight: bold;
      font-size: 18px;
    }

    .user-follow {
      color: gray;
      font-size: 14px;
      margin-top: 3px;
    }

    .follow-btn {
      padding: 8px 16px;
      background: #eee;
      border-radius: 6px;
      cursor: pointer;
      font-size: 14px;
      white-space: nowrap;
    }

    .photos {
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
      margin-left: 45px; /* 숫자 부분 만큼 들여쓰기 */
    }

    .photo {
      width: 120px;
      height: 120px;
      object-fit: cover;
      border-radius: 6px;
      background-color: #ddd;
    }
  </style>
<title>Insert title here</title>
</head>
<body>

<%@ include file="../common/headerNav.jsp"%>
<br><br>

  <div class="container">
  <input type="hidden" id="loginUserNo" value="<%= (loginUser != null) ? loginUser.getUserNo() : 0 %>">
  <% int rank = 1; %>
  <% for(Member m : peopleList) { %>
    <div class="rank-item">
      <div class="user-row">
        <div class="user-left">
          <div class="rank-num"><%= rank %></div>
          <img class="profile-img" src="profile1.jpg" alt="프로필">
          <div class="user-info">
            <div class="user-name"><%= m.getUserName() %></div>
            <div class="user-follow">팔로워 <%= m.getFollower() %></div>
          </div>
        </div>
        
        <input type="hidden" class="targetUserNo" value="<%= m.getUserNo() %>">
        <div class="follow-btn">+ 팔로우</div>
      </div>

      <div class="photos">
        <img class="photo" src="img1.jpg">
        <img class="photo" src="img2.jpg">
        <img class="photo" src="img3.jpg">
        <img class="photo" src="img4.jpg">
        <img class="photo" src="img5.jpg">
        <img class="photo" src="img6.jpg">
      </div>
    </div>
    <% rank++; %>
  <% } %>
  </div>
  
  	<script>
		document.addEventListener('DOMContentLoaded', function() {
		  const loginUserNo = document.getElementById('loginUserNo').value;
		  const followBtns = document.querySelectorAll('.follow-btn');
		
		  followBtns.forEach(btn => {
		    btn.addEventListener('click', function() {
		      const targetUserNo = this.previousElementSibling.value;  // 바로 위에 hidden에서 값 가져옴
		
		      // 비회원 체크
		      if(loginUserNo == 0) {
		        alert('로그인이 필요합니다.');
		        location.href = '<%= request.getContextPath() %>/loginForm.me';
		        return;
		      }
		
		      // confirm 후 AJAX 전송
		      if(confirm("팔로우 하시겠습니까?")) {
		        fetch('<%= request.getContextPath() %>/follow.pe', {
		          method: 'POST',
		          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
		          body: 'follower=' + loginUserNo + '&following=' + targetUserNo
		        })
		        .then(response => {
		          if(response.ok) {
		            alert('팔로우 성공!');
		            this.textContent = '✔ 팔로잉';
		          } else {
		            alert('팔로우 실패');
		          }
		        });
		      }
		    });
		  });
		});
	</script>
  
	

</body>
</html>