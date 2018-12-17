<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--    - 스마트에디터 추가하기 -->
<!-- <script type="text/javascript" src="/resources/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script> -->


<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){
// 	$(#"#btnWrite").click(function(){
		
// 	});	
	
        $("#list").on("click",function(e){
            e.preventDefault();
            fn_openBoardList();
        })
        $("#write").on("click",function(e){
            e.preventDefault();
            fn_writeBoard();
        })
    });
     
     
//     function fn_openBoardList(){
//         var comSubmit = new ComSubmit();
//         comSubmit.setUrl("<c:url value='/sample/openBoardList.do'/>");
//         comSubmit.submit();
//     }
     
//     function fn_writeBoard(){
//         var comSubmit = new ComSubmit("frm");
//         comSubmit.setUrl("<c:url value='/sample/writeBoard.do'/>");
//         comSubmit.submit();
//     }
	
// );
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
<form action="/admin/noticewrite" method="post" enctype="multipart/form-data" id="frm">
<table class="table table-striped table-hover">

<tr> <td>작성자</td><td>${userIdx }</td> </tr>
<tr> <td>분류</td><td><input type="text" name="NTypeIdx"></td> </tr>
<tr> <td>제목</td><td><input type="text" name="noticeTitle"></td> </tr>
<tr> <td>내용</td><td><textarea id="content" name="noticeContent"></textarea></td> </tr>
<tr> <td>첨부파일 #1</td> <td><input type="file" id="file1"></td> </tr>
<tr> <td>첨부파일 #2</td> <td><input type="file" id="file2"></td> </tr>
<tr> <td>첨부파일 #3</td> <td><input type="file" id="file3"></td> </tr>
<tr> <td>첨부파일 #4</td> <td><input type="file" id="file4"></td> </tr>
<tr> <td>첨부파일 #5</td> <td><input type="file" id="file5"></td> </tr>
</table>
<button id="btnWrite">작성</button>
</form>
<a href="/admin/noticelist"><button id="btnCancel">취소</button></a>
</div>



<script type="text/javascript">
//스마트에디터 스킨 적용
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content", //<textarea>의 id 입력
	sSkinURI: "/resources/smarteditor2/SmartEditor2Skin.html",
	fCreator: "createSEditor2",
	htParams: {
		bUseToolbar: true, //툴바 사용여부
		bUseVerticalResizer: false, //입력창 크기 조절 바
		bUseModeChanger: true //모드 탭
	}
});
//<form>의 submit에 맞춰 스마트에디터 내용 적용
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}


</script>


</body>
</html>