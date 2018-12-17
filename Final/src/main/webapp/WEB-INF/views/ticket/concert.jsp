<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
$(document).ready(function() {
	// 상단배너 이미지 하나씩 자동 슬라이드 해주기
	setInterval(function() {
		$('.topbannerimg').append($('.bannerImg').first());
	}, 2000);
	
	$("#all, #1, #2, #3, #4, #5").click(function() {
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
// 				console.log(d);
				
				themeList(d.posterList);
			}
			, error: function(e) {
				console.log('실패 !!!');
			}
		});
	}); // 테마 선택 btn
	
	// 인기순, 임박순, 최신순 (테스트중)
	$("#popularity, #Deadline, #Latest").click(function() {
		var arrayList = $(this).attr('id');
		console.log(arrayList);
		
		$.ajax({
			url: '/ticket/arraylist'
			, method: 'GET'
			, data: {
				"array" : arrayList
			}
			, dataType: 'json'
			, success: function(d) {
				console.log('성공');
				console.log(d);
				
				themeList(d.posterList);
			}
			, error: function(e) {
				console.log('실패');
			}
		});
	}); // 정렬 선택 btn
	
	function themeList(posterList) {
		
		$('#posterList').html('');
		
		posterList.forEach(function(list) {
			
		var li =$('<li class="pfmInfo">');
		
		var a = $('<a href="/ticket/pfmdetail?pfmIdx='+ list.pfmIdx + '">');
		var span = $('<span class="thumImg">');
		var img = $('<img class="concertImg" src="/resources/image/'+ list.originName + '"><br>');
		
		a.append(span.append(img));
		a.append($('<strong>'+ list.name +'</strong>'));
		li.append(a);
		
		$('#posterList').append(li);

		});
	}
	
});

</script>

<style>
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
	margin: 5px;
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
	margin: 5px;
	text-align: center;
}

.choiceDiv button {
	margin: 5px;
}

.choiceDiv {
	text-align: center;
}
</style>
<div class="container">
	<!-- 관리자가 선택한 콘서트 상단 배너 15개 -->
	<h3>콘서트</h3>
	<div class="topbannerimg">
	<c:forEach items="${topBanList }" var="topList">
	<span class="thumImg">
		<a href="/ticket/pfmdetail?pfmIdx=${topList.pfmIdx}">
			<img class="bannerImg" src="/resources/image/${topList.originName}" />
		</a>
	</span>
	</c:forEach>
	</div>
	
	<hr>
	<!-- 테마 리스트, 클릭시 해당 테마의 포스터만 확인가능 -->
	<div class="choiceDiv">
		<button id="all" style="border: none; background-color: #FFFFFF; color: black;">전체</button>
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
	
	<!-- 포스터 리스트 출력 -->
	<ul id="posterList">
		<c:forEach items="${posterList }" var="list">
			<li class="pfmInfo">
				<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<span class="thumImg">
					<img class="concertImg" src="/resources/image/${list.originName}" /><br>
				</span>
				<strong class="imgname">${list.name }</strong>
				</a>
			</li>
		</c:forEach>
	</ul>
	
	<!-- 무한스크롤 추가하기 -->
</div>
