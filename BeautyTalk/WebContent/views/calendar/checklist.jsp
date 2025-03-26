<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
    }

    .container {
      background-color: #fff;
      border-radius: 15px;
      padding: 20px;
      max-width: 400px;
      margin: 0 auto;
    }

    h1 {
      text-align: center;
      color: #fd6095;
      font-size: 24px;
      margin-bottom: 20px;
    }

    .form1 {
      display: flex;
      margin-bottom: 15px;
    }

    input[type="text"] {
      flex-grow: 1;
      padding: 10px;
      font-size: 14px;
      border-radius: 50px;
      border: none;
      background-color: #fff0f8;
    }

    #addBtn {
      padding: 5px 8px;
      font-size: 14px;
      border-radius: 50px;
      border: none;
      background-color: #ff81b5;
      color: #fff;
      cursor: pointer;
      margin-left: 10px;
      transition: background-color 0.3s;
    }

    #addBtn:hover {
      background-color: #ff4d88;
    }

    .todo-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .liContainer {
      display: flex;
      align-items: center;
      padding: 8px 10px;
      margin-bottom: 10px;
      background-color: #ffffff;
      border-radius: 10px;
      border: none;
      border-bottom: 1px solid #e0e0e0;
    }

    .liSpan {
      flex-grow: 1;
      font-size: 14px;
      color: #555;
    }

    .liButton {
      padding: 6px 10px;
      font-size: 12px;
      border-radius: 8px;
      border: none;
      background-color: #ff81b5;
      color: #fff;
      cursor: pointer;
    }

    .liButton:hover {
      background-color: #ff4d88;
    }

    #footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 15px;
      flex-wrap: wrap;
    }

    #footer > span {
      font-size: 12px;
      color: #333;
      margin: 5px;
    }

    #footer > button {
      padding: 8px 12px;
      font-size: 12px;
      border-radius: 10px;
      border: none;
      background-color: #ff81b5;
      color: #fff;
      cursor: pointer;
    }

    #footer > button:hover {
      background-color: #ff4d88;
    }

    #All, #Active, #Complete {
      background-color: #fff0f8;
      padding: 5px 10px;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    #All:hover, #Active:hover, #Complete:hover {
      background-color: #ffb6c1;
    }
  </style>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <h1>To_Do List</h1>
    <section class="form1">
      <input type="text" placeholder="할 일을 입력하세요." id="inputTodo">
      <button type="button" id = "addBtn">
        <span class="material-icons">add</span>
      </button>
    </section>

    <ul class="todo-list" id ="todo-listId" >
    </ul>

    <div id = "footer">
      <span id = "countSpan">남은 할일: </span>
      <span id = "countSpanInput"></span>
      <span id = "All">전체보기</span>
      <span id = "Active">미완료</span>
      <span id = "Complete">완료</span>
      <button type="button" id="allDelete" >전체 삭제</button>
    </div>
  </div>
  
  <script>
    const addBtn = document.getElementById("addBtn");  // Add 버튼
    const deleteBtn = document.getElementById("deleteBtn"); // Delete 버튼
    const inputTodo = document.getElementById("inputTodo"); // inputTodo
    let count=0;

    addBtn.addEventListener("click",function(e){   // Add 버튼 눌렀을때 .
        if ( inputTodo.value=="" ) {
            alert("Todo를 써주세요 ~ ");
            inputTodo.focus();
            return false;
        }else{
        const li = document.createElement("li");
        li.classList.add("liContainer");  // li 생성

        const checkBox = document.createElement("input");
        checkBox.classList.add("check1");
        checkBox.setAttribute("type","checkbox"); // 체크박스 생성

        const span = document.createElement("span");
        span.classList.add("liSpan");  // span 생성

        const button = document.createElement("button");
        button.classList.add("liButton"); // button 생성
        button.innerText="Delete";

        span.innerText = inputTodo.value;   
        inputTodo.value="";
        inputTodo.focus();

        li.append(checkBox,span,button);
        document.querySelector(".todo-list").append(li);

        count++;
        updateCount();

        button.addEventListener("click",function(){    // Delete 눌렀을때 삭제
            this.parentElement.remove();
            if ( !checkBox.checked)
            count --;
            updateCount();
        
        });
        checkBox.addEventListener("click",function(){   // check 시 취소선
            if ( checkBox.checked ){
                span.style.textDecoration="line-through";
                span.style.color="gray";
                count--;
            }else{
                span.style.textDecoration= "none";
                span.style.color="black";
                count++;
            } 
            updateCount();
        });
        }   
        updateCount();
    });


      /////////////////////  전체 삭제
    const allDelete = document.getElementById("allDelete");
    const todoList = document.getElementById("todo-listId");
    allDelete.addEventListener("click",function(){

        if(confirm("정말 삭제하시겠습니까?")==true){   //취소메시지가 true(ok)일때
            if(todoList.innerHTML==''){              //목록칸이 비어있다면
                alert("삭제할 목록이 없습니다");       //삭제할 목록이 없다는 경고창뜨기
            }else{                                   //삭제할 목록이 있다면
                todoList.innerHTML='';               //전체 삭제
                countSpanInput.innerText= "";        // 남은할일 : "" ;
                count = 0;
            }
        }else{                  //취소메시지가 false(no)일때
            return false;                   //삭제 취소
        }
    });

      /////////////      남은할일 표시해주는 function 
    function updateCount(){
        const countSpanInput = document.getElementById("countSpanInput")
        countSpanInput.innerText = count+" 개";
        if ( count == 0 ) {
            countSpanInput.innerText="";
        }
    }

    /////////////////   전체목록 / 체크된목록 / 체크안된목록 보이는 버튼 .
    const All = document.getElementById("All");
    const Active = document.getElementById("Active");
    const Complete = document.getElementById("Complete");
    const todoListId=document.getElementById("todo-listId");

    All.addEventListener("click", function() {
        showAll();
      });
      
    Active.addEventListener("click", function() {
        showActive();
      });
      
    Complete.addEventListener("click", function() {
        showComplete();
      });
      
      function showAll() {
        for (var i = 0; i < todoListId.children.length; i++) {
            todoListId.children[i].style.display = "flex";
        }
      }
      
      function showActive() {
        for (var i = 0; i < todoListId.children.length; i++) {
          if (todoListId.children[i].querySelector("input[type=checkbox]").checked === true) {
            todoListId.children[i].style.display = "none";
          } else {
            todoListId.children[i].style.display = "flex";
          }
        }
      }
      function showComplete() {
        for (var i = 0; i < todoListId.children.length; i++) {
          if (todoListId.children[i].querySelector("input[type=checkbox]").checked === false) {
            todoListId.children[i].style.display = "none";
          } else {
            todoListId.children[i].style.display = "flex";
          }
        }
      }
  </script>
</body>
</html>