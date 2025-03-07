<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
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
        * {
            box-sizing: border-box;
        }
        #bnavigator{
            position: relative;
            width: 100%;
            min-width: 1020px;
            height: 47px;
            background: #fff;
            border-top: 1px solid #ddd;
            border-bottom: 2px solid palevioletred;
            z-index: 10;
        }
        
        #navigator {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 1020px;
            margin: 0 auto;
            position: relative;
        }
        
        #category{
            display: flex;
            align-items: center;
            gap: 5px;
            width: 120px;
            height: 44px;
            padding-left: 10px;
            line-height: 44px;
            color: black;
            font-size: 15px;
            font-weight: 700;
            text-align: left;
            text-decoration: none;
            transition: background 0.3s ease, color 0.3s ease;
        }

        #category:hover {
            background: palevioletred;
            color: white;
        }

        .category-menu{
            position: absolute;
            top: 29px;
            left: 75px;
            width: 120px;
            background: white;
            border: 1px solid palevioletred;
            display: none;
            padding: 10px;
            z-index: 100;

        }

        .category-menu a{
            display: block;
            padding: 8px 12px;
            text-decoration: none;
            color: black;
            transition: background 0.3s ease, color 0.3s ease;
        }

        .category-menu a:hover{
            background: palevioletred;
            color: white;
        }
        
        #navi {
            margin-left: auto;
            display: flex;
            justify-content: flex-end;
            list-style: none;
            margin: 0;
            padding: 0;
        }
        
        #navi>li{
            width: 150px;
            text-align: center;
        }
        
        #navi a{
            text-decoration: none;
            color: black;
            font-size: 15px;
            font-weight: 900;
            display: block;
            width: 100%;
            height: 100%;
            line-height: 44px;
        }

        #navi a:hover{
            color: palevioletred;
        }

        .category-menu>li{
            list-style: none;
        }
        .content{
            width: 1020px;
            height: 100%;
            margin: 0 auto;
        }
        .main_banner{
            width: 100%;
            height: 450px;
            position: relative;
            float: left;
            display: block;
        }
        .banner_link{
            height: 450px;
        }
        .img_content{
            margin: 0 auto;
            box-sizing: border-box;
            position: absolute;
            width: 100%;
            height: 450px

            
        }
        .banner_link{
            text-decoration: none;
            height: 450px;
            width: 100%;
            color: #666;
            margin: 0;
            padding: 0;
            border: 0;
            display: block;
        }

<!-- best user -->
    #form_bestUser{
        width: 100%;
        height: 300px;
    }

    #table_bestUser{
        /* background-color: black; */
        width: 1100px;
        height: 330px;
        margin: auto;
        margin-top: 50px;
        box-sizing: border-box;
    }

    /* #table_bestUser td{
        border: 1px solid white;
        color:white;
    } */

    .prev_bestUser, .bestpost1_bestUser, .bestpost2_bestUser, .bestpost3_bestUser, .bestpost4_bestUser, .next_bestUser{
        cursor: pointer;
    }

<!-- best post -->
    #form_bestPost{
        width: 100%;
        height: 300px;
    }

    #table_bestPost{
        /* background-color: black; */
        width: 1100px;
        height: 330px;
        margin: auto;
        margin-top: 50px;
        box-sizing: border-box;
    }

    #table_bestPost td{
        border: 1px solid white;
        color:black;
    }

    .bestpost1_bestPost, .bestpost2_bestPost, .bestpost3_bestPost{
        cursor: pointer;
    }
<!-- footer -->
    #footer_footer{}

	#form_footer{
        background-color: black;
        width: 1100px;;
        height: 280px;
        margin: auto;
	}

    /* #table_footer td{
        border: 1px solid white;
    } */
	
    #table_footer{
        color: white;
        width: 1000px;
       	height: 280px;
        box-sizing: border-box;
        padding: 10px;
        font-size: 14px;
        font-style: normal;
        font-weight: 600;
    }

    .logo1_footer{background-image: url("resources/images/LOGO.jpg");}
    .kakao_footer{background-image: url("resources/images/kakao_logo.png");}
    .facebook_footer{background-image: url("resources/images/Facebook_logo.png");}
    .instar_footer{background-image: url("resources/images/Instar_logo.png");}
    .youtube_footer{background-image: url("resources/images/Youtube_logo.png");}

    .logo1_footer{
        width: 100%;
        background-position: center;
        background-repeat: no-repeat;
        background-size: contain;
    }
    .kakao_footer, .facebook_footer, .instar_footer, .youtube_footer{
        width: 50px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: contain;
    }


</style>
</head>
<body>
    <div class="wrap">
    
        <div id="header">
    
            <div id="header1">
                <img src="../../resources/images/현존최강로고.jpg" alt="로고">
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

                    <a href=""><img src="../../resources/images/2.PNG" alt="메시지"></a>
                    <a href=""><img src="../../resources/images/3.PNG" alt="알림"></a>
                    <a href="">로그아웃</a>
                    <span>|</span>
                    <a href="<%= contextPath %>/view/member/memberEnrollForm.jsp">마이페이지</a>
                </div>
                <div id="header3_bottom">
                    <span class="username"><strong>차은우</strong><strong>님</strong>,</span>
                    <span>환영합니다!</span>
                    <a href=""><img src="../assets/image2/eunwoo.png" alt="프로필 사진"></a>
                </div>
            </div>
    
        </div>

    </div>

    <div id="bnavigator">
        <div id="navigator">
            <a href="#" id="category">☰ 카테고리</a>
            <ul class="category-menu">
                <li><a href="skincare.html">스킨케어</a></li>
                <li><a href="makeup.html">메이크업</a></li>
                <li><a href="haircare.html">헤어케어</a></li>
            </ul>
            <ul id="navi">
                <li><a href="index.html">HOME</a></li>
                <li><a href="reviews.html">Reviews</a></li>
                <li><a href="posts.html">Posts</a></li>
                <li><a href="people.html">People</a></li>
                <li><a href="ranking.html">상품 랭킹</a></li>
            </ul>
        </div>
    </div>
        <div class="content">
            <div class="main_banner">
                <a href="" class="banner_link">
                    <img class="img_content" src="../../resources/images/mainbaner.png" alt=""></div>
                </a>
            </div>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        const categoryBtn = document.querySelector("#category");
        const categoryMenu = document.querySelector(".category-menu");
      
        categoryBtn.addEventListener("click", function (event) {
          event.preventDefault();
          categoryMenu.style.display = categoryMenu.style.display === "block" ? "none" : "block";
        });
      
        document.addEventListener("click", function (event) {
          if (!categoryBtn.contains(event.target) && !categoryMenu.contains(event.target)) {
            categoryMenu.style.display = "none";
          }
        });
      });
    </script>

<!-- best user -->
    <form action="" id="form_bestUser" method="">
        <table id="table_bestUser">
            <tr>
                <td></td>
                <td colspan="7" align="center" style="height: 130px; color: black;"><h1>Today's Best User</h1></td>
                <td></td>
            </tr>
            <tr>
                <td class="prev_bestUser" onclick="location.href='http://www.naver.com'">
                    <img src="resources/images/prevlogo.png">
                </td>

                <td class="user1_bestUser" style="height: 170px;">
                    <img src="resources/images/bestuser1.png">
                </td>
                <td></td>
                <td class="user2_bestUser" style="height: 170px;">
                    <img src="resources/images/bestuser2.png">
                </td>
                <td></td>

                <td class="user3_bestUser" style="height: 170px;">
                    <img src="resources/images/bestuser3.png">
                </td>
                <td></td>
                <td class="user4_bestUser" style="height: 170px;">
                    <img src="resources/images/bestuser4.png">
                </td>
                <td class="next_bestUser" onclick="location.href='http://www.yahoo.co.jp'">
                    <img src="resources/images/nextlogo.png">
                </td>
            </tr>
        </table>
    </form>

<!-- best post -->
    <form id="form_bestPost">
        <table id="table_bestPost">
            <tr>
                <td colspan="7" Style="color: black;" align="center"><h1>Best Post</h1></td>






            </tr>
            <tr>
                <td colspan="7" Style="color: gray;" align="center">뷰티 고수들의 찐 노하우 공개!</td>






            </tr>
            <tr>
                <td style="width: 80px;"></td>
                <td class="bestpost1_bestPost" onclick="location.href='http://yahoo.co.jp'" style="width: 300px; height: 200px;">
                    <img src="resources/images/bestpost1.png">
                </td>
                <td style="width: 20px;"></td>
                <td class="bestpost2_bestPost" onclick="location.href='http://www.naver.com'" style="width: 300px; height: 200px;">
                    <img src="resources/images/bestpost2.png">
                </td>
                <td style="width: 20px;"></td>
                <td class="bestpost3_bestPost" onclick="location.href='http://www.daum.net'" style="width: 300px; height: 200px;">
                    <img src="resources/images/bestpost3.png">
                </td>
                <td style="width: 80px;"></td>
            </tr>
            <tr>
                <td></td>
                <td style="padding: 10px;">Minsco 민스코</td>
                <td></td>
                <td style="padding: 10px;">안다 ANDA</td>
                <td></td>
                <td style="padding: 10px;">Jessica Vu</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td style="padding: 10px;">8천원대❓두겹광택❓ NEW 롬앤 더 쥬시 래스팅 틴트 23컬러 리뷰 (리뉴얼 포인트, 신컬러 5가지)</td>
                <td></td>
                <td style="padding: 10px;">인스타 셀럽st 쿨톤 핑크 메이크업🎀🖤 | 데일리 쿨톤템 한가득 추천🛒</td>
                <td></td>
                <td style="padding: 10px;">Chic Soft Glam Makeup 🦢 #grwm</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td style="padding: 10px;">
                    날짜, 좋아요 수
                </td>
                <td></td>
                <td style="padding: 10px;">
                    날짜, 좋아요 수
                </td>
                <td></td>
                <td style="padding: 10px;">
                    날짜, 좋아요 수
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="7" align="center">
                    <button type="button" onclick="location.href='http://www.naver.com/'">더보기</button>
                </td>






            </tr>

        </table>

    </form>

<!-- footer -->
    <footer id="footer_footer">
        <form action="" id="form_footer" method="">
            <table id="table_footer" style="text-align: left;">
                <tr>
                    <td rowspan="4" style="width: 30%;" class="logo1_footer"></td>
                    
                    <td style="width: 15%; height: 30%; padding: 5px; ">뷰티톡 소개</td>
                    <td style="width: 15%; padding: 5px;">이용 약관</td>
                    <td style="width: 15%; padding: 5px;">개인정보처리방침</td>
                    <td style="width: 15%; padding: 5px;">고객 지원</td>
                    <td style="width: 50px;"></td>
                    <td style="width: 50px;"></td>
                    <td style="width: 50px;"></td>
                    <td style="width: 50px;"></td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 25%; padding: 5px; ">email: beautytalk@abcd.com</td>

                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    
                    <td style="height: 25%; padding: 5px;">tel: 02-123-4567</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">© 2025 Brand, Inc. • Privacy • Terms • Sitemap</td>


                    <td class="kakao_footer"></td>
                    <td class="facebook_footer"></td>
                    <td class="instar_footer"></td>
                    <td class="youtube_footer"></td>
                </tr>
            </table>
        </form>
    </footer>
	
</body>
</html>