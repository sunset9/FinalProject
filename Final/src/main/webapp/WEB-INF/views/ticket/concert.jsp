<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#conall, #1, #2, #3, #4, #5").click(function() {
		// 각 버튼을 눌렀을 경우 해당 버튼에 대한 id 값을 가져옴
		//  id 값을 넘겨 themeIdx로 사용하여 조회하기 테스트
		var themeIdx = $(this).attr('id');
		console.log(themeIdx);
		
		$.ajax({
			url: '/ticket/themelist'
			, method: 'GET'
			, data: {
				"theme" : themeIdx
			}
			, dataType: 'json'
			, success: function(d) {
				// 테마에 맞는 리스트 가져오기
				console.log('성공');
				console.log(d);
				
				themeList(d.pfmList);
			}
			, error: function(e) {
				console.log('실패 !!!');
			}
		});
	}); // 테마 선택 btn
	
	// 인기순, 임박순, 최신순
	$("#popularity, #Deadline, #Latest").click(function() {
		var arrayList = $(this).attr('id');
		console.log(arrayList);
		
		// 콘서트 장르 IDX 전달해주기
		var genreIdx = 1;
		console.log(genreIdx);
		
		$.ajax({
			url: '/ticket/arraylist'
			, method: 'GET'
			, data: {
				"array" : arrayList
				, "genreIdx": genreIdx
			}
			, dataType: 'json'
			, success: function(d) {
				console.log('성공');
				console.log(d);
				
				themeList(d.pfmList);
			}
			, error: function(e) {
				console.log('실패');
			}
		});
	}); // 정렬 선택 btn
	
	function themeList(pfmList) {
		
		$('#pfmList').html('');
		
		pfmList.forEach(function(list) {
			
			var li =$('<li class="pfmInfo">');
			
			var a = $('<a href="/ticket/pfmdetail?pfmIdx='+ list.pfmIdx + '">');
			var span = $('<span class="thumImg">');
			var img = $('<img class="concertImg" src="/resources/image/'+ list.posterName + '"><br>');
			
			a.append(span.append(img));
			a.append($('<strong>'+ list.name +'</strong><br>'));
			
			var pfmStart = getDateSimpleString(list.pfmStart);
			var pfmEnd = getDateSimpleString(list.pfmEnd);
// 			console.log(pfmStart);
			
			a.append($('<small>' + pfmStart + ' ~ ' + pfmEnd + '</small>'));
			
			a.append($('<p>'+ list.hallName +'</p>'));
			li.append(a);
			
			$('#pfmList').append(li);

		});
	}
	
	function getDateSimpleString(date){
		var date = new Date(date);
		var month = date.getMonth() + 1;
		var day = date.getDate();
		return date.getFullYear() + "."
			+ ((month < 10)? '0' + month : month) + "."
			+ ((day < 10) ? '0' + day : day);
	}
	
	$('.bxslider').bxSlider({
		// 무한 루프가 아닌 처음과 끝으로 표현
		infiniteLoop: false,
		hideControlOnEnd: true,
		minSlides : 5,
		maxSlides : 5,
		slideWidth : 350
// 		slideMargin : 20
// 		ticker : true,
// 		speed : 50000
	});
	
});

</script>

<style>
.topbannerimg {
	text-align: center;
}

.container {
	margin: 0 5% 10px 5%;
}

.concertImg {
	width: 250px;
	height: 300px;
	margin: 5px;
}

.bannerImg {
	width: 200px;
	height: 250px;
	margin: 3px;
}

.themeList {
	margin: 5px;
	text-align: center;
}

ul.array {
	float: right;
	list-style: none;
}

ul.array li {
	float: left;
}

ul.array li span{
    padding: 0 20px 0 21px;
    vertical-align: middle;
    cursor: pointer;
}

.arrayDiv {
	width:100%;
	float: right;
}

li.pfmInfo {
	list-style: none;
	float: left;
	margin: 10px;
	text-align: center;
	border: 1px solid #C6C5C5;
}

.choiceDiv button {
	margin: 5px;
}

.choiceDiv {
	text-align: center;
	margin-top: 20px;
}
</style>
<div class="container">
	<!-- 관리자가 선택한 콘서트 상단 배너 15개 -->
	<h3 style="font-size: 30px;">콘서트</h3><br>
	<div class="topbannerimg">
	<ul class="bxslider">
	<c:forEach items="${topBanList }" var="topList">
	<li class="thumImg">
		<a href="/ticket/pfmdetail?pfmIdx=${topList.pfmIdx}">
			<img class="bannerImg" src="/resources/image/${topList.storedName}" /><br>
			<small>${topList.name }</small>
		</a>
	</li>
	</c:forEach>
	</ul>
	</div>
	
	<hr>
	<!-- 테마 리스트, 클릭시 해당 테마의 포스터만 확인가능 -->
	<div class="choiceDiv">
		<button id="conall" style="border: none; background-color: #FFFFFF; color: black;">전체</button>
		<button id="1" style="border: none; background-color: #FFFFFF; color: black;">발라드/R&B</button>
		<button id="2" style="border: none; background-color: #FFFFFF; color: black;">인디</button>
		<button id="3" style="border: none; background-color: #FFFFFF; color: black;">Pop</button>
		<button id="4" style="border: none; background-color: #FFFFFF; color: black;">토크콘서트</button>
		<button id="5" style="border: none; background-color: #FFFFFF; color: black;">내한</button>
	</div>
	
	<div class="arrayDiv">
		<ul class="array">
			<li><span id="popularity">인기순</span></li>
			<li><span id="Deadline">공연임박순</span></li>
			<li><span id="Latest">최신순</span></li>
		</ul>
	</div>
	
	<div class="main_wrapper">
	<!-- 공연 리스트 출력 -->
	<ul id="pfmList">
		<c:forEach items="${posterList }" var="list">
			<li class="pfmInfo">
				<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<span class="thumImg">
					<img class="concertImg" src="/resources/image/${list.posterName}" /><br>
				</span>
				<strong class="imgname">${list.name }</strong><br>
				<small>
					<fmt:formatDate value="${list.pfmStart }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${list.pfmEnd }" pattern="yyyy.MM.dd"/><br>
				</small>
				<small>${list.hallName }</small>
				</a>
			</li>
		</c:forEach>
	</ul>
	</div>
	<!-- 무한스크롤 추가하기 -->
</div>
