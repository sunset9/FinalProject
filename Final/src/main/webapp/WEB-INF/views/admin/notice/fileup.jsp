<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>파일업 테스트</h1>
<hr>
<form action="/admin/noticefileupload" method="post" enctype="multipart/form-data">

	<label for="file">첨부파일</label>
	<input type="file" name="file" id="file" /><br><br>
	<button>전송</button>
</form>


</body>
</html>