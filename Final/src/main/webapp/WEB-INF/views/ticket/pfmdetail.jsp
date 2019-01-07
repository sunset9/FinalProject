<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11b0d7e1cbaf8eb3510561bbddb85ae9&libraries=services"></script>
				
<script type="text/javascript">
$(document).ready(function() {
	console.log(1);	
	// 탭
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
		}
		,
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
		var userIdx = '${loginUser.userIdx }';
		
		// 삭제할 기대평 idx
		var expIdx = $('#expDeleteBtn').val();
		
		console.log('선택 기대평 idx : ' + expIdx);
// 		console.log('게시글 번호 : ' + pfmIdx);
// 		console.log('내용 : ' + expContent);
		console.log('로그인 유저 idx : ' + userIdx);
		
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
				console.log(d);
					
				// 성공할 경우 리스트에 출력해주기
				insertExpContent(d.expecList);
// 				insertExpRecomm(d.expRecommList);

				// 작성 성공시 textarea 초기화해주기
				$('#expectation').val("");
			}
			, error: function(e) {
				console.log("실패");
			}
		});
	});

	// 기대평 리스트
	function insertExpContent(expecList) {
		console.log('+ + + insertExpContent 함수 호출 완료 + + +');
		
		$('.ListExp').html('');
		
		expecList.forEach(function(list) {
			
		var div1 = $('<div class="expListUserInfo">');
		var img = $('<img id="userProfile" class="img-circle" src="/resources/image/' + list.profile + '"/><br>');
		var strong = $('<strong>' + list.nick + '</strong>');
		
		div1.append(img).append(strong);
		
		var div2 = $('<div class="expListContentInfo">');
		var small1 = $('<small>' + list.expContent + '</small><br>');
		var small2 = $('<small id="contentDay">등록일 : ' + list.createDate + '</small>');
		
		div2.append(small1).append(small2);
		
		var div3 = $('<div id="expdelnup">');
		var btn1 = $('<button id="expDeleteBtn" value="' + list.expIdx + '">삭제</button>');
		var input = $('<input type="text" id="expRecomm">');
		var btn2 = $('<button id="expReBtn" value="' + list.expIdx + '">답글</button>');
		
		console.log(list.expIdx);
		
		div3.append(btn1).append(input).append(btn2);
			
		$('.ListExp').append(div1).append(div2).append(div3);
		
		});
	};

	// 답글 선택 시
	$('#expReBtn').click(function() {
		var expIdx = $('#expReBtn').val();
		var contents = document.getElementById("expRecomm").value;
		var userIdx = '${loginUser.userIdx }';

		console.log('답글 작성 expIdx : ' + expIdx);
// 		console.log(contents);
// 		console.log(userIdx);
		
		$.ajax({     
			url: '/pfmdetail/expectRecomm'
			, method: 'GET'
			, data: {
				"expIdx": expIdx
				, "contents": contents
				, "userIdx": userIdx
			}
			, dataType: 'json'
			, success: function(d){
				console.log("+ + + 기대평 대댓글 작성 완료 + + +");
					
				// 성공할 경우 리스트에 출력해주기
				insertExpRecomm(d.expRecommList);

				// 작성 성공시 textarea 초기화해주기
				$('#expRecomm').val("");
			}
			, error: function(e) {
// 				console.log("실패");
				
				alert('댓글을 작성해주세요.');
			}
		});
	});
	
	// 기대평 대댓글 리스트
	function insertExpRecomm(expRecommList) {
		console.log('+ + + insertExpRecomm 함수 호출 완료 + + +');
		
		$('#expectationRecomm').html('');

		// 현재 대댓글을 달으려하는 댓글의 번호를 가져옴
		var expIdx = $('#expReBtn').val();
// 		console.log('expIdx : ' + expIdx);
		
		expRecommList.forEach(function(relist) {
			// 대댓글 데이터 중 expIdx와 부모 댓글의 expIdx가 동일할 경우
			if(relist.expIdx == expIdx) {
				console.log('relist.expIdx : ' + relist.expIdx);
				console.log('expIdx : ' + expIdx);
				
				var div = $('<div id="expectaRecomm">');
				var small = $('<small>-> ' + relist.nick + " : " + relist.contents + '</small><br>');
				div.append(small);
				
				$('#expectationRecomm').append(div);
			}
		});
	};
	
	// 관람 후기
	$('#revBtn, #revDeleteBtn').click(function() {
		// 작성, 삭제 여부 확인
		var updel = $(this).attr('id');
		
		// 현재 공연 번호
		var pfmIdx = ${pfmInfoList.pfmIdx };
		
		// 작성 내용 전달 및 작성할 유저 idx
		var revContent = $('#review').val();
		var userIdx = '${loginUser.userIdx }';
		
		console.log(updel);
		console.log(revContent);
		console.log(userIdx);
		
		// 삭제할 관람후기 idx
		var reviewIdx = $('#revDeleteBtn').val();
		
		$.ajax({
			url: '/pfmdetail/review'
			, method: 'GET'
			, data: {
				"reviewContent" : revContent
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

				// 작성 성공시 textarea 초기화해주기
				$('#review').val("");
			}
			, error: function(e) {
				console.log("실패");
			}
		});
	});

	// 관람후기 리스트
	function insertRevContent(reviewList) {
		
		$('.ListReview').html('');
		
		reviewList.forEach(function(list) {
			
		var div1 = $('<div class="revListUserInfo">');
		var img = $('<img id="userProfile" class="img-circle" src="/resources/image/' + list.profile + '"/><br>');
		var strong = $('<strong>' + list.nick + '</strong>');
		
		div1.append(img).append(strong);
		
		var div2 = $('<div class="revListContentInfo">');
		var small1 = $('<small>' + list.reviewContent + '</small><br>');
		var small2 = $('<small id="contentDay">등록일 : ' + list.createDate + '</small>');
		
		div2.append(small1).append(small2);
		
		var div3 = $('<div id="revdelnup">');
		var btn1 = $('<button id="revDeleteBtn" value="' + list.reviewIdx + '">삭제</button>');
		var input = $('<input type="text" id="revRecomm">');
		var btn2 = $('<button id="revReBtn" value="' + list.reviewIdx + '">답글</button>');
		
		console.log(list.reviewIdx);
		
		div3.append(btn1).append(input).append(btn2);
			
		$('.ListReview').append(div1).append(div2).append(div3);
		
		});
	};
	
	// QNA
	$('#qnaBtn').click(function() {
		// 현재 공연 번호
		var pfmIdx = ${pfmInfoList.pfmIdx };
		
		// 작성 내용 전달 및 작성할 유저 idx
		var qnaContent = $('#qna').val();
		var userIdx = '${loginUser.userIdx }';
		
		console.log(qnaContent);
		console.log(userIdx);
		
		$.ajax({
			url: '/pfmdetail/qna'
			, method: 'GET'
			, data: {
				"qnaContent" : qnaContent
				, "pfmIdx" : pfmIdx
				, "userIdx" : userIdx
			}
			, dataType: 'json'
			, success: function(d){
				console.log("+ + + 성공 + + +");
					
				// 성공할 경우 리스트에 출력해주기
				insertQnaContent(d.qnaList);

				// 작성 성공시 textarea 초기화해주기
				$('#qna').val("");
			}
			, error: function(e) {
				console.log("실패");
			}
		});
	});
	
});

function deleteQna (qnaIdx){
	
	console.log('+ + + QNA DELETE + + +');
	
	var pfmIdx = ${pfmInfoList.pfmIdx };
	
	console.log(pfmIdx);
	console.log(qnaIdx);
	
	$.ajax({
		type: "get"
		, url: "/pfmdetail/qnadelete"
		, dataType: "json"
		, data: {
			qnaIdx : qnaIdx
			, pfmIdx : pfmIdx
		}
		, success: function(d){
			var confirmDelete;
// 			confirmDelete = confirm("댓글을 삭제하시겠습니까?");
			
			if(confirmDelete) {
			$("[data-qnaIdx='"+qnaIdx+"']").remove();					
			} else {
// 				console.log('삭제 취소');
			}
			insertQnaContent(d.qnaList)
		}
		, error: function() {
			console.log("error");
		}
	});
};

function insertQnaRecomm(qnaIdx){
	
	console.log('+ + + QNA Recomm Insert + + +');
	
	var pfmIdx = ${pfmInfoList.pfmIdx };
	console.log('pfmIdx : ' + pfmIdx);
	
	var contents = $('#qnaRecomm').val();
// 	var contents = $('input[name=qnaRecomm]').val();
	console.log('contents : ' + contents);
	
	console.log('qnaIdx : ' + qnaIdx);
	
	$.ajax({
		type: "get"
		, url: "/pfmdetail/qnarecomm"
		, dataType: "json"
		, data: {
			qnaIdx : qnaIdx
			, contents : contents
			, pfmIdx : pfmIdx
		}
		, success: function(d){			
			insertQnaContent(d.qnaList);
// 			insertQnaRecommList(d.qnaRecommList);
		}
		, error: function() {
			console.log("error");
		}
	});
};

// function insertQnaRecommList(qnaRecommList) {
// 	$('#qnaRecomm').html('');
	
// 	qnaRecommList.forEach(function(list) {
// 		var qnaIdx = $('#qnaReBtn').val();
// 		console.log(qnaIdx);
		
// 		if(list.qnaIdx == qnaIdx) {
// 			var div = $('<div id="qRecomm">');
// 			var small = $('<small>-> 관리자 : ' + list.contents + '</small><br>');
			
// 			div.append(small);
			
// 			$('#qnaRecomm').append(div);
// 		}
		
// 	});
// };

function insertQnaContent(qnaList) {
	
	$('.ListQna').html('');
	
	qnaList.forEach(function(list) {
		
	var div1 = $('<div class="qnaListUserInfo">');
	var img = $('<img id="userProfile" class="img-circle" src="/resources/image/' + list.profile + '"/><br>');
	var strong = $('<strong>' + list.nick + '</strong>');
	
	div1.append(img).append(strong);
	
	var div2 = $('<div class="qnaListContentInfo">');
	var small1 = $('<small>' + list.qnaContent + '</small><br>');
	var small2 = $('<small id="contentDay">등록일 : ' + list.createDate + '</small>');
	
	div2.append(small1).append(small2);
	
	var div3 = $('<div id="qnadelnup">');
	var btn1 = $('<button id="qnaDeleteBtn" type="button" onclick="deleteQna(' + list.qnaIdx + ');">삭제</button>');
	var input = $('<input type="text" id="qnaRecomm" name="qnaRecomm">');
	var btn2 = $('<button id="qnaReBtn" type="button" onclick="insertQnaRecomm(' + list.qnaIdx + ');">답글</button>');
	
	console.log(list.qnaIdx);
	
	div3.append(btn1).append(input).append(btn2);
		
	$('.ListQna').append(div1).append(div2).append(div3);
	
	});
};
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

.posterImgDiv {
	width: auto;
	float: left;
	text-align: center;
}

.posterInfoDiv {
	float: left;
	margin-left: 20px;
	height: auto;
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

/* 기대평, 관람후기, qna */
#loginUserImg {
	 width: 50px;
	 height: 50px;
}

.insertExp {
	height: auto;
}

.insertExpUserInfo {
	float: left;
	text-align: center;
	margin: 5px;
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
#modifieBtn, #deleteBtn {
	list-style: none;
	float: left;
}

/* 다음 맵 */
#map {
	height: 400px;
	width: 100%;
}

#hallImg {
/* 	background-color: red;  */
	float: left;
	text-align: center;
	margin-left: 40px;
	position: static;
}

#hallInfo {
/*  	background-color: blue;  */
	width: auto;
	height: 200px;
	padding-top: 50px;
	padding-left: 10px;
	margin-bottom: 5px;
	display: inline-block;
}

#hallmap {
	margin-top: 20px;
/* 	background-color: yellow; */
}
</style>

<div class="container">
	<div class="topDiv ddiv">
		<div class="posterImgDiv">
			<img class="choicePosterImg" src="/resources/image/${posterList.storedName}" />
		</div>
	
		<div class="posterInfoDiv" style="font-size: 15px;">
			<strong style="font-size: 20px;">${pfmInfoList.name }</strong><br><br><br>
			관람시간 : ${pfmInfoList.runningTime }분<br>
			공연장 : ${hallInfoList.hallName }<br>
			연령제한 : 
			<c:choose>
				<c:when test="${pfmInfoList.ageGradeIdx eq 1}">
					전체 관람<br>
				</c:when>
				<c:when test="${pfmInfoList.ageGradeIdx eq 2 }">
					7세 이상<br>
				</c:when>
				<c:when test="${pfmInfoList.ageGradeIdx eq 3 }">
					15세 이상<br>
				</c:when>
				<c:when test="${pfmInfoList.ageGradeIdx eq 4 }">
					청소년 관람 불가<br>
				</c:when>
			</c:choose>
			공연기간 : <fmt:formatDate value="${pfmInfoList.pfmStart }" pattern="yyyy.MM.dd"/> ~ 
			<fmt:formatDate value="${pfmInfoList.pfmEnd }" pattern="yyyy.MM.dd"/><br>
			장르 : 
			<c:choose>
				<c:when test="${pfmInfoList.genreIdx eq 1 }">
					콘서트<br>
				</c:when>
				<c:when test="${pfmInfoList.genreIdx eq 2 }">
					뮤지컬&연극<br>
				</c:when>
				<c:when test="${pfmInfoList.genreIdx eq 3 }">
					가족&아동<br>
				</c:when>
			</c:choose>
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
			<div class="castInfo tabarray" style="width: 100%;">
			<ul>
			<c:forEach items="${castList }" var="list">
				<div class="imgli">
					<img id="castimg" class="img-circle" src="<c:url value="${list.imgUri}"/>"/><br>
					${list.name }
				</div>
			</c:forEach>
			</ul>
			</div>
			
			<div class="pfmInfo tabarray" style="display: inline-block;">
				${detailList.contents }
			</div>
		</div>
		
		<div id="tab-2" class="tab-content">
		<!-- 전체를 감싸는 div -->
		<div class="expectationContainer">
		
			<!-- 댓글 작성하는 부분 div -->
			<div class="insertExp">
				<c:if test="${login }">
				<div class="insertExpUserInfo">
				<img id="loginUserImg" class="img-circle"
					 src="<c:url value="/resources/image/${loginUser.profile}"/>"/><br>
					<strong>${loginUser.nick }</strong>
				</div>
				<textarea id="expectation" cols="100" rows="5"></textarea>
					<button type="submit" id="expecBtn">작성</button>
				</c:if>
				
				<c:if test="${not login }">
				<div class="insertExpUserInfo">
				<img id="loginUserImg" class="img-circle"
					 src="<c:url value="/resources/image/profile.png"/>"/><br>
				</div>
				<textarea id="exptextarea" readonly="readonly" cols="100" rows="5">로그인 후 기대평 작성이 가능합니다.</textarea>
					<button type="submit" id="expecBtn" disabled="disabled">작성</button>
				</c:if>
			</div>
			
			<!-- 기대평 출력되는 부분의 div -->
			<div class="ListExp">
			<c:forEach items="${expecList }" var="list">
				<!-- 기대평 작성한 사람의 정보 출력 div -->
				<div class="expListUserInfo">
					<img id="userProfile" class="img-circle" src="/resources/image/${list.profile }"/><br>
					<strong>${list.nick }</strong> 
				</div>
				
				<!-- 기대평 내용 출력 div -->
				<div class="expListContentInfo" style="float: inherit;">
					<small>${list.expContent }</small><br>
					<small id="contentDay">등록일 : ${list.createDate }</small>
				</div>
				
				<div id="expdelnup"> 
					<button id="expDeleteBtn" value="${list.expIdx }">삭제</button>
					<input type="text" id="expRecomm"><button id="expReBtn" value="${list.expIdx }">답글</button>
				</div>
				
				<!-- 대댓글 출력 부분 -->
				<c:forEach items="${expRecommList }" var="relist">
					<div id="expectationRecomm">
					<c:if test="${relist.expIdx eq list.expIdx }">
					<div id="expectaRecomm">
						<small>-> ${relist.nick} : ${relist.contents }</small><br>
					</div>
					</c:if>
					</div>
				</c:forEach>
					
			</c:forEach>			
			</div>
		</div>
		
		</div> <!-- tab2 -->
		
		<div id="tab-3" class="tab-content">
			<!-- 전체를 감싸는 div -->
		<div class="reviewContainer">
		
			<!-- 댓글 작성하는 부분 div -->
			<div class="insertRev">
				<c:if test="${login }">
				<div class="insertRevUserInfo">
				<img id="loginUserImg" class="img-circle"
					 src="<c:url value="/resources/image/${loginUser.profile}"/>"/><br>
					<strong>${loginUser.nick }</strong>
				</div>
				<textarea id="review" cols="100" rows="5"></textarea>
					<button type="submit" id="revBtn">작성</button>
				</c:if>
				
				<c:if test="${not login }">
				<div class="insertRevUserInfo">
				<img id="loginUserImg" class="img-circle"
					 src="<c:url value="/resources/image/profile.png"/>"/><br>
				</div>
				<textarea id="revtextarea" readonly="readonly" cols="100" rows="5">로그인 후 관람후기 작성이 가능합니다.</textarea>
					<button type="submit" id="revBtn" disabled="disabled">작성</button>
				</c:if>
			</div>
			
			<!-- 관람후기 출력되는 부분의 div -->
			<div class="ListReview">
			<c:forEach items="${reviewList }" var="list">
				<!-- 관람후기 작성한 사람의 정보 출력 div -->
				<div class="revListUserInfo">
					<img id="userProfile" class="img-circle" src="/resources/image/${list.profile }"/><br>
					<strong>${list.nick }</strong> 
				</div>
				
				<!-- 관람후기 내용 출력 div -->
				<div class="revListContentInfo">
					<small>${list.reviewContent }</small><br>
					<small id="contentDay">등록일 : ${list.createDate }</small>
				</div>
				
				<div id="revdelnup"> 
					<button id="revDeleteBtn" value="${list.reviewIdx }">삭제</button>
					<input type="text" id="revRecomm"><button id="revReBtn" value="${list.reviewIdx }">답글</button>
				</div>
				
				<!-- 대댓글 출력 부분 -->
<%-- 				<c:forEach items="${revRecommList }" var="relist"> --%>
<!-- 					<div id="expectationRecomm"> -->
<%-- 					<c:if test="${relist.expIdx eq list.expIdx }"> --%>
<!-- 					<div id="expectaRecomm"> -->
<%-- 						<small>-> ${relist.nick} : ${relist.contents }</small><br> --%>
<!-- 					</div> -->
<%-- 					</c:if> --%>
<!-- 					</div> -->
<%-- 				</c:forEach> --%>
					
			</c:forEach>			
			</div>
		</div>
		</div>	
		
		<div id="tab-4" class="tab-content">
			<div class="qnaContainer">
		
			<!-- 댓글 작성하는 부분 div -->
			<div class="insertQna">
				<c:if test="${login }">
				<div class="insertQnaUserInfo">
				<img id="loginUserImg" class="img-circle"
					 src="<c:url value="/resources/image/${loginUser.profile}"/>"/><br>
					<strong>${loginUser.nick }</strong>
				</div>
				<textarea id="qna" cols="100" rows="5"></textarea>
					<button type="submit" id="qnaBtn">작성</button>
				</c:if>
				
				<c:if test="${not login }">
				<div class="insertQnaUserInfo">
				<img id="loginUserImg" class="img-circle"
					 src="<c:url value="/resources/image/profile.png"/>"/><br>
				</div>
				<textarea id="qnatextarea" readonly="readonly" cols="100" rows="5">로그인 후 QNA 작성이 가능합니다.</textarea>
					<button type="submit" id="qnaBtn" disabled="disabled">작성</button>
				</c:if>
			</div>
			
			<!-- QNA 출력되는 부분의 div -->
			<div class="ListQna">
			<c:forEach items="${qnaList }" var="list">
				<!-- QNA 작성한 사람의 정보 출력 div -->
				<div class="qnaListUserInfo">
					<img id="userProfile" class="img-circle" src="/resources/image/${list.profile }"/><br>
					<strong>${list.nick }</strong> 
				</div>
				
				<!-- QNA 내용 출력 div -->
				<div class="qnaListContentInfo">
					<small>${list.qnaContent }</small><br>
					<small id="contentDay">등록일 : ${list.createDate }</small>
				</div>
				
				<div id="qnadelnup"> 
					<button id="qnaDeleteBtn" type="button" onclick="deleteQna(${list.qnaIdx});">삭제</button>
					<input type="text" id="qnaRecomm" name="qnaRecomm">
					<button id="qnaReBtn" type="button" value="${list.qnaIdx }"
						 onclick="insertQnaRecomm(${list.qnaIdx});">답글</button>
				</div>
				
				<c:forEach items="${qnaRecommList }" var="relist">
				<div id="qnaRecomm">
					<c:if test="${relist.qnaIdx eq list.qnaIdx}">
					<div id="qRecomm">
					<!-- 관리자 부분 변경하기 -->
						<small>-> 관리자 : ${relist.contents }</small><br>
					</div> 
					</c:if>
 				</div> 
				</c:forEach>
				
			</c:forEach>			
			</div>
		</div>
		</div>
		
		<div id="tab-5" class="tab-content">
		<div>
			<div id="hallImg">
				 <img style="width: 200px; height: 200px;" src="/resources/image/${hallImg.storedName }">
			</div>
			<div id="hallInfo">
			 공연장 이름 및 구역 : ${hallInfoList.hallName }, ${hallInfoList.hallLoc }<br>
			 전화번호 : ${hallInfoList.hallPhone }
			</div>
			 
			 <!-- GoogleMap API 연동 -->
			 <!-- 지도가 붙을 위치 -->
			 <div id="hallmap">
				<strong>공연장 위치</strong><br>
	       		<div id="map"></div>
	       		
	       		<!-- 위에 설정 시 지도 확인되지 않아 여기에 설정 -->
	       		<script>
	       		// 현재 등록되어있는 공연장의 주소지를 불러옴
	       		var hallAddress = '${hallInfoList.hallLoc}';
	       		console.log('등록된 공연장 주소지 : ' + hallAddress);
	       		
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        // 잠실 종합 운동장 좌표  : 37.515890, 127.072669
				        //	설정해도 중심으로 오지않음..
				        
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(hallAddress, function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {
				
				        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });
				        
				        var hallName = '${hallInfoList.hallName}';
				        console.log('등록된 공연장 이름 : ' + hallName);
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new daum.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + hallName + '</div>'
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				</script>
       		 </div>
        </div>
		</div>
		
		<div id="tab-6" class="tab-content">
			<strong style="font-size: 20px;">티켓 수령 방법 안내</strong><br><br>

			<strong>현장수령</strong><br>
			- 예매번호가 포함되어 있는 예매확인서와 예매자의 실물 신분증(복사본 및 사진 불가) 을 매표소에 제출하시면 편리하게 티켓을 수령하실 수 있습니다.<br>
			※ 공연별 정책이 상이하니 자세한 내용은 예매페이지 내 상세정보 확인 부탁드립니다.<br><br>
			
			<strong>배송</strong><br>
			- 배송을 선택하신 경우 예매완료(결제익일) 기준 4~5일 이내에 예매 시 입력하신 주소로 배송됩니다. (주말/공휴일 제외한 영업일 기준)<br>
			- 일괄배송의 경우 공연 별로 배송일자가 상이하며 지정된 배송일자 기준으로 배송이 시작됩니다. (지정된 배송일자는 상세정보 및 예매공지사항에서 확인할 수 있습니다.)<br>
			- 지역 및 배송서비스 사정에 따라 배송사가 변경될 수 있으며, 배송일이 추가적으로 소요될 수 있습니다. (CJ대한통운, 우체국 외 1개 업체)<br><br>
			
			<strong>취소/환불 안내</strong><br>
			- 취소마감시간 이후 또는 관람일 당일 예매하신 건에 대해서는 취소/변경/환불이 불가합니다.<br>
			- 예매수수료는 예매 당일 밤 12시 이전까지 취소 시 환불 가능합니다.<br>
			- 배송이 시작된 경우 취소마감시간 이전까지 멜론티켓 고객센터로 티켓을 반환해주셔야 환불이 가능하며, 도착한 일자 기준으로 취소수수료가 부과됩니다. <br>
			(* 단, 반환된 티켓의 배송료는 환불되지 않으며 일괄배송 상품의 경우 취소에 대한 자세한 문의는 고객센터로 문의해 주시기 바랍니다.)<br>
			- 예매취소 시점과 결제 시 사용하신 신용카드사의 환불 처리기준에 따라 취소금액의 환급방법과 환급일은 다소 차이가 있을 수 있습니다.<br>
			- 티켓 부분 취소 시 신용카드 할부 결제는 티켓 예매 시점으로 적용됩니다. (무이자할부 행사기간이 지날 경우 혜택 받지 못하실 수 있으니 유의하시기 바랍니다. )<br>
			- 취소일자에 따라 아래와 같이 취소수수료가 부과됩니다.<br>
			(예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 관람일 기준의 취소수수료가 부과됩니다.)<br>
		</div>
	</div>
</div>