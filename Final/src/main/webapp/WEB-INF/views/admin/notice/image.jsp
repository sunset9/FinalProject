<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<title>Daum에디터 - 이미지 첨부</title>
	
	<!-- 다음오픈에디터 라이브러리 -->
	<link rel="stylesheet" href="../../css/popup.css" type="text/css"  charset="utf-8"/>
	<script src="../../js/popup.js" type="text/javascript" charset="utf-8"></script>
	
	<script>
		
		//첨부한 이미지를 에디터에 적용시키는 함수
		function done() {
			if (typeof(execAttach) == 'undefined') {
				return;
	    		}
			
			var _mockdata = {
				'imageurl': 'http://cfile284.uf.daum.net/image/116E89154AA4F4E2838948',
				'filename': 'editor_bi.gif',
				'filesize': 640,
				'imagealign': 'C',
				'originalurl': 'http://cfile284.uf.daum.net/original/116E89154AA4F4E2838948',
				'thumburl': 'http://cfile284.uf.daum.net/P150x100/116E89154AA4F4E2838948'
			};
			execAttach(_mockdata);
			closeWindow();
		}
		
		//잘못된 경로로 접근할 때 호출되는 함수
		function initUploader(){
	    		var _opener = PopupUtil.getOpener();
	    		if (!_opener) {
				alert('잘못된 경로로 접근하셨습니다.');
	        		return;
	    		}
			
	    		var _attacher = getAttacher('image', _opener);
	    		registerAction(_attacher);
		}
		
	</script>
	
</head>

<body onload="initUploader();">

	<div class="wrapper">
		<div class="header">
			<h1>사진 첨부</h1>
		</div>	
		<div class="body">
			<dl class="alert">
		    		<dt>사진 첨부 확인</dt>
		    		<dd>
		    			확인을 누르시면 임시 데이터가 사진첨부 됩니다.<br /> 
		    			인터페이스는 소스를 확인해주세요.
		    		</dd>
			</dl>
		</div>
		<div class="footer">
			<p>
				<a href="#" onclick="closeWindow();" title="닫기" class="close">닫기</a>
			</p>
			<ul>
				<li class="submit"><a href="#" onclick="done();" title="등록" class="btnlink">등록</a> </li>
				<li class="cancel"><a href="#" onclick="closeWindow();" title="취소" class="btnlink">취소</a></li>
			</ul>
		</div>
	</div>
</body>

</html>