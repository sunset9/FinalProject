<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
$(document).ready(function() {
	$("#1, #2, #3, #4, #5").click(function() {
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
				
				themeList(d.posterList);
			}
			, error: function(e) {
				console.log('실패 !!!');
			}
		});
	}); // #1 ~ #5 click
	
	function themeList(posterList) {
		
		$('#posterList').html('');
		
		posterList.forEach(function(list) {
			
		var li =$('<li class="pfmInfo">');
		
		var a = $('<a href="/ticket/pfmdetail?pfmIdx='+ list.pfmIdx + '">');
		var span = $('<span class="thumImg">');
		var img = $('<img class="concertImg" src="/resources/image/'+ list.originName + '">');
		
		a.append(span.append(img));
		// 쿼리 수정 후 서버에서 이름 가져와 출력해주기
//			a.append($('<strong>'+ pfm.name +'</strong>'));
		li.append(a);
		
		$('#posterList').append(li);

		});
	}
	
	// 인기순, 임박순, 최신순 테스트중
// 	$("#11, #22, #33").click(function() {
// 		var arrayList = $(this).attr('id');
// 		console.log(arrayList);
		
// 		$.ajax({
// 			url: '/ticket/arraylist'
// 			, method: 'GET'
// 			, data: {
// 				"array" : arrayList
// 			}
// 			, dataType: 'json'
// 			, success: function(d) {
// 				console.log('성공');
// 				console.log(d);
// 			}
// 			, error: function(e) {
// 				console.log('실패');
// 			}
// 		});
// 	});
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

ul.choice {
	list-style: none;
}
ul.choice li {
	float: left;
}

ul.choice li span{
    padding: 0 20px 0 21px;
    vertical-align: middle;
    cursor: pointer;
}
.choiceDiv {
	width:100%;
	float: right;
	text-align: center;
}

li.pfmInfo {
	list-style: none;
	float: left;
}

.choiceDiv button {
	margin: 5px;
}
</style>
<div class="container">
	<!-- 관리자가 선택한 콘서트 상단 배너 15개 -->
	<!-- 슬라이드 추가하기 -->
	<h3>콘서트</h3>
	<c:forEach items="${topBanList }" var="topList">
	<span class="thumImg">
		<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
			<img class="concertImg" src="/resources/image/${topList.originName}" />
		</a>
	</span>
	</c:forEach>
	
	<hr>
	<!-- 테마 리스트, 클릭시 해당 테마의 포스터만 확인가능하도록 수정 -->
	<div class="choiceDiv">
		<button id="1" value="1" style="border: none; background-color: #FFFFFF; color: black;">발라드/R&B</button>
		<button id="2" value="2" style="border: none; background-color: #FFFFFF; color: black;">인디</button>
		<button id="3" value="3" style="border: none; background-color: #FFFFFF; color: black;">Pop</button>
		<button id="4" value="4" style="border: none; background-color: #FFFFFF; color: black;">토크콘서트</button>
		<button id="5" value="5" style="border: none; background-color: #FFFFFF; color: black;">내한</button>
	</div>
	
	<div class="arrayDiv">
		<ul class="array">
			<li><span id="11">인기순</span></li>
			<li><span id="22">공연임박순</span></li>
			<li><span id="33">최신순</span></li>
		</ul>
	</div>
	
	<!-- 포스터 전체 리스트 출력 -->
<%-- 	<c:forEach items="${posterList }" var="list"> --%>
<!-- 	<button class="imgDetailInfo" style="border: none; background-color: #FFFFFF;"> -->
<!-- 	<span class="thumImg"> -->
<%-- 		<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}"> --%>
<%-- 		<img class="concertImg" src="/resources/image/${list.originName}" /><br> --%>
<%-- 		<strong>${list.name }</strong> --%>
<!-- 		</a> -->
<!-- 	</span> -->
<%-- 	</c:forEach> --%>
	<ul id="posterList">
		<c:forEach items="${posterList }" var="list">
			<li class="pfmInfo">
				<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<span class="thumImg">
					<img class="concertImg" src="/resources/image/${list.originName}" /><br>
					<strong>${list.name }</strong>
				</span>
				</a>
			</li>
		</c:forEach>
	</ul>
	
	<!-- 무한스크롤 추가하기 -->
</div>
