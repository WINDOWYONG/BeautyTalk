<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">
    
    <%
    	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
    %>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <head>
        <meta charset="UTF-8">
        <title>Beauty Talks</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
                font-size: 14px;
            }
            .filter-container {
                border: 1px solid #e0e0e0;
                width: 1200px;
                margin: 0 auto;
            }
            .title{
                width: 1200px;
                margin: 0 auto;
                margin-bottom: 30px;
                margin-top: 30px;
            }
            .product{
                width: 1200px;
                margin: 0 auto;
                margin-bottom: 30px;
                margin-top: 30px;
            }
            .product {
                height: auto;
            }
            .filter-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #fff;
                padding: 10px;
                border-bottom: 1px solid #e0e0e0;
            }
            .header-left {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .brand-title {
                font-weight: bold;
                color: #FF69B4;
            }
            .brand-count {
                color: #888;
            }
            .header-right select {
                border: 1px solid #e0e0e0;
                padding: 5px;
            }
            .filter-body {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 10px;
                padding: 15px;
            }
            .brand-checkbox {
                display: flex;
                align-items: center;
                gap: 5px;
            }
            .brand-checkbox input[type="checkbox"] {
                accent-color: #FF69B4;
            }
            .filter-footer {
                display: flex;
                justify-content: center;
                padding: 10px;
                border-top: 1px solid #e0e0e0;
                background-color: #f8f8f8;
            }
            .footer-text {
                color: #888;
                font-size: 13px;
            }
            .product tr > td {
                padding: 20px;
                margin: 0 auto;
                text-align: center;
            }

            .material-icons {
                font-size: 24px;
                color: black; /* 기본 색을 검은색으로 설정해두었을 경우, 색상이 오버라이드되도록 */
            }

            .filled {
                color: #FF69B4 !important; /* 채워진 별 색상 (핑크) */
            }

            .empty {
                color: #ddd !important; /* 비어있는 별 색상 (회색) */
            }

            .half {
                color: #FF69B4 !important; /* 반쪽짜리 별 색상 (핑크) */
            }

            .material-icons.star_outline {
                color: #ddd !important; /* 빈 별은 회색 */
            }

            .material-icons.grade, .material-icons.star_half {
                color: #FF69B4 !important; /* 채워진 별과 반쪽짜리 별 색상 */
            }

            .star_outline {
                color: #ddd !important; /* 회색 */
            }

            .star_half {
                color: #FF69B4 !important; /* 반쪽 별 핑크 */
            }

            .star_filled {
                color: #FF69B4 !important; /* 채워진 별 핑크 */
            }
            
        </style>
    </head>
    </head>

    <body>
        <%@ include file="../common/headerNav.jsp" %>
        
        <div class="title">
            <h1 style="margin: 0 auto;">메이크업</h1>
        </div>

        <div class="filter-container">
            
            
            <div class="filter-header">
                <div class="header-left">
                    <span class="brand-title">브랜드</span>
                    <span class="brand-count">Total 32</span>
                </div>
                <div class="header-right">
                    <select>
                        <option>전체</option>
                        <option>가나다순</option>
                        <option>인기순</option>
                    </select>
                </div>
            </div>
            <div class="filter-body">
                <div class="brand-checkbox">
                    <input type="checkbox" id="brand1">
                    <label for="brand1">닥터지</label>
                </div>
                <div class="brand-checkbox">
                    <input type="checkbox" id="brand2">
                    <label for="brand2">라운드랩</label>
                </div>
                <div class="brand-checkbox">
                    <input type="checkbox" id="brand3">
                    <label for="brand3">로레알</label>
                </div>
                <div class="brand-checkbox">
                    <input type="checkbox" id="brand4">
                    <label for="brand4">더블유랩</label>
                </div>
                <div class="brand-checkbox">
                    <input type="checkbox" id="brand5">
                    <label for="brand5">미샤</label>
                </div>
                <div class="brand-checkbox">
                    <input type="checkbox" id="brand6">
                    <label for="brand6">에뛰드</label>
                </div>
                <div class="brand-checkbox">
                    <input type="checkbox" id="brand7">
                    <label for="brand7">이니스프리</label>
                </div>
                <div class="brand-checkbox">
                    <input type="checkbox" id="brand8">
                    <label for="brand8">토니모리</label>
                </div>
                <div class="brand-checkbox">
                    <input type="checkbox" id="brand9">
                    <label for="brand9">홀리카홀리카</label>
                </div>
            </div>
            <div class="filter-footer">
                <span class="footer-text" style="color: #FF69B4;">메이크업 카테고리 내 7개의 사용이 가능합니다.</span>
            </div>
        </div>
        <table class="product">
            <% for(Product p : list) { %>
                <tr>
                    <td style="border-bottom: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; height: 200px;"><%= p.getPcode() %></td>
                    <td style="border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0;">
                        <img src="<%= request.getContextPath() + p.getImagePath() %>" alt="상품 이미지" height="190">
                    </td>
                    <td style="border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px; width: 300px;"><%= p.getpName() %></td>
                    <td style="border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px;"><%= p.getbName() %></td>
                    <td style="border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px;">
                        <%= p.getLikeProduct() %>
                        <span class="material-icons">
                            favorite_border
                        </span>
                    </td>
                    <td style="border-bottom: 1px solid #e0e0e0; border-left: 1px solid #e0e0e0; border-top: 1px solid #e0e0e0; font-size: 20px;">
                        <%= p.getRate() %> <!-- 평점 값 -->
                        <!-- 별 1 -->
                        <span style="color: #FF69B4;" class="material-icons" id="star1_<%= p.getPcode() %>" data-rate="<%= p.getRate() %>">
                            <%= p.getRate() >= 1 ? "grade" : (p.getRate() >= 0.5 ? "star_half" : "star_outline") %>
                        </span>
                        <!-- 별 2 -->
                        <span style="color: #FF69B4;" class="material-icons" id="star2_<%= p.getPcode() %>" data-rate="<%= p.getRate() %>">
                            <%= p.getRate() >= 2 ? "grade" : (p.getRate() >= 1.5 ? "star_half" : "star_outline") %>
                        </span>
                        <!-- 별 3 -->
                        <span style="color: #FF69B4;" class="material-icons" id="star3_<%= p.getPcode() %>" data-rate="<%= p.getRate() %>">
                            <%= p.getRate() >= 3 ? "grade" : (p.getRate() >= 2.5 ? "star_half" : "star_outline") %>
                        </span>
                        <!-- 별 4 -->
                        <span style="color: #FF69B4;" class="material-icons" id="star4_<%= p.getPcode() %>" data-rate="<%= p.getRate() %>">
                            <%= p.getRate() >= 4 ? "grade" : (p.getRate() >= 3.5 ? "star_half" : "star_outline") %>
                        </span>
                        <!-- 별 5 -->
                        <span style="color: #FF69B4;" class="material-icons" id="star5_<%= p.getPcode() %>" data-rate="<%= p.getRate() %>">
                            <%= p.getRate() >= 5 ? "grade" : (p.getRate() >= 4.5 ? "star_half" : "star_outline") %>
                        </span>
                    </td>
                </tr>
            <% } %>
        </table>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                document.querySelectorAll('[data-rate]').forEach(starElement => {
                    const rating = parseFloat(starElement.getAttribute('data-rate'));  // 평점 값 가져오기
                    const productCode = starElement.id.split('_')[1]; // 상품 코드 추출 (Pcode로 접근)

                    // 별 1부터 5까지 순차적으로 처리
                    [1, 2, 3, 4, 5].forEach(starNumber => {
                        const star = document.getElementById(`star${starNumber}_${productCode}`);

                        if (star) {  // star가 존재할 때만 실행
                            // 별의 상태에 맞게 클래스 설정
                            if (rating >= starNumber) {
                                star.classList.add('filled');  // 채워진 별
                                star.classList.remove('half', 'empty');
                            } else if (rating >= starNumber - 0.5) {
                                star.classList.add('half');  // 반쪽짜리 별
                                star.classList.remove('filled', 'empty');
                            } else {
                                star.classList.add('empty');  // 빈 별
                                star.classList.remove('filled', 'half');
                            }
                        }
                    });
                });
            });
        </script>
    </body>

    </html>