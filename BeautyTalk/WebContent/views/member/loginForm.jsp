<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
    .outer {
        width: 100%;
        height: 100%;
        margin: auto;
        background-color: #fff;
        border-radius: 10px;
        text-align: center;
        display: block;
    }

    h2 {
        margin: auto;
    }

    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 8px 0;
        border: 1px solid #ddd;
        border-radius: 30px;
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

    .btn-kakao {
        background-color: #FEE500;
        color: black;
    }

    .btn-insta {
        background-color: #FF007F;
        color: white;
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

    #login-etc a{
        text-decoration: none;
        color: black;
    }
    


    .inner{
        height: 2000px;
        width: 500px;
        margin: auto;
        margin-top: 50px;
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
		<br><br><br><br><br>
		

        <div class="outer">
            <div class="inner">
            <h2>로그인</h2>
            
            <form action="" id="login-form" method="post">
                <input type="text" name="userId" id="userId" minlength="6" maxlength="15" placeholder="아이디를 입력하세요. (6자 이상 15자 이내)" required>
                <div class="error-message" id="userIdError">아이디는 최소 6자 이상 입력해야 합니다.</div>

                <input type="password" name="userPwd" id="userPwd" minlength="8" maxlength="16" placeholder="비밀번호를 입력하세요. (8~16자, 영문+숫자+특수문자)" required>
                <div class="error-message" id="userPwdError">비밀번호는 최소 8자 이상 입력해야 합니다.</div>
                
                <div style="text-align: left; margin-top: 10px;">
                    <input type="checkbox" name="rememId" id="rememId">
                    <label for="rememId">아이디 저장</label>
                </div>

                <button type="submit" class="btn btn-login">로그인</button>
            </form>

            <br>
            <button type="button" class="btn btn-kakao">
                <img src="resources/images/kakao.png" alt="Kakao"> 카카오톡 로그인
            </button>

            <button type="button" class="btn btn-insta">
                <img src="resources/images/Instagram.png" alt="Instagram"> 인스타그램 로그인
            </button>

            <br>

            <div id="login-etc">
                <a href="">아이디 찾기</a>
                <span>|</span>
                <a href="">비밀번호 찾기</a>
                <span>|</span>
                <a href="">회원가입</a>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            // 저장된 아이디가 있으면 자동 입력
            let savedUserId = localStorage.getItem("savedUserId");
            if (savedUserId) {
                $("#userId").val(savedUserId);
                $("#rememId").prop("checked", true);
            }

            // 로그인 폼 제출 이벤트
            $("#login-form").submit(function(event) {
                let userId = $("#userId").val();
                let userPwd = $("#userPwd").val();
                let isValid = true;

                // 아이디 최소 길이 확인
                if (userId.length < 6) {
                    $("#userIdError").show();
                    isValid = false;
                } else {
                    $("#userIdError").hide();
                }

                // 비밀번호 최소 길이 확인
                if (userPwd.length < 8) {
                    $("#userPwdError").show();
                    isValid = false;
                } else {
                    $("#userPwdError").hide();
                }

                // 최소 길이를 충족하지 않으면 제출 방지
                if (!isValid) {
                    event.preventDefault();
                } else {
                    // 아이디 저장 여부 확인
                    if ($("#rememId").is(":checked")) {
                        localStorage.setItem("savedUserId", userId); // 아이디 저장
                    } else {
                        localStorage.removeItem("savedUserId"); // 저장된 아이디 삭제
                    }
                }
            });
        });
    </script>

</body>
</html>
