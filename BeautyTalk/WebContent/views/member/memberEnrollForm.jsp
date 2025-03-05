<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    div,input{box-sizing: border-box;}
    .wrap{width: 1100px; height: 120px; margin: auto;}

    img{
        width: 100%;
    }

    #header{width: 100%; height: 100%;}

    /* #header, #header1, #header2, #header3{
        border: 1px solid red;
    } */

    #header>div{height: 100%; float: left; box-sizing: border-box;}

    #header1{height: 100%;width: 20%;}
    #header2{height: 100%;width: 60%;}
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

    .member{
        margin: 0 auto;
        margin-top: 100px;
        height: 800px;
        width: 600px;
    }
    </style>
</head>



<body>

		<%@ include file="../common/header.jsp" %>

        <div class="member">
            <br><br>
            <h1 align="center" style="color: #E8618C; text-decoration:underline">Beauty Talk</h1>

            <form id="enroll-form" action="<%= contextPath %>/insert.me" method="post">

                <table>
                    <tr>
                        <td>* 아이디</td>
                        <td><input type="text" name="userId"></td>
                        <td></td>
                    </tr>
                </table>
            </form>
            </div>
        </div>

</body>
</html>