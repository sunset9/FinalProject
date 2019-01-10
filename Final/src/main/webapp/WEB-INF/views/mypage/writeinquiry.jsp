<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
.contents-wrapper{
	margin: 30px;
}
#detailTable{
	width: 100%;
}

.waiting {
	color:red;
}

#inqContents td{
  	border-top: none;
}
#submitBtn{
	width: 140px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    background: #F2B134;
    font-weight: bold;
    color: #FFF;
}

#cancelBtn{
	width: 140px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #CCC;
    background: #CCC;
    font-weight: bold;
    color: #FFF;
}
.btnDiv{
	text-align: center;
}
</style>

<script>
$(document).ready(function(){
	
	// 내용 에디터 적용
	$('textarea').froalaEditor({
		width: '1150' // 너비
		, heightMin : 400 // 초기화시 크기
		, heightMax : 400 // 스크롤 생기는 지점의 크기
		, language: 'ko'
		// 툴바 버튼 목록
		, toolbarButtons: ['fontFamily','bold', 'italic', 'underline','align','|','insertLink','insertImage','|', 'undo', 'redo']
		 // Set the image upload URL.
	    , imageUploadURL: '/mypage/uploadinqimg'
	    , imageUploadParams: {
	      id: 'my_editor'
	    }
	}).on('froalaEditor.image.error', function (e, editor, error, response) { //이미지업로드 실패
		  console.log(error);
	  console.log(response);
	}).on('froalaEditor.image.removed', function (e, editor, $img) { //이미지 삭제 
	    $.ajax({
	        method: "POST",
	        url: "/mypage/deleteinqimg", //이미지삭제 경로
	        data: {
	          src: $img.attr('src')
	        }
	      }).fail (function () { //이미지 삭제 실패
	        console.log ('image delete problem');
	     });
	 });

	
// 취소 버튼 눌렀을 때
	$('#cancelBtn').click(function() {
		if(confirm("입력을 취소하시겠습니까?")== true){
			//yes
			loaction.href="/mypage/viewinquiry";
		} else {
			//no
			return;
		}
	}); // click end
	$('#submitBtn').click(function() {
		
		if($("#title").val().length < 1){
			console.log("제목 확인 안함");
			alert("제목을 입력해 주세요.");
			$('#title').focus();
		
			return;
		
		} // end if 
		
		if($("#contents").froalaEditor('html.get') ==""){
			console.log("내용 확인 안함");
			alert("내용을 입력해 주세요.");
			$('#contents').focus();
		
			return;
		
		} // end if 
		
		$('form').submit();
		
	}) // end click
});
</script>
<div class ="main_wrapper">
<div class="contents-wrapper">
<h1> 1:1 문의</h1>

<form action="/mypage/writeinquiry" method="post">

<input type="hidden" name="userIdx" value="${loginUser.userIdx }"/>
<table id="detailTable" class="table" >
<tr>
	<th>제목</th>
	<td><input type="text" id ="title"name="title" class="form-control"></td>
</tr>
<tr>
	<th>작성자</th>
	<td >${loginUser.name }</td>
</tr>
<tr>
	<th colspan=2>내용</th>
</tr>
<tr id="inqContents">
	<td colspan=2><textarea id = "contents" name="contents"></textarea><td>
</tr>

</table>
<div class ="btnDiv">
	<button type="button" class="submitBtn" id="submitBtn" >문의 하기</button>
	<button type="button" id="cancelBtn"  >취소</button>
</div>
</form>
</div>

</div>