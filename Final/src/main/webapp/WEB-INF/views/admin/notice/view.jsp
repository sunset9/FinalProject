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


</head>
<body>

<h1>공지 상세보기</h1>

<div class="conta">

<table class="table table-striped table-hover">	
	<tr>	
		<td>${noticeView.noticeIdx }</td>
		<td>${noticeView.noticeTitle }</td>	
		<td><fmt:formatDate value="${noticeView.createDate }" pattern="yyyy-MM-dd"/></td>
	</tr>
</table>
<hr>

<table class="content">
<tr>
<td> ${noticeView.noticeContent }</td>
</tr>
</table>

<hr>

<!-- 이전글 -->
<table class="table table-striped table-hover" id="prewr">
<tr>   
	<td>이전글</td>   
	<td>분류(서비스 점검)</td> 
	<td> 제목(제목에만 링크)</td> 
	<td>작성일 </td>
</tr>
</table>


<!-- 다음글 -->
<table class="table table-striped table-hover" id="nextwr">
<tr>   
	<td>다음글</td>   
	<td>분류(서비스 점검)</td> 
	<td> 제목(제목에만 링크)</td> 
	<td>작성일 </td></tr>
</table>
</div>


<a href="/admin/noticelist"><button class="notilistbtn">목록</button></a>

</body>

</html>