<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">

#userNick{
	font-weight: bolder;
	font-size: 2em;
}

.tabSec{
	border: 1px solid #CCC;
	width: 33%;
	display: inline-block;	
}


</style>

<script type="text/javascript">

</script>

<h1>마이페이지 예약 현황</h1>
<hr>
<div>
<!-- 유저 정보 담고 있는 jsp -->
<jsp:include page="userinfo.jsp" />
</div>

<div id ="tabSec" style="border: 1px solid #CCC; ">
	<a href='/mypage/myticket'><div class = "tabSec" id ="ticket">예매현황</div></a>
	<a href='/mypage/mychoice'><div class = "tabSec" id ="choice">찜</div></a>
	<a href='/mypage/myinquery'><div class = "tabSec" id ="inquiry">내 문의사항</div></a>
</div>

<div class ="contain">

</div>