<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<style type="text/css">

#warpTicket{
	display: grid;
	width:1200px;
	margin: 0 auto;
	grid-template-columns: 200px auto ;
 	grid-gap: 10px;
 	grid-template-rows:50px, auto; 
}
#poster {
	display: inline-block;
	grid-area: 1 / 1 / 3 / 2  ;
}

#title{
	
	grid-area: 1/ 2 / 2 /3 ;
	
	border: 1px solid black;
}


#bookDetail{
	grid-area: 2/ 2 / 3 /3;
}
dt{
	float: left;
	margin-right: 10px;
}
</style>


<h1>예약 상세</h1>
<hr>
<div>
<!-- 유저 정보 담고 있는 jsp -->
<jsp:include page="userinfo.jsp" />
</div>


<!-- 구매 티켓 정보 -->
<div id = "warpTicket">
	<div id = "poster">
	<img style ="width: 180px;" src="/resources/image/${sob.storedName }">
	</div>
	
<!-- 	공연 타이틀 -->
	<div id="title">
	<span><h3>${sob.name }</h3></span>
	</div>

<!-- 	예매 상세 정보	 -->
	<div id="bookDetail">
		<dl>
		<dt>예매번호</dt> <dd>${sob.bookGroup }</dd>
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
<!-- //구매 티켓 정보 -->



<!-- 티켓 수령 방법 -->
<div id="receive">
	<h2>티켓 수령 방법</h2>
	<div>
	<table>
	${receive}
	<c:if test="${receive eq 1 }">
	<tr>
		<td>수량 방법</td>
		<td><p>현장수령 | 공연 당일 현장 교부처에서 예매번호 및 본인 확인 후 티켓을 수령하여 입장이 가능합니다.</p></td>
	</tr>
	</c:if>
	<c:if test="${receive eq 2 }">
	<tr>
		<td>수량 방법</td>
		<td><p>배송 | 예매완료(결제익일) 기준으로 4~5일 이내 배송됩니다.(주말/공휴일을 제외한 영업일 기준)</p></td>
	</tr>
	<tr>
		<td>받으시는 분</td>
		<td>${sm.name }</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${sm.phone }</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>${sm.addr }
			${sm.addrDetail }
			${sm.postcode }
		</td>
	</tr>
	</c:if>
	</table>
	</div>
</div>
<!-- //티켓 수령 방법 -->


<!-- 구매내역 -->
<!-- //구매내역 -->

<!-- 결제내역 -->
<!-- //결제내역 -->

<!-- 좌석정보  -->
<!-- //좌석정보 -->





