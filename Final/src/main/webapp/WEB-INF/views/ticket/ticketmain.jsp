<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 모든 이미지 리스트
		var $mainbanner_list = $("#mainbanner li");

		$mainbanner_list.css("left", "100%");

		// 첫번째 이미지를 div 안쪽으로 보내기(첫 이미지 보이기)
		$("#mainbanner li:first-child").css("left", 0);

		var curSlide = 0; // 현재 이미지 인덱스

		setInterval(function() { // 시간 이용하여 슬라이드
			var nextSlide = (curSlide + 1) % $mainbanner_list.length; // 다음 이미지 인덱스

			// 보여져야 할 이미지 오른쪽으로 이동시키기
			$mainbanner_list.eq(nextSlide).css("left", "100%");

			// 현재 이미지 숨기기
			$mainbanner_list.eq(curSlide).animate({ "left" : "-=120%" });

			// 다음 이미지 보여주기
			$mainbanner_list.eq(nextSlide).animate({ "left" : "-=100%" });

			// 순환구조 만들기
			curSlide++;
			curSlide = curSlide % $mainbanner_list.length;
		}, 2000);
		
		// 메인배너 아래 탭
		$('ul.tabs li').click(function(){
		   var tab_id = $(this).attr('data-tab');
		 
		   $('ul.tabs li').removeClass('current');
		   $('.tab-content').removeClass('current');
		 
		   $(this).addClass('current');
		   $("#"+tab_id).addClass('current');
		 })
	});
</script>
 
<style type="text/css">

#mainbannerbox {
	position: relative;
	width: 100%;
	height: 350px;
 	border: 1px solid black; 
	/* div 영역을 벗어난 내용물 숨기기 */
	overflow: hidden;
	/* 옆으로 넘어가는거 확인시 주석 후 확인 */
	/* div 박스를 화면 가운데로 정렬 */
	margin: 0 auto;
/* 	z-index: 2; */
}

/* ul의 기본 스타일 없애기 */
#mainbanner {
	padding: 0;
	margin: 0;
	list-style: none;
}

 

#mainbanner li { /* 한 곳으로 모임 */
	position: absolute;
}

 

#mainbanner li img {
	max-width: 100%;
	height: 350px;
}

/* 탭 */
.main_tabs {
	margin-top: 15px;
	width: 70%;
 	padding-left: 15%;
	text-align: center;
}

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 15px;
  cursor: pointer;
}
 
ul.tabs li.current{
  background: #ededed;
  color: #222;
}
 
.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content img {
	text-align: center;
	width: 10%%;
	height: 150px;
}
 
.tab-content.current{
  display: inherit;
}

/* 메인 하단 () */
.mainranking {
	margin: 5px;
	width: 400px;
	float: left;
	text-align: center;
}

.recommendpfm {
	width: 300px;
	margin: 5px;
}
</style>

<!-- 메인 배너 -->
<div id="mainbannerbox">
	<ul id="mainbanner">
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/image/test.PNG" /></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/image/test5.PNG" /></a></li>
		<li><a href="#"><img src="${pageContext.request.contextPath}/resources/image/test2.PNG" /></a></li>
	</ul>
</div>

<!-- 썸네일 배너 -->
<!-- <div id="thumbannerbox"> -->
<!-- 	<ul id="thumbanner"> -->
<!-- 		<li><img src="http://i.imgur.com/RstXW7v.jpg"></li> -->
<!-- 	</ul> -->
<!-- </div> -->

<!-- 탭 (new, 콘서트, 뮤지컬&연극) -->
<div class="main_tabs">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">new</li>
		<li class="tab-link" data-tab="tab-2">콘서트</li>
		<li class="tab-link" data-tab="tab-3">뮤지컬&공연</li>
	</ul>
	 
	<div id="tab-1" class="tab-content current">
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
	</div>
	
	<div id="tab-2" class="tab-content">
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
	</div>
	
	<div id="tab-3" class="tab-content">
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" /></a>
	</div>
</div>

<!-- 메인 하단 (장르별 랭킹, 추천공연) -->
<!-- <div class="mainbottom"> -->
	<div class="mainranking">
<!-- 		<div class="toponeimg"> -->
<%-- 			<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" --%>
<!-- 			style="float: left; width: 100px; height: 200px;" /></a> -->
<!-- 		</div> -->
<!-- 		<div class="topotherimg"> -->
<%-- 			<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" --%>
<!-- 			style="float: left; width: 40px; height: 80px;" /></a> -->
<%-- 			<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" --%>
<!-- 			style="float: left; width: 40px; height: 80px;" /></a> -->
<%-- 			<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" --%>
<!-- 			style="float: left; width: 40px; height: 80px;" /></a> -->
<%-- 			<a href="#"><img src="${pageContext.request.contextPath}/resources/image/poster_empty.png" --%>
<!-- 			style="float: left; width: 40px; height: 80px;" /></a> -->
<!-- 		</div> -->
	</div>
	
	<div class="recommendpfm">
<%-- 		<c:if test="${not login }"> --%>
<!-- 			<h4>로그인시 취향에 맞는 공연 확인이 가능합니다.</h4> -->
<%-- 		</c:if> --%>
		
<%-- 		<c:if test="${login }"> --%>
			
<%-- 		</c:if> --%>
	</div>
<!-- </div> -->
	