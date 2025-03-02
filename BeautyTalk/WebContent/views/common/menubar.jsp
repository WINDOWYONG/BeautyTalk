<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
    
        div,input{box-sizing: border-box;}
        .wrap{width: 1400px; height: 800px; margin: auto;}
    
        #header{width: 100%; height: 10%;}
    
        /* #header, #header1, #header2, #header3{
            border: 1px solid red;
        } */
    
        #header>div{height: 100%; float: left; box-sizing: border-box;}
    
        #header1{width: 20%;}
        #header2{width: 60%;}
        #header3{width: 20%;}
    
        #header1 {
        width: 20%;
        display: flex;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center; /* 가로 중앙 정렬 */
        }
    
        #header1 img {
            height: 100%; /* 부모 div의 높이에 맞게 */
            object-fit: contain; /* 이미지 비율 유지하면서 축소 */
        }
    
        #header_2{position: relative;}
    
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
    
    </style>
    </head>
    <body>
        <div class="wrap">
    
            <div id="header">
        
                <div id="header1">
                    <img src="../assets/image2/bono.jpg" alt="로고">
                </div>
            
                <div id="header2">
                    <form action="" id="search_form">
                        <div id="search_text">
                            <input type="text" name="keyword" placeholder="검색 키워드를 입력하세요.">
                        </div>
                        <div id="search_btn">
                            <input type="submit" value="Search">
                        </div>
        
                </div>
            
                <div id="header3">
                    <div id="header3_top">
                        <a href=""><img src="../assets/image2/reply.png" alt="메시지"></a>
                        <a href=""><img src="../assets/image2/alert.png" alt="알림"></a>
                        <a href="">로그아웃</a>
                        <span>|</span>
                        <a href="">마이페이지</a>
                    </div>
                    <div id="header3_bottom">
                        <span class="username"><strong>차은우</strong><strong>님</strong>,</span>
                        <span>환영합니다!</span>
                        <a href=""><img src="../assets/image2/eunwoo.png" alt="프로필 사진"></a>
                    </div>
                </div>
        
            </div>
    
        </div>
    
    </body>
    </html>