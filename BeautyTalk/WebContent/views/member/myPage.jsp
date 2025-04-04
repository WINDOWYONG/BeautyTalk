<%@page import="com.kh.profile.controller.model.vo.Profile" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <link href="resources/css/mypage.css" rel="stylesheet">
        </head>
        <style>
            @font-face {
                font-family: 'Binggrae-Two';
                src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
                font-weight: bold;
                font-style: normal;
            }

            body {
                font-family: 'Binggrae-Two', sans-serif;
                color: #000000;
                /* 글자 색상 설정 */
                margin: 0 auto;
                padding: 30px;
                /* 글자 크기 설정 */
            }
        </style>

        <body>
            <%@ include file="../common/header.jsp" %>
                <% String imagePath=(loginUser.getFilePath() !=null && !loginUser.getFilePath().isEmpty()) ?
                    loginUser.getFilePath()
                    : "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y" ; %>

                    <br>

                    <div id="Content1">
                        <div id="Content2">
                            <% if(loginUser.getFilePath() !=null && !loginUser.getFilePath().isEmpty()) { %>
                                <div id="userImg"
                                    style="position: relative; display: inline-block; width: 100px; height: 100%;">
                                    <img id="userprofile" src="<%= imagePath %>" alt="유저이미지"
                                        style="border-radius: 50%; cursor: pointer;">

                                    <!-- 수정 아이콘 -->
                                    <span id="openProfileModal" class="material-icons"
                                        style="position: absolute; bottom: 2px; right: 2px; cursor: pointer;">
                                        photo_camera
                                    </span>
                                </div>
                                <% } else {%>
                                    <div id="userImg"
                                        style="position: relative; display: inline-block; width: 100px; height: 100%;">
                                        <img id="previewImage"
                                            src="https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y"
                                            alt="현재 프로필 이미지" style="width: 100px; height: 100%; border-radius: 50%;">

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
                                                <form id="profileForm"
                                                    action="<%= contextPath %>/insert.img?userNo=<%= loginUser.getUserNo() %>"
                                                    method="POST" enctype="multipart/form-data" class="profile-form">
                                                    <input type="hidden" name="userNo"
                                                        value="<%= loginUser.getUserNo() %>">
                                                    <input type="hidden" name="userId"
                                                        value="<%= loginUser.getUserId() %>">
                                                    <input type="hidden" name="userPwd"
                                                        value="<%= loginUser.getUserPwd() %>">
                                                    <!-- 현재 사용자 프로필 이미지 -->
                                                    <div class="profile-preview">
                                                        <% if(loginUser.getFilePath() !=null &&
                                                            !loginUser.getFilePath().isEmpty()) { %>
                                                            <img id="previewImage1" src="<%= imagePath %>"
                                                                alt="현재 프로필 이미지">
                                                            <% } else { %>
                                                                <img id="previewImage2" src="<%= imagePath %>"
                                                                    alt="현재 프로필 이미지">
                                                                <% } %>
                                                    </div>

                                                    <!-- 이미지 업로드 버튼 -->
                                                    <div class="profile-button-container">
                                                        <input type="file" id="profileUpload" name="upfile"
                                                            style="display: none;">
                                                        <label for="profileUpload" class="custom-file-upload">파일
                                                            선택</label>
                                                        <button type="submit" id="saveProfile"
                                                            style="font-size: medium;">저장</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                        <script>
                                            document.getElementById('profileUpload').addEventListener('change', function (event) {
                                                const file = event.target.files[0];
                                                const previewImage = document.getElementById('previewImage2');  // 현재 프로필 이미지

                                                if (file && previewImage) {
                                                    const reader = new FileReader();
                                                    reader.onload = function (e) {
                                                        previewImage.src = e.target.result; // 미리보기 이미지 변경
                                                    };
                                                    reader.readAsDataURL(file);
                                                }
                                            });
                                        </script>


                                        <div id="userName" style="margin-left: 20px;">
                                            <h2>
                                                <%= loginUser.getUserName() %>
                                            </h2>
                                            <span style="font-size: x-small;">
                                                <%= loginUser.getUserId() %>
                                            </span>
                                        </div>
                        </div>
                        <div id="Content3">
                            <table style="margin-top: 10px;">
                                <tr>
                                    <td>
                                        <a href="<%= contextPath %>/postMyList.po"
                                            style="font-weight: 800; font-size: larger;">게시글 <br>
                                            <%= loginUser.getPost() %>
                                        </a> <br>
                                    </td>
                                    <td><a href="<%= contextPath %>/review.my"
                                            style="font-weight: 800; font-size: larger;">리뷰 <br>
                                            <%= loginUser.getReview() %><br>
                                        </a></td>
                                    <td><a href="<%= contextPath %>/views/member/follow.jsp"
                                            style="font-weight: 800; font-size: larger;">팔로워 <br>
                                            <%= loginUser.getFollowing() %><br>
                                        </a></td>
                                    <td><a href="<%= contextPath %>/views/member/follow.jsp"
                                            style="font-weight: 800; font-size: larger;">팔로잉 <br>
                                            <%= loginUser.getFollower() %><br>
                                        </a></td>
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
                                    <span class="material-icons" style="font-size: 30px;">person<a
                                            href="<%= contextPath %>/myPage.me?userNo=<%= loginUser.getUserNo() %>"
                                            style="font-size:25px;">마이페이지</a></span>
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
                                        <pre
                                            align="left">                                                                                                                                   </pre>
                                    </div>
                                    <form action="<%= contextPath %>/update.me?userNo=<%= loginUser.getUserNo() %>"
                                        id="insert-form" method="post">
                                        <input type="hidden" name=userNo id="userNo" maxlength="16"
                                            value="<%= loginUser.getUserNo() %>">
                                        <table style="margin-top: 50px; margin-left: 50px;">
                                            <tr>
                                                <td style="text-align: left;" width="150">아이디</td>
                                                <td><input type="text" name="userId" id="userId" minlength="6"
                                                        maxlength="15" placeholder="아이디를 입력하세요. (6자 이상 15자 이내)" required
                                                        value="<%= loginUser.getUserId() %>"></td>
                                                <td><button class="check" type="button"
                                                        onclick="idCheck()">중복확인</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">비밀번호</td>
                                                <td><input type="password" name="userPwd" class="userPwd" maxlength="16"
                                                        placeholder="비밀번호를 입력하세요." required
                                                        value="<%= loginUser.getUserPwd() %>"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">이름</td>
                                                <td><input type="text" name="userName" class="userName" minlength="3"
                                                        maxlength="20" placeholder="이름을 입력하세요." required
                                                        value="<%= loginUser.getUserName() %>"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">이메일</td>
                                                <td><input type="text" name="email" id="email" minlength="6"
                                                        maxlength="15" placeholder="이메일를 입력하세요. (6자 이상 15자 이내)" required
                                                        value="<%= loginUser.getEmail() %>"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">닉네임</td>
                                                <td><input type="text" name="nickName" id="nickName" minlength="2"
                                                        maxlength="10" placeholder="닉네임을 입력하세요" required
                                                        value="<%= loginUser.getNickName() %>"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;">휴대전화번호</td>
                                                <td><input type="text" name="phone" id="phone" minlength="8"
                                                        maxlength="11" placeholder="휴대전화번호 ex) 01011112222" required
                                                        value="<%= loginUser.getPhone() %>"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <button type="submit" class="btn-insta-insert"
                                                        style="font-size: large; font-weight: 600; margin-left: 11px;">회원정보수정</button>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                                <div id="update2">
                                    <div id="myPageTitle">
                                        <h2 id="Title" style="margin-left: 50px;">Beauty Profile</h2>
                                    </div>
                                    <div id="line" style="margin-left: 55px;">
                                        <pre
                                            align="left">                                                                                                                  </pre>
                                    </div>
                                    <% if(loginUser.getBfNo() !=0) { %>
                                        <form action="<%= contextPath %>/update.bp" id="profile-form11" method="post">
                                            <input type="hidden" name=userNo class="userNo" maxlength="16"
                                                value="<%= loginUser.getUserNo() %>">
                                            <div id="myPageTitle">
                                                <h4 id="Title"
                                                    style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">
                                                    개인 정보</h4>
                                            </div>
                                            <table style="margin-left: 50px;">
                                                <tr>
                                                    <td style="text-align: left;" width="110">이름</td>
                                                    <td width="480"><input type="text" name="userName" class="userName"
                                                            value="<%= loginUser.getUserName() %>"></td>
                                                </tr>
                                                <tr style="margin-bottom: 50px;">
                                                    <td style="text-align: left;">성별</td>
                                                    <% if(loginUser.getGender().equals("Y")) { %>
                                                        <td><input type="text" name="gender" value="M" readonly></td>
                                                        <% } else { %>
                                                            <td><input type="text" name="gender" value="F" readonly>
                                                            </td>
                                                            <% } %>
                                            </table>
                                            <div id="myPageTitle">
                                                <h4 id="Title"
                                                    style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">
                                                    피부 정보</h4>
                                            </div>
                                            <table style="margin-left: 50px;">
                                                <tr>
                                                    <td style="text-align: left;" width="110" height="45px">피부 타입</td>
                                                    <td style="text-align: center;" width="482">
                                                        <div class="color-box">
                                                            <input type="radio" id="skin1" name="skinType"
                                                                class="color-input" value="S1">
                                                            <label for="skin1" class="color-label">건성</label>

                                                            <input type="radio" id="skin2" name="skinType"
                                                                class="color-input" value="S2">
                                                            <label for="skin2" class="color-label">지성</label>

                                                            <input type="radio" id="skin3" name="skinType"
                                                                class="color-input" value="S3">
                                                            <label for="skin3" class="color-label">복합</label>

                                                            <input type="radio" id="skin4" name="skinType"
                                                                class="color-input" value="S4">
                                                            <label for="skin4" class="color-label">민감성</label>
                                                        </div>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;" width="110" height="45px">바디 타입</td>
                                                    <td style="text-align: center;" width="482">
                                                        <div class="color-box">
                                                            <input type="radio" id="body1" name="bodyType"
                                                                class="color-input" value="B1">
                                                            <label for="body1" class="color-label">건성</label>

                                                            <input type="radio" id="body2" name="bodyType"
                                                                class="color-input" value="B2">
                                                            <label for="body2" class="color-label">지성</label>

                                                            <input type="radio" id="body3" name="bodyType"
                                                                class="color-input" value="B3">
                                                            <label for="body3" class="color-label">복합</label>

                                                            <input type="radio" id="body4" name="bodyType"
                                                                class="color-input" value="B4">
                                                            <label for="body4" class="color-label">민감성</label>
                                                        </div>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;" width="110" height="45px">개선 항목</td>
                                                    <td style="text-align: center;" width="482">
                                                        <div class="color-box">
                                                            <input type="checkbox" id="skinImprove1"
                                                                name="skinImprovement" class="color-input" value="주름">
                                                            <label for="skinImprove1" class="color-label">주름</label>

                                                            <input type="checkbox" id="skinImprove2"
                                                                name="skinImprovement" class="color-input" value="미백">
                                                            <label for="skinImprove2" class="color-label">미백</label>

                                                            <input type="checkbox" id="skinImprove3"
                                                                name="skinImprovement" class="color-input" value="각질">
                                                            <label for="skinImprove3" class="color-label">각질</label>

                                                            <input type="checkbox" id="skinImprove4"
                                                                name="skinImprovement" class="color-input" value="트러블">
                                                            <label for="skinImprove4" class="color-label">트러블</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p style="color: #e8618c; margin-left: 10px;">다중 선택</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;" width="110" height="45px">퍼스널 컬러</td>
                                                    <td style="text-align: center;" width="482">
                                                        <div class="color-box">
                                                            <input type="radio" id="spring" name="skinColor"
                                                                class="color-input" value="봄웜">
                                                            <label for="spring" class="color-label">봄웜</label>

                                                            <input type="radio" id="summer" name="skinColor"
                                                                class="color-input" value="여름쿨">
                                                            <label for="summer" class="color-label">여름쿨</label>

                                                            <input type="radio" id="autumn" name="skinColor"
                                                                class="color-input" value="가을웜">
                                                            <label for="autumn" class="color-label">가을웜</label>

                                                            <input type="radio" id="winter" name="skinColor"
                                                                class="color-input" value="겨울쿨">
                                                            <label for="winter" class="color-label">겨울쿨</label>
                                                        </div>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                            <div id="myPageTitle">
                                                <h4 id="Title"
                                                    style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">
                                                    헤어 정보</h4>
                                            </div>
                                            <table style="margin-left: 50px;">
                                                <tr>
                                                    <td style="text-align: left;" width="110" height="45px">헤어 타입</td>
                                                    <td style="text-align: center;" width="482">
                                                        <div class="color-box">
                                                            <input type="radio" id="hair1" name="hairType"
                                                                class="color-input" value="H1">
                                                            <label for="hair1" class="color-label">직모</label>

                                                            <input type="radio" id="hair2" name="hairType"
                                                                class="color-input" value="H2">
                                                            <label for="hair2" class="color-label">곱슬</label>

                                                            <input type="radio" id="hair3" name="hairType"
                                                                class="color-input" value="H3">
                                                            <label for="hair3" class="color-label">탈모</label>

                                                            <input type="radio" id="hair4" name="hairType"
                                                                class="color-input" value="H4">
                                                            <label for="hair4" class="color-label">손상모</label>
                                                        </div>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;" width="110" height="45px">두피 타입</td>
                                                    <td style="text-align: center;" width="482">
                                                        <div class="color-box">
                                                            <input type="radio" id="scalp1" name="scalpType"
                                                                class="color-input" value="HB1">
                                                            <label for="scalp1" class="color-label">건성</label>

                                                            <input type="radio" id="scalp2" name="scalpType"
                                                                class="color-input" value="HB2">
                                                            <label for="scalp2" class="color-label">지성</label>

                                                            <input type="radio" id="scalp3" name="scalpType"
                                                                class="color-input" value="HB3">
                                                            <label for="scalp3" class="color-label">복합</label>

                                                            <input type="radio" id="scalp4" name="scalpType"
                                                                class="color-input" value="HB4">
                                                            <label for="scalp4" class="color-label">민감성</label>
                                                        </div>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;" width="110" height="45px">개선 항목</td>
                                                    <td style="text-align: center;" width="482">
                                                        <div class="color-box">
                                                            <input type="checkbox" id="scalpImprovement1"
                                                                name="scalpImprovement" class="color-input"
                                                                value="탈모예방">
                                                            <label for="scalpImprovement1"
                                                                class="color-label">탈모예방</label>

                                                            <input type="checkbox" id="scalpImprovement2"
                                                                name="scalpImprovement" class="color-input"
                                                                value="모발촉진">
                                                            <label for="scalpImprovement2"
                                                                class="color-label">모발촉진</label>

                                                            <input type="checkbox" id="scalpImprovement3"
                                                                name="scalpImprovement" class="color-input"
                                                                value="두피건강">
                                                            <label for="scalpImprovement3"
                                                                class="color-label">두피건강</label>

                                                            <input type="checkbox" id="scalpImprovement4"
                                                                name="scalpImprovement" class="color-input"
                                                                value="모발건강">
                                                            <label for="scalpImprovement4"
                                                                class="color-label">모발건강</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p style="color: #e8618c; margin-left: 10px;">다중 선택</p>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div id="myPageTitle">
                                                <h4 id="Title"
                                                    style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">
                                                    브랜드</h4>
                                            </div>
                                            <table style="margin-left: 50px;">
                                                <tr>
                                                    <td style="text-align: left;" width="110" height="45px">관심 브랜드</td>
                                                    <td style="text-align: center;" width="482">
                                                        <div class="color-box">
                                                            <input type="checkbox" id="brand1" name="brand"
                                                                class="color-input" value="브랜드 A">
                                                            <label for="brand1" class="color-label">닥터지</label>

                                                            <input type="checkbox" id="brand2" name="brand"
                                                                class="color-input" value="브랜드 B">
                                                            <label for="brand2" class="color-label">클리오</label>

                                                            <input type="checkbox" id="brand3" name="brand"
                                                                class="color-input" value="브랜드 C">
                                                            <label for="brand3" class="color-label">미쟝센</label>

                                                            <input type="checkbox" id="brand4" name="brand"
                                                                class="color-input" value="브랜드 D">
                                                            <label for="brand4" class="color-label">미샤</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p style="color: #e8618c; margin-left: 10px;">다중 선택</p>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div id="myPageTitle">
                                                <h4 id="Title"
                                                    style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">
                                                    공개 범위</h4>
                                            </div>
                                            <table style="margin-left: 50px;">
                                                <tr>
                                                    <td style="text-align: left; vertical-align: middle;" width="110"
                                                        height="45px">공개 여부</td>
                                                    <td style="text-align: center;" width="482">
                                                        <div class="color-box"
                                                            style="display: flex; justify-content: center;">
                                                            <input type="radio" id="public" name="release"
                                                                class="color-input" value="A">
                                                            <label for="public" class="color-label"
                                                                style="width: 161px;">모두
                                                                공개</label>

                                                            <input type="radio" id="friends" name="release"
                                                                class="color-input" value="F">
                                                            <label for="friends" class="color-label"
                                                                style="width: 161px;">친구만 공개</label>

                                                            <input type="radio" id="private" name="release"
                                                                class="color-input" value="N">
                                                            <label for="private" class="color-label"
                                                                style="width: 161px;">비공개</label>
                                                        </div>
                                                    </td>
                                                    <td></td>
                                                </tr>

                                                <tr>
                                                    <td colspan="3"><button type="submit" class="btn-insta-insert"
                                                            style="font-size: large; font-weight: 600; margin-left: 11px;">뷰티프로필수정</button>
                                                    </td>
                                                </tr>
                                            </table>
                                            <script>
                                                $(function () {
                                                    const skinTypeNo = "<%= loginUser.getSkinType() %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function () {

                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if (skinTypeNo.search($(this).val()) != -1) { // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        }
                                                    })
                                                })

                                                $(function () {
                                                    const bodyTypeNo = "<%= loginUser.getBodyType() %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function () {

                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if (bodyTypeNo.search($(this).val()) != -1) { // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        }

                                                    })
                                                })

                                                $(function () {
                                                    const skinList = "<%= loginUser.getSimList() %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=checkbox]").each(function () {

                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if (skinList.search($(this).val()) != -1) { // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        }

                                                    })
                                                })

                                                $(function () {
                                                    const color = "<%= loginUser.getColor() %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function () {

                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if (color.search($(this).val()) != -1) { // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        }

                                                    })
                                                })

                                                $(function () {
                                                    const hairTypeNo = "<%= loginUser.getHairType() %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function () {

                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if (hairTypeNo.search($(this).val()) != -1) { // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        }

                                                    })
                                                })

                                                $(function () {
                                                    const scalpTypeNo = "<%= loginUser.getScalpType() %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function () {

                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if (scalpTypeNo.search($(this).val()) != -1) { // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        }

                                                    })
                                                })

                                                $(function () {
                                                    const scalpList = "<%= loginUser.getHimList() %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=checkbox]").each(function () {

                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if (scalpList.search($(this).val()) != -1) { // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        }

                                                    })
                                                })

                                                $(function () {
                                                    const brandList = "<%= loginUser.getBrandList() %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=checkbox]").each(function () {

                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if (brandList.search($(this).val()) != -1) { // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        }

                                                    })
                                                })

                                                $(function () {
                                                    const release = "<%= loginUser.getMarketingAgree() %>";
                                                    // "" | "1, 2, 3 ..."
                                                    $("input[type=radio]").each(function () {

                                                        // $(this) : 순차적으로 접근되는 체크박스 요소
                                                        // $(this).val() : 해당 체크박스의 value 값
                                                        if (release.search($(this).val()) != -1) { // 그 요소를 찾았다!!
                                                            $(this).attr("checked", true);
                                                        }

                                                    })
                                                })
                                            </script>






                                        </form>
                                        <% } else {%>
                                            <form action="<%= contextPath %>/insert.bp" id="profile-form1"
                                                method="post">
                                                <<input type="hidden" name=userNo class="userNo" maxlength="16"
                                                    value="<%= loginUser.getUserNo() %>">
                                                    <div id="myPageTitle">
                                                        <h4 id="Title"
                                                            style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">
                                                            개인 정보</h4>
                                                    </div>
                                                    <table style="margin-left: 50px;">
                                                        <tr>
                                                            <td style="text-align: left;" width="110">이름</td>
                                                            <td width="480"><input type="text" name="userName"
                                                                    class="userName"
                                                                    value="<%= loginUser.getUserName() %>">
                                                            </td>
                                                        </tr>
                                                        <tr style="margin-bottom: 50px;">
                                                            <td style="text-align: left;">성별</td>
                                                            <% if(loginUser.getGender().equals("M")) { %>
                                                                <td><input type="text" name="gender" value="M" readonly>
                                                                </td>

                                                                <% } else { %>
                                                                    <td><input type="text" name="gender" value="F"
                                                                            readonly>
                                                                    </td>
                                                                    <% } %>
                                                        </tr>
                                                    </table>
                                                    <div id="myPageTitle">
                                                        <h4 id="Title"
                                                            style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">
                                                            피부 정보</h4>
                                                    </div>
                                                    <table style="margin-left: 50px;">
                                                        <tr>
                                                            <td style="text-align: left;" width="110" height="45px">피부
                                                                타입
                                                            </td>
                                                            <td style="text-align: center;" width="482">
                                                                <div class="color-box">
                                                                    <input type="radio" id="skin1" name="skinType"
                                                                        class="color-input" value="S1">
                                                                    <label for="skin1" class="color-label">건성</label>

                                                                    <input type="radio" id="skin2" name="skinType"
                                                                        class="color-input" value="S2">
                                                                    <label for="skin2" class="color-label">지성</label>

                                                                    <input type="radio" id="skin3" name="skinType"
                                                                        class="color-input" value="S3">
                                                                    <label for="skin3" class="color-label">복합</label>

                                                                    <input type="radio" id="skin4" name="skinType"
                                                                        class="color-input" value="S4">
                                                                    <label for="skin4" class="color-label">민감성</label>
                                                                </div>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;" width="110" height="45px">바디
                                                                타입
                                                            </td>
                                                            <td style="text-align: center;" width="482">
                                                                <div class="color-box">
                                                                    <input type="radio" id="body1" name="bodyType"
                                                                        class="color-input" value="B1">
                                                                    <label for="body1" class="color-label">건성</label>

                                                                    <input type="radio" id="body2" name="bodyType"
                                                                        class="color-input" value="B2">
                                                                    <label for="body2" class="color-label">지성</label>

                                                                    <input type="radio" id="body3" name="bodyType"
                                                                        class="color-input" value="B3">
                                                                    <label for="body3" class="color-label">복합</label>

                                                                    <input type="radio" id="body4" name="bodyType"
                                                                        class="color-input" value="B4">
                                                                    <label for="body4" class="color-label">민감성</label>
                                                                </div>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;" width="110" height="45px">개선
                                                                항목
                                                            </td>
                                                            <td style="text-align: center;" width="482">
                                                                <div class="color-box">
                                                                    <input type="checkbox" id="skinImprove1"
                                                                        name="skinImprovement" class="color-input"
                                                                        value="주름">
                                                                    <label for="skinImprove1"
                                                                        class="color-label">주름</label>

                                                                    <input type="checkbox" id="skinImprove2"
                                                                        name="skinImprovement" class="color-input"
                                                                        value="미백">
                                                                    <label for="skinImprove2"
                                                                        class="color-label">미백</label>

                                                                    <input type="checkbox" id="skinImprove3"
                                                                        name="skinImprovement" class="color-input"
                                                                        value="각질">
                                                                    <label for="skinImprove3"
                                                                        class="color-label">각질</label>

                                                                    <input type="checkbox" id="skinImprove4"
                                                                        name="skinImprovement" class="color-input"
                                                                        value="트러블">
                                                                    <label for="skinImprove4"
                                                                        class="color-label">트러블</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <p style="color: #e8618c; margin-left: 10px;">다중 선택</p>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;" width="110" height="45px">퍼스널
                                                                컬러
                                                            </td>
                                                            <td style="text-align: center;" width="482">
                                                                <div class="color-box">
                                                                    <input type="radio" id="spring" name="skinColor"
                                                                        class="color-input" value="봄웜">
                                                                    <label for="spring" class="color-label">봄웜</label>

                                                                    <input type="radio" id="summer" name="skinColor"
                                                                        class="color-input" value="여름쿨">
                                                                    <label for="summer" class="color-label">여름쿨</label>

                                                                    <input type="radio" id="autumn" name="skinColor"
                                                                        class="color-input" value="가을웜">
                                                                    <label for="autumn" class="color-label">가을웜</label>

                                                                    <input type="radio" id="winter" name="skinColor"
                                                                        class="color-input" value="겨울쿨">
                                                                    <label for="winter" class="color-label">겨울쿨</label>
                                                                </div>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                    <div id="myPageTitle">
                                                        <h4 id="Title"
                                                            style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">
                                                            헤어 정보</h4>
                                                    </div>
                                                    <table style="margin-left: 50px;">
                                                        <tr>
                                                            <td style="text-align: left;" width="110" height="45px">헤어
                                                                타입
                                                            </td>
                                                            <td style="text-align: center;" width="482">
                                                                <div class="color-box">
                                                                    <input type="radio" id="hair1" name="hairType"
                                                                        class="color-input" value="H1">
                                                                    <label for="hair1" class="color-label">직모</label>

                                                                    <input type="radio" id="hair2" name="hairType"
                                                                        class="color-input" value="H2">
                                                                    <label for="hair2" class="color-label">곱슬</label>

                                                                    <input type="radio" id="hair3" name="hairType"
                                                                        class="color-input" value="H3">
                                                                    <label for="hair3" class="color-label">탈모</label>

                                                                    <input type="radio" id="hair4" name="hairType"
                                                                        class="color-input" value="H4">
                                                                    <label for="hair4" class="color-label">손상모</label>
                                                                </div>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;" width="110" height="45px">두피
                                                                타입
                                                            </td>
                                                            <td style="text-align: center;" width="482">
                                                                <div class="color-box">
                                                                    <input type="radio" id="scalp1" name="scalpType"
                                                                        class="color-input" value="HB1">
                                                                    <label for="scalp1" class="color-label">건성</label>

                                                                    <input type="radio" id="scalp2" name="scalpType"
                                                                        class="color-input" value="HB2">
                                                                    <label for="scalp2" class="color-label">지성</label>

                                                                    <input type="radio" id="scalp3" name="scalpType"
                                                                        class="color-input" value="HB3">
                                                                    <label for="scalp3" class="color-label">복합</label>

                                                                    <input type="radio" id="scalp4" name="scalpType"
                                                                        class="color-input" value="HB4">
                                                                    <label for="scalp4" class="color-label">민감성</label>
                                                                </div>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;" width="110" height="45px">개선
                                                                항목
                                                            </td>
                                                            <td style="text-align: center;" width="482">
                                                                <div class="color-box">
                                                                    <input type="checkbox" id="scalpImprovement1"
                                                                        name="scalpImprovement" class="color-input"
                                                                        value="탈모예방">
                                                                    <label for="scalpImprovement1"
                                                                        class="color-label">탈모예방</label>

                                                                    <input type="checkbox" id="scalpImprovement2"
                                                                        name="scalpImprovement" class="color-input"
                                                                        value="모발촉진">
                                                                    <label for="scalpImprovement2"
                                                                        class="color-label">모발촉진</label>

                                                                    <input type="checkbox" id="scalpImprovement3"
                                                                        name="scalpImprovement" class="color-input"
                                                                        value="두피건강">
                                                                    <label for="scalpImprovement3"
                                                                        class="color-label">두피건강</label>

                                                                    <input type="checkbox" id="scalpImprovement4"
                                                                        name="scalpImprovement" class="color-input"
                                                                        value="모발건강">
                                                                    <label for="scalpImprovement4"
                                                                        class="color-label">모발건강</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <p style="color: #e8618c; margin-left: 10px;">다중 선택</p>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div id="myPageTitle">
                                                        <h4 id="Title"
                                                            style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">
                                                            브랜드</h4>
                                                    </div>
                                                    <table style="margin-left: 50px;">
                                                        <tr>
                                                            <td style="text-align: left;" width="110" height="45px">관심
                                                                브랜드
                                                            </td>
                                                            <td style="text-align: center;" width="482">
                                                                <div class="color-box">
                                                                    <input type="checkbox" id="brand1" name="brand"
                                                                        class="color-input" value="브랜드 A">
                                                                    <label for="brand1" class="color-label">브랜드
                                                                        A</label>

                                                                    <input type="checkbox" id="brand2" name="brand"
                                                                        class="color-input" value="브랜드 B">
                                                                    <label for="brand2" class="color-label">브랜드
                                                                        B</label>

                                                                    <input type="checkbox" id="brand3" name="brand"
                                                                        class="color-input" value="브랜드 C">
                                                                    <label for="brand3" class="color-label">브랜드
                                                                        C</label>

                                                                    <input type="checkbox" id="brand4" name="brand"
                                                                        class="color-input" value="브랜드 D">
                                                                    <label for="brand4" class="color-label">브랜드
                                                                        D</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <p style="color: #e8618c; margin-left: 10px;">다중 선택</p>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div id="myPageTitle">
                                                        <h4 id="Title"
                                                            style="margin-left: 33px; margin-top: 50px; margin-bottom: 20px; font-size: medium; text-decoration: underline;">
                                                            공개 범위</h4>
                                                    </div>
                                                    <table style="margin-left: 50px;">
                                                        <tr>
                                                            <td style="text-align: left; vertical-align: middle;"
                                                                width="110" height="45px">공개 여부</td>
                                                            <td style="text-align: center;" width="482">
                                                                <div class="color-box"
                                                                    style="display: flex; justify-content: center;">
                                                                    <input type="radio" id="public" name="release"
                                                                        class="color-input" value="A">
                                                                    <label for="public" class="color-label"
                                                                        style="width: 161px;">모두 공개</label>

                                                                    <input type="radio" id="friends" name="release"
                                                                        class="color-input" value="F">
                                                                    <label for="friends" class="color-label"
                                                                        style="width: 161px;">친구만 공개</label>

                                                                    <input type="radio" id="private" name="release"
                                                                        class="color-input" value="N">
                                                                    <label for="private" class="color-label"
                                                                        style="width: 161px;">비공개</label>
                                                                </div>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"><button type="submit"
                                                                    class="btn-insta-insert"
                                                                    style="font-size: large; font-weight: 600px; margin-left: 11px;">뷰티프로필저장</button>
                                                            </td>
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
                                    <pre
                                        align="left">                                                                                                                       </pre>
                                </div>
                                <br>
                                <h3 style="text-decoration: underline;">회원 탈퇴 유의 사항</h3>
                                <p style="display: inline;">사용하고 계신 현재 아이디는 탈퇴할 경우
                                <p style="display: inline; color: red; font-size: 25px;">복구가 불가능합니다.</p>
                                <br><br>
                                <!-- 비밀번호 입력 -->
                                <div class="userId-container">
                                    <label for="userId">아이디 입력</label>
                                    <input name="userId" type="text" placeholder="아이디 입력">
                                </div>
                                <div class="password-container">
                                    <label for="password">비밀번호 입력</label>
                                    <input name="userPwd" type="password" id="password" placeholder="비밀번호 입력">
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
                            // ✅ 프로필 수정 모달 열기
                            $("#userprofile, #openProfileModal").click(function () {
                                $("#profileModal").fadeIn();
                            });

                            // ✅ 프로필 수정 모달 닫기 (X 버튼 클릭 시)
                            $(".close-profile").click(function () {
                                $("#profileModal").fadeOut();
                            });

                            // ✅ 프로필 수정 모달 바깥 클릭 시 닫기 (모달의 외부를 클릭한 경우에만)
                            $(window).click(function (e) {
                                // 클릭된 영역이 #profileModal(배경)일 경우만 모달을 닫도록 처리
                                if ($(e.target).is("#profileModal")) {
                                    $("#profileModal").fadeOut();
                                }
                            });

                            // 프로필 수정 모달 내용 클릭 시에는 닫히지 않도록 방지
                            $(".profile-modal-content").click(function (e) {
                                e.stopPropagation(); // 이벤트 전파를 막아서 모달 내용 클릭 시 닫히지 않도록
                            });
                        });

                        // 모달 내용 클릭 시 바깥 클릭 이벤트가 발생하지 않도록 처리
                        $(".profile-modal-content").click(function (e) {
                            e.stopPropagation(); // 이벤트 버블링을 막아 모달 내용 클릭 시 모달 닫히지 않게 함
                        });

                        // 🔥 회원 탈퇴 모달 관련 코드는 손대지 않음! 🔥
                        $("#openModal").click(function (e) {
                            e.preventDefault();
                            $("#deleteModal").fadeIn();
                        });

                        $(".close-btn").click(function () {
                            $("#deleteModal").fadeOut();
                        });

                        $(window).click(function (e) {
                            if ($(e.target).is("#deleteModal")) {
                                $("#deleteModal").fadeOut();
                            }
                        });
                    </script>

                    <script>
                        function idCheck() {
                            const $idInput = $("#userId");


                            $.ajax({
                                url: "idCheck.me",
                                data: { checkId: $idInput.val() },
                                success: function (result) {
                                    console.log(result);

                                    if (result == 'NNNNN') {
                                        alert("중복된 아이디입니다")
                                        $idInput.focus();
                                    } else {
                                        if (confirm("사용가능한 아이디입니다. 사용하시겠습니까?")) {
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
                                complete: function () { },
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