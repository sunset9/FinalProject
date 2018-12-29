<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		// 메인 배너 슬라이드
		$('.mainbanner').bxSlider({
			minSlides: 1,
			maxSlides: 1
		});
		
		// 메인배너 아래 탭
		$('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');
		 
		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
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
					console.log('성공');
					
					insertFitPfm(d.fitPfmList);
				}
				, error:function(e) {
					console.log('로그인 되어있지 않음 - 맞춤 공연 x');
				}
			});
		}
		
		// 맞춤 공연
// 		$('.bxslider').bxSlider({
// 		  infiniteLoop: false,
// 		  hideControlOnEnd: true
// 		});
		
		function insertFitPfm(fitPfmList) {
			
			$('.fitPfmbox').html('');
			fitPfmList.forEach(function(list) {

// 				var ul = $('<ul class="bxslider">');
				
// 				var li = $('<li>');
				var img = $('<img id="fitImg" src="/resources/image/' + list.originName + '" />');

// 				li.append(img);
// 				ul.append(li);
				
				$('.fitPfmbox').append(img);
			});
		}
	});
</script>
 
<style type="text/css">
/* 메인 배너 */
#mainbannerbox {
	position: relative;
	max-width: 100%;
	height: auto;
/* 	border: 1px solid black;   */
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

#fitImg {
	width: 50px;
	height: 100px;
}

/* 탭 메뉴 */
.main_tab{
	width: 850px;
	margin: 20px auto 10px auto;
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
	width:100%;
	float: right;
}

li.pfmInfo {
	list-style: none;
	float: left;
}

.tapImg {
	width: 100px;
	height: 100px;
}

/* 메인 하단 */
.mainbottom {
	width: 100%;
/* 	display: inline; */
}

.ranking {
	width: 50%;
	height: 400px;
	margin: 10px 0 20px 10%;
	border: 1px solid silver;
	float: left;
}

.alignPfm {
	width: 30%;
	height: 400px;
	margin: 10px 10% 20px 0;
	border: 1px solid silver;
	float: left;
}

div>h4 {
	text-align: center;
}

#tabPfmList {
	float: left;
}

.tab-content {
	width: 100%;
}
</style>

<!-- 메인 배너 -->
<div id="mainbannerbox">
	<ul class="mainbanner">
		<c:forEach items="${bannerList }" var="list">
			<li>
			<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<img src="/resources/image/${list.bannerImgStr}" />
			</a>
			</li>
		</c:forEach>
	</ul>
	
	<!-- 슬라이드 CSS 추가 시 변경 예정 -->
<!-- 	<ul class="mainThumb"> -->
<%-- 		<c:forEach items="${bannerList }" var="list"> --%>
<!-- 			<li> -->
<%-- 				<img src="/resources/image/${list.thumbImgOri}" /> --%>
<!-- 			</li> -->
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
</div>

<!-- 탭 배너 -->
<div class="main_tab">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">NEW! 공연</li>
	    <li class="tab-link" data-tab="tab-2">콘서트</li>
	    <li class="tab-link" data-tab="tab-3">뮤지컬&연극</li>
	</ul>

	<div id="tab-1" class="tab-content current">
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
	
	<div id="tab-2" class="tab-content">
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
	
	<div id="tab-3" class="tab-content">
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
	<h4>랭킹</h4>
	<div class="kindDiv">
		<ul class="kind">
			<li><span id="con">콘서트</span></li>
			<li><span id="mu">뮤지컬&연극</span></li>
			<li><span id="fam">가족&아동</span></li>
		</ul><br><br>
		
		<!-- 랭킹 테스트 데이터 이용해서 출력 중 / 쿼리문 작성 후 ajax 해야함 -->
		<ul id="posterList">
		<c:forEach items="${testList }" var="list">
			<li class="pfmInfo">
				<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<span class="thumImg">
<%-- 					<img class="tapImg" src="/resources/image/${list.originName}" /><br> --%>
				</span>
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
</div>

<div class="alignPfm">
	<h4>맞춤 공연</h4>
	<div>
		<c:if test="${login }" >
<!--  		<script>loginFitPfm();</script> -->
			<ul class="fitPfmbox" onload="loginFitPfm();">
				<li>
				<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
					<img src="/resources/image/${list.bannerImgOri}" />
				</a>
				</li>
			</ul>
		</c:if>
		
		<c:if test="${not login }">
			<h5 style="text-align: center;">로그인 시 맞춤 공연을 추천해드립니다.</h5>
		</c:if>
	</div>
</div>
</div>
