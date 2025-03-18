<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
    Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="resources/dist/index.global.min.js"></script>
<script src="resources/dist/list.global.min.js"></script>
<style>
/* ✅ CSS 그대로 유지 */
body {
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  margin: 0;
  padding: 20px;
  color: #333;
}
.container {
  display: flex;
  max-width: 1024px;
  margin: 0 auto;
  gap: 20px;
}
#calendar {
  flex: 1;
  background-color: #fdf6f9;
  border-radius: 15px;
  padding: 20px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}
.fc .fc-toolbar {
  background-color: #fce4ec;
  border-radius: 15px;
  padding: 10px 20px;
  margin-bottom: 20px;
  align-items: center;
  display: flex;
  justify-content: space-between;
}
.fc .fc-toolbar .fc-toolbar-chunk:first-child { display: flex; gap: 2px; }
.fc .fc-toolbar .fc-toolbar-chunk:last-child { display: flex; gap: 8px; }
.fc .fc-button {
  background-color: #f8bbd0;
  color: #d81b60;
  border: none;
  border-radius: 50px;
  padding: 4px 8px;
  font-size: 12px;
  font-weight: 600;
  transition: background-color 0.3s;
  box-shadow: none;
  min-width: auto;
}
.fc .fc-button:hover { background-color: #d81b60; color: white; }
.fc .fc-button.fc-today-button { background-color: #fddde6; color: #d6336c; }
.fc .fc-button.fc-button-active { background-color: #d6336c !important; color: #fff !important; }
.fc .fc-button-group .fc-button {
  background-color: #f8bbd0 !important;
  color: #d81b60 !important;
  min-width: auto;
  padding: 4px 12px;
  text-align: center;
}
.fc .fc-button-group .fc-button:hover { background-color: #d81b60 !important; color: #fff !important; }
.fc-toolbar-title {
  color: #d6336c;
  font-size: 20px !important;
  font-weight: bold;
  white-space: nowrap;
  margin: 0 20px !important;
}
.fc-list-event { background-color: #ffffff !important; border: none; }
.fc-list-day-cushion { background-color: #fce4ec !important; color: #d6336c; font-weight: bold; }
.fc-list-event-time { color: #d6336c; font-weight: bold; }
.form-container {
  flex: 1;
  background-color: #fff;
  border-radius: 15px;
  padding: 30px 40px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  color: #333;
}
.form-container label,
.form-container input,
.form-container textarea,
.form-container select,
.weekdays { width: 100%; }
.form-container input, .form-container textarea, .form-container select { box-sizing: border-box; }
.form-container h2 { font-size: 22px; margin-bottom: 20px; color: #d6336c; }
.form-container label { display: block; margin: 15px 0 5px; font-weight: bold; color: #d6336c; }
.form-container input, .form-container select, .form-container textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #f8d7da;
  border-radius: 10px;
  background-color: #fff0f5;
}
.form-container button {
  background-color: #f78fb3;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 10px;
  font-size: 16px;
  cursor: pointer;
  margin-top: 20px;
  width: 100%;
}
.form-container button:hover { background-color: #f1aeb5; }
.weekdays { display: flex; gap: 5px; margin-top: 10px; }
.week-btn {
  flex: 1;
  padding: 10px;
  background-color: #fff0f5;
  border: 1px solid #f8d7da;
  border-radius: 50px;
  text-align: center;
  cursor: pointer;
  color: #d6336c;
  font-weight: 500;
}
.week-btn.active { background-color: #f78fb3; color: white; }
.date-group { display: flex; align-items: center; gap: 8px; }
.date-group input[type="date"] {
  width: 140px;
  background-color: #fff0f5;
  border-radius: 10px;
  border: 1px solid #f8d7da;
  padding: 8px;
  color: #333;
}
.fc-list-event-time { display: none; }
.fc-list-event-title:has(.fc-list-event-dot) { display: none; }
</style>
</head>

<body>

<div class="container">
  <div id="calendar"></div>

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
      <div class="week-btn">월</div>
      <div class="week-btn">화</div>
      <div class="week-btn">수</div>
      <div class="week-btn">목</div>
      <div class="week-btn">금</div>
      <div class="week-btn">토</div>
      <div class="week-btn">일</div>
    </div>

    <label>메모</label>
    <textarea id="event-memo" rows="3" placeholder="메모를 입력하세요 (선택사항)" style="resize: none;"></textarea>

    <label>알림 설정</label>
    <select id="alarm">
      <option>오전 9:00</option>
      <option>오전 10:00</option>
      <option>오후 1:00</option>
      <option>오후 6:00</option>
    </select>

    <button id="add-event-btn">설정</button>
  </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      locale: 'ko',
      plugins: [ listPlugin ],
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'listDay,listWeek'
      },

      // customize the button names,
      // otherwise they'd all just say "list"
      views: {
        listDay: { buttonText: 'day' },
        listWeek: { buttonText: 'week' }
      },

      initialView: 'listWeek',
      initialDate: '2025-03-18',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events

      // 체크박스
      eventContent: function(arg) {
        return {
          html: `
            <div class="list-event" data-event-id="${arg.event.id}" style="display:flex; align-items:center; gap:8px; cursor:pointer;">
              <input type="checkbox" class="schedule-check" onclick="event.stopPropagation()">
              <span>${arg.event.title}</span>
            </div>`
        }
      },
      
      eventClick: function(info) {
        if (confirm(`'${info.event.title}' 일정을 삭제하시겠습니까?`)) {
          info.event.remove();
        }
      },


      events: [
        {
          title: 'All Day Event',
          start: '2025-03-16'
        },
        {
          title: 'Long Event',
          start: '2025-03-17',
          end: '2025-03-18'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2025-03-18T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2025-03-18T16:00:00'
        },
        {
          title: 'Conference',
          start: '2025-03-18',
          end: '2025-03-19'
        },
        {
          title: 'Meeting',
          start: '2025-03-19T10:30:00',
          end: '2025-03-19T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2025-03-18T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2025-03-18T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2025-03-20T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2025-03-21T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2025-03-22T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2025-03-22'
        }
      ]
    });

    calendar.render();
    console.log(calendar);

      document.getElementById('add-event-btn').addEventListener('click', function() {
        var title = document.getElementById('event-title').value;
        var start = document.getElementById('event-start').value;
        var end = document.getElementById('event-end').value;

        if (title && start) {
          // 1. 캘린더에 추가
          calendar.addEvent({
            title: title,
            start: start,
            end: end ? end : null
          });

          // 2. 서버로 저장 요청 보내기
          fetch('/save-event', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ title: title, start: start, end: end })
          })
          .then(response => response.json())
          .then(data => {
            console.log('서버 저장 성공:', data);
            alert('일정이 추가되었습니다!');
          })
          .catch(error => {
            console.error('서버 저장 실패:', error);
            alert('서버 저장 실패');
          });

        } else {
          alert('제목과 시작 시간을 입력하세요!');
        }
      });

      document.querySelectorAll('.week-btn').forEach(btn => {
        btn.addEventListener('click', () => btn.classList.toggle('active'));
      });
    });
  </script>


</body>
</html>
