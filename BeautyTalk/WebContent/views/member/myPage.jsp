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
<link href="resources/css/mypage.css" rel="stylesheet">
<script src="resources/js/mypage.js"></script>
</head>

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
            <% if(loginUser.getFilePath() != null) { %>
                <div id="userImg" style="position: relative; display: inline-block; width: 100px; height: 100%;">
                    <img id="userprofile" src="<%= contextPath + "/" + loginUser.getFilePath() %>" 
                        alt="유저이미지" style="border-radius: 50%; cursor: pointer;">
                    <!-- 수정 아이콘 -->
                    <span id="openProfileModal" class="material-icons" 
                        style="position: absolute; bottom: 2px; right: 2px; cursor: pointer;">
                        photo_camera
                    </span>
                </div>
                <% } else { %>
                <div id="userImg" style="position: relative; display: inline-block; width: 100px; height: 100%;">
                    <img id="userprofile" src="<%= contextPath %>/resources/images/account_circle_500dp_000000.png" 
                        alt="유저이미지" style="border-radius: 50%; cursor: pointer;">
                    <!-- 수정 아이콘 -->
                    <span id="openProfileModal" class="material-icons" 
                        style="position: absolute; bottom: 2px; right: 2px; cursor: pointer;">
                        photo_camera
                    </span>
                </div>
                <% } %>
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
        

</body>
</html>