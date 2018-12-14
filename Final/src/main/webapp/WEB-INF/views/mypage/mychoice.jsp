<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
#userProfile{
	width: 150px;
	
}
#userinfo{
	background-color: #CCC;
}

.artistSec {
	float: left;
	width: 200px;
}

#choicePfm{
/* 	float해제하기 */
	clear: left;
}

.posterImg{
	width: 150px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	// 오늘 날짜 구하기
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	today = yyyy +'/'+mm+'/'+dd;
	console.log(today);
	
	
	
	
	
});  // ready end

</script>

<h1>내가 찜한 공연</h1>
<button onclick="location ='/mypage/prefer'">선호 수정하기</button>
<hr>
<div id = "userinfo">
	<div class = "form-inline">
	
		<img id = "userProfile" src="${loginUser.profile }"  class="img-circle"/>
		<span id="userNick">${loginUser.nick }</span> <small>님 안녕하세요</small>
		<button id="userInfoChange" class="btn btn-default">정보 변경</button>
		<span>입금 대기</span><span>예매 완료</span><span>취소 현황</span>
	</div>
	
	
</div>

<!-- 선택한 아티스트 이름과 사진 보여주기 -->
<div id = "selectedArt">
	<c:forEach items="${aList }" var ="a">
	<c:if test ="${! empty  a}">
	<div  data-paidx="${a.artistIdx }" class = "artistSec">
		<img id = "artistImg" src="${a.imgUri }"  class="img-circle"/>
		<span>${a.name } </span>
	</div>
	</c:if>
	</c:forEach>
</div>

<!-- 유저가 찜해 놓은 공연 목록 보여주기 -->
<div id ="choicePfm">
	<c:forEach items="${pfmList }" var ="pfm">
	<c:if test ="${! empty pfm}">
	<div  data-pfmidx="${pfm.pfmIdx }" class = "pfmSec">
		
		<span class="frame">
		<img class = "posterImg" src="/resources/image/${pfm.posterImg }" />
		</span>
		<span> 판매기간 : ~ ${pfm.ticketEnd }</span><br>
		<span>${pfm.pfmName } </span>
	</div>
	</c:if>
	</c:forEach>
</div>

<!-- 선택한 테마와 유저에 관한 추천공연  -->
<div id ="recommendPfm">

</div>

<!-- 선택한 테마와 아티스트 텍스트로 보여주기 -->
<div id="myprefer">

</div>
