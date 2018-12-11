<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#noticeView").click(function(){
		$(location).attr("href","/admin/noticelist?curPage=2");
	});
});
</script>

</head>
<body>

<h1>공지 리스트</h1>

<!-- conta = container -->
<div class="container">

Bootstrap Table
<table class="table table-striped table-hover">
	
	<tr>
		<th>NO.</th>
		<th>분류</th>
		<th>제목</th>
		<th>등록일</th>	
	</tr>
  
	<c:forEach items="${noticelist }" var="noli">
	<tr>		
		<td>${noli.noticeIdx }</td>
		<td>${noli.NTypeIdx }</td>
		<td><a href="/admin/noticeview?noticeIdx=${noli.noticeIdx }"> ${noli.noticeTitle }</a></td>
		<td><fmt:formatDate value="${noli.createDate }" pattern="yyyy-MM-dd"/></td>
	</tr>	
	</c:forEach>

</table>

</div>

<a href="/admin/noticewrite"><button> 글쓰기 </button></a>

<jsp:include page="../../utils/noticepaging.jsp"/>

</body>
</html>