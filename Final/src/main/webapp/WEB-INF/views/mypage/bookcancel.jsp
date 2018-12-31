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

td{
	border: 1px solid black;
	width: 400px;
}
</style>
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

<!-- 환불 금액 -->
<div>

<h2>환불내역</h2>
<div>
<table>
	<tr>
		<td>
		<dl>
			<dt>결제방법</dt>
			<dd>카드</dd>
		</dl>
		</td>
	</tr>

	<tr>
		<td>
		<dl>
			<dt>환불 금액</dt>
			<dd>${payment.paidAmount }</dd>
		</dl>
		</td>
	</tr>
	<tr>
		<td>
		<dl>
			<dt>결제 날짜</dt>
			<dd>
			<fmt:formatDate value="${payment.createDate }" pattern="yyyy-MM-dd"/>
			(<fmt:formatDate value="${payment.createDate }" pattern="E"/>)
			</dd>
		</dl>
		</td>
	</tr>

</table>
</div>


</div>