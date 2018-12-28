<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11b0d7e1cbaf8eb3510561bbddb85ae9&libraries=services"></script>
				
<script type="text/javascript">
$(document).ready(function() {
	
	// 공연플래너 담기 버튼
	$('#mychoicebtn').click(function() {
		var userIdx = '${loginUser.userIdx }';
		console.log("loginUserIdx : " + userIdx);
		
		var pfmIdx = '${pfmInfoList.pfmIdx}';
		console.log("pfmIdx : " + pfmIdx);
	
		if(userIdx != '') {
		$.ajax({
			url: '/ticket/opendetail'
			, method: 'POST'
			, data: {
				"userIdx" : userIdx
				, "pfmIdx": pfmIdx
			}
			, dataType: 'json'
			, success: function(choice) {
				console.log('성공');
				
				if(choice)
					alert('공연플래너 담기가 완료되었습니다.');
			}
			, error: function(e) {
				console.log('실패');
			}
		});
		} else {
			alert('해당 기능은 로그인 후 이용가능합니다.\n로그인 후 이용해주세요.');
		}
	});
	
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
	
	
	<div id = "pfmInfo">
		<strong style="font-size: 20px;">${pfmInfoList.name }</strong><br><br>
		티켓 오픈일 : <fmt:formatDate value="${pfmInfoList.ticketStart }" pattern="yyyy-MM-dd"/><br>
	</div>
	<div id="btnDiv">
		<button id="mychoicebtn">공연플래너 담기</button>
		<button>상세보기</button>
	</div>
	<div class="bottomDiv ddiv">
		
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
	</div>
	</div>	
</div>