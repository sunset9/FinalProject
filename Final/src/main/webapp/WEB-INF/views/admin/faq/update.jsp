<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel=stylesheet type=text/css href="${pageContext.request.contextPath}/resources/daumOpenEditor/css/editor.css" charset=utf-8 />
<script type=text/javascript charset=utf-8 src="${pageContext.request.contextPath}/resources/daumOpenEditor/js/editor_loader.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript">
</script>

<div class="conta">

<h1> FAQ 수정 </h1>


<div>
<form action="/admin/faqupdate" name="tx_editor_form" id="tx_editor_form" method="post" enctype="multipart/form-data">
<input type="hidden" name="faqIdx" value="${update.faqIdx }"/>

<table>
<tr> <td>분류</td><td><input type="text" name="FTypeIdx" value="${update.FTypeIdx }"></td> </tr>
<tr> <td>제목</td><td><input type="text" name="faqQuestion" value="${update.faqQuestion }"></td></tr>
</table>
<jsp:include page="/WEB-INF/views/admin/notice/editor_frame.jsp"></jsp:include>
<textarea name="faqAnswer" id="faqAnswer" rows="10" cols="100" 
 style="width:766px; height:412px; display:none;"></textarea>


</form>
</div>


<button type="button" id="save_button">수정 적용</button>

</div>


<script>
if('${update!=null}'=='true') Editor.modify({'content': '${update.faqAnswer}'});  // 블로그 방법 이미지O, 글O


var config = {
		txHost : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
		txPath : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
		txService : 'sample', /* 수정필요없음. */
		txProject : 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
		initializedId : "", /* 대부분의 경우에 빈문자열 */
		wrapper : "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
		form : 'tx_editor_form' + "", /* 등록하기 위한 Form 이름 */
		txIconPath : "${ pageContext.request.contextPath }/resources/daumOpenEditor/images/icon/editor/", /* 에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
		txDecoPath : "${ pageContext.request.contextPath }/resources/daumOpenEditor/images/deco/contents/", /* 본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
		canvas : {
			exitEditor : {
			/*
			desc:'빠져 나오시려면 shift+b를 누르세요.',
			hotKey: {
			    shiftKey:true,
			    keyCode:66
			},
			nextElement: document.getElementsByTagName('button')[0]
			 */
			},
			styles : {
				color : "#123456", /* 기본 글자색 */
				fontFamily : "굴림", /* 기본 글자체 */
				fontSize : "10pt", /* 기본 글자크기 */
				backgroundColor : "#fff", /*기본 배경색 */
				lineHeight : "1.5", /*기본 줄간격 */
				padding : "8px" /* 위지윅 영역의 여백 */
			},
			showGuideArea : false
		},
		events : {
			preventUnload : false
		},
		sidebar : {
			attachbox : {
				show : true,
				confirmForDeleteAll : true
			},
			
			// 		이미지첨부, 파일 관련 추가 config (팝업) 시작
			attacher : {
				image : {
					features : {
						left : 250,
						top : 65,
						width : 400,
						height : 190,
						scrollbars : 0
					}, //팝업창 사이즈 
					popPageUrl : '${pageContext.request.contextPath}/admin/imagepopup' //팝업창 주소
				},
			
				file : {
					features : {
						left : 250,
						top : 65,
						width : 400,
						height : 190,
						scrollbars : 0
					}, //팝업창 사이즈 
					popPageUrl : '${pageContext.request.contextPath}/admin/filepopup' //팝업창 주소
				}
			},
			capacity: {maximum:10*1024*1024} // 파일 10메가 제한
		}, // 팝업 끝
		
		size : {
			contentWidth : 700
		/* 지정된 본문영역의 넓이가 있을 경우에 설정 */
		}
	};

	EditorJSLoader.ready(function(Editor) {
		var editor = new Editor(config);
	});

	function saveContent() {
		Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
	}

	/**
	 * Editor.save()를 호출한 경우 데이터가 유효한지 검사하기 위해 부르는 콜백함수로
	 * 상황에 맞게 수정하여 사용한다.
	 * 모든 데이터가 유효할 경우에 true를 리턴한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 모든 데이터가 유효할 경우에 true
	 */
	function validForm(editor) {
		// Place your validation logic here

		// sample : validate that content exists
		var validator = new Trex.Validator();
		var content = editor.getContent();
		if (!validator.exists(content)) {
			alert('내용을 입력하세요');
			return false;
		}

		return true;
	}

	/**
	 * Editor.save()를 호출한 경우 validForm callback 이 수행된 이후
	 * 실제 form submit을 위해 form 필드를 생성, 변경하기 위해 부르는 콜백함수로
	 * 각자 상황에 맞게 적절히 응용하여 사용한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 정상적인 경우에 true
	 */
	function setForm(editor) {
		var i, input;
		var form = editor.getForm();
		var content = editor.getContent();

		// 본문 내용을 필드를 생성하여 값을 할당하는 부분
		var textarea = document.createElement('textarea');
		textarea.name = 'faqAnswer'; // 
		textarea.value = content;
		form.createField(textarea);

		/* 아래의 코드는 첨부된 데이터를 필드를 생성하여 값을 할당하는 부분으로 상황에 맞게 수정하여 사용한다.
		 첨부된 데이터 중에 주어진 종류(image,file..)에 해당하는 것만 배열로 넘겨준다. */
		var images = editor.getAttachments('image');
		for (i = 0; i < images.length; i++) {
			// existStage는 현재 본문에 존재하는지 여부
			if (images[i].existStage) {
				// data는 팝업에서 execAttach 등을 통해 넘긴 데이터
//					alert('attachment information - image[' + i + '] \r\n'	+ JSON.stringify(images[i].data));
				input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'attach_image';
				input.value = images[i].data.imageurl; // 예에서는 이미지경로만 받아서 사용
				form.createField(input);
			}
		}

		var files = editor.getAttachments('file');
		for (i = 0; i < files.length; i++) {
			input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'attach_file';
			input.value = files[i].data.attachurl;
			form.createField(input);
		}
		return true;
	}

	//form submit 버튼 클릭
	$("#save_button").click(function() {
		//다음에디터가 포함된 form submit
		Editor.save();
	})

		
	// 1. Editor.save()    submit기능의 첫단계
	// 2. validForm()     다음에디터 내에 자체적으로 호출되는 함수입니다.    
	// 폼필드내에 입력태그들에 대한 validation 처리를 해당 함수에서 처리해주시면 되겠습니다.
	// 3. setForm()     최종적으로 submit 전송전에 display:none 해놓은 실제로 컨텐츠 내용을 서버로 전송해 줄 textarea에 
	// 다음에디터에 입력된 내용을 넣어주는 작업함수입니다

</script>


<script type="text/javascript">

$(document).ready(function(){
	loadContent();
});


	function loadContent() {
		var attachments = {};
		
		/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
		Editor.modify({
			"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김,위의 부분을 수정하고 아래 부분은 수정없이 사용 */
				var allattachments = [];
				for (var i in attachments) {
					allattachments = allattachments.concat(attachments[i]);
				}
				return allattachments;
			}()
			,
			
		});
	}	
</script>



</body>
</html>