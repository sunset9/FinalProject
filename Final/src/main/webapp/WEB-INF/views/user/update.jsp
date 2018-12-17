<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
.change {
	font-weight: bold;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	

// 닉네임 중복 체크 
$("#nickCheck").click(function() {
	console.log("닉네임 체크 실행?")
	$.ajax ({
		type:"POST"
		, url : "/user/nickcheck"
		, data: {
			"nick":$('#nick').val()
		}
		, success:function(data) {
			if($.trim(data) == 0) {
				 $('#checkMsg2').html('<span id ="nCheck" style="color:blue">사용가능</span>');
				 $('#confirm').attr("disabled", true);
			} else {
				 $('#checkMsg2').html('<span style="color:red">사용불가</span>');
			}
		}
	}); // end ajax
}); // end click

	$('#confirm').click(function() {
		if($('#nCheck').length >1){
			$('#oriNick').html($('#nick').val());
			close();
		} else {
			
		}
		
	});
});// end ready

</script>



<h1>회원 정보 수정</h1>

<div>
<!-- 연락처, 주소, 닉네임 -->
<div id="userInfo">
닉네임 :<span id="oriNick"> ${user.nick }</span> <span id ="nickCh" class = "change" data-toggle="modal" data-target="#nickModal">변경</span> <br>
비밀번호 <span id ="passCh" class = "change">변경</span><br>
연락처 : ${user.phone }<span id ="phoneCh" class = "change">변경</span><br>
주소  : ${user.addr }<span id ="addrCh" class = "change">변경</span><br>
</div>

</div>


<!--//////////////////////////////////////////////////////  -->
<!-- nick Modal -->
<div class="modal fade" id="nickModal" tabindex="-1" role="dialog" aria-labelledby="nickModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="nickModalLabel">닉네임 변경</h4>
      </div>
      <div class="modal-body">
      	<form id="nickForm">
      	닉네임 : <input type="text" id ="nick" name ="nick"/>
      	<div id ="checkMsg2"></div>
      	<p>한글 및 영문, 숫자만 사용 가능하며, 최대 15자까지만 등록 가능합니다.</p>
      	<button type="button" id ="nickCheck">중복확인</button>
      	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <div data-toggle="tooltip" data-placement="left" title="닉네임 중복확인을 해주세요.">
        <button type="button" id = "confirm" class="btn btn-primary"  data-dismiss="modal" disabled="disabled">변경하기</button></div>
      </div>
    </div>
  </div>
</div>