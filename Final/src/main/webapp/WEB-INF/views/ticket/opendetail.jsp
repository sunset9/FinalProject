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
	$('.castImgUl').bxSlider({
		// 무한 루프가 아닌 처음과 끝으로 표현
		infiniteLoop: false,
		hideControlOnEnd: true,
		pager: false,
		minSlides : 7,
		maxSlides : 7,
		slideWidth : 1130,
		slideMargin : 10
	});
	
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
	
// 	$('#pfmDetailbtn').click(function() {
// 		$(location).attr("href", "");
// 	});
	
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

ul.tabs li{
	background: none;
/* 	color: #222; */
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}
 
ul.tabs li.current{
/* 	background: #ededed; */
	color: #222;
}
 
.tab-content{
	display: none;
/* 	background: #ededed; */
	padding: 15px;
}
 
.tab-content.current{
	display: inherit;
	width: 100%;
}

.ddiv, .pfmInfo {
	display: inline-block;
	width: 100%;
	margin: 10px;
}

#castimg{
	width: 100px;
	height: 100px;
	text-align: center;
	margin: 5px;
}

.castInfo {
	margin-bottom: 20px;
}

.pfmInfo {
	margin: 20px 0px 10px 0px;
/* 	padding: 10px; */
}

#openticketText {
	font-size: 30px;
	display: inline-block;
	width: 100%;
	margin: 30px 5px 0px 5px;
}

.imgli {
	float: left;
}

.bx-wrapper {
	margin-top: 20px;
}

.topDiv {
	border: 1px solid #BDBDBD;
	height: 320px;
	padding: 10px;
}

#pfmMyChoice {
	border: 1px solid #BDBDBD;
	padding: 20px;
	font-size: 20px;
	margin-bottom: 30px;
	display: flex;
}

#pfmTitle {
	padding: 10px;
}
</style>

<div class="main_wrapper">
	<div class="ddiv">
		<div class="topDiv">
		<div class="posterImgDiv">
			<img class="choicePosterImg" src="/resources/image/${posterList.storedName}" />
		</div>
		
		<div id="pfmTitle">
			<strong style="font-size: 30px;">${pfmInfoList.name } 티켓 오픈 안내</strong><br>
			<small>등록일 : <fmt:formatDate value="${pfmInfoList.createDate }" pattern="yyyy.MM.dd"/></small><br><br>
			<small style="font-size: 15px;">안녕하세요. 바나나티켓입니다.<br>${pfmInfoList.name } 티켓 오픈 안내입니다.</small>
		</div>
		</div>
		
		<strong id="openticketText">티켓 오픈 일정</strong>
		<div id="pfmMyChoice">
		<div style="width: 580px;">
			<strong>${pfmInfoList.name }</strong><br>
			티켓 오픈일 : <fmt:formatDate value="${pfmInfoList.ticketStart }" pattern="yyyy.MM.dd"/>
		</div>
		<div style="width: 580px; text-align: center; margin-top: 10px;">
			<button class="btn btn-default" id="mychoicebtn">공연플래너 담기</button>
			<a href="/ticket/pfmdetail?pfmIdx=${pfmInfoList.pfmIdx}">
				<button id="pfmDetailbtn" class="btn btn-success">상세보기</button>
			</a>
		</div>
		</div>
		<div class="bottomDiv ddiv">
			
			<div id="tab-1" class="tab-content current">
				<strong style="float: left; font-size: 20px;">출연진</strong><br>
				<div class="castInfo tabarray">
				<ul class="castImgUl">
				<c:forEach items="${castList }" var="list">
					<li class="imgli">
						<img id="castimg" class="img-circle" src="<c:url value="${list.imgUri}"/>"/><br>
						${list.name }
					</li>
				</c:forEach>
				</ul>
				</div>
				
				<div class="pfmInfo tabarray"style="display: inline-block;">
					<strong style="float: left; font-size: 20px;">공연 정보</strong><br>
					${detailList.contents }
				</div>
			</div>
		</div>
	</div>	
</div>