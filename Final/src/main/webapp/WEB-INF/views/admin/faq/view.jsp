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

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

.preNext{
	width:50px;
}

.preNextNum{
	width:100px;
}

.preNextTitle{
	width:100px;
}
.num{
	width:10px;
}
.title{
	width:70%;
}
.content{
	width:90%;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnDelete").click(function(){
		$(location).attr("href", "/admin/faqdelete?faqIdx=${faqView.faqIdx}");
	});
	
	$("#btnUpdate").click(function(){
		$(location).attr("href", "/admin/faqupdate?faqIdx=${faqView.faqIdx}");
	});
	
});
</script>

</head>
<body>

<h1>상세보기</h1>

<div class="conta">

<table class="table table-striped table-hover">	
	<tr>	
		<td id="num">${faqView.faqIdx }</td>
		<td class="title">${faqView.faqQuestion }</td>	
		<td><fmt:formatDate value="${faqView.createDate }" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<td></td>
		<td class="content"> ${faqView.faqAnswer }</td>
	</tr>	
</table>
<hr>

<hr>


<a href="/admin/faqlist"><button class="btnList">목록</button></a>
<button id="btnDelete">삭제</button>
<button id="btnUpdate">수정</button>
</div>

</body>
</html>