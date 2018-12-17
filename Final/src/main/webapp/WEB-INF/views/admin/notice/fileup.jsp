<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> 파일업 테스트</h1>

<form action="/admin/noticefileupload" method="post" enctype="multipart/form-data">
<table>
	<tr> <td>첨부파일 #1</td> <td><input type="file" id="file1"></td> </tr>
	<tr> <td>첨부파일 #2</td> <td><input type="file" id="file2"></td> </tr>
	<tr> <td>첨부파일 #3</td> <td><input type="file" id="file3"></td> </tr>
	<tr> <td>첨부파일 #4</td> <td><input type="file" id="file4"></td> </tr>
	<tr> <td>첨부파일 #5</td> <td><input type="file" id="file5"></td> </tr>
</table>
</form>

</body>
</html>