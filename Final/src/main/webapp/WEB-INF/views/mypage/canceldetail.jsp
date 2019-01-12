<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.boxDiv{
 	border: 1px solid #CCC;
 	padding :10px;
}
#warpTicket{
	display: grid;
	width:1160px;
	margin: 20px auto;
/* 	padding :10px; */
	grid-template-columns: 200px auto ;
 	grid-gap: 10px;
 	grid-template-rows:50px, auto; 

}
#poster {
	display: inline-block;
	grid-area: 1 / 1 / 3 / 2  ;
}
.btnDiv{
	margin: 20px auto;
	text-align: center;
}
#title{
	
	grid-area: 1/ 2 / 2 /3 ;
	text-align : center;
/* 	border: 1px solid black; */
	font-weight: bolder;
	font-size: 3em;
	
}


#bookDetail{
	grid-area: 2/ 2 / 3 /3;
	text-align: center;
	
}
.innerBox{
/* 	북 디테일 담고 있는 div */
	width: 500px;
	margin: 0 auto;
}
dt{
	float: left;
	margin-right: 10px;
}
th{
	text-align: center !important;
}

 td{ 
/* 	border: 1px solid black; */
	padding: 10px;

 }
 
dd{
	padding:5xp ;
 	text-align: center;
 } 
table{
	width: 100%;
	text-align: center;
}
.pfmInfo{
	width: 20%;
	background: #EEE;
	border-bottom: #fff;
}
.fontSize{
	font-size: 1.2em;
}
.previous{
	width: 140px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    color:#FFF;
    font-weight: bold;
}
.btnDiv{
	margin: 20px auto;
	text-align: center;
}
.cancelBookGroup{

	color: #F2B134;
 
}
.cancelBookGroup span{
   text-decoration-line: line-through;
}
</style>

<div class="main_wrapper">
<div>
<!-- 유저 정보 담고 있는 jsp -->
<jsp:include page="userinfo.jsp" />
</div>

<!-- 구매 티켓 정보 -->
<div id = "warpTicket" class ="boxDiv">
	<div id = "poster">
	<img style ="width: 180px; height: 262px;" src="/resources/image/${sob.storedName }">
	</div>
	
<!-- 	공연 타이틀 -->
	<div id="title">
	<span>${sob.name }</span>
	</div>

<!-- 	예매 상세 정보	 -->
	<div id="bookDetail">
		<div class = "innerBox">
			<dl>
			<dt>예매번호</dt> <dd class="cancelBookGroup">[취소]<span>${sob.bookGroup }</span></dd>
			<dt>공연장</dt> <dd>${sob.hallName }</dd>
			</dl>
			<dl>
			<dt>예매일시</dt> <dd>
			<fmt:formatDate value="${sob.createDate }" pattern="yyyy-MM-dd"/>
			</dd>
			<dt>상태</dt> <dd>${sob.state }</dd>
			</dl>
			<dl>
			<dt>관람일시</dt> <dd>
				<fmt:formatDate value="${sob.pfmDate}" pattern="yyyy-MM-dd"/>
				(<fmt:formatDate value="${sob.pfmDate}" pattern="E"/>)
				 &nbsp; ${sob.pfmTime} 
				 </dd>
			<dt>매수</dt> <dd>${sob.ea }매</dd>
			</dl>
		</div>
	</div>
	

</div>
<!-- //구매 티켓 정보 -->

<!-- 환불내역 -->
<h2>환불내역</h2>
<div class="boxDiv">
<table>
	<tr>
		<td class="pfmInfo">
			환불방법
		</td>
		<td class="fontSize">
			카드
		</td>
	</tr>
	<tr>
		<td class="pfmInfo"> 거래자명</td>
		<td class="fontSize">${payment.buyerName }</td>
	</tr>
	<tr>
		<td class="pfmInfo">환불 금액</td>
		<td class="fontSize">${sob.ea * ss.secPay }원</td>
	</tr>
	

</table>

<!-- 좌석정보  -->
<h2>좌석정보</h2>
<div class="boxDiv"><table class="fontSize">
<tr >
<th>좌석등급</th>
<th>좌석번호</th>
<th>좌석 구매 가격</th>
<th>예매/취소</th>
</tr>
<c:forEach items="${seatList }" var="s">
<tr>
	<td>${ss.appSec }</td>
	<td>${s.seatFloor }층 ${s.seatRow }-${s.seatCol } 자리</td>
	<td>${ss.secPay } 원</td>
	
	<td>${s.state }
<%-- 	${s.state eq '예매완료(결제완료)' || s.state eq '예매완료(부분취소)'} --%>
		<c:if test='${s.state eq "예매완료(결제완료)" || s.state eq "예매완료(부분취소)"}'>
			<input type="checkbox" value="${s.bookIdx}" name="cancelCheck"/>취소 가능
		</c:if>
	</td>
</tr>
</c:forEach>

</table>

</div>

<!-- //좌석정보 -->
</div>

	<div class="btnDiv">
		<button class ="previous" onclick="location.href='/mypage/myticket'">목록</button>
	</div>


</div> 