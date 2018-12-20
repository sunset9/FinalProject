<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

$(document).ready(function() {
	console.log("step :" +${step });
	if(${step eq 1}){
		$('#emailTab').addClass('active');
		$('#findEmail').addClass('active');
	} else {
		$('#passwordTab').addClass('active');
		$('#findPass').addClass('active');
	}
	
	
	// 이메일 찾기 버튼 눌럿을 때 반응
	$('#emailBtn').click(function() {
		$.ajax({
			type : "POST"
			,url : "/user/findemail"
			, data :{
				"name":$('#ename').val()
				,"phone" : $('#ephone').val()
			}
			, success: function(data){
				if(data!=null) {
					console.log(data);
					// 모달 바디에 받아온 정보 추가하기 
					$('#modalBody').html('등록된 이메일은 <span style="font-weight: bolder">'+data+'</span> 입니다.');
					$('#ename').val("");
					$('#ephone
							').val("");
				}
			}
		}); // end ajax
	});// end click
	
	$('#passBtn').click(function() {
		$.ajax({
			type : "POST"
			,url : "/user/findpass"
			, data :{
				"email":$('#email').val()+"@"+$('#email2').val()
				,"name":$('#ename').val()
				,"phone" : $('#ephone').val()
			}
			, success: function(data){
				if(data!=null) {
					alert("입력하신 이메일로 임시 비밀번호를 보내드렸습니다." +data);
					$('#ename').val("");
					$('#phone').val("");
					$('#email').val("");
				}
			}
		}); // end ajax
	});// end click
	
});  // end ready


//이메일 주소 선택 함수
function directInput(){

    if (join.email_select.value == '1') {
    	$("#email2").attr('readonly', false);
    	join.email2.value = '';
        join.email2.focus();
    }  else {
    	$("#email2").attr('readonly', true);
    	join.email2.value = join.email_select.value;
    }
}
</script>
<h1>아이디, 비밀번호 찾기</h1>

<div role="tabpanel" class="contain">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" id="emailTab"><a href="#findEmail" aria-controls="findEmail" role="tab" data-toggle="tab">이메일 찾기</a></li>
    <li role="presentation" id="passwordTab"><a href="#findPass" aria-controls="findPass" role="tab" data-toggle="tab">비밀번호 찾기</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content"  class ="form-inline">
    <div role="tabpanel" class="tab-pane" id="findEmail">
	<p>가입하실 때 입력했던 이름과 연락처를 입력해 주세요.</p>
	<form id="emailForm">
		이름 : <input type="text" name="name" id ="ename"/><br>
		연락처 : <input type="text" name="phone" id ="ephone"/><br>
	<button type = "button" id="emailBtn" data-toggle="modal" data-target="#emailModal" >찾기</button>
	</form>
	</div>
	
	
	
	
    <div role="tabpanel" class="tab-pane" id="findPass">
    	<p>가입하실 때 입력했던 이메일과 이름과 연락처를 입력해 주세요.</p>
    	<form id="passForm">
    	이메일 : <input type="text" name="email" id ="email" value="skdud5011"/>
    		 @ <input name="email2" type="text"  class="form-control" id="email2"  value="daum.net">
				<select class="form-control" name="email_select" id="email_select"  onchange="directInput(); " >
				
				    <option value="1" selected="selected">직접입력</option>
				    <option value="naver.com">naver.com</option>
				    <option value="daum.net">daum.net</option>
				    <option value="gmail.com">gmail.com</option>
				</select><br>
		이름 : <input type="text" name="name" id ="name" value="홍나영"/><br>
		연락처 : <input type="text" name="phone" id ="phone" value="01040322028"/><br>
		<button type = "button" id="passBtn">찾기</button>
	</form>
    </div>
  </div>

</div>


<!-- 찾은 아이디 보여줄 모달창 -->
<div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="emailModalLabel">이메일 찾기</h4>
      </div>
      <div id ="modalBody"class="modal-body">
      
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
  </div>
