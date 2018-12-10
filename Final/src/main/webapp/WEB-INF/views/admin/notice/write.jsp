<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- table table-striped table-hover -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<h1> 공지 글쓰기 </h1>

<div class="conta">

<table class="table table-striped table-hover">

<tr>
	<td>제목</td><td><input type="text"></td>
</tr>

<tr>
	<td>작성자</td><td>${noticeView.userIdx }</td>
</tr>

<tr>
	<td>내용</td><td><textarea rows="30" cols="70"></textarea></td>
</tr>



</table>


</div>



</body>
</html>