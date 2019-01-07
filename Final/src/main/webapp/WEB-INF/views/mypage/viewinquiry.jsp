<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<style>
.waiting {
	color:red;
}
#inqList { 
	width: 900px;
}

.tabSec{
	border: 1px solid #CCC;
	width: 33%;
	display: inline-block;	
}
</style>
<h1>내 문의사항 상세보기</h1>
<hr>
<div class ="main_wrapper">
<!-- 유저 정보 담고 있는 jsp -->
<jsp:include page="userinfo.jsp" />
</div>

<div id ="tabSec" style="border: 1px solid #CCC; ">
	<a href='/mypage/myticket'><div class = "tabSec" id ="ticket">예매현황</div></a>
	<a href='/mypage/mychoice'><div class = "tabSec" id ="choice">찜</div></a>
	<a href='/mypage/viewinquiry'><div class = "tabSec" id ="inquiry">내 문의사항</div></a>
</div>


<div class="contents-wrapper">

<button onclick="location.href='/mypage/writeinquiry'">1:1문의하기</button>
<table class="table" id="inqList">
<thead>
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>답변 상태</th>
	<th>작성자</th>
	<th>작성일</th>
</tr>
</thead>
<tbody>
<c:forEach items="${inqList }" var="inq">
<tr>
	<td>${inq.inqIdx }</td>
	<td><a href="/mypage/detailinquiry?inqIdx=${inq.inqIdx }">${inq.title }</a></td>
	<c:if test="${inq.replyStatus eq 0}"><td class="waiting">답변 대기</td></c:if>
	<c:if test="${inq.replyStatus eq 1}"><td>답변 완료</td></c:if>
	<td>${inq.userName }</td>
	<td>
	<fmt:formatDate value="${inq.createDate }" pattern="yyyy-MM-dd HH:mm"/>
	</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>