<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/menu.jsp" />

<style>
.waiting {
	color:red;
}
#inqList { 
	width: 900px;
}
</style>

<div class="contents-wrapper">

<h1>1:1 문의 리스트</h1>
<button onclick="location.href='/admin/writeinquiry'">1:1문의하기</button>
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
	<td><a href="/admin/detailinquiry?inqIdx=${inq.inqIdx }">${inq.title }</a></td>
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

</div>
</body>
</html>