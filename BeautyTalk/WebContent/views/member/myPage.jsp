<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

    #Content1{
        height: auto;
        width: 100%;
        min-width: 1020px;
        margin: auto;
        margin-top: 50px;
    }
    #Content2{
        width: 1020px;
        overflow: hidden;
        margin: auto;

    }
    #Content3{
        width: 1020px;
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
        width: 450px


    }
    #userImg{
        height: 70px;
        width: 70px
        
    }
    #userprofile{
    	border-radius: 100%;
        height: 100%;
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
    table td>a{
        text-decoration: none;
        color: rgb(199, 192, 182);
    }

    #userInfo tr{
        float: left;
    }
    #userBoard {
        display: flex;
        text-align: left;
        width: 50%;
        gap: 20px;
        position: relative;
        border-bottom: 2px solid #ddd;
        padding-bottom: 5px;
    }
    .tab {
        font-size: 16px;
        font-weight: bold;
        color: gray;
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
</style>
<body>
	<%@ include file="../common/header.jsp" %>
	
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
            <div>
                
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
</body>
</html>