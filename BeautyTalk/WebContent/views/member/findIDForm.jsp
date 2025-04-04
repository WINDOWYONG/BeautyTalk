<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
  @font-face {
    font-family: 'Binggrae-Two';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	font-family: 'Binggrae-Two';
    color: rgb(70, 69, 69);
    box-sizing: border-box;
}

#search_text input {
  height: 100%;
  padding: 10px 15px 0 15px; /* ⬅ 여기가 핵심! 위쪽 padding */
  font-size: 14px;
  border: none;
  outline: none;
  display: block;
}

#search_text input::placeholder {
  transform: translateY(2px); /* 또는 */
  padding-top: 2px;
}

  
    body {
      margin: 0;
      padding: 0;
      background-color: #fff;
    }
    
    .wrapper {
    display: flex;
    justify-content: center;
    align-items: flex-start; /* 중앙 아닌 위쪽 정렬 */
    padding-top: 120px; /* 상단 여백만 부여 */
    min-height: calc(100vh - 100px); /* 최소 높이 지정 */
    }
  
    .container {
      width: 430px;
      padding: 40px 20px;
      text-align: center;
    }
  
    h2 {
      margin-bottom: 40px;
      font-size: 24px;
      font-weight: bold;
    }
  
    input[type="text"],
    input[type="email"] {
      width: 100%;
      padding: 16px;
      margin-bottom: 18px;
      border: 1px solid #ddd;
      border-radius: 25px;
      font-size: 15px;
      transition: border-color 0.3s;
    }
  
    input:focus {
      border-color: #ff7da9;
      outline: none;
    }
  
    button {
      width: 100%;
      padding: 16px;
      border: none;
      border-radius: 12px;
      background-color: #ff7da9; /* 부드러운 분홍 */
      color: white;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s;
    }
  
    button:hover {
      background-color: #ff6297;
    }
  </style>
</head>
<body>
<br>
<%@ include file="../common/header.jsp" %>
	
	<div class="wrapper">
	  <div class="container">
	    <form action="<%= contextPath %>/findID.me">
	      <h2>아이디 찾기</h2>
	      <input type="text" name="userName" placeholder="이름을 입력하세요. ex) 홍길동" required>
	      <input type="email" name="email" placeholder="이메일을 입력하세요. ex) honggd@naver.com" required>
	      <input type="text" name="phone" placeholder="전화번호를 입력하세요. ex) 01012345678" required>
	      <button type="submit">확인</button>
	    </form>
	  </div>
	</div>
	

</body>
</html>