<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
 /*TAB CSS*/
ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px; /*--Set height of tabs--*/
    border-bottom: 1px solid #999;
    border-left: 1px solid #999;
    width: 100%;
}
ul.tabs li {
    float: left;
    margin: 0;
    padding: 0;
    height: 31px; /*--Subtract 1px from the height of the unordered list--*/
    line-height: 31px; /*--Vertically aligns the text within the tab--*/
    border: 1px solid #999;
    border-left: none;
    margin-bottom: -1px; /*--Pull the list item down 1px--*/
    overflow: hidden;
    position: relative;
    background: #e0e0e0;
}
ul.tabs li a {
    text-decoration: none;
    color: #000;
    display: block;
    font-size: 1.2em;
    padding: 0 20px;
    /*--Gives the bevel look with a 1px white border inside the list item--*/
    border: 1px solid #fff; 
    outline: none;
}
ul.tabs li a:hover {
    background: #ccc;
}
ul.tabs li.active, ul.tabs li.active a:hover  {
    /*--Makes sure that the active tab does not listen to the hover properties--*/
    background: #fff;
    /*--Makes the active tab look like it's connected with its content--*/
    border-bottom: 1px solid #fff; 
}

ul.order {
	float: right;
	list-style: none;
}
ul.order li {
	float: left;
}

ul.order li a{
    padding: 0 20px 0 21px;
    vertical-align: middle;
}

/*Tab Conent CSS*/
.tabContainer {
    border: 1px solid #999;
    border-top: none;
    overflow: hidden;
    clear: both;
    float: left; 
    width: 100%;
    background: #fff;
}
.tabContent {
    padding: 20px;
    font-size: 1.2em;
}
</style>

<script>
$(document).ready(function(){
	// 페이지 로드 시
    $(".tabContent").hide(); // 모든 컨텐츠 요소 숨기기
    $("ul.tabs li:first").addClass("active").show(); // 첫번째 탭메뉴 활성화
    $(".tabContent:first").show(); // 첫번째 탭 컨텐츠 보여주기
	
    // 탭 클릭 시
    $("ul.tabs li").click(function() {
        $("ul.tabs li").removeClass("active"); // "active" 클래스 삭제 
        $(this).addClass("active"); // 선택된 탭에 "active" 클래스 부여
        $(".tabContent").hide(); // 모든 탭 컨텐츠 숨기기 

        var activeTab = $(this).find("a").attr("href"); 
        $(activeTab).fadeIn(); // 선택한 탭과 연관된 탭 컨텐츠 보여주기
    });
    
});
</script>

<h1>공연 관리 - 전체 목록 조회</h1>

<!-- 탭 메뉴 -->
<ul class="tabs">
    <li><a href="#conTab">콘서트</a></li>
    <li><a href="#muTab">뮤지컬&연극</a></li>
    <li><a href="#famTab">가족&아동</a></li>
</ul>
<div>
<ul class="order">
    <li><a>등록순</a></li>
    <li><a>조회순</a></li>
    <li><a>예매순</a></li>
</ul>
</div>

<!--탭 콘텐츠 영역 -->
<div class="tab_container">
	<div id="conTab" class="tabContent">
	콘서트 탭
	</div>
	
	<div id="muTab" class="tabContent">
	뮤지컬 탭
	</div>
	
	<div id="famTab" class="tabContent">
	가족아동 탭
	</div>
</div>
