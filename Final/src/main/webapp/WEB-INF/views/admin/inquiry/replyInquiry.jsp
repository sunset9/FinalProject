<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/menu.jsp" />

<!-- Froara Editor 관련 -->
<!-- Include external CSS. -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<!-- Include Editor style. -->
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_style.min.css" rel="stylesheet" type="text/css" />
<!-- Include external JS libs. -->
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
<!-- Include Editor JS files. -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/js/froala_editor.pkgd.min.js"></script>

<style>
#detailTable{
	width: 70%;
}

.waiting {
	color:red;
}

#inqContents td{
  	border-top: none;
}

.submitBtn{
	width: 85px;
    height: 38px;
    border-radius: 10px;
    background: #e27d24;
    border: 1px solid #e27d24;
    color: white;
    font-weight: 700;
    margin-bottom: 5px;
    margin-top: 5px;
}

</style>

<script>
$(document).ready(function(){
	
	// 내용 에디터 적용
	$('textarea').froalaEditor({
		width: '800' // 너비
		, heightMin : 400 // 초기화시 크기
		, heightMax : 400 // 스크롤 생기는 지점의 크기
		, language: 'ko'
		// 툴바 버튼 목록
		, toolbarButtons: ['fontFamily','bold', 'italic', 'underline','align','|','insertLink','insertImage','|', 'undo', 'redo']
		 // Set the image upload URL.
	    , imageUploadURL: '/admin/uploadinqimg'
	    , imageUploadParams: {
	      id: 'my_editor'
	    }
	}).on('froalaEditor.image.error', function (e, editor, error, response) { //이미지업로드 실패
		  console.log(error);
	  console.log(response);
	}).on('froalaEditor.image.removed', function (e, editor, $img) { //이미지 삭제 
	    $.ajax({
	        method: "POST",
	        url: "/admin/deleteinqimg", //이미지삭제 경로
	        data: {
	          src: $img.attr('src')
	        }
	      }).fail (function () { //이미지 삭제 실패
	        console.log ('image delete problem');
	     });
	 });
});
</script>

<div class="contents-wrapper">
<h1> 1:1 문의 답변하기</h1>

<form action="/admin/replyinquiry" method="post">

<input type="hidden" name="userIdx" value="${loginUser.userIdx }"/>
<input type="hidden" name="inqIdx" value="${inq.inqIdx }"/>
<table id="detailTable" class="table" >	
<tr>
	<th>제목</th>
	<td><input type="text" name="title" class="form-control"></td>
</tr>
<tr>
	<th>관리자이름</th>
	<td >${loginUser.name }</td>
</tr>
<tr>
	<th colspan=2>내용</th>
</tr>
<tr id="inqContents">
	<td colspan=2><textarea name="contents"></textarea><td>
</tr>

</table>

<button class="submitBtn">답변 하기</button>

</form>
</div>


</div>
</body>
</html>