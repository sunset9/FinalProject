<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	$(document).ready(function() {
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
		 
		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		});
		
		// 기대평 작성 버튼 클릭 시
		$('#expecBtn').click(function() {
			
			
			var expectation = $('#expectation').val();;
			console.log(expectation);
			
			$.ajax({
				url: '/pfmdetail/expectation'
				, method: 'GET'
				, data: {
					"expectation": expectation
				}
				,dataType: 'json'
				, success: function(d){
					console.log("성공");
					
					// 성공할 경우 리스트에 출력해주기
// 					insertExpectation(d.expectationList);
				}
				, error: function(e) {
					console.log("실패");
				}
			});
		});
	});
</script>

<style>
.container {
	margin: 0 5% 10px 5%;
}

.posterImgDiv {
	float: left;
/* 	margin: 10px 0 10px 0; */
}

.choicePosterImg {
	width: 250px;
	height: 300px;
}

.posterInfoDiv {
	float: left;
/* 	margin: 10px 0 10px 20px; */
}

/* 하단 탭 */
.bottomDiv{
	width: 800px;
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
	display: inherit;
	width: 100%;
}

.ddiv {
	display: inline-block;
	width: 100%;
}

#castimg {
	width: 100px;
	height: 100px;
	text-align: center;
}

.imgli {
	list-style: none;
	float: left;
	margin: 5px;
}

.castInfo {
	margin-bottom: 20px;
}

.tabarray {
	display: inline-block;
}
</style>

<div class="container">
	<div class="topDiv ddiv">
		<div class="posterImgDiv">
			<img class="choicePosterImg" src="/resources/image/${posterList.originName}" />
		</div>
	
		<div class="posterInfoDiv">
			<h1>${pfmInfoList.name }</h1>
			<h5>관람시간 : ${pfmInfoList.runningTime }시간</h5>
		</div>
	</div>
	
	<div class="bottomDiv ddiv">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">상세정보	</li>
		    <li class="tab-link" data-tab="tab-2">기대평</li>
		    <li class="tab-link" data-tab="tab-3">관람후기</li>
		    <li class="tab-link" data-tab="tab-4">Q&A</li>
		    <li class="tab-link" data-tab="tab-5">공연장정보</li>
		    <li class="tab-link" data-tab="tab-6">예매안내</li>
		</ul>

		<div id="tab-1" class="tab-content current">
			<h3 style="float: left;">출연진</h3><br>
			<div class="castInfo tabarray">
			<ul>
			<c:forEach items="${castList }" var="list">
				<li class="imgli">
					<img id="castimg" class="img-circle" src="<c:url value="${list.imgUri}"/>"/><br>
					${list.name }
				</li>
			</c:forEach>
			</ul>
			</div>
			
			<div class="pfmInfo tabarray">
				${detailList.contents }
			</div>
		</div>
		
		<div id="tab-2" class="tab-content">
			<div class="expecUserInfo">
				유저 프로필, 이름 출력해서 보여주기
			</div>
			
			<div class="expectation">
				<textarea cols="100" rows="5" id="expectation"></textarea>
				<button type="submit" id="expecBtn">작성</button>
			</div>
			
			<div class="expectationList">
				<c:forEach items="${expecList }" var="list">
					${list.expContent }
				</c:forEach>
			</div>
		</div>
		
		<div id="tab-3" class="tab-content">
			33333333
		</div>
		
		<div id="tab-4" class="tab-content">
			4444444
		</div>
		
		<div id="tab-5" class="tab-content">
			455
		</div>
		
		<div id="tab-6" class="tab-content">
			66666
		</div>
	</div>
</div>