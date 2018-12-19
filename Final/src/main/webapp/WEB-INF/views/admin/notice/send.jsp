<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>




<html>

<script src='js/smarteditor2.min.js' charset='utf-8'></script>
<script src='js/smarteditor2.js' charset='utf-8'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="/resources/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>


<script type="text/javascript">
//한글 인코딩을 위한 UTF-8 설정 
request.setCharacterEncoding("utf-8");
out.println("에디터 결과");
out.println(request.getParameter("smarteditor"));

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



</body>

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
//작성 버튼이 눌렸을 때 반응하도록 작성
//	작성버튼은 <textarea>와 같은 <form>을 부모요소로 가져야 함
$(document).ready(function() {
	$("#btnWrite").click(function() {
		submitContents( $(this) );
	});
});

</script>

</html>