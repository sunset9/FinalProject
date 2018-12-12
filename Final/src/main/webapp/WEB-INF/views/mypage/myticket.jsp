<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
#userinfo{
	background-color: #CCC;
}

#userProfile{
	width: 150px;

	
}
#userNick{
	font-weight: bolder;
	font-size: 2em;
}
</style>

<h1>마이페이지 예약 현황</h1>
<hr>
<div id = "userinfo">
	<div class = "form-inline">
	
		<img id = "userProfile" src="/resources/image/profile.png"  class="img-circle"/>
		<span id="userNick">${loginUser.nick }</span> <small>님 안녕하세요</small>
		<button id="userInfoChange" class="btn btn-default">정보 변경</button>
		<span>입금 대기</span><span>예매 완료</span><span>취소 현황</span>
	</div>
	
	
</div>