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
// 		var expIdx = $('#expDeleteBtn').val();
		
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
		
// 		var star = $('#20, #40, #60, #80, #100').attr('id');
// 		console.log(star);
		
		// 현재 공연 번호
		var pfmIdx = ${pfmInfoList.pfmIdx };
		
		// 작성 내용 전달 및 작성할 유저 idx
		var revContent = $('#review').val();
		var userIdx = ${loginUser.userIdx }
		
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
// 	$('.starRev span').click(function(){
// 		$(this).parent().children('span').removeClass('on');
// 		$(this).addClass('on').prevAll('span').addClass('on');
// 		return false;
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

.posterImgDiv {
	width: 400px;
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
/* .starR{ */
/*   background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0; */
/*   background-size: auto 100%; */
/*   width: 15px; */
/*   height: 15px; */
/*   display: inline-block; */
/*   text-indent: -9999px; */
/*   cursor: pointer; */
/* } */
/* .starR.on{ */
/* 	background-position:0 0; */
/* } */

/* 구글 맵 */
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
			<img class="choicePosterImg" src="/resources/image/${posterList.originName}" />
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