<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


 
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



</head>
<body>

<h1> 공지 수정 </h1>

<div class="conta">

<div>

<form action="/admin/noticeupdate" method="post" enctype="multipart/form-data">
<input type="hidden" name="boardIdx" value="${noticeUpdate.boardIdx }"/>
<table class ="table table-bordered">
<tr><td>제목</td><td><input type="text" name="noticeTitle" value="${noticeView.noticeTitle }"></td></tr>
<tr><td>내용</td><td><textarea id="noticeContent">${noticeView.noticeContent }</textarea> </td></tr>

</table>

</form>

<button type="button" id="btnUpdate">수정 적용</button>
<button type="button" id="btnCancel">취소</button>

</div>




</div>




</body>
</html>