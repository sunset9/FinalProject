<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/menu.jsp" />

<!-- Froara Editor 관련 -->
<!-- Include external CSS. -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<!-- Include Editor style. -->
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_style.min.css" rel="stylesheet" type="text/css" />
<!-- Include external JS libs. -->
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
<!-- Include Editor JS files. -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/js/froala_editor.pkgd.min.js"></script>


<style>
#detailTable{
	width: 70%;
}

.waiting {
	color:red;
}

#inqContents td{
    padding: 15px;
}

</style>

<script>
</script>

<div class="contents-wrapper">
<h1> 1:1 문의 확인</h1>

<table id="detailTable" class="table table-bordered" >
<tr>
	<th>제목</th>
	<td>${inq.title }</td>
	<th>답변 상태</th>
	<c:if test="${inq.replyStatus eq 0}"><td class="waiting">답변 대기</td></c:if>
	<c:if test="${inq.replyStatus eq 1}"><td>답변 완료</td></c:if>
</tr>
<tr>
	<th>작성자</th>
	<td>${inq.userName }</td>
	<th>작성일</th>
	<td>
	<fmt:formatDate value="${inq.createDate }" pattern="yyyy-MM-dd HH:mm"/>
	</td>
</tr>
<tr id="inqContents">
	<td colspan=4><div class="fr-view">${inq.contents }</div></td>
</tr>

</table>

<c:if test="${inq.replyStatus eq 0}">
	<button class="replyBtn" onclick="location.href='/admin/replyinquiry?inqIdx=${inq.inqIdx }'">답변 하기</button>
</c:if>

<c:if test="${inq.replyStatus eq 1}">
<div class="reply">
<hr>
<h4>답변</h4>
<button class="replyBtn" onclick="location.href='/admin/editreplyinquiry?inqIdx=${inq.inqIdx }'">답변 수정</button>

<table id="detailTable" class="table table-bordered" >
<tr>
	<th>제목</th>
	<td colspan=3>${inqAns.title }</td>
</tr>
<tr>
	<th>작성자</th>
	<td>${inqAns.userName }</td>
	<th>작성일</th>
	<td>
	<fmt:formatDate value="${inqAns.createDate }" pattern="yyyy-MM-dd HH:mm"/>
	</td>
</tr>
<tr id="inqContents">
	<td colspan=4><div class="fr-view">${inqAns.contents }</div></td>
</tr>
</table>

</div>
</c:if>

</div>


</div>
</body>
</html>