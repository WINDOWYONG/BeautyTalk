<%@page import="com.kh.profile.controller.model.vo.Profile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
</head>
<style>
    #Content1{
        height: auto;
        width: 100%;
        min-width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    #Content2{
        width: 1200px;
        height: 100px;
        overflow: hidden;
        margin: 0 auto;

    }
    #Content3{
        width: 1200px;
        overflow: hidden;
        margin: auto;
    }
    #Content3 table{
        height: auto;
        width: 350px;
        margin-bottom: 50px;
    }
    #Content3 div{
        float: left;
        text-align: center;
    }
    #Content4{
        width: 1200px;
        height: 1200px;
        overflow: hidden;
        margin: auto;
        display: flex;

    }
    #Content5{
        width: 350px;
        border: 1px solid #ddd;
        margin-right: 50px;
        
    }
    #Content6{
        width: 800px;
    }
    #userImg{
        height: 70px;
        width: 70px
        
    }
    #userprofile{
        border-radius: 50%;  /* 원형 이미지 */
        object-fit: cover;
        height: 100%;
        width: 100%;
    }
    
    #Content2 div{
        float: left;
        margin: auto;
        
    }
    #userName *{
        margin: 0;
        margin-top: 20px;
    }
    table td{
        text-align: center;

    }
    a{
        text-decoration: none;
        color: black;
        text-decoration: none;
        font-size: 15px;
        font-weight: 600;
    }
    a:hover{
        color: #e8618c;
    }

    #userInfo tr{
        float: left;
    }
    #userBoard {
        display: flex;
        text-align: left;
        gap: 33px;
        position: relative;
        border-bottom: 2px solid #ddd;
        padding-bottom: 5px;
        margin-left: 20px;
        margin-bottom: 30px;
    }

    #myPageTitle{
        margin-left: 20px;
    }
    #Title{
        color: #e8618c;
        font-size: x-large;
        margin: 0;
    }

    .tab {
        font-size: 16px;
        font-weight: bold;
        color: #5e5858;
        padding: 10px;
        cursor: pointer;
        position: relative;
        transition: color 0.3s ease-in-out;
    }
    .tab.active {
        color: #e8618c;
    }
    .underline{
        position: absolute;
        bottom: -2px;
        height: 3px;
        background-color: #e8618c;
        transition: all 0.3s ease-in-out;
        
    }
    .material-icons{
        display: inline;
        display: flex;
        align-items: center;
        font-weight: 600;
    }
    pre{
        text-decoration: underline;
        color: #e8618c;
        text-decoration-thickness: 3px;
        font-size: xx-small;
    }


    input[type="text"], input[type="password"] {
        width: 480px;
        padding: 12px;
        margin: 0;
        border: 1px solid #ddd;
        border-radius: 7px;
        font-size: 13px;
        box-sizing: border-box;
    }
    .check {
    background-color: #e8618c;
    color: white;
    width: 80px;
    height: 40px;
    border-radius: 7px;
    border: none;
    cursor: pointer; /* 🔥 마우스 커서를 손가락 모양으로 변경 */
    pointer-events: auto;
    font-size: 13px;
    font-weight: 600;
    transition: all 0.2s ease-in-out;
    box-shadow: 3px 3px 5px #e8618c(0, 0, 0, 0.2);
}
    .check:hover {
    background-color: #d9507a;
    box-shadow: 3px 3px 5px #e8618c(0, 0, 0, 0.2);
    }

    /* 클릭 시 버튼이 살짝 눌리는 효과 */
    .check:active {
        transform: scale(0.95);
        box-shadow: 1px 1px 3px #e8618c(0, 0, 0, 0.2);
    }
    .btn-insta-insert {
    background-color: #e8618c;
    color: white;
    width: 150px;
    height: 40px;
    margin-top: 20px;
    border-radius: 7px;
    border: none;
    cursor: pointer; /* 🔥 마우스 커서를 손가락 모양으로 변경 */
    pointer-events: auto;
    font-size: 13px;
    font-weight: 600;
    transition: all 0.2s ease-in-out;
    box-shadow: 3px 3px 5px #e8618c(0, 0, 0, 0.2);
    }

    /* 호버 시 */
    .btn-insta-insert:hover {
        background-color: #d9507a;
        box-shadow: 3px 3px 5px #e8618c(0, 0, 0, 0.2);
    }

    /* 클릭 시 */
    .btn-insta-insert:active {
        transform: scale(0.95);
        box-shadow: 1px 1px 3px #e8618c(0, 0, 0, 0.2);
    }

    .btn img {
        width: 18px;
        height: 18px;
        margin-right: 10px;
    }

    .error-message {
        color: red;
        font-size: 12px;
        display: none;
    }
    
    #insert-form :nth-child(4){
        margin-top: 20px;
    }

    #insert-form :nth-child(7){
        margin-top: 20px;
    }

    #Content5>*{
        margin: 7px;
    }
    #update{
        align-content: center;
    }
    #update2{
        width: 100%;
        height: 100%;
    }
    #openModal {
    display: inline-block;
    text-decoration: none;
    color: black;
    text-decoration: none;
    font-size: 15px;
    font-weight: 600;
    text-decoration: none;
    cursor: pointer;
    }
    #openModal:hover{
        color: #e8618c;
    }


    .modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
}

/* 모달 박스 */
.modal-content {
    background: white;
    padding: 90px; /* 좌우 여백을 충분히 줌 */
    box-sizing: border-box; /* padding 포함한 크기 유지 */
    height: 600px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    border: 4px solid #5aa1f2; /* 파란색 테두리 추가 */
}

/* 입력 폼 스타일 */
.modal-content input[id="password"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}
.modal-content input[id="userPwd"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

/* 버튼 스타일 */
.modal-content .delete-btn {
    background: #ff5f98;
    color: white;
    border: none;
    padding: 12px 20px;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    display: block;
    margin: 20px auto 0;
    text-align: center;
    width: 200px;
}

.modal-content .delete-btn:hover {
    background: #e8618c;
	background: #ff5f98;
	color: white;
	border: none;
	padding: 12px 20px;
	border-radius: 5px;
	font-weight: bold;
	cursor: pointer;
	display: block;
	margin: 20px auto 0;
	text-align: center;
	width: 200px;
}

/* 닫기 버튼 (X) */
.close-btn {
    position: absolute;
    top: 15px;
    right: 20px;
    font-size: 25px;
    font-weight: bold;
    cursor: pointer;
}
.close-btn:hover {
    color: red;
}
.password-container {
    display: flex;
    align-items: center; /* 세로 정렬 */
    gap: 10px; /* 라벨과 입력 필드 사이 간격 */
}
.userId-container {
    display: flex;
    align-items: center; /* 세로 정렬 */
    gap: 26px; /* 라벨과 입력 필드 사이 간격 */
}

.password-container label {
    white-space: nowrap; /* 라벨 줄바꿈 방지 */
}

.password-container input {
    flex: 1; /* 입력 필드가 남은 공간을 차지 */
    max-width: 500px; /* 원하는 너비 설정 */
}
.userId-container label {
    white-space: nowrap; /* 라벨 줄바꿈 방지 */
}

.userId-container input {
    flex: 1; /* 입력 필드가 남은 공간을 차지 */
    max-width: 500px; /* 원하는 너비 설정 */
}
table {
    table-layout: fixed; /* 테이블 셀 너비를 균등하게 */
}

button {
    border-style: none;
}
#gender{
        width: 100%;
        height: 20px;
        margin-top: 10px;
        
    }
#improvement input{
margin-left: 30px;
}
#update2 input[type="checkbox"]{
    margin-left: 30px;
    appearance: none;
    width: 15px;
    vertical-align: middle;
    height: 12px;
    border: 1px solid rgb(118, 118, 118);
    border-radius: 50%; /* 원형 */
    position: relative;
    cursor: pointer;
}
#update2 input[type="radio"]{
    margin: 10px;
}
.color-box {
    display: flex;
  }

  .color-label {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 121px; /* 버튼 크기 */
    height: 45px;
    border: 2px solid #ddd;
    cursor: pointer;
    font-size: 14px;
    font-weight: bold;
    color: #333;
    background-color: #fff;
    transition: all 0.3s;
  }

  /* 라디오 버튼 숨기기 */
  .color-input {
    display: none;
  }

  /* 선택된 상태 스타일 */
  .color-input:checked + .color-label {
    background-color: #e8618c;
    border-color: #e8618c;
    color: white;
  }
  /* 처음 버튼 (왼쪽만 둥글게) */
  .color-label:first-of-type {
    border-radius: 10px 0 0 10px;
  }

  /* 마지막 버튼 (오른쪽만 둥글게) */
  .color-label:last-of-type {
    border-radius: 0 10px 10px 0;
  }
#userImg {
    position: relative;
    display: inline-block;
}


.edit-icon {
    position: absolute;
    bottom: 5px; /* 이미지 아래쪽 여백 */
    right: 5px;  /* 이미지 오른쪽 여백 */
    background-color: white; /* 아이콘 배경 */
    color: black;
    border-radius: 50%;
    padding: 5px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    font-size: 18px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 14px;
    height: 14px;
}
.profile-modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 500px; /* 기본 크기 */
    height: 500px;
    min-width: 300px;  /* 최소 너비 */
    min-height: 200px; /* 최소 높이 */
    max-width: 600px;  /* 최대 너비 */
    max-height: 500px; /* 최대 높이 */
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
    overflow: hidden;
    resize: both;  /* 크기 조절 가능하도록 설정 */
}

/* 내부 컨텐츠 */
.profile-modal-content {
    text-align: center;
    width: 100%;
    height: 100%;
    overflow: auto; /* 내용이 넘칠 경우 스크롤 가능 */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

/* 버튼을 감싸는 부모 컨테이너 추가 */
.profile-button-container {
    display: flex;
    flex-direction: row;  /* 버튼을 가로로 정렬 */
    justify-content: center; /* 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    gap: 15px; /* 버튼 간격 */
    margin-top: 15px; /* 위쪽 여백 */
    width: 100%; /* 부모 요소가 가득 차도록 설정 */
}

.profile-modal-content img {
    width: 200px;
    height: 200px;
    margin-left: 125px;
    border-radius: 50%;
    margin-bottom: 20px; /* 간격 조정 */
}

.profile-button-container {
    display: flex;

    gap: 10px; /* 버튼 간격 조정 */
    align-items: center;
}

.custom-file-upload, 
#saveProfile {
    width: 120px; /* 버튼 크기 조정 */
    text-align: center;
}

/* 닫기 버튼 */
.close-profile {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 20px;
    cursor: pointer;
}
input[type="file"] {
    display: none;
}

.custom-file-upload {
    display: inline-block;
    padding: 10px 20px;
    background-color: #f8d7da;
    color: #e8618c;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    border: 1px solid #e8618c;
}

.custom-file-upload:hover {
    background-color: #e8618c;
    color: white;
}

#saveProfile {
    display: inline-block;
    padding: 10px 20px;
    background-color: #f8d7da;
    color: #e8618c;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    border: 1px solid #e8618c;
}

#saveProfile:hover {
    background-color: #e8618c;
    color: white;
}




</style>
<body>
	<%@ include file="../common/header.jsp" %>
	<%
	int bfNO = (userProfile == null) ? 22 : userProfile.getBfNO();
	int userNo = (userProfile == null) ? 22 : userProfile.getUserNo();
	String skinTypeNo = (userProfile == null) ? "" : userProfile.getSkinTypeNo(); // 필수 입력 사항 아니라서 null이 있을 수도 있다.
	String bodyTypeNo = (userProfile == null) ? "" : userProfile.getBodyTypeNo();
	String skinList = (userProfile == null) ? "" : userProfile.getSkinList();
	String scalpList = (userProfile == null) ? "" : userProfile.getScalpList();
	String brandList = (userProfile == null) ? "" : userProfile.getBrandList();
	String color = (userProfile == null) ? "" : userProfile.getColor();
	String release = (userProfile == null) ? "" : userProfile.getRelease();
	String hairTypeNo = (userProfile == null) ? "" : userProfile.getHairTypeNo();
	String scalpTypeNo = (userProfile == null) ? "" : userProfile.getScalpTypeNo();
	%>
    
    <br>
	
	    <div id="Content1">
            <div id="Content2">
                <div id="userImg" style="position: relative; display: inline-block; width: 100px; height: 100%;">
                    <img id="userprofile" src="<%= contextPath + "/" + loginUser.getFilePath() %>" 
                        alt="유저이미지" style="border-radius: 50%; cursor: pointer;">
                    
                    <!-- 수정 아이콘 -->
                    <span id="openProfileModal" class="material-icons" 
                        style="position: absolute; bottom: 2px; right: 2px; cursor: pointer;">
                        photo_camera
                    </span>
                </div>
                <!-- ✅ 프로필 수정 모달 -->
                <div id="profileModal" class="profile-modal">
                    <div class="profile-modal-content">
                        <span class="close-profile">&times;</span>
                        <h2 style="color: #e8618c;">프로필 사진 변경</h2>
                
                        <!-- ✅ form에 class 추가하여 스타일 영향 최소화 -->
                        <form id="profileForm" action="<%= contextPath %>/insert.img" method="POST" enctype="multipart/form-data" class="profile-form">
                            <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                            <input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">
                            <input type="hidden" name="userPwd" value="<%= loginUser.getUserPwd() %>">
                            <!-- 현재 사용자 프로필 이미지 -->
                            <div class="profile-preview">
                                <img id="previewImage" src="<%= loginUser.getFilePath() %>" 
                                    alt="현재 프로필 이미지">
                            </div>
                
                            <!-- 이미지 업로드 버튼 -->
                            <div class="profile-button-container">
                                <input type="file" id="profileUpload" name="upfile" accept="image/*" style="display: none;">
                                <label for="profileUpload" class="custom-file-upload">파일 선택</label>
                                <button type="submit" id="saveProfile" style="font-size: medium;">저장</button>
                            </div>
                        </form>
                    </div>
                </div>
                

                <div id="userName" style="margin-left: 20px;">
                    <h2><%= loginUser.getUserName() %></h2>
                    <span style="font-size: x-small;"><%= loginUser.getUserId() %></span>
                </div>
            </div>
            <div id="Content3">
                <table style="margin-top: 10px;">
                    <tr>
                        <td>
                            <a href="" style="font-weight: 800; font-size: larger;">게시글 <br><%= loginUser.getPost() %></a> <br>
                        </td>
                        <td><a href="" style="font-weight: 800; font-size: larger;">리뷰 <br><%= loginUser.getReview() %><br></a></td>
                        <td><a href="" style="font-weight: 800; font-size: larger;">팔로우 <br><%= loginUser.getFollower() %><br></a></td>
                        <td><a href="" style="font-weight: 800; font-size: larger;">팔로잉 <br><%= loginUser.getFollowing() %><br></a></td>
                    </tr>
                </table>
                <div id="userBoard">
                    <div class="tab">post</div>
                    <div class="tab">Review</div>
                    <div class="tab" id="beautyProfile">Beauty Profile</div>
                    <div class="underline"></div>
                </div>

            </div>
            <div id="Content4">
                <div id="Content5">
                    <div>
                        <span class="material-icons" style="font-size: 30px;">person<a href="<%= contextPath %>/myPage.me" style="font-size:25px;">마이페이지</a></span>
                    </div>
                    
                    <div>
                        
                    </div>
                    <div>
                        <h2>내정보</h2>
                    </div>
                    <div>
                        <a href="#" id="updatePage">회원정보 수정</a>
                    </div>
                    <div>
                        <a href="#" id="openModal">회원탈퇴</a>
                    </div>
                    <div>
                        <a href="#" id="mybag">왓츠인 마이백</a>
                    </div>
                    <div>
                        <a href="<%= contextPath %>/calendarMainpage.ca">뷰티캘린더</a>
                    </div>
                    <div>
                        <a href="">알림내역</a>
                    </div>
                    <div>
                        <a href=""></a>
                    </div>
                    <br>
                    <div>
                        <h2>문의 / 공지사항</h2>
                    </div>
                    <div>
                        <a href="">문의 내역</a>
                    </div>
                    <div>
                        <a href="">1:1 문의하기</a>
                    </div>
                    <div>
                        <a href="">공지사항</a>
                    </div>
                    <br>
                    <div>
                        <h2>댓글</h2>
                    </div>
                    <div>
                        <a href="">댓글 내역</a>
                    </div>
                    <br>
                    <div>
                        <h2>신고내역</h2>
                    </div>
                    <div>
                        <a href="">신고내역</a>
                    </div>
                </div>
                <div id="Content6">

                    <div id="update">
                        <div id="myPageTitle">
                            <h2 id="Title" style="margin-left: 55px;">회원정보</h2>
                        </div>
                        <div id="line" style="margin-left: 55px;">
                            <pre align="left">                                                                                                                                   </pre>
                        </div>
                        <form action="<%= contextPath %>/update.me" id="insert-form" method="post">
                            <input type="hidden" name=userNo id="userNo" maxlength="16" value="<%= loginUser.getUserNo() %>">
                            <table style="margin-top: 50px; margin-left: 50px;">
                                    <tr>
                                        <td style="text-align: left;" width="150">아이디</td>
                                        <td><input type="text" name="userId" id="userId" minlength="6" maxlength="15" placeholder="아이디를 입력하세요. (6자 이상 15자 이내)" required value="<%= loginUser.getUserId() %>"></td>
                                        <td><button class="check" type="button" onclick="idCheck()">중복확인</button></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">비밀번호</td>
                                        <td><input type="text" name="userPwd" class="userPwd" maxlength="16" placeholder="이름을 입력하세요." required value="<%= loginUser.getUserPwd() %>"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">이름</td>
                                        <td><input type="text" name="userName" class="userName" minlength="8" maxlength="20" placeholder="이메일을 입력하세요." required value="<%= loginUser.getUserName() %>"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" >이메일</td>
                                        <td><input type="text" name="email" id="email" minlength="6" maxlength="15" placeholder="아이디를 입력하세요. (6자 이상 15자 이내)" required value="<%= loginUser.getEmail() %>"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">닉네임</td>
                                        <td><input type="text" name="nickName" id="nickName" minlength="2" maxlength="10" placeholder="닉네임을 입력하세요" required value="<%= loginUser.getNickName() %>"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">휴대전화번호</td>
                                        <td><input type="text" name="phone" id="phone" minlength="8" maxlength="11" placeholder="휴대전화번호 ex) 01011112222" required value="<%= loginUser.getPhone() %>"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3"><button type="submit" class="btn-insta-insert" style="font-size: large; font-weight: 600; margin-left: 11px;">회원정보수정</button></td>
                                    </tr>
                            </table>
                        </form>
                    </div>
                    <div id="update2">
                        <div id="myPageTitle">
                            <h2 id="Title" style="margin-left: 50px;">Beauty Profile</h2>
                        </div>
                        <div id="line" style="margin-left: 55px;">                              
                            <pre align="left">                                                                                                                  </pre>
                        </div>
                            <% if(userProfile != null) { %>
                        <form action="<%= contextPath %>/update.bp" id="profile-form11" method="post">
                            <input type="hidden" name=userNo class="userNo" maxlength="16" value="<%= loginUser.getUserNo() %>">
                            <div id="myPageTitle">
                                <h4 id="Title" style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">개인 정보</h4>
                            </div>
                            <table style="margin-left: 50px;">
                                    <tr>
                                        <td style="text-align: left;" width="110">이름</td>
                                        <td width="480"><input type="text" name="userName" class="userName"value="<%= loginUser.getUserName() %>"></td>
                                    </tr>
                                    <tr style="margin-bottom: 50px;">
                                        <td style="text-align: left;">성별</td>
                                        <% if(loginUser.getGender().equals("Y")) { %>
                                        <td><input type="text" name="gender" value="M" readonly></td>
                                        <% } else { %>
                                        <td><input type="text" name="gender" value="F" readonly></td>
                                        <% } %>
                                </table>
                                    <div id="myPageTitle">
                                        <h4 id="Title" style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">피부 정보</h4>
                                    </div>
                                    <table style="margin-left: 50px;">
                                        <tr>
                                            <td style="text-align: left;" width="110" height="45px">피부 타입</td>
                                            <td style="text-align: center;" width="482">
                                                <div class="color-box">
                                                    <input type="radio" id="skin1" name="skinType" class="color-input" value="S1">
                                                    <label for="skin1" class="color-label">건성</label>
                                            
                                                    <input type="radio" id="skin2" name="skinType" class="color-input" value="S2">
                                                    <label for="skin2" class="color-label">지성</label>
                                            
                                                    <input type="radio" id="skin3" name="skinType" class="color-input" value="S3">
                                                    <label for="skin3" class="color-label">복합</label>
                                            
                                                    <input type="radio" id="skin4" name="skinType" class="color-input" value="S4">
                                                    <label for="skin4" class="color-label">민감성</label>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;" width="110" height="45px">바디 타입</td>
                                            <td style="text-align: center;" width="482">
                                                <div class="color-box">
                                                    <input type="radio" id="body1" name="bodyType" class="color-input" value="B1">
                                                    <label for="body1" class="color-label">건성</label>
                                            
                                                    <input type="radio" id="body2" name="bodyType" class="color-input" value="B2">
                                                    <label for="body2" class="color-label">지성</label>
                                            
                                                    <input type="radio" id="body3" name="bodyType" class="color-input" value="B3">
                                                    <label for="body3" class="color-label">복합</label>
                                            
                                                    <input type="radio" id="body4" name="bodyType" class="color-input" value="B4">
                                                    <label for="body4" class="color-label">민감성</label>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;" width="110" height="45px">개선 항목</td>
                                            <td style="text-align: center;" width="482">
                                                <div class="color-box">
                                                    <input type="checkbox" id="skinImprove1" name="skinImprovement" class="color-input" value="주름">
                                                    <label for="skinImprove1" class="color-label">주름</label>
                                            
                                                    <input type="checkbox" id="skinImprove2" name="skinImprovement" class="color-input" value="미백">
                                                    <label for="skinImprove2" class="color-label">미백</label>
                                            
                                                    <input type="checkbox" id="skinImprove3" name="skinImprovement" class="color-input" value="각질">
                                                    <label for="skinImprove3" class="color-label">각질</label>
                                            
                                                    <input type="checkbox" id="skinImprove4" name="skinImprovement" class="color-input" value="트러블">
                                                    <label for="skinImprove4" class="color-label">트러블</label>
                                                </div>
                                            </td>
                                            <td><p style="color: #e8618c; margin-left: 10px;">다중 선택</p></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;" width="110" height="45px">퍼스널 컬러</td>
                                            <td style="text-align: center;" width="482">
                                                <div class="color-box">
                                                    <input type="radio" id="spring" name="skinColor" class="color-input" value="봄웜">
                                                    <label for="spring" class="color-label">봄웜</label>
                                            
                                                    <input type="radio" id="summer" name="skinColor" class="color-input" value="여름쿨">
                                                    <label for="summer" class="color-label">여름쿨</label>
                                            
                                                    <input type="radio" id="autumn" name="skinColor" class="color-input" value="가을웜">
                                                    <label for="autumn" class="color-label">가을웜</label>
                                            
                                                    <input type="radio" id="winter" name="skinColor" class="color-input" value="겨울쿨">
                                                    <label for="winter" class="color-label">겨울쿨</label>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                    <div id="myPageTitle">
                                        <h4 id="Title" style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">헤어 정보</h4>
                                    </div>
                                    <table style="margin-left: 50px;">
                                        <tr>
                                            <td style="text-align: left;" width="110" height="45px">헤어 타입</td>
                                            <td style="text-align: center;" width="482">
                                                <div class="color-box">
                                                    <input type="radio" id="hair1" name="hairType" class="color-input" value="H1">
                                                    <label for="hair1" class="color-label">직모</label>
                                            
                                                    <input type="radio" id="hair2" name="hairType" class="color-input" value="H2">
                                                    <label for="hair2" class="color-label">곱슬</label>
                                            
                                                    <input type="radio" id="hair3" name="hairType" class="color-input" value="H3">
                                                    <label for="hair3" class="color-label">탈모</label>
                                            
                                                    <input type="radio" id="hair4" name="hairType" class="color-input" value="H4">
                                                    <label for="hair4" class="color-label">손상모</label>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;" width="110" height="45px">두피 타입</td>
                                            <td style="text-align: center;" width="482">
                                                <div class="color-box">
                                                    <input type="radio" id="scalp1" name="scalpType" class="color-input" value="HB1">
                                                    <label for="scalp1" class="color-label">건성</label>
                                            
                                                    <input type="radio" id="scalp2" name="scalpType" class="color-input" value="HB2">
                                                    <label for="scalp2" class="color-label">지성</label>
                                            
                                                    <input type="radio" id="scalp3" name="scalpType" class="color-input" value="HB3">
                                                    <label for="scalp3" class="color-label">복합</label>
                                            
                                                    <input type="radio" id="scalp4" name="scalpType" class="color-input" value="HB4">
                                                    <label for="scalp4" class="color-label">민감성</label>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;" width="110" height="45px">개선 항목</td>
                                            <td style="text-align: center;" width="482">
                                                <div class="color-box">
                                                    <input type="checkbox" id="scalpImprovement1" name="scalpImprovement" class="color-input" value="탈모예방">
                                                    <label for="scalpImprovement1" class="color-label">탈모예방</label>
                                            
                                                    <input type="checkbox" id="scalpImprovement2" name="scalpImprovement" class="color-input" value="모발촉진">
                                                    <label for="scalpImprovement2" class="color-label">모발촉진</label>
                                            
                                                    <input type="checkbox" id="scalpImprovement3" name="scalpImprovement" class="color-input" value="두피건강">
                                                    <label for="scalpImprovement3" class="color-label">두피건강</label>
                                            
                                                    <input type="checkbox" id="scalpImprovement4" name="scalpImprovement" class="color-input" value="모발건강">
                                                    <label for="scalpImprovement4" class="color-label">모발건강</label>
                                                </div>
                                            </td>
                                            <td><p style="color: #e8618c; margin-left: 10px;">다중 선택</p></td>
                                        </tr>
                                    </table>
                                    <div id="myPageTitle">
                                        <h4 id="Title" style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">브랜드</h4>
                                    </div>
                                    <table style="margin-left: 50px;">
                                        <tr>
                                            <td style="text-align: left;" width="110" height="45px">관심 브랜드</td>
                                            <td style="text-align: center;" width="482">
                                                <div class="color-box">
                                                    <input type="checkbox" id="brand1" name="brand" class="color-input" value="브랜드 A">
                                                    <label for="brand1" class="color-label">브랜드 A</label>
                                            
                                                    <input type="checkbox" id="brand2" name="brand" class="color-input" value="브랜드 B">
                                                    <label for="brand2" class="color-label">브랜드 B</label>
                                            
                                                    <input type="checkbox" id="brand3" name="brand" class="color-input" value="브랜드 C">
                                                    <label for="brand3" class="color-label">브랜드 C</label>
                                            
                                                    <input type="checkbox" id="brand4" name="brand" class="color-input" value="브랜드 D">
                                                    <label for="brand4" class="color-label">브랜드 D</label>
                                                </div>
                                            </td>
                                            <td><p style="color: #e8618c; margin-left: 10px;">다중 선택</p></td>
                                        </tr>
                                    </table>
                                    <div id="myPageTitle">
                                        <h4 id="Title" style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">공개 범위</h4>
                                    </div>
                                    <table style="margin-left: 50px;">
                                        <tr>
                                            <td style="text-align: left; vertical-align: middle;" width="110" height="45px">공개 여부</td>
                                            <td style="text-align: center;" width="482">
                                                <div class="color-box" style="display: flex; justify-content: center;">
                                                    <input type="radio" id="public" name="release" class="color-input" value="A">
                                                    <label for="public" class="color-label" style="width: 161px;">모두 공개</label>
                                            
                                                    <input type="radio" id="friends" name="release" class="color-input" value="F">
                                                    <label for="friends" class="color-label" style="width: 161px;">친구만 공개</label>
                                            
                                                    <input type="radio" id="private" name="release" class="color-input" value="N">
                                                    <label for="private" class="color-label" style="width: 161px;">비공개</label>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        
                                        <tr>
                                            <td colspan="3"><button type="submit" class="btn-insta-insert" style="font-size: large; font-weight: 600; margin-left: 11px;">뷰티 프로필 수정</button></td>
                                        </tr>
                                        </table>
                                        <script>
                                            $(function() {
                                                    const skinTypeNo = "<%= skinTypeNo %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function() {
                                                    
                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if(skinTypeNo.search($(this).val()) != -1){ // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        }
                                                    })
                                            })	
                                            
                                            $(function() {
                                                    const bodyTypeNo = "<%= bodyTypeNo %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function() {
                                                    
                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if(bodyTypeNo.search($(this).val()) != -1){ // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        } 
                                                    
                                                    })
                                            })
                                            
                                            $(function() {
                                                    const skinList = "<%= skinList %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=checkbox]").each(function() {
                                                    
                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if(skinList.search($(this).val()) != -1){ // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        } 
                                                    
                                                    })
                                            })
                                            
                                            $(function() {
                                                    const color = "<%= color %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function() {
                                                    
                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if(color.search($(this).val()) != -1){ // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        } 
                                                    
                                                    })
                                            })
                                            
                                            $(function() {
                                                    const hairTypeNo = "<%= hairTypeNo %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function() {
                                                    
                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if(hairTypeNo.search($(this).val()) != -1){ // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        } 
                                                    
                                                    })
                                            })
                                            
                                            $(function() {
                                                    const scalpTypeNo = "<%= scalpTypeNo %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function() {
                                                    
                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if(scalpTypeNo.search($(this).val()) != -1){ // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        } 
                                                    
                                                    })
                                            })
                                            
                                                    $(function() {
                                                    const scalpList = "<%= scalpList %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=checkbox]").each(function() {
                                                    
                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if(scalpList.search($(this).val()) != -1){ // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        } 
                                                    
                                                    })
                                            })
                                            
                                            $(function() {
                                                    const brandList = "<%= brandList %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=checkbox]").each(function() {
                                                    
                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if(brandList.search($(this).val()) != -1){ // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        } 
                                                    
                                                    })
                                            })
                                            
                                            $(function() {
                                                    const release = "<%= release %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function() {
                                                    
                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if(release.search($(this).val()) != -1){ // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        } 
                                                    
                                                    })
                                            })
                                            </script>
                                            
                                        


                                        
                            
                        </form>
                        <% } else {%>
                            <form action="<%= contextPath %>/insert.bp" id="profile-form1" method="post">
                                <<input type="hidden" name=userNo class="userNo" maxlength="16" value="<%= loginUser.getUserNo() %>">
                                <div id="myPageTitle">
                                    <h4 id="Title" style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">개인 정보</h4>
                                </div>
                                <table style="margin-left: 50px;">
                                        <tr>
                                            <td style="text-align: left;" width="110">이름</td>
                                            <td width="480"><input type="text" name="userName" class="userName"value="<%= loginUser.getUserName() %>"></td>
                                        </tr>
                                        <tr style="margin-bottom: 50px;">
                                            <td style="text-align: left;">성별</td>
                                            <% if(loginUser.getGender().equals("Y")) { %>
                                                    <td><input type="text" name="gender" value="M" readonly></td>
                                                    
                                            <% } else { %>
                                                    <td><input type="text" name="gender" value="F" readonly></td>
                                            <% } %>
                                        </tr>
                                    </table>
                                        <div id="myPageTitle">
                                            <h4 id="Title" style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">피부 정보</h4>
                                        </div>
                                        <table style="margin-left: 50px;">
                                    <tr>
                                        <td style="text-align: left;" width="110" height="45px">피부 타입</td>
                                        <td style="text-align: center;" width="482">
                                            <div class="color-box">
                                                <input type="radio" id="skin1" name="skinType" class="color-input" value="S1">
                                                <label for="skin1" class="color-label">건성</label>
                                        
                                                <input type="radio" id="skin2" name="skinType" class="color-input" value="S2">
                                                <label for="skin2" class="color-label">지성</label>
                                        
                                                <input type="radio" id="skin3" name="skinType" class="color-input" value="S3">
                                                <label for="skin3" class="color-label">복합</label>
                                        
                                                <input type="radio" id="skin4" name="skinType" class="color-input" value="S4">
                                                <label for="skin4" class="color-label">민감성</label>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" width="110" height="45px">바디 타입</td>
                                        <td style="text-align: center;" width="482">
                                            <div class="color-box">
                                                <input type="radio" id="body1" name="bodyType" class="color-input" value="B1">
                                                <label for="body1" class="color-label">건성</label>
                                        
                                                <input type="radio" id="body2" name="bodyType" class="color-input" value="B2">
                                                <label for="body2" class="color-label">지성</label>
                                        
                                                <input type="radio" id="body3" name="bodyType" class="color-input" value="B3">
                                                <label for="body3" class="color-label">복합</label>
                                        
                                                <input type="radio" id="body4" name="bodyType" class="color-input" value="B4">
                                                <label for="body4" class="color-label">민감성</label>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" width="110" height="45px">개선 항목</td>
                                        <td style="text-align: center;" width="482">
                                            <div class="color-box">
                                                <input type="checkbox" id="skinImprove1" name="skinImprovement" class="color-input" value="주름">
                                                <label for="skinImprove1" class="color-label">주름</label>
                                        
                                                <input type="checkbox" id="skinImprove2" name="skinImprovement" class="color-input" value="미백">
                                                <label for="skinImprove2" class="color-label">미백</label>
                                        
                                                <input type="checkbox" id="skinImprove3" name="skinImprovement" class="color-input" value="각질">
                                                <label for="skinImprove3" class="color-label">각질</label>
                                        
                                                <input type="checkbox" id="skinImprove4" name="skinImprovement" class="color-input" value="트러블">
                                                <label for="skinImprove4" class="color-label">트러블</label>
                                            </div>
                                        </td>
                                        <td><p style="color: #e8618c; margin-left: 10px;">다중 선택</p></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" width="110" height="45px">퍼스널 컬러</td>
                                        <td style="text-align: center;" width="482">
                                            <div class="color-box">
                                                <input type="radio" id="spring" name="skinColor" class="color-input" value="봄웜">
                                                <label for="spring" class="color-label">봄웜</label>
                                        
                                                <input type="radio" id="summer" name="skinColor" class="color-input" value="여름쿨">
                                                <label for="summer" class="color-label">여름쿨</label>
                                        
                                                <input type="radio" id="autumn" name="skinColor" class="color-input" value="가을웜">
                                                <label for="autumn" class="color-label">가을웜</label>
                                        
                                                <input type="radio" id="winter" name="skinColor" class="color-input" value="겨울쿨">
                                                <label for="winter" class="color-label">겨울쿨</label>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                                <div id="myPageTitle">
                                    <h4 id="Title" style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">헤어 정보</h4>
                                </div>
                                <table style="margin-left: 50px;">
                                    <tr>
                                        <td style="text-align: left;" width="110" height="45px">헤어 타입</td>
                                        <td style="text-align: center;" width="482">
                                            <div class="color-box">
                                                <input type="radio" id="hair1" name="hairType" class="color-input" value="H1">
                                                <label for="hair1" class="color-label">직모</label>
                                        
                                                <input type="radio" id="hair2" name="hairType" class="color-input" value="H2">
                                                <label for="hair2" class="color-label">곱슬</label>
                                        
                                                <input type="radio" id="hair3" name="hairType" class="color-input" value="H3">
                                                <label for="hair3" class="color-label">탈모</label>
                                        
                                                <input type="radio" id="hair4" name="hairType" class="color-input" value="H4">
                                                <label for="hair4" class="color-label">손상모</label>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" width="110" height="45px">두피 타입</td>
                                        <td style="text-align: center;" width="482">
                                            <div class="color-box">
                                                <input type="radio" id="scalp1" name="scalpType" class="color-input" value="HB1">
                                                <label for="scalp1" class="color-label">건성</label>
                                        
                                                <input type="radio" id="scalp2" name="scalpType" class="color-input" value="HB2">
                                                <label for="scalp2" class="color-label">지성</label>
                                        
                                                <input type="radio" id="scalp3" name="scalpType" class="color-input" value="HB3">
                                                <label for="scalp3" class="color-label">복합</label>
                                        
                                                <input type="radio" id="scalp4" name="scalpType" class="color-input" value="HB4">
                                                <label for="scalp4" class="color-label">민감성</label>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" width="110" height="45px">개선 항목</td>
                                        <td style="text-align: center;" width="482">
                                            <div class="color-box">
                                                <input type="checkbox" id="scalpImprovement1" name="scalpImprovement" class="color-input" value="탈모예방">
                                                <label for="scalpImprovement1" class="color-label">탈모예방</label>
                                        
                                                <input type="checkbox" id="scalpImprovement2" name="scalpImprovement" class="color-input" value="모발촉진">
                                                <label for="scalpImprovement2" class="color-label">모발촉진</label>
                                        
                                                <input type="checkbox" id="scalpImprovement3" name="scalpImprovement" class="color-input" value="두피건강">
                                                <label for="scalpImprovement3" class="color-label">두피건강</label>
                                        
                                                <input type="checkbox" id="scalpImprovement4" name="scalpImprovement" class="color-input" value="모발건강">
                                                <label for="scalpImprovement4" class="color-label">모발건강</label>
                                            </div>
                                        </td>
                                        <td><p style="color: #e8618c; margin-left: 10px;">다중 선택</p></td>
                                    </tr>
                                </table>
                                <div id="myPageTitle">
                                    <h4 id="Title" style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">브랜드</h4>
                                </div>
                                <table style="margin-left: 50px;">
                                    <tr>
                                        <td style="text-align: left;" width="110" height="45px">관심 브랜드</td>
                                        <td style="text-align: center;" width="482">
                                            <div class="color-box">
                                                <input type="checkbox" id="brand1" name="brand" class="color-input" value="브랜드 A">
                                                <label for="brand1" class="color-label">브랜드 A</label>
                                        
                                                <input type="checkbox" id="brand2" name="brand" class="color-input" value="브랜드 B">
                                                <label for="brand2" class="color-label">브랜드 B</label>
                                        
                                                <input type="checkbox" id="brand3" name="brand" class="color-input" value="브랜드 C">
                                                <label for="brand3" class="color-label">브랜드 C</label>
                                        
                                                <input type="checkbox" id="brand4" name="brand" class="color-input" value="브랜드 D">
                                                <label for="brand4" class="color-label">브랜드 D</label>
                                            </div>
                                        </td>
                                        <td><p style="color: #e8618c; margin-left: 10px;">다중 선택</p></td>
                                    </tr>
                                </table>
                                <div id="myPageTitle">
                                    <h4 id="Title" style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">공개 범위</h4>
                                </div>
                                <table style="margin-left: 50px;">
                                    <tr>
                                        <td style="text-align: left; vertical-align: middle;" width="110" height="45px">공개 여부</td>
                                        <td style="text-align: center;" width="482">
                                            <div class="color-box" style="display: flex; justify-content: center;">
                                                <input type="radio" id="public" name="release" class="color-input" value="A">
                                                <label for="public" class="color-label" style="width: 161px;">모두 공개</label>
                                        
                                                <input type="radio" id="friends" name="release" class="color-input" value="F">
                                                <label for="friends" class="color-label" style="width: 161px;">친구만 공개</label>
                                        
                                                <input type="radio" id="private" name="release" class="color-input" value="N">
                                                <label for="private" class="color-label" style="width: 161px;">비공개</label>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                <tr>
                                    <td colspan="3"><button type="submit" class="btn-insta-insert" style="font-size: large; font-weight: 600; margin-left: 11px;">뷰티 프로필 저장</button></td>
                                </tr>
                                </table>
                            </form>
                        <% } %>
                </div>
            </div>
                
        </div>
    </div>

        <div id="deleteModal" class="modal">
            <div class="modal-content">
                <form action="<%= contextPath %>/delete.me" method="get">
                    <!-- 닫기 버튼 (X) -->
                    <span class="close-btn">&times;</span>
            
                    <h2 style="color: #e8618c;">회원 탈퇴</h2>
                    <div id="line">
                        <pre align="left">                                                                                                                       </pre>
                    </div>
                    <br>
                    <h3 style="text-decoration: underline;">회원 탈퇴 유의 사항</h3>
                    <p style="display: inline;">사용하고 계신 현재 아이디는 탈퇴할 경우 <p style="display: inline; color: red; font-size: 25px;">복구가 불가능합니다.</p>
                    <br><br>
                    <!-- 비밀번호 입력 -->
                    <div class="userId-container">
                        <label for="password">아이디 입력</label>
                        <input name="userId" type="text" id="password" placeholder="아이디 입력">
                    </div>
                    <div class="password-container">
                        <label for="password">비밀번호 입력</label>
                        <input name="userPwd" type="password" id="userPwd" placeholder="비밀번호 입력">
                    </div>

                    <!-- 회원 탈퇴 버튼 -->
                    <button class="delete-btn" type="submit">회원탈퇴</button>
                </form>
            </div>
        </div>
        
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const tabs = document.querySelectorAll(".tab");
                const underline = document.querySelector(".underline");
    
                function moveUnderline(element) {
                    underline.style.width = element.offsetWidth + "px";
                    underline.style.left = element.offsetLeft + "px";
                }
    
                tabs.forEach(tab => {
                    tab.addEventListener("click", function () {
                        tabs.forEach(t => t.classList.remove("active"));
                        this.classList.add("active");
    
                        moveUnderline(this);
    
                    });
                });
    
                // 페이지 로드 시 첫 번째 탭에 언더라인 설정
                moveUnderline(tabs[0]);
                tabs[0].classList.add("active");
            });
        </script>
        
        <script>
            $(document).ready(function () {
            // 모달 열기
            $("#openModal").click(function (e) {
                e.preventDefault();
                $("#deleteModal").fadeIn();
                });

            // 모달 닫기 (X 버튼 클릭 시)
            $(".close-btn").click(function () {
                $("#deleteModal").fadeOut();
                });

            // 모달 바깥 영역 클릭 시 닫기
            $(window).click(function (e) {
                if ($(e.target).is("#deleteModal")) {
                    $("#deleteModal").fadeOut();
                    }
                });
            });
            $(document).ready(function () {
            // ✅ 프로필 수정 모달 열기
            $("#userprofile, #openProfileModal").click(function () {
                $("#profileModal").fadeIn();
            });

            // ✅ 프로필 수정 모달 닫기 (X 버튼 클릭 시)
            $(".close-profile").click(function () {
                $("#profileModal").fadeOut();
            });

            // ✅ 프로필 수정 모달 바깥 클릭 시 닫기 (회원탈퇴 모달과 구별)
            $(window).click(function (e) {
                if ($(e.target).is("#profileModal")) {
                    $("#profileModal").fadeOut();
                }
            });

            // 🔥 기존 회원탈퇴 모달 관련 코드는 손대지 않음! 🔥
        });
        </script>
        
        <script>
            function idCheck() {
                const $idInput = $("#userId");


                    $.ajax({
                        url:"idCheck.me",
                        data:{checkId:$idInput.val()},
                        success: function (result) {
                            console.log(result);

                            if(result == 'NNNNN'){
                                alert("중복된 아이디입니다")
                                $idInput.focus();
                            } else{
                                if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
                                    $idInput.attr("readonly", true);
                                    $("#userId :submit").removeAttr("disabled");
                            } else {
                                    $idInput.focus();
                            }
                        }

                        },
                    error: function () {
                    alert("서버 요청에 실패했습니다. 다시 시도해주세요.");
                    },
                    complete:function(){},
                });
            }
        </script>

        <script>
            $(document).ready(function () {
                const $tabs = $(".tab");
                const $underline = $(".underline");
                const $updateSection = $("#update"); // 회원정보 수정 폼
                const $beautyProfileSection = $("#update2"); // 뷰티 프로파일 폼
                const $beautyProfileTab = $(".tab:nth-child(3)"); // 뷰티 프로파일 탭
                const $updatePage = $("#updatePage"); // 회원정보 수정 버튼 (a 태그)

                // **초기 상태 설정**
                $beautyProfileSection.hide(); // 뷰티 프로파일 폼 숨기기
                $underline.hide(); // 언더라인 숨기기 (추가된 부분)

                function moveUnderline($element) {
                    $underline.show().css({
                        "width": $element.outerWidth() + "px",
                        "left": $element.position().left + "px",
                        "opacity": 1
                    });
                }

                function hideUnderline() {
                    $underline.css("opacity", 0).hide(); // 언더라인 숨기기
                }

                // 탭 클릭 시 언더라인 이동 + 폼 전환
                $tabs.click(function () {
                    $tabs.removeClass("active");
                    $(this).addClass("active");
                    moveUnderline($(this));

                    if ($(this).is($beautyProfileTab)) {
                        $updateSection.fadeOut(function () {
                            $beautyProfileSection.fadeIn();
                        });
                    }
                });

                // 회원정보 수정 버튼 클릭 시 폼 다시 보이고 언더라인 숨김
                $updatePage.click(function (e) {
                    e.preventDefault(); // a 태그의 기본 동작 방지 (페이지 이동 X)
                    $beautyProfileSection.fadeOut(function () {
                        $updateSection.fadeIn();
                    });
                    hideUnderline(); // 언더라인 숨기기
                    $tabs.removeClass("active"); // 모든 탭 비활성화
                });
            });

        </script>
</body>
</html>