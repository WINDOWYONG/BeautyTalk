<img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/images/MainLogo.png" width="300">

# 🌸 프로젝트 소개

오늘날에는 올리브영과 같은 H&B(헬스앤뷰티) 스토어와 온라인 쇼핑몰 덕분에 누구나 손쉽게 다양한 화장품을 접할 수 있다. 하지만 선택의 폭이 넓어진 만큼, 어떤 제품이 자신에게 맞는지 고민하는 소비자들도 많아졌다. 현대의 소비자들은 정보 공유를 통해 자신에게 최적화된 제품을 찾고자하며, 이에 따라 SNS 기능을 결합한 뷰티 커뮤니티 플랫폼의 필요성이 대두되고 있다.

본 프로젝트는 이러한 니즈를 반영하여 다음과 같은 기능을 제공한다:  
✔ **사용자 리뷰와 SNS 기능(팔로우, 좋아요 등)을** 통해 제품에 대한 신뢰 형성  
✔ **화장품 사용 가이드 및 메이크업 영상을 제공**하여 초보자도 쉽게 따라할 수 있도록 지원

누구나 쉽고 간편하게 화장품을 접하고, 자신에게 맞는 뷰티 루틴을 찾아갈 수 있는 공간을 제공하는 것이 해당 프로젝트의 목표다.  
프로젝트 현황 보고

# 📆 개발 기간

#### 2025.02.06 ~ 2025.04.04

*   2025.02.06 ~ 2025.02.12 : 주제 선정, 팀장 선출, 진행 방향 논의
*   2025.02.12 ~ 2025.02.19 : 기획 의도, 유사사이트 분석, 클라이언트 요구사항 분석, UseCase Diagram 작성, 구현 목표 및 세부 기능, 작업 일정표
*   2025.02.19 ~ 2025.02.26 : 사이트맵, Visily툴을 활용한 화면 설계
*   2025.02.26 ~ 2025.03.04 : DB 테이블 설계, 샘플데이터, ERD CLOUD를 활용한 ERD 작성
*   2025.03.04 ~ 2025.03.10 : 화면 JSP 생성, 주요기능 구현, JDBC 오라클 연동 후 CRUD 테스트
*   2025.03.10 ~ 2025.03.31 : 프로젝트 구현 및 디버깅
*   2025.03.31 ~ 2025.04.03 : 베타 테스트, 최종 발표자료 준비
*   2025.04.04 : 프로젝트 최종 발표

<img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/images/개발일정표_스프레드시트.png" width="700">

# 👨‍💻 구성원 및 역할

### ❤️ 전창용 (조장)

*   회원정보 조회, 수정
*   회원탈퇴
*   뷰티 프로필 조회, 추가, 수정
*   아이디 중복체크
*   네이버 API 로그인
*   상품 카테코리, 브랜드별 조회
*   유저 팔로우/ 팔로우 취소 기능
*   사용자 팔로우, 팔로워 검색 및 조회

### 💛 주현수 (조원)

*   일반회원 로그인
*   카카오톡 API 로그인
*   ID/PW 찾기 (이메일 인증)
*   로그아웃
*   뷰티캘린더 일정 조회/추가/삭제
*   팔로잉 뷰티캘린더 조회
*   투두리스트 루틴 설정
*   투두리스트 조회/추가/완료/삭제
*   인기 유저 조회
*   유저 팔로우/언팔로우

### 💜 이용훈 (조원)

*   리뷰 작성/수정/삭제
*   포스트 작성
*   댓글 작성
*   마이 리뷰/포스트 조회

# ⚙️ 개발 환경

*   OS : Windows10
*   IDE : Eclipse / VS Code / SqlDeveloper
*   Server : Apach Tomcat 9.0
*   DBMS : Oracle
*   Languages : Java, HTML, CSS, JavaScript, JQuery, JSP, SQL
*   Management : Git, GitHub, SourceTree

# 🛠️ 기술 스택 & 사용 라이브러리

### 🖥️ Front-End

*   HTML5, CSS3, JavaScript
*   jQuery, AJAX, JSON
*   FullCalendar.js (캘린더 UI 라이브러리)

### ⚙️ Back-End

*   Java 11
*   JSP & Servlet
*   Oracle DB (JDBC: ojdbc6 사용)

### 🌐 API / 외부 연동

*   네이버 로그인 API (OAuth 기반 소셜 로그인)
*   카카오 로그인 API (OAuth 기반 소셜 로그인)
*   Google 이메일 인증 (JavaMail API 사용)

### 📦 주요 기능별 사용 라이브러리

*   🔐 소셜 로그인: 네이버, 카카오 API
*   📧 이메일 인증: JavaMail API, Activation
*   📂 파일 업로드: commons-fileupload, cos.jar
*   🔄 JSON 처리: Gson, JSON-simple
*   🗄 DB 연동: Oracle JDBC Driver (ojdbc6)

# 💾 설계

ERD CLOUD:  
<img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/images/ERDCLOUD.png" width="700">

# 🎀 프로젝트 구현

### ❤️ 전창용

*   회원정보 조회, 수정
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/yong/%ED%9A%8C%EC%9B%90%EC%A0%95%EB%B3%B4%20%EC%88%98%EC%A0%95%20%EC%B5%9C%EC%A2%85.gif" width="700">
*   회원탈퇴
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/yong/%ED%9A%8C%EC%9B%90%ED%83%88%ED%87%B4.gif" width="700">
*   뷰티 프로필 조회, 추가, 수정
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/yong/%EB%B7%B0%ED%8B%B0%ED%94%84%EB%A1%9C%ED%95%84.gif" width="700">
*   아이디 중복체크
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/yong/%EC%95%84%EC%9D%B4%EB%94%94%EC%A4%91%EB%B3%B5%EC%B2%B4%ED%81%AC.gif" width="700">
*   네이버 API 로그인
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/yong/%EB%84%A4%EC%9D%B4%EB%B2%84API.gif" width="700">
*   상품 카테고리, 브랜드별 조회
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/yong/%EC%83%81%ED%92%88%20%EC%A1%B0%ED%9A%8C%2C%20%EB%B0%8F%20%EA%B2%80%EC%83%89.gif" width="700">
*   유저 팔로우/ 팔로우 취소 기능
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/yong/%ED%8C%94%EB%A1%9C%EC%9A%B0%2C%20%ED%8C%94%EB%A1%9C%EC%9B%8C%20%EA%B2%80%EC%83%89%20%EB%B0%8F%20%ED%8C%94%EB%A1%9C%EC%9A%B0%20%EC%B7%A8%EC%86%8C.gif" width="700">
*   유저 팔로우, 팔로워 검색 및 조회
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/yong/%ED%8C%94%EB%A1%9C%EC%9A%B0%2C%20%ED%8C%94%EB%A1%9C%EC%9B%8C%20%EA%B2%80%EC%83%89.gif" width="700">

### 💛 주현수

*   일반회원 로그인
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EC%9D%BC%EB%B0%98%ED%9A%8C%EC%9B%90%EB%A1%9C%EA%B7%B8%EC%9D%B8.gif" width="700">
*   아이디 저장
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EC%95%84%EC%9D%B4%EB%94%94%EC%A0%80%EC%9E%A5.gif" width="700">
*   카카오톡 API 로그인
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1API%EB%A1%9C%EA%B7%B8%EC%9D%B8.gif" width="700">
*   아이디 찾기
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EC%95%84%EC%9D%B4%EB%94%94%EC%B0%BE%EA%B8%B0.gif" width="700">
*   비밀번호 찾기 및 변경
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EB%B9%84%EB%B0%80%EB%B2%88%ED%98%B8%EC%B0%BE%EA%B8%B0%EB%B0%8F%EB%B3%80%EA%B2%BD.gif" width="700">
*   로그아웃
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EB%A1%9C%EA%B7%B8%EC%95%84%EC%9B%83.gif" width="700">
*   뷰티캘린더 일정 조회
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EB%B7%B0%ED%8B%B0%EC%BA%98%EB%A6%B0%EB%8D%94%20%EC%9D%BC%EC%A0%95%20%EC%A1%B0%ED%9A%8C.gif" width="700">
*   뷰티캘린더 일정 추가
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EB%B7%B0%ED%8B%B0%EC%BA%98%EB%A6%B0%EB%8D%94%20%EC%9D%BC%EC%A0%95%20%EC%B6%94%EA%B0%80.gif" width="700">
*   뷰티캘린더 일정 삭제
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EB%B7%B0%ED%8B%B0%EC%BA%98%EB%A6%B0%EB%8D%94%20%EC%9D%BC%EC%A0%95%20%EC%82%AD%EC%A0%9C.gif" width="700">
*   팔로잉 뷰티캘린더 조회(조회만 가능, 삭제 불가)
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%ED%8C%94%EB%A1%9C%EC%9E%89%20%EB%B7%B0%ED%8B%B0%EC%BA%98%EB%A6%B0%EB%8D%94%20%EC%A1%B0%ED%9A%8C.gif" width="700">
*   투두리스트 추가
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%ED%88%AC%EB%91%90%EB%A6%AC%EC%8A%A4%ED%8A%B8%20%EC%B6%94%EA%B0%80.gif" width="700">
*   인기 유저 조회
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EC%9D%B8%EA%B8%B0%20%EC%9C%A0%EC%A0%80%20%EC%A1%B0%ED%9A%8C.gif" width="700">
*   비로그인 시 로그인 창으로 이동
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EB%B9%84%EB%A1%9C%EA%B7%B8%EC%9D%B8%20%EC%9C%A0%EC%A0%80%ED%8C%94%EB%A1%9C%EC%9A%B0.gif" width="700">
*   유저 팔로우/언팔로우
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/%EC%9C%A0%EC%A0%80%20%ED%8C%94%EB%A1%9C%EC%9A%B0%EC%96%B8%ED%8C%94%EB%A1%9C%EC%9A%B0.gif" width="700">

### 💜 이용훈

*   리뷰 작성
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/lyh/%EB%A6%AC%EB%B7%B0%20%EC%9E%91%EC%84%B1.gif" width="700">
*   리뷰 수정
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/lyh/%EB%A6%AC%EB%B7%B0%20%EC%88%98%EC%A0%95.gif" width="700">
*   리뷰 삭제
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/lyh/%EB%A6%AC%EB%B7%B0%20%EC%82%AD%EC%A0%9C.gif" width="700">
*   포스트 작성
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/lyh/%ED%8F%AC%EC%8A%A4%ED%8A%B8%20%EC%9E%91%EC%84%B1.gif" width="700">
*   댓글 작성
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/lyh/%EB%8C%93%EA%B8%80%20%EC%9E%91%EC%84%B1.gif" width="700">
*   마이 리뷰/포스트 조회
    
    <img src="https://raw.githubusercontent.com/WINDOWYONG/BeautyTalk/main/BeautyTalk/WebContent/resources/gif/lyh/%EB%A7%88%EC%9D%B4%20%ED%8F%AC%EC%8A%A4%ED%8A%B8.gif" width="700">

# 📚 최종 보고서

[BeautyTalk 최종보고서 🎈](https://drive.google.com/file/d/1kOtn__TMRBmBCC3bmQg25ulM2rtiX0R5/view?usp=drive_link)

# 📄 최종 스크립트

[BeautyTalk 최종스크립트 🎈](https://drive.google.com/file/d/1oYFzYuDkXt5aw5cXwGPtld-1difSGdzE/view?usp=drive_link)