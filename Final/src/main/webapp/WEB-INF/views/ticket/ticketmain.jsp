<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		// 모든 이미지 리스트
		var $slider_list = $("#slider li");

		// 모든 이미지를 "left: 300px"으로 보내기(숨기기)
		$slider_list.css("left", "00px");

		// 첫번째 이미지를 div 안쪽으로 보내기(첫 이미지 보이기)
		$("#slider li:first-child").css("left", 0);

		// 클릭이 될 때마다 이미지 한 장씩 교체하기
		var curSlide = 0; // 현재 이미지 인덱스

		setInterval(function() { // 시간 이용하여 슬라이드
			// 		$("#sliderbox").on("click", function() { // 클릭으로 슬라이드
			var nextSlide = (curSlide + 1) % $slider_list.length; // 다음 이미지 인덱스

			// 보여져야 할 이미지 오른쪽으로 이동시키기
			$slider_list.eq(nextSlide).css("left", "300px");

			// 현재 이미지 숨기기
			$slider_list.eq(curSlide).animate({ "left" : "-=300px" }); // -= : 현재 위치로부터 -600px

			// 다음 이미지 보여주기
			$slider_list.eq(nextSlide).animate({ "left" : "-=300px" });

			// 순환구조 만들기
			curSlide++;
			curSlide = curSlide % $slider_list.length;
		}, 1000);

		// 메인 배너 슬라이드
// 		$('.mainbanner').bxSlider({
// 			minSlides: 1,
// 			maxSlides: 1
// 		});
		
		// 배너 썸네일
		$('.mainbanner').bxSlider({
			pagerCustom : '#mainThumb'
		});
		
		// 맞춤 공연
		//	적용 안돼,,
// 		$('.fitPfmSlider').bxSlider({
// 			 minSlides: 1,
// 			 maxSlides: 1,
// 			 slideWidth: 360,
// 			 slideMargin: 10
// 		});
		
		// 메인배너 아래 탭
		$('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');
		 
		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		});
		
		// 랭킹 가져오기
		$('.kind span').click(function(){
			$.ajax({
				url: "/ticket/mainrank"
				, method: "GET"
				, data: {"genre": $(this).attr('id')}
				, dataType: "JSON"
				, success:function(d){
					console.log(d);
					
					// 새로 그려주기
					$('#rankList').html('');
					
					d.forEach(function(pfm){
						var li = $('<li class="pfmInfo">');
						var a = $('<a href="/ticket/pfmdetail?pfmIdx='+pfm.pfmIdx+'">');
						var span = $('<span class="thumImg">');
						var img = $('<img class="rankPoster" src="/resources/image/'+pfm.posterName+'"/>');
						var name = $('<span>'+pfm.name+'</span>');
						
						span.append(img).append('<br>').append(name);
						li.append(a.append(span));
						$('#rankList').append(li);
					});
					
				}
				, error:function() {
					console.log('랭킹 가져오기 실패');
				}
			});
		});
		
	});

	// 맞춤 공연
	function loginFitPfm() {
		var userIdx = '${loginUser.userIdx }';
		console.log("loginUserIdx : " + userIdx);
		
		$.ajax({
			type:"get",
			url:"/ticket/fit",
			data:{
				"userIdx" : userIdx
			},
			dataType:"json",
			success:function(d){
				console.log('+ + + 맞춤공연 불러오기 성공 + + +');
				
				insertFitPfm(d.fitPfmList);
			}
			, error:function(e) {
				console.log('로그인 되어있지 않음 - 맞춤 공연 x');
			}
		});
	};
	
	function insertFitPfm(fitPfmList) {
		
		$('#slider').html('');
		
		fitPfmList.forEach(function(list) {
			var li = $('<li>');
			var a = $('<a href="/ticket/pfmdetail?pfmIdx=' + list.pfmIdx + '">');
			var img = $('<img id="fitImg" src="/resources/image/' + list.posterName + '"/>');
			
			a.append(img);
			li.append(a);
			
			$('#slider').append(li);
			
		});
	};
</script>
 
<style type="text/css">
.fitPfmSlider {
	padding: 5px;;
}

/* 메인 배너 */
#mainbannerbox {
	position: relative;
	max-width: 100%;
	height: auto;
 	border: 1px solid black;   
/* 	overflow: hidden; */
	margin: 0 auto;
/* 	z-index: 2; */
}

.mainbanner {
	padding: 0;
	margin: 0;
/* 	height: 500px; */
	list-style: none;
}

.mainbanner li {
	position: absolute;
}

.mainbanner li img {
	max-width: 100%;
	height: 350px;
}

#thumbImg {
	width: 100px;
	height: 100px;
}

#mainThumb {
	text-align: center;
}

#fitImg {
	width: 200px;
	height: 300px;
}

/* 탭 메뉴 */
.main_tab{
	width: 970px;
	margin: 20px auto 10px auto;
}
 
ul.tabs{
	margin: 0px;
	padding: 0px 1px;
	list-style: none;
}
ul.tabs li{
	background: none;
/* 	color: #222; */
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	width: 320px;
	text-align: center;
}
 
ul.tabs li.current{
/* 	background: #ededed; */
/* 	color: #222; */
	border-bottom: 5px solid #F2B134;
}
 
.tab-content{
	display: none;
/* 	background: #ededed; */
	padding: 15px;
    border: 1px solid #BDBDBD;
}
 
.tab-content.current{
	display: inline-block;
	text-align: center;
}

/* 랭킹 */
ul.kind {
	float: right;
	list-style: none;
}
ul.kind li {
	float: left;
}

ul.kind li span{
    padding: 0 20px 0 21px;
    vertical-align: middle;
    cursor: pointer;
}
.kindDiv {
    width: 650px;
    height: 493px;
    float: right;
    position: relative;
    padding: 15px;
    border: 1px solid #bdbdbd;
}

.kindDiv ul.kind {
	margin-bottom: 0px;
    padding: 10px;
}

li.pfmInfo:first-child {
    position: absolute;
    left: 7px;
    top: 8px;
    border: 1px solid #eee;
    padding: 10px;
    left: -5px;
}

li.pfmInfo:nth-child(2),li.pfmInfo:nth-child(3),
li.pfmInfo:nth-child(4),li.pfmInfo:nth-child(5){
	list-style: none;
    float: left;
    margin: 5px;
    width: 147px;
}

li.pfmInfo:nth-child(2) {
    position: absolute;
	left: 296px;
    top: 8px;
    border: 1px solid #eee;
    padding: 10px;
}
li.pfmInfo:nth-child(3) {
	position: absolute;
    left: 463px;
    top: 8px;
    border: 1px solid #eee;
    padding: 10px;
}
li.pfmInfo:nth-child(4) {
    position: absolute;
	left: 296px;
	top: 216px;
    border: 1px solid #eee;
    padding: 10px;
}
li.pfmInfo:nth-child(5) {
    position: absolute;
    left: 463px;
    top: 216px;
    border: 1px solid #eee;
    padding: 10px;
}



li.pfmInfo {
	list-style: none;
	float: left;
	margin: 5px;
}

.pfmInfo:first-child img {
    width: 260px;
    height: 359px;
}

.rankPoster {
    width: 120px;
    height: 156px;
    margin-bottom: 10px;
}

/* 메인 하단 */
.mainbottom {
	width: 100%;
 	display: flex;
}

.ranking {
    width: 640px;
    height: 520px;
	margin: 10px 0 20px 10%;
	float: left;
	margin-left: 87px;
}

.alignPfm {
	width: 30%;
	height: 520px;
	margin: 10px 10% 20px 0;
	float: left;
	margin: 10px;
}

.ranking h4{
    font-weight: 900;
    font-size: 30px;
}

.alignPfm h4{
    font-weight: 900;
    font-size: 30px;
}

div>h4 {
	text-align: center;
}

#tabPfmList {
	float: left;
    margin: 15px;
    padding-top: 15px;
}

.tab-content {
	width: 100%;
}

/* 메인 배너 사진 속에 썸네일 사진 넣어주기 */
.bx-wrapper {
	display: contents;
}

.rankBox {
    width: 610px;
    height: 450px;
    position: absolute;
    top: 48px;
}

.kind span {
	font-weight: 700;
}

.kind span:hover {
	color: #f1c40f;
}

li.pfmInfo:first-child span span {
    font-size: 16px;
    display: block;
    width: 260px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-weight: 400;
}

li.pfmInfo:nth-child(2) span span, li.pfmInfo:nth-child(3) span span,
li.pfmInfo:nth-child(4) span span, li.pfmInfo:nth-child(5) span span {
    display: block;
    width: 120px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-size: 12px;

#sliderbox {
	position: relative;
	width: 300px;
	height: 400px;
	border: 1px solid black;
	/* div 영역을 벗어난 내용물 숨기기 */
	overflow: hidden;
	/* 옆으로 넘어가는거 확인시 주석 후 확인 */
	/* div 박스를 화면 가운데로 정렬 */
	margin: 0 auto;
}

/* ul의 기본 스타일 없애기 */
#slider {
	padding: 0;
	margin: 0;
	list-style: none;
}

#slider li { /* 한 곳으로 모임 */
	position: absolute;
}

#slider li img {
	width: 300px;
	height: 400px;
}
</style>

<!-- 메인 배너 -->
<div id="mainbannerbox">
	<ul class="mainbanner">
		<c:forEach items="${bannerList }" var="list">
			<li>
			<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<img src="/resources/image/${list.bannerImgOri}" />
			</a>
			</li>
		</c:forEach>
	</ul>
	
	<!-- 슬라이드 CSS 추가 시 변경 예정 -->
	<div id="mainThumb">
		<c:forEach items="${bannerList }" var="list">
			<a data-slide-index="${list.mainbanIdx }" href="">
				<img id="thumbImg" src="/resources/image/${list.thumbImgOri}" />
			</a>
		</c:forEach>
	</div>
</div>

<div class="main_wrapper">
<!-- 탭 배너 -->
<div class="main_tab">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">NEW! 공연</li>
	    <li class="tab-link" data-tab="tab-2">콘서트</li>
	    <li class="tab-link" data-tab="tab-3">뮤지컬&연극</li>
	</ul>

	<div id="tab-1" class="tab-content current" style="height: 300px;">
		<c:forEach items="${newList }" var="list">
		<span id="tabPfmList">
			<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<img src="/resources/image/${list.storedName}"
					style="width: 150px; height: 200px;"/><br>
					${list.name }
			</a>
		</span>
		</c:forEach>
	</div>
	
	<div id="tab-2" class="tab-content" style="height: 300px;">
		<c:forEach items="${conList }" var="list">
		<span id="tabPfmList">
			<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<img src="/resources/image/${list.storedName}"
					style="width: 150px; height: 200px;"/><br>
					${list.name }
			</a>
		</span>
		</c:forEach>
	</div>
	
	<div id="tab-3" class="tab-content" style="height: 300px;">
		<c:forEach items="${muList }" var="list">
		<span id="tabPfmList">
			<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<img src="/resources/image/${list.storedName}"
					style="width: 150px; height: 200px;"/><br>
					${list.name }
			</a>
		</span>
		</c:forEach>
	</div>
</div>

<div class="mainbottom">

<div class="ranking">
<div><h4>랭킹</h4></div>
	<div class="kindDiv">
		<ul class="kind">
			<li><span id="CON">콘서트</span></li>
			<li><span id="MU">뮤지컬&연극</span></li>
			<li><span id="FAM">가족&아동</span></li>
		</ul><br><br>
		
		<div class="rankBox">
			<ul id="rankList">
			<c:forEach items="${rankPfm }" var="pfm">
				<li class="pfmInfo">
					<a href="/ticket/pfmdetail?pfmIdx=${pfm.pfmIdx}">
					<span class="thumImg">
						<img class="rankPoster" src="/resources/image/${pfm.posterName}" /><br>
						<span>${pfm.name }</span>
					</span>
					</a>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
</div>

<script type="text/javascript">loginFitPfm();</script>
<div class="alignPfm">

<h4>맞춤 공연</h4>
	슬라이드만 추가하기
	<div class="fitPfmbox" onload="loginFitPfm();">

	<h4 style="padding-bottom: 25px;">맞춤 공연</h4>
	<c:if test="${login }">
		<div id="sliderbox">
			<ul id="slider" onload="loginFitPfm();">
			
			</ul>
		</div>
	</c:if>

		
	<c:if test="${not login }">
		<div class="fitPfmbox">
			<h5 style="text-align: center;">로그인 시 맞춤 공연을 추천해드립니다.</h5>
		</div>
	</c:if>
</div>
</div>

</div>
