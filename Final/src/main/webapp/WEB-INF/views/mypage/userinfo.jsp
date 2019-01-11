<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 유저 정보 보여줄 DIV 빼놓았어요 ~ 쓰이는 곳이 좀 있어서 !  -->
<!-- jQuery Form Plugin -->
<script src="http://malsup.github.com/min/jquery.form.min.js"></script> 
<style type="text/css">
#userProfile{
	width: 150px;
	height: 152px;
}
#userinfo{
	height:185px;
	display : grid;
	grid-template-columns:260px 450px 200px 200px;
	grid-template-rows: 153px;
	background-color: #f6f6f6;
	grid-gap :6px;
	margin: 0 auto;
	text-align: center;
	border-radius: 4px;
    padding: 16px;
}

#userNick{
	font-weight: bolder;
	font-size: 2em;
}
#profileDiv{
	grid-column:1/2;
/*  	margin-top: 10px; */
}
#nickDiv{	
	grid-column:2/3;
	display: inline-block;
	text-align: left;
	vertical-align:middle;
	border-right: 2px solid #eee;
}
#userInfoChange {
	background: #fff;
    width: 109px;
}
#bookDiv{
	grid-column:3/4;
	vertical-align:middle;
 	padding-top:14px; 
}
#cancelDiv{
	grid-column:4/5;
	vertical-align:middle;
	padding-top:14px; 
}

#nickSec{
	display: inline-block;
	margin-top: 30px;
}
.cnt{
	font-size:5em;
	font-weight: bolder;
	margin: 10px auto;
}
.info{
	font-size: 1.3em;
	font-weight: bold;
    color: #828282;
}
.cover {
	display: inline-block;
	z-index: 10;
    background-color: #33333399;
    height: 152px;
    width: 150px;
    position: absolute;
    border-radius: 72px;
    cursor:pointer;
    
}
.changeSpan{
	display: block;
	margin: 50% auto;
	font-weight: bold;
	color: #fff;
	font-size: 1.2em;
}
.overDiv{
	display: none;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	// 예매 상태 조회할 ajax
	$.ajax({
		type:"POST"
		, url :"/user/bookstate"
		, data :{
			"userIdx":${loginUser.userIdx}
		}
		,dataType:"JSON"
		,success:function(data) {
			// 스트링 타입으로 받음
			console.log(data)
			
			// json으로 파씽
// 			console.log(JSON.parse(data))
// 			data=JSON.parse(data)
			
			console.log(data.book)
			$('#bookCnt').html(data.book);
			$('#cancelCnt').text(data.cancel);
		}
		,error:function(e){
			console.log(e);
		}
	}); //end ajax
	
	
	
	// 프로필 사진 클릭시 파일업로드창 실행 
// 	$('#userProfile').click(function() {
	$('#profileDiv').on('click','.cover',function(){
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
			console.log("data="+data.profile);
			
			$('#userProfile').attr('src',data.profile);
			
		}
		,error :function(e) {
			console.log("실패");
			console.log(e);	
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
	
	
	
    // 프로필사진 구역에 마우스 over 시  
//     $('#profileDiv').on('mouseover','#userProfile', function(){
	 $('#profileDiv').mouseenter(function(){
		 console.log("마우스 over");

// 		var cover = $('<div class="cover">');
// 		var cSpan = $('<span class="changeSpan">변경</span>');
// 		cover.append(cSpan);
// 		$(this).parent('#profileDiv').append(cover);
// 		$(this).parent.append(cover);
// 		$('.overDiv').show();
		$('.overDiv').css("display", "inline-block");
			
    });
	  // 마우스 leave시
// 	    $('#profileDiv').on('mouseleave','.cover', function(){
	$('#profileDiv').mouseleave(function() {
	    	console.log("마우쓰가 떠났다");
	    
// 	    	$('.overDiv').hide();		
		$('.overDiv').css("display", "none");
// 	    	$(this).remove();
	    	
	    });
	
}); // end ready
</script>


<div id = "userinfo">
	<div id = profileDiv>
		<div>
			<div class="overDiv cover">
				<span class="changeSpan">
					변경
				</span>		
			</div>
		
			<img id = "userProfile" src="${loginUser.profile }"  class="img-circle"/>
		</div>
	</div>
	
	
<!-- 		수정할 사진 업로드 할 input 안보이게 숨겨 놓고 사진 누르면 반응 -->
	<div style="display: none;">
	<form id="imageForm" action ="/user/profile"method="POST" enctype="multipart/form-data">
		<input type="file" id ="profileFile" name="profileFile"/>
	</form>
	</div>
	
	<div id="nickDiv">
		<div id ="nickSec">
		<span id="userNick">${loginUser.nick }</span> <small>님 안녕하세요</small><br><br>
		<button id="userInfoChange" onclick ="location.href='/user/pwcheck'" class="btn btn-default">정보 변경</button>
		</div>
	</div>
	
	<div id="bookDiv">
		<span id ="bookCnt" class ="cnt"></span><br>
		<span class="info">예매 완료</span>
	</div>
	
	<div id ="cancelDiv">
		<span id ="cancelCnt"  class ="cnt"></span><br>
		<span class="info">취소 현황</span>
	</div>
</div>
	
	
	
	
	
	
	
	
	