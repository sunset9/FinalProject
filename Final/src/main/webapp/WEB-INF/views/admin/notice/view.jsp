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

.container{
	width:2000px;
}
.preNext{
	width:50px;
}

.preNextNum{
	width:100px;
}

.preNextTitle{
	width:100px;
}
.num {
	width:70px;
}
.title{
	width:500px;
}
.date {
	width:150px;
}
.type {
	width:100px;
}

#noticon {
	text-align:left;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnDelete").click(function(){
		$(location).attr("href", "/admin/noticedelete?noticeIdx=${noticeView.noticeIdx}");
	});
	
	$("#btnUpdate").click(function(){
		$(location).attr("href", "/admin/noticeupdate?noticeIdx=${noticeView.noticeIdx}");
	});
	
});
</script>

</head>
<body>

<!-- <h1>공지 상세보기</h1> -->

<div class="container">

	
	<div class="form-group">
			<label for="noticeIdx" class="col-sm-2 control-label"> 글번호</label>
		
			<input type="text" id="noticeIdx" name="noticeIdx" class="form-control" value="${noticeView.noticeIdx }" readonly="readonly"/>
		
	</div>
	
		<div class="form-group">
			<label for="NTypeIdx" class="col-sm-2 control-label"> 분류</label>
			<input type="text" id="NTypeIdx" name="NTypeIdx" class="form-control" value="${noticeView.NTypeIdx }" readonly="readonly"/>
	</div>
	
		<div class="form-group">
			<label for="noticeTitle" class="col-sm-2 control-label"> 글제목</label>
			<input type="text" id="noticeTitle" name="noticeTitle" class="form-control" value="${noticeView.noticeTitle }" readonly="readonly"/>
	</div>
	

	<div class="form-group">
		<label for="createDate" class="col-sm-2 control-label"> 등록일</label>
		<div class="col-sm-10">
			<span><fmt:formatDate value="${noticeView.createDate }" pattern="yyyy-MM-dd"/></span>
		</div>	
	</div>	





	<br><br>
	
		<div id="noticon">
			<label>  글내용 </label>
			<p>${noticeView.noticeContent }</p>
		</div>	
			


<!-- prev(이전글 번호), prevTitle(이전글 제목), next(다음글 번호), nextTitle(다음글 번호) -->
<!-- 이전글 --> 
<table class="table table-striped table-hover" id="prewr">
<tr>   
	<td class="preNext">이전글</td>   
	<td class="preNextNum">${preNoti.prev }</td> 
	<td class="preNextTitle"><a href="/admin/noticeview?noticeIdx=${preNoti.prev }"> ${preNoti.prevTitle }</a></td>
</tr>
</table>	
 
<!-- 다음글 -->
<table class="table table-striped table-hover" id="nextwr">
<tr>   
	<td class="preNext">다음글</td>   
	<td class="preNextNum">${postNoti.next }</td> 
	<td class="preNextTitle"><a href="/admin/noticeview?noticeIdx=${postNoti.next }"> ${postNoti.nextTitle }</a></td> 
</table>


<a href="/admin/noticelist"><button class="btnList">목록</button></a>
<button id="btnDelete">삭제</button>
<button id="btnUpdate">수정</button>
</div>

</body>
</html>