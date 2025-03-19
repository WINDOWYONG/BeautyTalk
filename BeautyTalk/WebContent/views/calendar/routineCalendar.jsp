<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
    Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons&display=block">
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');
body { font-family: 'Poppins', sans-serif; margin: 0; padding: 20px; color: #333; }
.container { display: flex; max-width: 1200px; margin: 0 auto; gap: 30px; align-items: flex-start; }
#routine { flex: 1; background-color: #fdf6f9; border-radius: 15px; padding: 30px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }

.form-container { flex: 1; background-color: #fff; border-radius: 15px; padding: 30px 40px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); color: #333; }
.form-container h2 { font-size: 22px; margin-bottom: 20px; color: #d6336c; }
.form-container label { margin: 15px 0 5px; font-weight: bold; color: #d6336c; display: block; }
.form-container input, .form-container select, .form-container textarea {
  width: 100%; padding: 10px; border: 1px solid #f8d7da; border-radius: 10px; background-color: #fff0f5;
}
.form-container button {
  background-color: #f78fb3; color: white; padding: 12px 20px; border: none;
  border-radius: 10px; font-size: 16px; cursor: pointer; margin-top: 20px; width: 100%;
}
.form-container button:hover { background-color: #f1aeb5; }
.weekdays { display: flex; gap: 5px; margin-top: 10px; }
.week-btn { flex: 1; padding: 10px; background-color: #fff0f5; border: 1px solid #f8d7da;
  border-radius: 50px; text-align: center; cursor: pointer; color: #d6336c; font-weight: 500; }
.week-btn.active { background-color: #f78fb3; color: white; }
.date-group { display: flex; align-items: center; gap: 8px; }
.date-group input[type="date"] { width: 140px; background-color: #fff0f5; border-radius: 10px; border: 1px solid #f8d7da; padding: 8px; color: #333; }

/* 캘린더 */
.routine-calendar .wrapper { width: 100%; background-color: #fff; border-radius: 10px; padding: 20px; }
.routine-calendar .nav { display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; }
.routine-calendar .current-date { font-size: 20px; font-weight: 600; }
.routine-calendar .nav button { border: none; background: none; cursor: pointer; }
.routine-calendar .nav .material-icons { font-size: 32px; color: #d6336c; }
.routine-calendar .calendar ul { display: flex; list-style: none; flex-wrap: wrap; text-align: center; padding: 0; }
.routine-calendar .calendar .weeks li { font-weight: 500; width: calc(100% / 7); padding: 5px 0; }
.routine-calendar .calendar .days li { width: calc(100% / 7); position: relative; z-index: 1; margin-top: 20px; cursor: pointer; }
.routine-calendar .days li.inactive { color: #aaa; }
.routine-calendar .days li.active { color: #fff; }
.routine-calendar .calendar .days li::before {
  position: absolute; content: ''; height: 36px; width: 36px; top: 50%; left: 50%;
  transform: translate(-50%, -50%); border-radius: 50%; z-index: -1;
}
.routine-calendar .days li:hover::before { background: #f2f2f2; }
.routine-calendar .days li.active::before { background: #ffb6cf; }
</style>
</head>

<body>

<div class="container">
  <!-- 캘린더 영역 -->
  <div id="routine">
    <div class="routine-calendar">
      <div class="wrapper">
        <div class="nav">
          <button id="prev"><span class="material-icons">chevron_left</span></button>
          <p class="current-date"></p>
          <button id="next"><span class="material-icons">chevron_right</span></button>
        </div>
        <div class="calendar">
          <ul class="weeks">
            <li>일</li><li>월</li><li>화</li><li>수</li><li>목</li><li>금</li><li>토</li>
          </ul>
          <ul class="days"></ul>
        </div>
      </div>
    </div>
  </div>

  <!-- 루틴 입력 폼 -->
  <div class="form-container">
    <h2><span style="color:black;"><%= loginUser.getUserName() %></span>님의 뷰티 루틴</h2>
    <label>항목명</label>
    <input type="text" id="event-title" placeholder="항목명을 입력해 주세요.">

    <label>기간</label>
    <div class="date-group">
      <input type="date" id="event-start"> ~ <input type="date" id="event-end">
    </div>

    <label>요일</label>
    <div class="weekdays">
      <div class="week-btn">월</div><div class="week-btn">화</div><div class="week-btn">수</div>
      <div class="week-btn">목</div><div class="week-btn">금</div><div class="week-btn">토</div><div class="week-btn">일</div>
    </div>

    <label>메모</label>
    <textarea id="event-memo" rows="3" placeholder="메모를 입력하세요 (선택사항)" style="resize: none;"></textarea>

    <label>알림 설정</label>
    <select id="alarm">
      <option>오전 9:00</option><option>오전 10:00</option><option>오후 1:00</option><option>오후 6:00</option>
    </select>

    <button id="add-event-btn">설정</button>
  </div>
</div>

<!-- ✅ 캘린더 스크립트 -->
<script>
let date = new Date();
let currMonth = date.getMonth();
let currYear = date.getFullYear();
let selectedDay = date.getDate();

const calendarEl = document.querySelector('.routine-calendar');
const currentDate = calendarEl.querySelector('.current-date');
const daysTag = calendarEl.querySelector('.days');
const prevNextIcon = calendarEl.querySelectorAll('.nav button');

const renderCalendar = () => {
  let lastDateofMonth = new Date(currYear, currMonth + 1, 0).getDate();
  let firstDayofMonth = new Date(currYear, currMonth, 1).getDay();
  let lastDayofMonth = new Date(currYear, currMonth, lastDateofMonth).getDay();
  let lastDateofLastMonth = new Date(currYear, currMonth, 0).getDate();

  currentDate.innerHTML = `${currYear}년 ${currMonth + 1}월`;

  let liTag = '';
  for (let i = firstDayofMonth; i > 0; i--) {
    liTag += `<li class="inactive">${lastDateofLastMonth - i + 1}</li>`;
  }
  for (let i = 1; i <= lastDateofMonth; i++) {
    let isActive = (i === selectedDay) ? 'active' : '';
    liTag += `<li class="${isActive}" data-day="${i}">${i}</li>`;
  }
  for (let i = lastDayofMonth; i < 6; i++) {
    liTag += `<li class="inactive">${i - lastDayofMonth + 1}</li>`;
  }
  daysTag.innerHTML = liTag;

  calendarEl.querySelectorAll('.days li').forEach(day => {
    day.addEventListener('click', function() {
      if (!this.classList.contains('inactive')) {
        selectedDay = parseInt(this.getAttribute('data-day'));
        renderCalendar();
      }
    });
  });
};

renderCalendar();

prevNextIcon.forEach((icon) => {
  icon.addEventListener('click', () => {
    currMonth = icon.id === 'prev' ? currMonth - 1 : currMonth + 1;
    if (currMonth < 0) { currMonth = 11; currYear--; }
    else if (currMonth > 11) { currMonth = 0; currYear++; }
    selectedDay = null;
    renderCalendar();
  });
});
</script>

</body>
</html>