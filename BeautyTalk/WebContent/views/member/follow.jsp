<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>팔로우 목록 (검색 + 무한 스크롤)</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 추가 -->
        <style>
            .follow-container {
                width: 1200px;
                margin: auto;
                display: flex;
                justify-content: space-between;
                /* 팔로우 목록과 팔로워 목록을 양옆에 배치 */
            }

            #searchfollow,
            #searchfollower {
                width: 100%;
                max-width: 600px;
                height: 50px;
                padding: 10px;
                margin-bottom: 35px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .follow-list {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .follow-item {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 10px;
                background-color: #f9f9f9;
                gap: 50px;
                width: 100%;
                max-width: 600px;
            }

            .follow-item img {
                width: 50px;
                height: 50px;
                margin-right: 20px;
            }

            .follow-item span {
                font-size: 16px;
                margin-right: 20px;
            }

            .follow-item button {
                background-color: #e8618c;
                color: white;
                width: 80px;
                height: 40px;
                border-radius: 7px;
                border: none;
                cursor: pointer;
                font-size: 13px;
                font-weight: 600;
                transition: background-color 0.3s;
            }

            img.default-image {
                width: 50px;
                height: 50px;
                object-fit: cover;
                /* 이미지 비율을 유지하면서 잘라서 보여줍니다 */
            }

            .follow-item button:hover {
                background-color: #c04e6f;
            }

            .loading {
                text-align: center;
                font-size: 18px;
                color: #888;
                display: none;
            }

            /* 팔로우 목록과 팔로워 목록을 가로로 배치 */
            .follow-list-container {
                width: 48%;
                /* 각각 48%로 크기 설정 */
                margin-top: 100px;
            }

            .follow-list-container h2 {
                margin-bottom: 20px;
                text-align: center;
                max-width: 600px;
            }

            img {
                width: 50px;
                height: 50px;
                object-fit: cover;
                /* 이미지 비율에 맞춰 크기 조정 */
            }
        </style>

    <body>
        <%@ include file="../common/header.jsp" %>
            <div class="follow-container">
                <!-- 팔로우 목록 -->
                <div class="follow-list-container">
                    <h2>팔로우</h2>
                    <input type="text" id="searchfollow" placeholder="닉네임 검색" oninput="searchfollow()">
                    <div id="followList" class="follow-list"></div>
                    <div id="loading" class="loading">🔄 로딩 중...</div>
                </div>

                <!-- 팔로워 목록 -->
                <div class="follow-list-container">
                    <h2>팔로워</h2>
                    <input type="text" id="searchfollower" placeholder="닉네임 검색" oninput="searchfollower()">
                    <div id="followerList" class="follow-list"></div>
                    <div id="loading" class="loading">🔄 로딩 중...</div>
                </div>
            </div>
    </body>


    <script>
        function loadFollowList() {
            let followListDiv = document.getElementById("followList");
            let followerListDiv = document.getElementById("followerList");  // 팔로워 목록을 추가할 div
            let loadingDiv = document.getElementById("loading");
            let userNo = <%= loginUser.getUserNo() %>;

            console.log(userNo);
            // 로딩 표시 활성화
            loadingDiv.style.display = "block";
            followListDiv.innerHTML = "";  // 기존 목록 초기화
            followerListDiv.innerHTML = "";

            $.ajax({
                url: "<%= contextPath %>/followselectlist.me",  // 전체 팔로우 목록을 가져오는 URL
                type: "GET", // 전체 팔로우 목록을 요청하는 GET 방식
                data: { userNo: <%= loginUser.getUserNo() %> }, // 회원 번호 가져가기
                dataType: "json",  // 서버로부터 JSON 응답 받기
                success: function (result) {
                    // 로딩 표시 숨기기
                    loadingDiv.style.display = "none";

                    // 응답 받은 데이터를 팔로우 목록으로 렌더링
                    if (result.length === 0) {
                        followListDiv.innerHTML = "<p>팔로우 목록이 없습니다.</p>";
                        followerListDiv.innerHTML = "<p>팔로워 목록이 없습니다.</p>";
                        return;
                    }

                    // 팔로우 목록 생성
                    let htmlContentFollow = "";  // 여기에 선언
                    let htmlContentFollower = "";  // 여기에 선언

                    // 팔로우 목록 처리
                    for (let i = 0; i < result.followList.length; i++) {
                        if(result.followList[i].filePath === null){
                            htmlContentFollow += `
                            <div class="follow-item" style="margin-bottom: 20px; display: flex; align-items: center; gap: 20px;">
                                <table style="border-collapse: collapse; width: 100%;">
                                    <tr>
                                        <!-- 프로필 이미지 -->
                                        
                                        <td style="width: 30px; text-align: center; padding: 0;">
                                            <img src="<%= contextPath %>/\${(result.followList[i] && result.followList[i].filePath ? result.followList[i].filePath : '/resources/images/account_circle_500dp_000000.png')}" alt="프로필 이미지" style="width: 50px; height: 50px; margin-left: 35px;">
                                        </td>
                                        <!-- 닉네임 -->
                                        <td style="width: 130px; text-align: center; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                            \${result.followList[i].nickName}
                                        </td>
                                        <!-- 팔로우 버튼 -->
                                        <td style="width: 100px; text-align: center;">
                                            <button style="background-color: #e8618c; color: white; width: 80px; height: 40px; border-radius: 7px; border: none; cursor: pointer; font-size: 13px; font-weight: 600;">
                                                팔로잉
                                            </button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        `;
                        } else {
                            htmlContentFollow += `
                            <div class="follow-item" style="margin-bottom: 20px; display: flex; align-items: center; gap: 20px;">
                                <table style="border-collapse: collapse; width: 100%;">
                                    <tr>
                                        <!-- 프로필 이미지 -->
                                        
                                        <td style="width: 30px; text-align: center; padding: 0;">
                                            <img src="<%= contextPath %>/\${(result.followList[i] && result.followList[i].filePath ? result.followList[i].filePath : '/resources/images/account_circle_500dp_000000.png')}" alt="프로필 이미지" style="width: 50px; height: 50px; margin-left: 35px;">
                                        </td>
                                        <!-- 닉네임 -->
                                        <td style="width: 130px; text-align: center; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                            \${result.followList[i].nickName}
                                        </td>
                                        <!-- 팔로우 버튼 -->
                                        <td style="width: 100px; text-align: center;">
                                            <button style="background-color: #e8618c; color: white; width: 80px; height: 40px; border-radius: 7px; border: none; cursor: pointer; font-size: 13px; font-weight: 600;">
                                                팔로잉
                                            </button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        `;
                        }
                        
                    }

                    // 팔로워 목록 처리
                    for (let i = 0; i < result.followerList.length; i++) {
                        
                        htmlContentFollower += `
                            <div class="follow-item" style="margin-bottom: 20px; display: flex; align-items: center; gap: 20px;">
                                <table style="border-collapse: collapse; width: 100%;">
                                    <tr>
                                        <!-- 프로필 이미지 -->
                                        <td style="width: 30px; text-align: center; padding: 0;">
                                            <img src="<%= contextPath %>/\${(result.followList[i] && result.followList[i].filePath ? result.followList[i].filePath : '/resources/images/account_circle_500dp_000000.png')}" alt="프로필 이미지" style="width: 50px; height: 50px; margin-left: 35px;">
                                        </td>
                                        <!-- 닉네임 -->
                                        <td style="width: 130px; text-align: center; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
                                            \${result.followerList[i].nickName}
                                        </td>
                                        <!-- 팔로우 버튼 -->
                                        <td style="width: 100px; text-align: center;">
                                            <button style="background-color: #e8618c; color: white; width: 80px; height: 40px; border-radius: 7px; border: none; cursor: pointer; font-size: 13px; font-weight: 600;">
                                                팔로잉
                                            </button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        `;
                    }

                    // 팔로우 목록을 div에 추가
                    followListDiv.innerHTML = htmlContentFollow;

                    // 팔로워 목록을 div에 추가
                    followerListDiv.innerHTML = htmlContentFollower;
                },
                error: function () {
                    loadingDiv.style.display = "none";
                    followListDiv.innerHTML = "<p>팔로우 목록을 가져오는 데 실패했습니다.</p>";
                    followerListDiv.innerHTML = "<p>팔로워 목록을 가져오는 데 실패했습니다.</p>";
                }
            });
        }

        // 페이지 로드 시 loadFollowList() 함수 호출
        window.onload = function () {
            loadFollowList();  // 페이지가 로드되면 팔로우 목록을 불러옵니다.
        };

        function searchfollow() {
            let nickname = document.getElementById("searchfollow").value.trim();  // 검색창에서 값 가져오기
            let followListDiv = document.getElementById("followList");
            let loadingDiv = document.getElementById("loading");

            // 로딩 표시 활성화
            loadingDiv.style.display = "block";
            followListDiv.innerHTML = "";  // 이전 검색 결과 초기화

            // 닉네임이 비어있으면 더 이상 검색하지 않음
            if (nickname === "") {
                loadFollowList();  // 빈 닉네임 입력 시 전체 목록 로드
                return;
            }

            $.ajax({
                url: "<%= contextPath %>/followlist.me",  // 기존의 URL을 그대로 사용
                type: "POST",
                data: { nickname: nickname },  // 입력한 닉네임을 서버로 보냄
                dataType: "json",  // 서버로부터 JSON 응답 받기
                success: function (result) {
                    console.log(result);  // 응답 받은 JSON 데이터 출력


                    // 로딩 표시 숨기기
                    loadingDiv.style.display = "none";


                    // 팔로우 목록이 비어있으면 결과 없음 표시
                    if (result.length === 0) {
                        followListDiv.innerHTML = "<p>팔로우 결과가 없습니다.</p>";
                        return;
                    }

                    // 팔로우 목록 생성
                    let htmlContentFollow = "";

                    // 팔로우 목록 처리
                    for (let i = 0; i < result.length; i++) {
                        htmlContentFollow += `
                    <div class="follow-item">
                        <img src="<%= contextPath %>/\${result[i].filePath}" alt="프로필 이미지" style="width: 50px; height: 50px;">
                        <span>\${result[i].nickName}</span>
                    </div>
                `;
                    }

                    // 생성된 HTML을 div에 추가
                    followListDiv.innerHTML = htmlContentFollow;

                },
                error: function () {
                    loadingDiv.style.display = "none";
                    followListDiv.innerHTML = "<p>팔로우 목록을 가져오는 데 실패했습니다.</p>";
                }
            });
        }

        function searchfollower() {
            let nickname = document.getElementById("searchfollower").value.trim();  // 검색창에서 값 가져오기
            let followerListDiv = document.getElementById("followerList");
            let loadingDiv = document.getElementById("loading");

            // 로딩 표시 활성화
            loadingDiv.style.display = "block";
            followerListDiv.innerHTML = "";  // 이전 검색 결과 초기화

            // 닉네임이 비어있으면 더 이상 검색하지 않음
            if (nickname === "") {
                loadFollowList();  // 빈 닉네임 입력 시 전체 목록 로드
                return;
            }

            $.ajax({
                url: "<%= contextPath %>/followerlist.me",  // 기존의 URL을 그대로 사용
                type: "POST",
                data: { nickname: nickname },  // 입력한 닉네임을 서버로 보냄
                dataType: "json",  // 서버로부터 JSON 응답 받기
                success: function (result) {
                    console.log(result);  // 응답 받은 JSON 데이터 출력


                    // 로딩 표시 숨기기
                    loadingDiv.style.display = "none";


                    // 팔로우 목록이 비어있으면 결과 없음 표시
                    if (result.length === 0) {
                        followerListDiv.innerHTML = "<p>팔로워 결과가 없습니다.</p>";
                        return;
                    }

                    // 팔로워 목록 생성
                    let htmlContentFollow = "";

                    // 팔로우워목록 처리
                    for (let i = 0; i < result.length; i++) {
                        htmlContentFollow += `
                    <div class="follow-item">
                        <img src="<%= contextPath %>/\${result[i].filePath}" alt="프로필 이미지" style="width: 50px; height: 50px;">
                        <span>\${result[i].nickName}</span>
                    </div>
                `;
                    }

                    // 생성된 HTML을 div에 추가
                    followerListDiv.innerHTML = htmlContentFollow;

                },
                error: function () {
                    loadingDiv.style.display = "none";
                    followerListDiv.innerHTML = "<p>팔로우 목록을 가져오는 데 실패했습니다.</p>";
                }
            });
        }
    </script>


    </body>

    </html>