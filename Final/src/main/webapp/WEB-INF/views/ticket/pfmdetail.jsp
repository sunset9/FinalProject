<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<script type="text/javascript">
$(document).ready(function() {
	console.log(${pfmInfoList.pfmIdx });
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');
 
		$('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
		 
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});
		
	$.ajax({
		type:"get",
		url:"/ticket/bookInfo",
		data:{
			"pfmIdx" : ${pfmInfoList.pfmIdx},
			"hallIdx" : ${pfmInfoList.hallIdx},
			"name" : "${pfmInfoList.name}"
		},
		async: false,
		dataType:"html",
		success:function(res){
			$('#bookInfo').html(res);
		}
	});	
	
	// 기대평
	$('#expecBtn, #expDeleteBtn').click(function() {
		// 작성, 삭제 여부 확인
		var updel = $(this).attr('id');
		
		// 현재 공연 번호
		var pfmIdx = ${pfmInfoList.pfmIdx };
		
		// 작성 내용 전달 및 작성할 유저 idx
		var expContent = $('#expectation').val();
		var userIdx = ${loginUser.userIdx }
		
		// 삭제할 기대평 idx
		var expIdx = $('#expDeleteBtn').val();
		
		console.log('선택 기대평 idx : ' + expIdx);
// 		console.log('게시글 번호 : ' + pfmIdx);
// 		console.log('내용 : ' + expContent);
// 		console.log('로그인 유저 idx : ' + userIdx);
		
		$.ajax({
			url: '/pfmdetail/expectation'
			, method: 'GET'
			, data: {
				"expContent" : expContent
				, "pfmIdx" : pfmIdx
				, "userIdx" : userIdx
				, "updel" : updel
				, "expIdx" : expIdx
			}
			, dataType: 'json'
			, success: function(d){
				console.log("+ + + 성공 + + +");
					
				// 성공할 경우 리스트에 출력해주기
				insertExpContent(d.expecList);
				insertExpUser(d.expecUserList);

				// 작성 성공시 textarea 초기화해주기
				$('#expectation').val("");
			}
			, error: function(e) {
				console.log("실패");
			}
		});
	});

	// 기대평 작성자 리스트
	function insertExpUser(expecUserList) {
		
		$('#expecUser').html('');
		
		expecUserList.forEach(function(list) {
			
		var div = $('<div id="expectationUser">');
		var img = $('<img id="userProfile" class="img-circle" src="/resources/image/' + list.profile + '"/><br>');
		var strong = $('<strong>' + list.name + '</strong>');
		
		div.append(img);
		div.append(strong);
		
		$('#expecUser').append(div);

		});
	}
	
	// 기대평 리스트
	function insertExpContent(expecList) {
		
		$('#expecContent').html('');
		
		expecList.forEach(function(list) {
			
		var div1 = $('<div id="expectationContent">');
		var content = list.expContent;

		div1.append(content);
		
		var div2 = $('<div id="expdelnup">');
 		var delbtn = $('<button id="expDeleteBtn" value="' + list.expIdx + '">삭제</button>');
		
		div2.append(delbtn);
		
		div1.append(div2);
		
		$('#expecContent').append(div1);
		
		});
	}

	
	// 관람 후기
	$('#revBtn, #revDeleteBtn').click(function() {
		// 작성, 삭제 여부 확인
		var updel = $(this).attr('id');
		
		// 현재 공연 번호
		var pfmIdx = ${pfmInfoList.pfmIdx };
		
		// 작성 내용 전달 및 작성할 유저 idx
		var revContent = $('#review').val();
		var userIdx = ${loginUser.userIdx }
		
// 		console.log(updel);
// 		console.log(expContent);
// 		console.log(userIdx);
		
		// 삭제할 관람후기 idx
		var reviewIdx = $('#revDeleteBtn').val();
		
		$.ajax({
			url: '/pfmdetail/review'
			, method: 'GET'
			, data: {
				"reviewContent" : reviewContent
				, "pfmIdx" : pfmIdx
				, "userIdx" : userIdx
				, "updel" : updel
				, "reviewIdx" : reviewIdx
			}
			, dataType: 'json'
			, success: function(d){
				console.log("+ + + 성공 + + +");
					
				// 성공할 경우 리스트에 출력해주기
				insertRevContent(d.reviewList);
				insertRevUser(d.reviewUserList);

				// 작성 성공시 textarea 초기화해주기
				$('#review').val("");
			}
			, error: function(e) {
				console.log("실패");
			}
		});
	});

	// 별점
	$('.starRev span').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		return false;
	});
	
	// 별점 값 넘겨주기
// 	$('#20, #40, #60, #80, #100').click(function() {
		// 선택한 별점의 점수 가져오기
		//	한 별당 20점으로 처리하기 위해 id값 지정
// 		var reivewStar = $(this).attr('id');
		
// 		console.log('별점 : ' + reivewStar);
		
		// 댓글 작성하려면 별점, 내용, 유저idx, 공연 idx 필요함
// 		$.ajax({
// 				url: '/pfmdetail/review'
// 				, method: 'GET'
// 				, data: {
// 					"reivewStar" : reivewStar
// 				}
// 				, dataType: 'json'
// 				, success: function(d){
// 					console.log("+ + + 성공 + + +");
					
// 				}
// 				, error: function(e) {
// 					console.log("실패");
// 				}
// 		});
		
// 	});
	
	// 관람후기 작성자 리스트
	function insertRevUser(reviewUserList) {
		
		$('#revUser').html('');
		
		reviewUserList.forEach(function(list) {
			
		var div = $('<div id="reviewUser">');
		var img = $('<img id="userProfile" class="img-circle" src="/resources/image/' + list.profile + '"/><br>');
		var strong = $('<strong>' + list.name + '</strong>');
		
		div.append(img);
		div.append(strong);
		
		$('#revUser').append(div);

		});
	}

	// 관람후기 리스트
	function insertRevContent(reviewList) {
		
		$('#revContent').html('');
		
		reviewList.forEach(function(list) {
			
		var div1 = $('<div id="reviewContent">');
		var content = list.reviewContent;

		div1.append(content);
		
		var div2 = $('<div id="revdelnup">');
 		var delbtn = $('<button id="revDeleteBtn" value="' + list.reviewIdx + '">삭제</button>');
		
		div2.append(delbtn);
		
		div1.append(div2);
		
		$('#revContent').append(div1);
		
		});
	}

});
</script>

<style>
.container {
	margin: 0 5% 10px 5%;
}

.erImgDiv {
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

#castimg{
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

/* 기대평, 관람후기 */
#userProfile {
	width: 50px;
	height: 50px;
}

#expecUser, #expecContent, #revUser, #revContent {
	float: left;
	text-align: center;
}

#expectationContent, #expectationUser, #reviewContent, #reviewUser {
	margin: 5px;
	height: 70px;
	text-align: center;
}

.expectationList, .reviewList {
	margin-top: 10px;
}

#exptext, #revtext {
	color: gray;
}

#modifieBtn, #deleteBtn {
	list-style: none;
	float: left;
}

.expecUserInfo, .expectation, .revUserInfo, .review {
	list-style: none;
	float: left;
}

.expContainer, .revContainer {
	list-style: none;
	display: flex;
}

/* 별점 */
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 15px;
  height: 15px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{
	background-position:0 0;
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
	
	<div id = "bookInfo">
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
				<div class="imgli">
					<img id="castimg" class="img-circle" src="<c:url value="${list.imgUri}"/>"/><br>
					${list.name }
				</div>
			</c:forEach>
			</ul>
			</div>
			
			<div class="pfmInfo tabarray">
				${detailList.contents }
			</div>
		</div>
		
		<div id="tab-2" class="tab-content">
			<!-- 기대평 등록 부분, 나중에 이미지 경로 변경해주기 -->
			<ul>
			<li class="expContainer">
			<div class="insertExpextation">
			<ul>
				<li class="expecUserInfo">
					<img id="loginUserImg" class="img-circle" style="width: 50px; height: 50px;"
					 src="<c:url value="/resources/image/${loginUser.profile}"/>"/><br>
					<strong>${loginUser.name }</strong>
				</li>
				<c:if test="${login }">
				<li class="expectation">
					<textarea id="expectation" cols="100" rows="5"></textarea>
					<button type="submit" id="expecBtn">작성</button>
				</li>
				</c:if>
				
				<c:if test="${not login }">
				<div class="expectation">
					<textarea id="exptextarea" readonly="readonly" cols="100" rows="5">로그인 후 기대평 작성이 가능합니다.</textarea>
					<button type="submit" id="expecBtn">작성</button>
				</div>
				</c:if>
			</ul>
			</div>
			</li>
			
			<!-- 기대평 리스트 출력 부분 -->
			<li class="expectationList expContainer">
				<div id="expecUser">
				<c:forEach items="${expecUserList }" var="list">
					<div id="expectationUser">
						<img id="userProfile" class="img-circle" src="/resources/image/${list.profile }"/><br>
						<strong>${list.name }</strong>
					</div>
				</c:forEach>
				</div>
					
				<div id="expecContent">
				<c:forEach items="${expecList }" var="list">
				<div id="expectationContent">
					${list.expContent }
					
					<div id="expdelnup">
<%-- 					<c:if test="${sessionScope.email eq loginUser.email }"> --%>
						<button id="expDeleteBtn" value="${list.expIdx }">삭제</button>
<%-- 					</c:if> --%>
					</div>
				</div>
				</c:forEach>
				</div>
			</li>
			</ul>
		</div> <!-- tab2 -->
		
		<div id="tab-3" class="tab-content">
			<!-- 별점 -->
			<div class="starRev">
				<span class="starR on" id="20">별1</span>
				<span class="starR" id="40">별2</span>
				<span class="starR" id="60">별3</span>
				<span class="starR" id="80">별4</span>
				<span class="starR" id="100">별5</span>
			</div>
			: 별점 구현 전
			
			<!-- 관람후기 등록 부분, 나중에 이미지 경로 변경해주기 -->
			<ul>
			<li class="revContainer">
			<div class="insertReview">
			<ul>
				<li class="revUserInfo">
					<img id="loginUserImg" class="img-circle" style="width: 50px; height: 50px;"
					 src="<c:url value="/resources/image/${loginUser.profile}"/>"/><br>
					<strong>${loginUser.name }</strong>
				</li>
				<c:if test="${login }">
				<li class="review">
					<textarea id="review" cols="100" rows="5"></textarea>
					<button type="submit" id="revBtn">작성</button>
				</li>
				</c:if>
				
				<c:if test="${not login }">
				<div class="review">
					<textarea id="revtextarea" readonly="readonly" cols="100" rows="5">로그인 후 관람후기 작성이 가능합니다.</textarea>
					<button type="submit" id="revBtn">작성</button>
				</div>
				</c:if>
			</ul>
			</div>
			</li>
			
			<!-- 관람후기 리스트 출력 부분 -->
			<li class="reviewList revContainer">
				<div id="revUser">
				<c:forEach items="${reviewUserList }" var="list">
					<div id="reviewUser">
						<img id="userProfile" class="img-circle" src="/resources/image/${list.profile }"/><br>
						<strong>${list.name }</strong>
					</div>
				</c:forEach>
				</div>
					
				<div id="revContent">
				<c:forEach items="${reviewList }" var="list">
				<div id="reviewContent">
					${list.reviewContent }<br>
					<small>평점 : ${list.reviewStar } / 별로 출력바꾸기</small>
					
					<div id="revdelnup">
<%-- 					<c:if test="${sessionScope.email eq loginUser.email }"> --%>
						<button id="revDeleteBtn" value="${list.reviewIdx }">삭제</button>
<%-- 					</c:if> --%>
					</div>
				</div>
				</c:forEach>
				</div>
			</li>
			</ul>
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