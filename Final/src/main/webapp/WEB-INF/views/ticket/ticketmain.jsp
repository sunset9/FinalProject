<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">
$(window).load(function() {
	/* 모두 로드된 후에 실행 */
	
	// 맞춤 공연
	$('#slider').bxSlider({
		 minSlides: 1,
		 maxSlides: 1
	});
	
	// 맞춤 공연이 없는 경우
	if( $('.fitImg').length == 0 ) {
		$('.fitPfmbox').hide();
		$('#noRecPfm').show();
	}
	
});

	$(document).ready(function() {
		
		// 메인 배너 슬라이드
// 		$('.mainbanner').bxSlider({
// 			minSlides: 1,
// 			maxSlides: 1
// 		});x	
		
		// 배너 썸네일
		$('.mainbanner').bxSlider({
			pagerCustom : '#mainThumb'
		});
		
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
			$('.kind span').removeClass('clicked');
			$(this).addClass('clicked');
			
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
// 	function loginFitPfm() {
// 		var userIdx = '${loginUser.userIdx }';
// 		console.log("loginUserIdx : " + userIdx);
		
// 		$.ajax({
// 			type:"get",
// 			url:"/ticket/fit",
// 			data:{
// 				"userIdx" : userIdx
// 			},
// 			dataType:"json",
// 			success:function(d){
// 				console.log('+ + + 맞춤공연 불러오기 성공 + + +');
				
// 				insertFitPfm(d.fitPfmList);
// 			}
// 			, error:function(e) {
// 				console.log('로그인 되어있지 않음 - 맞춤 공연 x');
// 			}
// 		});
// 	};
	
// 	function insertFitPfm(fitPfmList) {
		
// 		$('#slider').html('');
		
// 		fitPfmList.forEach(function(list) {
// 			var li = $('<li>');
// 			var a = $('<a href="/ticket/pfmdetail?pfmIdx=' + list.pfmIdx + '">');
// 			var img = $('<img id="fitImg" src="/resources/image/' + list.posterName + '"/>');
			
// 			a.append(img);
// 			li.append(a);
			
// 			$('#slider').append(li);
			
// 		});
// 	};

// 찜하기 버튼 눌렀을 때 반응할 메소드
function pfmChoice(pfmIdx){
	console.log("함수 실행 되나용");
	// form 태그 만들어서 공연IDX 보내기 
	var form = $("<form>");
	form.attr('action' , "/mypage/pfmchoice");
	form.attr('method', "post");
	form.appendTo('body');
	
	form.append('<input type="hidden" name ="pfmIdx" value="'+pfmIdx+'"/>');
	
	form.submit();
}
</script>
 
<style type="text/css">

img{
	border: 1px solid #efefef !important;
}

.fitPfmSlider {
	padding: 5px;
}

/* 메인 배너 */
#mainbannerbox {
	position: relative;
	max-width: 100%;
	height: auto;
 	border-bottom: 1px solid #ccc;   
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

.fitImg {
	width: 200px;
	height: 300px;
}

/* 탭 메뉴 */
.main_tab{
	width: 1010px;
	margin: 20px auto 35px auto;
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
	font-weight: 600;
   	font-size: 19px;
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
    border: 1px solid #dfdfdf;
}
 
.tab-content.current{
	display: inline-block;
	text-align: center;
}

#tab-1 {
	padding-top: 30px;
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
    height: 505px;
    float: right;
    position: relative;
    padding: 15px;
    padding-top: 10px;
    border: 1px solid #dfdfdf;
}

.kindDiv ul.kind {
	margin-bottom: 0px;
    padding: 10px;
}

#rankList {
	counter-reset: my-counter 0;
}
li.pfmInfo:before {
	content: counter(my-counter);
    counter-increment: my-counter 1;
    position: absolute;
    background: #f2b133;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    text-align: center;
    line-height: 2.3;
    left: -1px;
    top: -1px;
    color: #fff;
    font-weight: bold;
}
li.pfmInfo:nth-child(n+4):before{
    background: #ccc;
}
li.pfmInfo:first-child:before {
    width: 50px;
    height: 50px;
    line-height: 2.1;
    left: -4px;
    top: -7px;
    color: #fff;
    font-size: 26px;
}
li.pfmInfo:first-child {
    position: absolute;
    top: 0px;
    padding: 10px;
    left: 6px;
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
	left: 300px;
    top: 0px;
    padding: 10px;
}
li.pfmInfo:nth-child(3) {
	position: absolute;
    left: 447px;
    top: 0px;
    padding: 10px;
}
li.pfmInfo:nth-child(4) {
    position: absolute;
	left: 300px;
	top: 211px;
    padding: 10px;
}
li.pfmInfo:nth-child(5) {
    position: absolute;
    left: 447px;
    top: 212px;
    padding: 10px;
}



li.pfmInfo {
	list-style: none;
	float: left;
	margin: 5px;
}

.pfmInfo:first-child img {
    width: 271px;
    height: 372px;
}

.rankPoster {
    width: 133px;
    height: 185px;
    margin-bottom: 3px;
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

.ranking h4, .alignPfm h4{
    font-weight: 600;
    font-size: 30px;
    text-align: left;
    padding-left: 48px;
}

div>h4 {
	text-align: center;
}

#tabPfmList {
	float: left;
    margin: 0 15px;
}
#tabPfmList a {
	display: block;
    width: 165px;
}
#tabPfmList img {
	width: 100%;
    height: 220px;
}
#tabPfmList div{
    position: relative;
    top: 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
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

.kind span.clicked {
	font-weight: 700;
}
.kind span:hover {
/* 	color: #F2B134; */
}

li.pfmInfo:first-child span span {
    font-size: 23px;
    display: block;
    width: 260px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-weight: 400;
    margin: 0 auto;
    margin-top: 8px;
}

li.pfmInfo:nth-child(2) span span, li.pfmInfo:nth-child(3) span span,
li.pfmInfo:nth-child(4) span span, li.pfmInfo:nth-child(5) span span {
    display: block;
    width: 120px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-size: 12px;
}

#sliderbox {
	position: relative;
	width: 300px;
	height: 460px;
/* 	border: 1px solid black; */
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
.fitPfmbox {
	width:350px;
	height: 505px;
    display: table;
    text-align: center;
    padding: 18px;
	border: 1px solid #DDD;
}
.fitPfmbox span {
	
	display:table-cell;
	vertical-align:middle;
	font-size: 2em;
}

#noRecPfm {
	width:350px;
	height: 505px;
    display: table;
    text-align: center;
    padding: 18px;
	border: 1px solid #DDD;
}
#noRecPfm span {
	display:table-cell;
	vertical-align:middle;
	font-size: 2em;
}

/* 아래 점들 정렬 */
.bx-pager{
	margin-bottom: 30px !important;
}
.choiceBtn {
    width: 140px;
    height: 40px;
    border-radius: 6px;
    border: 1px solid #a5a5a5;
    background: #FFF;
    color: #888;
    font-weight: bold;
    margin-bottom: 5px;
}
</style>

<!-- 메인 배너 -->
<div id="mainbannerbox">
	<ul class="mainbanner">
		<c:forEach items="${bannerList }" var="list">
			<li>
			<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<img src="/resources/image/${list.bannerImgStr}" style="width:1440px; height: 380px;" />
			</a>
			</li>
		</c:forEach>
	</ul>
	
	<!-- 슬라이드 CSS 추가 시 변경 예정 -->
	<div id="mainThumb">
		<c:forEach items="${bannerList }" var="list">
			<a data-slide-index="${list.mainbanIdx }" href="">
				<img id="thumbImg" src="/resources/image/${list.thumbImgStr}" style="width:100px; height: 100px;" />
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
				<img src="/resources/image/${list.storedName}"/>
				<div>${list.name }</div>
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
			<li><span id="CON" class="clicked">콘서트</span></li>
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
	<c:if test="${login }">
		<div class="fitPfmbox" >
			<div id="sliderbox">
				<ul id="slider" >
				     <c:forEach items="${recomList }" var ="recom"  varStatus="index">
						<c:if test ="${! empty recom}">
						<li><a href="/ticket/pfmdetail?pfmIdx=${recom.pfmIdx }">
							<img class = "fitImg" src="/resources/image/${recom.posterName }" />
							</a>
						</li>
						</c:if>
					 </c:forEach>
				</ul>
			</div>
		</div>
	</c:if>
	
		
	<c:if test="${not login }">
		<div class="fitPfmbox">
			<span>로그인 하시면 맞춤공연 <br> 추천을 받으실 수 있습니다.</span>
		</div>
	</c:if>
	
	<!-- 추천 공연 없는 경우 활성화 -->
	<div id="noRecPfm" style="display:none">
		<span>취향에 맞는 공연이 등록되면 <br>알려드릴게요</span>
		<button id="changePrefer" onclick="location.href='/mypage/prefer'" class="choiceBtn ">취향 변경하기</button>
	</div>
</div>
</div>

</div>
