<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    * {
        margin:0px;
        padding:0px;
    }

    /* 애니메이션 캔버스 */
    .animation_canvas  {
        overflow:hidden;
        position:relative;
        float:left;
        width:600px;
    }
    
    .slide_section {
        float:left;
    }

    .slide_board {
        height:400px;
    }

    .move_arrow {
        height:400px;
        display:table-cell;
        vertical-align:middle;
    }

    /* 슬라이드 패널 */
    .slider_panel {
        width:3000px;
        position:relative;
    }

    /* 슬라이드 이미지 */
    .slider_image {
        float:left;
        width:600px;
        height:400px;
    }

    /* 슬라이드 텍스트 패널 */
    .slider_text_panel {
        position:absolute;
        top:200px;
        left:50px;
    }
    
    .slider_text {
        position:absolute;
        width:250px;
        height:150px;
    }

    .slider_text > h1 {
        background-color:#FFFFFF;
        opacity:0.5;
    }

    .slider_text > p {
        background-color:#C0C0C0;
        opacity:0.5;
    }

    /* 컨트롤 패널  */
    .control_panel  {
        position:absolute;
        top:375px; 
        left:270px;
        height:20px; 
        overflow:hidden; 
    }

    .control_button {
        font-size:11px;
        width:13px;
        height:13px;
        border:1px solid #D4D4D4;
        background-color:#F4F4F4;
        position:relative; 
        float:left;
        cursor:pointer;
        margin-left:3px;
        margin-right:3px;
        text-align:center;
        font-weight:bold;
    }

    /* 컨트롤 마우스 오버  */
    .control_button:hover { 
        border:1px solid #F4F4F4;
        background-color:#D4D4D4;
        color:#FFFFFF;
    }
    
    /* 컨트롤 현재 영역  */
    .control_button.active { 
        border:1px solid #24822A;
        background-color:#24822A;
        color:#FFFFFF;
    }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
jQuery(document).ready(function() {
    
    // 슬라이드의 전체 개수를 구한다.
    var slideMax = jQuery(".control_button").length;

    // 슬라이드 이미지 좌우 이동버튼
    function moveArrow(sum) {

        var num = jQuery(".active").index();
        var idx = jQuery(".active").index() + sum;

        if(idx < 0) { idx = slideMax; }
        if(idx >= slideMax) { idx = 0; }

        moveSlider(idx);
    }

    // 슬라이드를 움직여주는 함수
    function moveSlider(index) {

        // 슬라이드를 이동합니다.
        var willMoveLeft = -(index * 600);
        jQuery(".slider_panel").animate({ left: willMoveLeft }, "slow");

        // control_button에 active클래스를 부여/제거합니다.
        jQuery(".control_button[data-index=" + index + "]").addClass("active");
        jQuery(".control_button[data-index!=" + index + "]").removeClass("active");

            // 글자를 이동합니다.
            jQuery(".slider_text[data-index=" + index + "]").show().animate({
                left : 0
            }, "slow");
            jQuery(".slider_text[data-index!=" + index + "]").hide("slow", function() {
                jQuery(this).css("left", -300);
            });
        }

        // 초기 텍스트 위치 지정 및 data-index 할당
        jQuery(".slider_text").css("left", -300).each(function(index) {
            jQuery(this).attr("data-index", index);
        });

        // 좌우 슬라이드 넘김 버튼
        jQuery("#leftMove").on("click", function() { moveArrow(-1) });
        jQuery("#rightMove").on("click", function() { moveArrow(1) });

        // 컨트롤 버튼의 클릭 핸들러 지정 및 data-index 할당
        jQuery(".control_button").each(function (index) {
            jQuery(this).attr("data-index", index);
        }).click(function () {
            var index = jQuery(this).attr("data-index");
            moveSlider(index);
        });

        // 초기 슬라이드의 위치 지정
        var randomNumber = Math.round(Math.random() * slideMax);
        moveSlider(randomNumber);
            
        // 5초마다 한번씩 슬라이드를 자동으로 다음 페이지로 넘긴다.
        setInterval(function() {
            moveArrow(1);
        }, 5000);
    });
</script>
<h1>Slide Header</h1>
    <div class="slide_board">
        <div class="slide_section" id="leftMove">
            <div class="move_arrow">◀</div>
        </div>
        <div class="animation_canvas">
            <div class="slider_panel">
                <img class="slider_image" src="./image/girl_image01.jpg">
                <img class="slider_image" src="./image/girl_image02.jpg">
                <img class="slider_image" src="./image/girl_image03.jpg">
                <img class="slider_image" src="./image/girl_image04.jpg">
                <img class="slider_image" src="./image/girl_image05.jpg">
            </div>
            <div class="slider_text_panel">
                <div class="slider_text">
                    <h1>Jessica Jung</h1>
                    <p>블랑 앤 에클레어(대표이사, 수석 디자이너), 코리델 엔터테인먼트(소속 가수), 하이룬.</p>
                </div>
                <div class="slider_text">
                    <h1>Kim Ji-Yeon</h1>
                    <p>Loveliz - 메인보컬, 리드댄서, 비주얼</p>
                </div>
                <div class="slider_text">
                    <h1>Lim Na-Yeon</h1>
                    <p>TWICE - 리드보컬, 리드댄서</p>
                </div>
                <div class="slider_text">
                    <h1>Minatozaki Sana</h1>
                    <p>TWICE - 서브보컬, 서브래퍼</p>
                </div>
                <div class="slider_text">
                    <h1>Jeong Ye-In</h1>
                    <p>Loveliz - 서브보컬, 리드댄서</p>
                </div>
            </div>
            <div class="control_panel">
                <div class="control_button">1</div>
                <div class="control_button">2</div>
                <div class="control_button">3</div>
                <div class="control_button">4</div>
                <div class="control_button">5</div>
            </div>
        </div>
        <div class="slide_section" id="rightMove">
            <div class="move_arrow">▶</div>
        </div>
    </div>
    <h1>Test Footer</h1>