<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


 
<script type="text/javascript" src="/resources/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
 
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		// 스마트에디터 내용으로 <textarea>적용
		submitContents($("#btnUpdate"));
		
		// submit
		$("form").submit();
	});
	
	$("#btnCancel").click(function() {
		history.go(-1);
	});
});
</script>

<div class="conta">

<h1> 공지 수정 </h1>


<div>
<!-- noticeUpdate -->
<form action="/admin/noticeupdate" method="post" enctype="multipart/form-data">
<input type="hidden" name="noticeIdx" value="${update.noticeIdx }"/>

<table>
<tr> <td>작성자</td><td>${userIdx }</td> </tr>
<tr> <td>분류</td><td><input type="text" name="NTypeIdx" value="${update.NTypeIdx }"></td> </tr>
<tr> <td>제목</td><td><input type="text" name="noticeTitle" value="${update.noticeTitle }"></td></tr>
<tr> <td>내용</td><td><textarea id="content" name="noticeContent"> ${update.noticeContent }</textarea> </td></tr>

</table>


</form>
</div>





<button type="button" id="btnUpdate">수정 적용</button>
<button type="button" id="btnCancel">취소</button>
</div>


<script type="text/javascript">
// 스마트에디터 스킨 적용
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