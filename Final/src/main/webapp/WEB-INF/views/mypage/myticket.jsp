<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<style type="text/css">


.tabSec{
	border: 1px solid #CCC;
	width: 33%;
	display: inline-block;	
}

#cancel{
	display: none;
}


</style>

<script type="text/javascript">
$(document).ready(function(){
	$('#completeBtn').click(function() {
		$('#complete').show();
		$('#cancel').hide();
		
	}); // click end
	
	$('#cancelBtn').click(function() {
		$('#cancel').show();
		$('#complete').hide();
		
	}); // click end
});
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

<button id="completeBtn">예매확인</button>
<button id="cancelBtn">예매취소</button>

<div id="complete">
<table class="table table-hover table-striped table-condensed">
<thead>
<tr>
	<th style="width: 10%">예매일</th>
	<th style="width: 40%">공연정보</th>
	<th style="width: 40%">예매정보</th>
	<th style="width: 10%">상태</th>
</tr>
</thead>

<tbody>
<c:forEach items="${sob }" var="sob"  >
	<c:if test='${sob.state eq "예매완료(결제완료)"||sob.state eq "예매완료(부분취소)"}'>
	<tr>
		<td><fmt:formatDate value="${sob.createDate }" pattern="yyyy-MM-dd"/></td>

		<td>
		<div>
		<a><img style="width: 80px" src="/resources/image/${sob.storedName }"></a> <!-- 포스터 -->
			
			<span>${sob.name }</span> <!-- 공연제목 -->
			<span><fmt:formatDate value="${sob.pfmStart }" pattern="yyyy-MM-dd"/> ~ 
			<fmt:formatDate value="${sob.pfmEnd }" pattern="yyyy-MM-dd"/></span>
			<span>${sob.hallName }</span>
			
		</div></td>

		<td><div>
		<dl>
			<dt>예약번호</dt>
			<dd>${sob.bookGroup }</dd>
			<dt>관람일</dt>
			<dd>
			<fmt:formatDate value="${sob.pfmDate}" pattern="yyyy-MM-dd"/>
			(<fmt:formatDate value="${sob.pfmDate}" pattern="E"/>)
			 &nbsp; ${sob.pfmTime}  </dd>
			<dt>매수</dt>
			<dd>${sob.ea }</dd>
		</dl>
		</div></td>

		<td>${sob.state }
			<button onclick="location.href='/mypage/detailicket?pfmIdx=${sob.pfmIdx}'">예매 상세</button>
		</td>
	</tr>
	</c:if>
</c:forEach>
</tbody>
</table>
</div>

<div id ="cancel">
<table class="table table-hover table-striped table-condensed">
<thead>
<tr>
	<th style="width: 10%">예매일</th>
	<th style="width: 40%">공연정보</th>
	<th style="width: 40%">예매정보</th>
	<th style="width: 10%">상태</th>
</tr>
</thead>

<tbody>
<c:forEach items="${sob }" var="sob"  >
	<c:if test='${sob.state eq "취소중"||sob.state eq "취소완료"}'>
	<tr>
		<td><fmt:formatDate value="${sob.createDate }" pattern="yyyy-MM-dd"/></td>

		<td>
		<div>
		<a><img style="width: 80px" src="/resources/image/${sob.storedName }"></a> <!-- 포스터 -->
			
			<span>${sob.name }</span> <!-- 공연제목 -->
			<span><fmt:formatDate value="${sob.pfmStart }" pattern="yyyy-MM-dd"/> ~ 
			<fmt:formatDate value="${sob.pfmEnd }" pattern="yyyy-MM-dd"/></span>
			<span>${sob.hallName }</span>
			
		</div></td>

		<td><div>
		<dl>
			<dt>예약번호</dt>
			<dd>${sob.bookGroup }</dd>
			<dt>관람일</dt>
			<dd>
			<fmt:formatDate value="${sob.pfmDate}" pattern="yyyy-MM-dd"/>
			(<fmt:formatDate value="${sob.pfmDate}" pattern="E"/>)
			 &nbsp; ${sob.pfmTime}  </dd>
			<dt>매수</dt>
			<dd>${sob.ea }</dd>
		</dl>
		</div></td>

		<td>${sob.state }
			<button onclick="location.href='/mypage/canceldetail?pfmIdx=${sob.pfmIdx}'">취소 상세</button>

		</td>
	</tr>
	</c:if>
</c:forEach>
</tbody>
</table>
</div>




</div>