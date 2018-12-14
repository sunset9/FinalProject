<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function cancelBook(impUid) {
// 	console.log(impUid);
}

</script>
<style type="text/css">
table, td, th, tr {border: 1px solid black;}
</style>
</head>
<body>
<div>
<h3>회원 상세</h3>
<hr>

<div>
회원정보칸<br><br>
${curUser.email }님의 예매현황<br>
이름 ${curUser.name}<br>
성별 <c:if test="${curUser.sex eq 'female'}">여성</c:if>
    <c:if test="${curUser.sex eq 'male'}">남성</c:if><br>
닉네임 ${curUser.nick}<br>
생년월일 <fmt:formatDate value="${curUser.birth}" pattern="yyyy.MM.dd" /><br>
휴대폰번호 ${curUser.phone}<br>
주소 ${curUser.addr} ${curUser.addrDetail }<br>
회원등급 ${curUser.mGrade}

</div>
<hr>
<div>
예매현황칸<br><br>
<table class="table table-hover table-striped table-condensed">
<thead>
<tr>
<th style="width: 10%">예매일</th>
<th style="width: 35%">공연정보</th>
<th style="width: 20%">예매정보</th>
<th style="width: 10%">상태</th>
<th style="width: 10%">환불처리</th>
</tr>
</thead>

<tbody>
<c:forEach items="${sobList }" var="sob" varStatus="status">
<tr>
	<td><fmt:formatDate value="${sob.createDate}" pattern="yyyy.MM.dd(E)" /></td>
	<td>
	${sob.name }<br><br>
	<fmt:formatDate value="${sob.pfmStart}" pattern="yyyy.MM.dd" /> ~ 
	<fmt:formatDate value="${sob.pfmEnd}" pattern="yyyy.MM.dd" /><br>
	${sob.hallName}
	</td>
	<td>
	예매번호   ${sob.bookIdx}<br>
	 관람일    <fmt:formatDate value="${sob.pfmDate}" pattern="yyyy.MM.dd(E)" />  ${sob.pfmTime}<br>
	 매수 <br>
	 <c:if test="${sob.state eq '취소중' }">
	 	취소일    <fmt:formatDate value="${sob.cancelDate}" pattern="yyyy.MM.dd(E)" />
	 </c:if>
	 <c:if test="${sob.state eq '예매완료(결제완료)' }">
	 	취소가능일    <fmt:formatDate value="${sob.createDate}" pattern="yyyy.MM.dd(E)" />
	 </c:if>
	</td>
	<td>
	${sob.state }<br>
	</td>
	<td>
	<c:if test="${sob.state eq '취소중'}">
<%-- 		<button onclick="cancelBook(${sob.imp_uid});">환불하기</button> --%>
	</c:if>
	</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>

</div>
</body>
</html>