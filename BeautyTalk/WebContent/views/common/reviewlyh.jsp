<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    * {
        /* border: 1px solid black; */
    }

    #form_review1{
        width: 1100px;
        height: auto;
        margin: auto;
        display: flex;
    }
    
    #table_my_review1{
        border: 1px solid gray;
        border-radius: 15px;
        width: 200px;
        height: 100px;
        box-sizing: border-box;
        padding: 10px;
    }

    #table_my_review2{
        width: 900px;
        height: auto;
        box-sizing: border-box;
        margin-left: 100px;
        padding: 20px;
    }

    #table_my_review2>tr>td{
        width: 20px;
    }

    #review_img1{
        width: 30px;
        height: 30px;
    }

    .td_review1{
        cursor: pointer;
    }

    .review_img2 {
        width: 250px;
        height: 250px;
        cursor: pointer;
    }




</style>
</head>
<body>
	
	<form id="form_review1"> 
        <table id="table_my_review1" align="left">
            <br>
            <tr>
                <th id="review_img1" style="border-bottom: 1px solid gray;">
                    <img src="resources/images/3" alt="">
                     <span>
                        마이페이지
                    </span>
                </th>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td><b>내 정보</b></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'"><pre >  회원정보수정</pre></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'"><pre>  회원탈퇴</pre></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'"><pre>  왓츠 인 마이 백</pre></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'"><pre>  뷰티 캘린더</pre></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'"><pre>  알림내역</pre></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'" style="border-bottom: 1px solid gray;"><pre>  팔로워</pre></td>
            </tr>

            <tr>
                <td><b>문의/공지사항</b></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'"><pre>  문의 내역</pre></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'"><pre>  1:1 문의하기</pre></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'" style="border-bottom: 1px solid gray;"><pre>  공지사항</pre></td>
            </tr>

            <tr>
                <td><b>댓글</b></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'" td style="border-bottom: 1px solid gray;"><pre>  댓글내역</pre></td>
            </tr>

            <tr>
                <td><b>신고</b></td>
            </tr>

            <tr>
                <td class="td_review1" onclick="location.href='https://www.daum.net/'"><pre>  신고 내역</pre></td>
            </tr>

        </table>
        <table id="table_my_review2" align="left">
            <tr>
                <td colspan="2">
                    <input type="text" style="width: 280px; border-radius: 15px;" placeholder="   키워드를 입력하세요.">
                </td>
                
                <td style="width: 50px;"></td>
                <td style="width: 100px;">
                    정렬: 
                    <select>
                        <option>
                            최신순
                        </option>
                        <option>
                            제목순
                        </option>
                        <option>
                            유저순
                        </option>
                    </select>
                </td>
                <td></td>
                <td align="left">
                    <button type="button" style="width: 100px;" onclick="location.href='http://www.naver.com'";>
                    <b>+ 리뷰 작성</b>
                    </button>
                </td>
                <td></td>

            </tr>
            <tr>
                <td colspan="8">
                    <b>200 result</b>
                </td>
                
                
                
                
                
                
                
            </tr>
            <tr>
                <td rowspan="6" onclick="location.href='http://www.yahoo.co.jp'">
                    <img src="<%= contextPath %>/resources/images/medicube.png" class="review_img2">
                </td>
                <td colspan="3">2025-02-18</td>
                
                
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <tr>
                
                <td colspan="3"><b>리뷰 제목1</b></td>
                
                
                
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td colspan="4" style="color: gray;">
                    ———————————————————————————————————
                </td>
                
                
                
                
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td colspan="4">
                    <textarea cols="70" rows="10" style="resize: none; border-color: white">어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고</textarea>
                </td>
                
                
                
                
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <tr>
                
                <td><b>★ 4.7</b></td>
                <td style="width: 150px;">가격 : ★★★★☆</td>
                <td style="width: 150px;">성분 : ★★★★☆</td>
                <td style="width: 150px;">재구매 : ★★★★☆</td>
                <td align="right"><b></b>👍50</b></td>

                <td></td>
            </tr>
            <tr>
                <td colspan="8" style="color: lightgray;">
                    ————————————————————————————————————————————————————————————
                </td>







            </tr>

<!-- 두번째 시작 -->
            <tr>
                <td rowspan="6" onclick="location.href='http://www.yahoo.co.jp'">
                    <img src="<%= contextPath %>/resources/images/medicube.png" class="review_img2">
                </td>
                <td colspan="3">2025-02-18</td>
                
                
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <tr>
                
                <td colspan="3"><b>리뷰 제목1</b></td>
                
                
                
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td colspan="4" style="color: gray;">
                    ———————————————————————————————————
                </td>
                
                
                
                
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td colspan="4">
                    <textarea cols="70" rows="10" style="resize: none; border-color: white">어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고</textarea>
                </td>
                
                
                
                
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <tr>
                
                <td><b>★ 4.7</b></td>
                <td>가격 : ★★★★☆</td>
                <td>성분 : ★★★★☆</td>
                <td>재구매 : ★★★★☆</td>
                <td align="right"><b></b>👍50</b></td>

                <td></td>
            </tr>
            <tr>
                <td colspan="8" style="color: lightgray;">
                    ————————————————————————————————————————————————————————————
                </td>







            </tr>


            <tr>
                <td rowspan="6" onclick="location.href='http://www.yahoo.co.jp'">
                    <img src="<%= contextPath %>/resources/images/medicube.png" class="review_img2">
                </td>
                <td colspan="3">2025-02-18</td>
                
                
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <tr>
                
                <td colspan="3"><b>리뷰 제목1</b></td>
                
                
                
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td colspan="4" style="color: gray;">
                    ———————————————————————————————————
                </td>
                
                
                
                
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td colspan="4">
                    <textarea cols="70" rows="10" style="resize: none; border-color: white">어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고</textarea>
                </td>
                
                
                
                
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <tr>
                
                <td><b>★ 4.7</b></td>
                <td>가격 : ★★★★☆</td>
                <td>성분 : ★★★★☆</td>
                <td>재구매 : ★★★★☆</td>
                <td align="right"><b></b>👍50</b></td>

                <td></td>
            </tr>
            <tr>
                <td colspan="8" style="color: lightgray;">
                    ————————————————————————————————————————————————————————————
                </td>







            </tr>
            <tr>
                <td rowspan="6" onclick="location.href='http://www.yahoo.co.jp'">
                    <img src="<%= contextPath %>/resources/images/medicube.png" class="review_img2">
                </td>
                <td colspan="3">2025-02-18</td>
                
                
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <tr>
                
                <td colspan="3"><b>리뷰 제목1</b></td>
                
                
                
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td colspan="4" style="color: gray;">
                    ———————————————————————————————————
                </td>
                
                
                
                
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td colspan="4">
                    <textarea cols="70" rows="10" style="resize: none; border-color: white">어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고어쩌고 저쩌고</textarea>
                </td>
                
                
                
                
                <td></td>
                <td></td>
            </tr>
            <tr>
                
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>

            </tr>
            <tr>
                
                <td><b>★ 4.7</b></td>
                <td>가격 : ★★★★☆</td>
                <td>성분 : ★★★★☆</td>
                <td>재구매 : ★★★★☆</td>
                <td align="right"><b></b>👍50</b></td>

                <td></td>
            </tr>
            <tr>
                <td colspan="8" style="color: lightgray;">
                    ————————————————————————————————————————————————————————————
                </td>







            </tr>
        </table>
    </form>

	
</body>
</html>