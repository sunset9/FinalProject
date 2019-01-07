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
    width: 1100px;
}

th, td {
	text-align: center;
}

hr {
    width: 1100px;
}

.inqBtn {
	float: right;
    width: 85px;
    height: 38px;
    border-radius: 10px;
    background: #e27d24;
    border: 1px solid #e27d24;
    color: white;
    font-weight: 700;
    margin-bottom: 5px;
    margin-top: 5px;
}
</style>

<div class="contents-wrapper" style="width: 1100px;">

<h1>1:1 문의 리스트</h1>
<hr>

<button onclick="location.href='/admin/writeinquiry'" class="inqBtn">1:1문의하기</button>
<table class="table table-hover table-striped table-condensed" id="inqList">
<thead>
<tr>
	<th style="width:5%">글번호</th>
	<th style="width:35%">제목</th>
	<th style="width:15%">답변 상태</th>
	<th style="width:10%">작성자</th>
	<th style="width:25%">작성일</th>
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

</body>
</html>