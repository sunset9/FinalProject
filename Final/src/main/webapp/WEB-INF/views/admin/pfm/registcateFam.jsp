<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>파일업로드 테스트</h1>
<hr>
<form action="/admin/pfm/registcateFam" method="post"
	enctype="multipart/form-data">
	<label for="title">제목</label> <input type="text" name="title"
		id="title" /><br> <label for="file">첨부파일</label> <input
		type="file" name="file" id="file" /><br> <br>
	<button>전송</button>
</form>
