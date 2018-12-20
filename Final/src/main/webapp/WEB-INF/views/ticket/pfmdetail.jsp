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
		
	// 기대평 작성 버튼 클릭 시
	$('#expecBtn').click(function() {
			
		var expContent = $('#expectation').val();;
		console.log(expContent);
		
		$.ajax({
			url: '/ticket/pfmdetail'
			, method: 'POST'
			, data: {
				"expContent": expContent
			}
			,dataType: 'json'
			, success: function(d){
				console.log("성공");
					
				// 성공할 경우 리스트에 출력해주기
// 				insertExpectation(d.expectationList);
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

/* 기대평 */

#userProfile {
	width: 50px;
	height: 50px;
}

#expecUser, #expecContent {
	float: left;
	text-align: center;
}

#expectationContent, #expectationUser {
	margin: 5px;
	height: 70px;
	text-align: center;
}

.expectationList {
	margin-top: 10px;
}

#exptext {
	color: gray;
}
/* #expectationuser, #expectationContent { */
/* 	height: 60px; */
/* } */
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
			<div class="insertExpextation">
				<div class="expecUserInfo">
					유저 프로필, 이름 출력해서 보여주기
				</div>
				<c:if test="${login }">
				<div class="expectation">
					<textarea id="exptextarea" cols="100" rows="5" id="expectation"></textarea>
					<button type="submit" id="expecBtn">작성</button>
				</div>
				</c:if>
				
				<c:if test="${not login }">
				<div class="expectation">
					<textarea id="exptext" readonly="readonly" cols="100" rows="5" id="expectation">로그인 후 기대평 작성이 가능합니다.</textarea>
					<button type="submit" id="expecBtn">작성</button>
				</div>
				</c:if>
			</div>
			
			<div class="expectationList">
				<div id="expecUser">
				<c:forEach items="${expecUserList }" var="list">
					<div id="expectationUser">
						<img id="userProfile" class="img-circle" src="/resources/image/${list.profile }"/><br>
						${list.name }
					</div>
				</c:forEach>
				</div>
					
				<div id="expecContent">
				<c:forEach items="${expecList }" var="list">
				<div id="expectationContent">
						${list.expContent }
						<!-- createDate 값 읽어오지못해,, 수정해야함 -->
<%-- 						<fmt:formatDate value="${list.createDate }" pattern="yyyy-MM-dd"/> --%>
					</div>
				</c:forEach>
				</div>
			</div>
		</div> <!-- tab2 -->
		
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