$(function() {
    const skinTypeNo = "<%= skinTypeNo %>";
    // "" | "1, 2, 3 ..."
    $("input[type=radio]").each(function() {
    
        // $(this) : 순차적으로 접근되는 체크박스 요소
        // $(this).val() : 해당 체크박스의 value 값
        if(skinTypeNo.search($(this).val()) != -1){ // 그 요소를 찾았다!!
            $(this).attr("checked", true);
        }
    })
})	

$(function() {
    const bodyTypeNo = "<%= bodyTypeNo %>";
    // "" | "1, 2, 3 ..."
    $("input[type=radio]").each(function() {
    
        // $(this) : 순차적으로 접근되는 체크박스 요소
        // $(this).val() : 해당 체크박스의 value 값
        if(bodyTypeNo.search($(this).val()) != -1){ // 그 요소를 찾았다!!
            $(this).attr("checked", true);
        } 
    
    })
})

$(function() {
    const skinList = "<%= skinList %>";
    // "" | "1, 2, 3 ..."
    $("input[type=checkbox]").each(function() {
    
        // $(this) : 순차적으로 접근되는 체크박스 요소
        // $(this).val() : 해당 체크박스의 value 값
        if(skinList.search($(this).val()) != -1){ // 그 요소를 찾았다!!
            $(this).attr("checked", true);
        } 
    
    })
})

$(function() {
    const color = "<%= color %>";
    // "" | "1, 2, 3 ..."
    $("input[type=radio]").each(function() {
    
        // $(this) : 순차적으로 접근되는 체크박스 요소
        // $(this).val() : 해당 체크박스의 value 값
        if(color.search($(this).val()) != -1){ // 그 요소를 찾았다!!
            $(this).attr("checked", true);
        } 
    
    })
})

$(function() {
    const hairTypeNo = "<%= hairTypeNo %>";
    // "" | "1, 2, 3 ..."
    $("input[type=radio]").each(function() {
    
        // $(this) : 순차적으로 접근되는 체크박스 요소
        // $(this).val() : 해당 체크박스의 value 값
        if(hairTypeNo.search($(this).val()) != -1){ // 그 요소를 찾았다!!
            $(this).attr("checked", true);
        } 
    
    })
})

$(function() {
    const scalpTypeNo = "<%= scalpTypeNo %>";
    // "" | "1, 2, 3 ..."
    $("input[type=radio]").each(function() {
    
        // $(this) : 순차적으로 접근되는 체크박스 요소
        // $(this).val() : 해당 체크박스의 value 값
        if(scalpTypeNo.search($(this).val()) != -1){ // 그 요소를 찾았다!!
            $(this).attr("checked", true);
        } 
    
    })
})

    $(function() {
    const scalpList = "<%= scalpList %>";
    // "" | "1, 2, 3 ..."
    $("input[type=checkbox]").each(function() {
    
        // $(this) : 순차적으로 접근되는 체크박스 요소
        // $(this).val() : 해당 체크박스의 value 값
        if(scalpList.search($(this).val()) != -1){ // 그 요소를 찾았다!!
            $(this).attr("checked", true);
        } 
    
    })
})

$(function() {
    const brandList = "<%= brandList %>";
    // "" | "1, 2, 3 ..."
    $("input[type=checkbox]").each(function() {
    
        // $(this) : 순차적으로 접근되는 체크박스 요소
        // $(this).val() : 해당 체크박스의 value 값
        if(brandList.search($(this).val()) != -1){ // 그 요소를 찾았다!!
            $(this).attr("checked", true);
        } 
    
    })
})

$(function() {
    const release = "<%= release %>";
    // "" | "1, 2, 3 ..."
    $("input[type=radio]").each(function() {
    
        // $(this) : 순차적으로 접근되는 체크박스 요소
        // $(this).val() : 해당 체크박스의 value 값
        if(release.search($(this).val()) != -1){ // 그 요소를 찾았다!!
            $(this).attr("checked", true);
        } 
    
    })
})
document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll(".tab");
    const underline = document.querySelector(".underline");

    function moveUnderline(element) {
        underline.style.width = element.offsetWidth + "px";
        underline.style.left = element.offsetLeft + "px";
    }

    tabs.forEach(tab => {
        tab.addEventListener("click", function () {
            tabs.forEach(t => t.classList.remove("active"));
            this.classList.add("active");

            moveUnderline(this);

        });
    });

    // 페이지 로드 시 첫 번째 탭에 언더라인 설정
    moveUnderline(tabs[0]);
    tabs[0].classList.add("active");
});



$(document).ready(function () {
// 모달 열기
$("#openModal").click(function (e) {
    e.preventDefault();
    $("#deleteModal").fadeIn();
    });

// 모달 닫기 (X 버튼 클릭 시)
$(".close-btn").click(function () {
    $("#deleteModal").fadeOut();
    });

// 모달 바깥 영역 클릭 시 닫기
$(window).click(function (e) {
    if ($(e.target).is("#deleteModal")) {
        $("#deleteModal").fadeOut();
        }
    });
});
$(document).ready(function () {
// ✅ 프로필 수정 모달 열기
$("#userprofile, #openProfileModal").click(function () {
    $("#profileModal").fadeIn();
});

// ✅ 프로필 수정 모달 닫기 (X 버튼 클릭 시)
$(".close-profile").click(function () {
    $("#profileModal").fadeOut();
});

// ✅ 프로필 수정 모달 바깥 클릭 시 닫기 (회원탈퇴 모달과 구별)
$(window).click(function (e) {
    if ($(e.target).is("#profileModal")) {
        $("#profileModal").fadeOut();
    }
});

// 🔥 기존 회원탈퇴 모달 관련 코드는 손대지 않음! 🔥
});



function idCheck() {
    const $idInput = $("#userId");


        $.ajax({
            url:"idCheck.me",
            data:{checkId:$idInput.val()},
            success: function (result) {
                console.log(result);

                if(result == 'NNNNN'){
                    alert("중복된 아이디입니다")
                    $idInput.focus();
                } else{
                    if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
                        $idInput.attr("readonly", true);
                        $("#userId :submit").removeAttr("disabled");
                } else {
                        $idInput.focus();
                }
            }

            },
        error: function () {
        alert("서버 요청에 실패했습니다. 다시 시도해주세요.");
        },
        complete:function(){},
    });
}



$(document).ready(function () {
    const $tabs = $(".tab");
    const $underline = $(".underline");
    const $updateSection = $("#update"); // 회원정보 수정 폼
    const $beautyProfileSection = $("#update2"); // 뷰티 프로파일 폼
    const $beautyProfileTab = $(".tab:nth-child(3)"); // 뷰티 프로파일 탭
    const $updatePage = $("#updatePage"); // 회원정보 수정 버튼 (a 태그)

    // **초기 상태 설정**
    $beautyProfileSection.hide(); // 뷰티 프로파일 폼 숨기기
    $underline.hide(); // 언더라인 숨기기 (추가된 부분)

    function moveUnderline($element) {
        $underline.show().css({
            "width": $element.outerWidth() + "px",
            "left": $element.position().left + "px",
            "opacity": 1
        });
    }

    function hideUnderline() {
        $underline.css("opacity", 0).hide(); // 언더라인 숨기기
    }

    // 탭 클릭 시 언더라인 이동 + 폼 전환
    $tabs.click(function () {
        $tabs.removeClass("active");
        $(this).addClass("active");
        moveUnderline($(this));

        if ($(this).is($beautyProfileTab)) {
            $updateSection.fadeOut(function () {
                $beautyProfileSection.fadeIn();
            });
        }
    });

    // 회원정보 수정 버튼 클릭 시 폼 다시 보이고 언더라인 숨김
    $updatePage.click(function (e) {
        e.preventDefault(); // a 태그의 기본 동작 방지 (페이지 이동 X)
        $beautyProfileSection.fadeOut(function () {
            $updateSection.fadeIn();
        });
        hideUnderline(); // 언더라인 숨기기
        $tabs.removeClass("active"); // 모든 탭 비활성화
    });
});

