<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

li.pfmInfo{
	float:left;
	list-style: none;	
	padding-top: 30px;
}
.pfmInfo a{
 	display:flex; 
	padding: 24px 24px 21px;
 	
}
.pfmInfo img {
	width: 180px;
	height: 250px;
} 
</style>

<script>
$(document).ready(function(){
	var genre; // 조회 기준 (콘서트, 뮤지컬, 가족, 검색)
	var keyword; // 검색 키워드
	var order; // 정렬 기준
	
	// 페이지 로드 시
    $("ul.tabs li:first").addClass("active").show(); // 첫번째 탭메뉴 활성화
	
    // 검색버튼 클릭 시
    $('#searchPfmBtn').click(function(){
    	// genre 변경
    	genre = "search";
    	keyword = $('#searchPfm').val();
    	getPfmList();
    });
    
    // 탭 클릭 시
    $("ul.tabs li").click(function() {
        $("ul.tabs li").removeClass("active"); // "active" 클래스 삭제 
        $(this).addClass("active"); // 선택된 탭에 "active" 클래스 부여

        // genre 변경
        genre = $(this).find('span').attr('id');
        getPfmList();
        
    });
    
    function getPfmList(){
    	$.ajax({
    		url: '/admin/viewpfmlist'
			, method : "GET"
			, data: {
				"genre": genre
				, "keyword": keyword
				, "order": order
			}
			, dataType: "json"
			, success : function(d){
				console.log("성공");
				console.log(d);
			}
			, error: function(e){
				console.log("공연 목록 불러오기 실패");
			}
    	});
    }
    
});
</script>

<h1>공연 관리 - 전체 목록 조회</h1>
<!-- 검색창 -->
<input type="text" id="searchPfm" placeholder="공연 제목 검색" onkeypress="if(event.keyCode==13){$('#searchPfmBtn').trigger('click'); return false;}"/> 
<button type="button" id="searchPfmBtn">검색</button>
<br>
 
<!-- 탭 메뉴 -->
<ul class="tabs">
    <li><span id="con">콘서트</span></li>
    <li><span id="mu">뮤지컬&연극</span></li>
    <li><span id="fam">가족&아동</span></li>
</ul>
<!-- 정렬 메뉴 -->
<div class="orderDiv">
<ul class="order">
    <li><span>등록순</span></li>
    <li><span>조회순</span></li>
    <li><span>예매순</span></li>
</ul>
</div>

<!-- 리스트 뷰 영역 -->
<ul id="pfmList">
<c:forEach var="pfm" items="${pfmList }" varStatus="i">
	<c:if test="${i.count %4 eq 1 }">
		<li class="pfmInfo first">
			<a href="/pfmDetail?pfmIdx=${pfm.pfmIdx }">
				<img src="/resources/image/${pfm.posterName }">
				<strong>${pfm.name }</strong>
			</a>
		</li>
	</c:if>
	<c:if test="${i.count %4 ne 1 }">
		<li class="pfmInfo">
			<a href="/pfmDetail?pfmIdx=${pfm.pfmIdx }">
				<img src="/resources/image/${pfm.posterName }">
				<strong>${pfm.name }</strong>
			</a>
		</li>
	</c:if>
</c:forEach>
</ul>
