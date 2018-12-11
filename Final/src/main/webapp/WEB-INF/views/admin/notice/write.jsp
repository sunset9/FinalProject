<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>

<script type="text/javascript">
$(document).ready(function(){

// 	$(#"#btnWrite").click(function(){
		
// 	});
	
	
	$("#btnCancel").click(function(){
		history.go(-1);
	});
});

</script>

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
<form action="/admin/noticewrite" method="post" enctype="multipart/form-data">
<table class="table table-striped table-hover">

<tr> <td>작성자</td><td>${userIdx }</td> </tr>
<tr> <td>분류</td><td><input type="text" name="NTypeIdx"></td> </tr>
<tr> <td>제목</td> <td><input type="text" name="noticeTitle"></td> </tr>
<tr> <td>내용</td><td><textarea rows="30" cols="70" name="noticeContent"></textarea></td> </tr>
<tr> <td>첨부파일 #1</td> <td><input type="file" id="file1"></td> </tr>
<tr> <td>첨부파일 #2</td> <td><input type="file" id="file2"></td> </tr>
<tr> <td>첨부파일 #3</td> <td><input type="file" id="file3"></td> </tr>
<tr> <td>첨부파일 #4</td> <td><input type="file" id="file4"></td> </tr>
<tr> <td>첨부파일 #5</td> <td><input type="file" id="file5"></td> </tr>
</table>
<button id="btnWrite">작성</button>
<button id="btnCancel">취소</button>
</form>
</div>



</body>
</html>