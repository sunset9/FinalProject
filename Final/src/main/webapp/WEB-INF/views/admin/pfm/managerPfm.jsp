<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#managePfm{
	width: 1200px;
	margin: 0 auto;
}
#registBtn {
    float: right;
}

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
ul.tabs li span {
    text-decoration: none;
    color: #000;
    display: block;
    font-size: 1.2em;
    padding: 0 20px;
    /*--Gives the bevel look with a 1px white border inside the list item--*/
    border: 1px solid #fff; 
    outline: none;
    cursor: pointer;
}
ul.tabs li a:hover {
    background: #ccc;
}
ul.tabs li.active, ul.tabs li.active span:hover  {
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

ul.order li span{
    padding: 0 20px 0 21px;
    vertical-align: middle;
    cursor: pointer;
}
.orderDiv {
	width:100%;
	float: right;
}
#pfmList{
	overflow: hidden;
	width: 1080px;
	margin: 0 auto;
}
li.pfmInfo{
	float:left;
	list-style: none;	
	padding-top: 30px;
    margin-left: 29px;
}
/* li.pfmInfo.first{ */
/* 	margin-left: 0; */
/*     padding-right: 1px; */
/* } */
.pfmInfo a{
 	display: block;
/*     width: 180px; */
    height: 358px;
    padding: 24px 24px 21px;
    border: 1px solid #eee;
}

.thumb {
    display: block;
    position: relative;
    width: 180px;
    height: 250px;
    overflow: hidden;
}

.pfmInfo img {
	width: 180px;
	height: 250px;
} 
</style>

<script>
var genre = "CON"; // 조회 기준 (콘서트(기본), 뮤지컬, 가족, 검색)
var keyword =""; // 검색 키워드
var order; // 정렬 기준

var curPage = 1;
var isEnd = false; // 스크롤시 ajax 통신 중단 여부

$(document).ready(function(){
	
	// 페이지 로드 시
    $("ul.tabs li:first").addClass("active").show(); // 첫번째 탭메뉴 활성화
	
    // 검색버튼 클릭 시
    $('#searchPfmBtn').click(function(){
    	curPage = 1; // 현재 페이지 초기화
    	isEnd = false; // 무한스크롤 동작 여부 초기화
    	
    	// genre 변경
    	genre = "search";
    	keyword = $('#searchPfm').val();
    });
    
    // 장르탭 클릭 시
    $("ul.tabs li").click(function() {
    	curPage = 1; // 현재 페이지 초기화
    	isEnd = false; // 무한스크롤 동작 여부 초기화
    	
        $("ul.tabs li").removeClass("active"); // "active" 클래스 삭제 
        $(this).addClass("active"); // 선택된 탭에 "active" 클래스 부여

        // genre값 변경(서버에 넘기는 값)
        genre = $(this).find('span').attr('id');
        
        getPfmListAjax('/admin/viewpfmlist');
    });
    
});

//ajax 통신으로 공연 리스트 가져오는 메소드
function getPfmListAjax(url){
	if(genre != 'SEARCH') url='/admin/viewpfmlist'; // 검색시 호출 url
	else url = '/admin/searchpfm'; // 분류탭 클릭시 호출 url
	
	$.ajax({
		url: url
		, method : "GET"
		, async: false
		, data: {
			"genre": genre
			, "order": order
			, "keyword": keyword
			, "curPage": curPage
		}
		, dataType: "json"
		, success : function(d){
			viewPfmList(d.pfmList);
			// 8개 미만이면 더 불러올 데이터 없는 것. 무한스크롤 중단
			if(d.pfmList.length < 8){ isEnd = true; }
		}
		, error: function(e){
			console.log("공연 목록 불러오기 실패");
		}
	});
}

// json list 타입의 공연리스트를 그려주는 메소드
function viewPfmList(pfmList){
	if(curPage == 1) $('#pfmList').html('');
	
	var i = 1;
	pfmList.forEach(function(pfm){
		var li =$('<li class="pfmInfo">');
		
		var a = $('<a href="/pfmDetail?pfmIdx='+ pfm.pfmIdx + '">');
		var span = $('<span class="thumb">');
		var img ; 
		if(!pfm.posterName) img = $('<img src="/resources/image/poster_empty.png">');
		else img = $('<img src="/resources/image/'+ pfm.posterName + '">');
		a.append(span.append(img));
		a.append($('<strong>'+ pfm.name +'</strong>'));
		li.append(a);
		
		$('#pfmList').append(li);
	});
}

$(window).scroll(function() { // 스크롤 이벤트가 발생할 때마다 인식
	 let $window = $(this);

	var maxHeight = $(document).height();
    var currentScroll = $(window).scrollTop() + $(window).height();

   	 if(!isEnd){
	     // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
// 	     if( scrollTop + windowHeight + 30 > documentHeight ){
		if (maxHeight <= currentScroll + 100){
			curPage++;
			
	    	getPfmListAjax('/admin/viewpfmlist');
    	 }
     }



});

</script>

<h1>공연 관리 - 전체 목록 조회</h1>

<button id="registBtn" onclick="location.href='/admin/registpfm'">공연 등록</button>

<div id="managePfm">
<!-- 검색창 -->
<input type="text" id="searchPfm" placeholder="공연 제목 검색" onkeypress="if(event.keyCode==13){$('#searchPfmBtn').trigger('click'); return false;}"/> 
<button type="button" id="searchPfmBtn">검색</button>
 
<!-- 탭 메뉴 -->
<ul class="tabs">
    <li><span id="CON">콘서트</span></li>
    <li><span id="MU">뮤지컬&연극</span></li>
    <li><span id="FAM">가족&아동</span></li>
</ul>

<!-- 정렬 메뉴 -->
<div class="orderDiv">
<ul class="order">
    <li><span id="LATEST">등록순</span></li>
    <li><span id="RANK">예매순</span></li>
</ul>
</div>

<!-- 리스트 뷰 영역 -->
<!-- <div id="pfmMainView"> -->
<ul id="pfmList">
<c:forEach var="pfm" items="${pfmList }" varStatus="i">
	<li class="pfmInfo">
		<a href="/pfmDetail?pfmIdx=${pfm.pfmIdx }">
			<span class="thumb">
				<img src="/resources/image/${pfm.posterName }">
			</span>
			<strong>${pfm.name }</strong>
		</a>
	</li>
</c:forEach>
</ul>
<!-- </div> -->

</div>