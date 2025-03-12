<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<style>

    #Content1{
        height: auto;
        width: 100%;
        min-width: 1200px;
        margin: auto;
        margin-top: 100px;
    }
    #Content2{
        width: 1200px;
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
        width: 400px;
        margin-bottom: 50px;
    }
    #Content3 div{
        float: left;
        text-align: center;
    }
    #Content4{
        width: 1200px;
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
        width: 670px;
    }
    #userImg{
        height: 70px;
        width: 70px
        
    }
    #userprofile{
    	border-radius: 100%;
        height: 100%;
        width: 100%;
    }
    
    #Content2 div{
        float: left;
        margin: auto;
        margin: 10px;
        
    }
    #userName *{
        margin: 0;
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
        width: 330px;
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
        color: #ddd;
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
        width: 450px;
        padding: 12px;
        margin: 0;
        border: 1px solid #ddd;
        border-radius: 7px;
        font-size: 13px;
        box-sizing: border-box;
    }

    .btn {
        width: 100%;
        padding: 12px;
        margin: 8px 0;
        border: none;
        border-radius: 30px;
        font-size: 16px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .btn-login {
        background-color: #000;
        color: white;
    }

    .btn-kakao-insert {
        background-color: #FEE500;
        color: black;
    }

    .btn-insta-insert {
        background-color: #e8618c;
        color: white;
        width: 500px;
        height: 40px;
        border-radius: 7px;
        margin-top: 40px;
    }
    .check{
        background-color: #e8618c;
        color: white;
        width: 80px;
        height: 40px;
        border-radius: 7px;
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
        margin-top: 50px;
        align-content: center;
    }

</style>
<body>
	<%@ include file="../common/header.jsp" %>
    <br>
	
	    <div id="Content1">
            <div id="Content2">
                <div id="userImg">
                    <img id="userprofile" src="<%= contextPath %>/resources/userImage/변우석.jpg" alt="유저이미지">
                </div>
                <div id="userName">
                    <h2>userName</h2>
                    <span style="font-size: x-small;">사용자 아이디</span>
                </div>
            </div>
            <div id="Content3">
                <table>
                    <tr>
                        <td>post</td>
                        <td>Review</td>
                        <td>Follows</td>
                        <td>Following</td>
                    </tr>
                    <tr >
                        <td style="font-weight: 800; font-size: medium;">포스트수</td>
                        <td style="font-weight: 800; font-size: medium;">리뷰수</td>
                        <td style="font-weight: 800; font-size: medium;">팔로우수</td>
                        <td style="font-weight: 800; font-size: medium;">팔로잉수</td>
                    </tr>
                </table>
                <div id="userBoard">
                    <div class="tab" onclick="Animation()">post</div>
                    <div class="tab">Review</div>
                    <div class="tab">Beauty Profile</div>
                    <div class="underline"></div>
                </div>

            </div>
            <div id="Content4">
                <div id="Content5">
                    <div>
                        <span class="material-icons" style="font-size: 30px;">person
                        <span style="font-size:25px;">마이페이지</span>
                    </div>
                    
                    <div>
                        
                    </div>
                    <div>
                        <h2>내정보</h2>
                    </div>
                    <div>
                        <a href="">회원정보 수정</a>
                    </div>
                    <div>
                        <a href="<%= contextPath %>/delete.me">회원탈퇴</a>
                    </div>
                    <div>
                        <a href="">왓츠인 마이백</a>
                    </div>
                    <div>
                        <a href="">뷰티캘린더</a>
                    </div>
                    <div>
                        <a href="">알림내역</a>
                    </div>
                    <div>
                        <a href=" "></a>
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
                    <div id="myPageTitle">
                        <h2 id="Title">회원정보</h2>
                    </div>
                    <div id="line">
                        <pre align="left">                                                                                                                                     </pre>
                    </div>
                    <div id="update">
                        <table>
                            <form action="<%= contextPath %>/insert.me" id="insert-form" method="post"></form>
                                <tr>
                                    <td style="text-align: left;">이름</td>
                                    <td><input type="text" name="userId" id="userId" minlength="6" maxlength="15" placeholder="아이디를 입력하세요. (6자 이상 15자 이내)" required></td>
                                    <td><button class="check" style="">중복확인</button></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;">아이디</td>
                                    <td><input type="text" name="userName" id="userName" maxlength="16" placeholder="이름을 입력하세요." required value=""></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;">비밀번호</td>
                                    <td><input type="text" name="email" id="email" minlength="8" maxlength="20" placeholder="이메일을 입력하세요." required value=""></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;">이메일</td>
                                    <td><input type="text" name="userId" id="userId" minlength="6" maxlength="15" placeholder="아이디를 입력하세요. (6자 이상 15자 이내)" required></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;">닉네임</td>
                                    <td><input type="text" name="nickName" id="nickName" minlength="2" maxlength="10" placeholder="닉네임을 입력하세요" required></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;">생년월일</td>
                                    <td><input type="text" name="birthDate" id="birthDate" minlength="8" maxlength="8" placeholder="생년월일 ex) 19990812" required value=""></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;">휴대전화번호</td>
                                    <td><input type="text" name="phone" id="phone" minlength="8" maxlength="11" placeholder="휴대전화번호 ex) 01011112222" required value=""></td>
                                </tr>
                                <tr>
                                    <td><td><button type="submit" class="btn-insta-insert" style="font-size: large; font-weight: 600;">회원정보수정</button></td></td>
                                </tr>
                            </form>
                        </table>
                    </div>
                </div>
                
            </div>
        </div>
        <!--
        <input type="password" name="userPwd" id="userPwd" minlength="8" maxlength="16" placeholder="비밀번호를 입력하세요. (8~16자, 영문+숫자+특수문자)" required>
                        
                
        <input type="text" name="userName" id="userName" maxlength="16" placeholder="이름을 입력하세요." required value="">


        <input type="text" name="email" id="email" minlength="8" maxlength="20" placeholder="이메일을 입력하세요." required value="">


        <input type="text" name="nickName" id="nickName" minlength="2" maxlength="10" placeholder="닉네임을 입력하세요" required>


        <input type="text" name="birthDate" id="birthDate" minlength="8" maxlength="8" placeholder="생년월일 ex) 19990812" required value="">



        <input type="text" name="phone" id="phone" minlength="8" maxlength="11" placeholder="휴대전화번호 ex) 01011112222" required value="">
        -->
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
</body>
</html>