<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 유저 정보 보여줄 DIV 빼놓았어요 ~ 쓰이는 곳이 좀 있어서 !  -->
<!-- jQuery Form Plugin -->
<script src="http://malsup.github.com/min/jquery.form.min.js"></script> 
<style type="text/css">
#userProfile{
	width: 150px;
	
}
#userinfo{
	background-color: #CCC;
}


</style>

<script type="text/javascript">
$(document).ready(function() {
	// 프로필 사진 클릭시 파일업로드창 실행 
	$('#userProfile').click(function() {
		console.log('addchange');
		$("#profileFile").click();
	}); //end click
	
	// submit 이벤트 발생 시 동작
	// == onsubmit 이벤트리스너
	$("#imageForm").ajaxForm({
		type:"POST"
		,url:"/user/profile"
		,data:{}
		,dataType:"json"
		,success: function (data){
			console.log("프로필 변경 성공");
		}
	}); // end ajax form

	// 업로드 파일이 변경 됐을경우 실행되는 이벤트 
	// ajaxForm 라이브러리 사용
	$("#profileFile").change(function(){
	
		console.log("사진 변경함수 실행");
		imageForm
		var file = $('#profileFile');
		var fileData = new FormData( $('#imageForm')); 
		console.log(file);
		console.log(file[0].files[0]);
		
		 // 파일 없는 경우 중단 
		if ((file[0].files).length <1 ) {
			
			console.log("첨부된 사진 없음");	
			return
		}

		$("#imageForm").submit();
	});//end change
	
});
</script>


<div id = "userinfo">
		<img id = "userProfile" src="${loginUser.profile }"  class="img-circle"/>
		
<!-- 		수정할 사진 업로드 할 input 안보이게 숨겨 놓고 사진 누르면 반응 -->
<!-- 		<div style="display: none;"> -->
		<form id="imageForm" action ="/user/profile"method="POST" enctype="multipart/form-data">
			<input type="file" id ="profileFile" name="profileFile"/>
		</form>
<!-- 		</div> -->
		
		<span id="userNick">${loginUser.nick }</span> <small>님 안녕하세요</small>
		<button id="userInfoChange" onclick ="location.href='/user/pwcheck'" class="btn btn-default">정보 변경</button>
		<span>입금 대기</span><span>예매 완료</span><span>취소 현황</span>
	</div>