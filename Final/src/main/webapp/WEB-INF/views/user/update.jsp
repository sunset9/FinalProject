<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 다음 우편주th--소 API -->
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>


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
				 $('#Nconfirm').attr("disabled", false);
			} else {
				 $('#checkMsg2').html('<span style="color:red">사용불가</span>');
			}
		}
	}); // end ajax
}); // end click

// 닉네임 입력창에 변화가 생길때 발생할 메소드
	$('#nick').change(function () {
		
		$('#checkMsg2').html('');
		$('#Nconfirm').attr("disabled", true);
	});


// 닉네임 변경 모달에서 변경 버튼 누르면 반응할 메소드
	$('#Nconfirm').click(function() {
		console.log('함수 실행은 되냐')
		if($('#nCheck').length >0){
			// 서버로 넘겨서 DB 처리하기
			console.log("ajax실행 전");
			$.ajax({
				type : "POST"
				, url : "/user/updatenick"
				, data : {
					"nick":$('#nick').val()
				} 
				, success: function(data){
					console.log("닉네임 변경 성공");
					$('#nickModal').find('form')[0].reset();
					$('#oriNick').html($('#nick').val());
					close();
				}
			}); // end ajax
			
			
			
		} else {
			
		}
		
	});
	
	// 비밀번호 변경 모달에서 변경 버튼 누르면 반응할 메소드
	$('#Pconfirm').click(function() {
		console.log('함수 실행은 되냐')
		
			// 서버로 넘겨서 DB 처리하기
			$.ajax({
				type : "POST"
				, url : "/user/updatepass"
				, data : {
					"password":$('#password').val()
				} 
				, success: function(data){
					$('#passModal').find('form')[0].reset();
					console.log("비밀번호 변경 성공");
					close();
					alert("비밀번호가 변경되었습니다.");
				}
			}); // end ajax
			
			
	});
	
	// 연락처 변경 모달에서 변경 버튼 누르면 반응할 메소드
	$('#Phconfirm').click(function() {
		console.log('함수 실행은 되냐')
		
			// 서버로 넘겨서 DB 처리하기
			$.ajax({
				type : "POST"
				, url : "/user/updatephone"
				, data : {
					"phone":$('#phone').val()
				} 
				, success: function(data){
					console.log("연락처 변경 성공");
					$('#oriPhone').html($('#phone').val());
					$('#phoneModal').find('form')[0].reset();
					close();
				}
			}); // end ajax
			
			
	});
	
	// 첫번째 비밀번호입력칸 포커스 잃을때  정규식 확인
	$("#password").blur(function() {
			console.log ("포커스 잃음");
			passRule();
		});


	
	

});// end ready


//비밀번호 정규식 체크
function passRule() {
	
	// 조건 1. 8~15자리 영문 대소문자
	// 조건 2. 최소 1개의 숫자를 포함해야 함

	console.log("비밀번호 정규식 확인하러 왔습니다~");
	
	var pRule = /^(?=.*[a-zA-Z])(?=.*\d).{8,15}$/;
	var pw1 = password.value;
	
	console.log(pRule.test(pw1))
	
	if(pRule.test(pw1)){
		
		console.log("정규식 맞음");
		$('#passRule').html('<span id ="pwCheck" style="color:green">안전</span>');

	} else {
	
		console.log("정규식 안맞음");
	    $('#passRule').html('<span style="color:red">숫자와 문자를 포함 형태의 8~15자리 이내로 설정해주세요!</span>');
	    
	} 
}

// 비밀번호 일치 확인 
function checkPw() {
	console.log("비밀번호 확인되나~?");

	// 처음 입력한 비밀번호 값 가져오기
// 	var pw1 = $('#password').val();
	var pw1 = password.value;
	
	// 비밀번오 확인 값 얻기
	var pw2 = $('#password2').val();
	console.log(pw1+" and "+pw2);
	
	if(pw1== pw2) {
		 $('#checkPW3').html('<span id = "pw2Check"style="color:blue">비밀번호 확인완료!</span>');
		 
		 console.log($('#pw2Check').length);
		 // 정규식 만족하고 비밀번호 일치하면 변경버튼 활성화
		 if($('#pw2Check').length > 0 ){
			 $('#Nconfirm').attr("disabled", false);
			 $('#Pconfirm').attr("disabled", false);
		 }
	} else{
		$('#checkPW3').html('<span style="color:red">동일한 비밀번호 입력해주세요.</span>');
	}
} 

//다음 우편번호/ 주소 API
function DaumPostcode() {
	 daum.postcode.load(function(){
       new daum.Postcode({
    	   oncomplete: function(data) {
           	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullAddr = ''; // 최종 주소 변수
               var extraAddr = ''; // 조합형 주소 변수
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   fullAddr = data.jibunAddress;
               }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
               if(data.userSelectedType === 'R'){
                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있고, 공동주택일 경우 추가한다.
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('addr').value = fullAddr;
                // 커서를 상세주소 필드로 이동한다.
               document.getElementById('addrDetail').focus();
           }
       }).open();
})
}

</script>



<h1>회원 정보 수정</h1>

<div>
<!-- 연락처, 주소, 닉네임 -->
<div id="userInfo">
닉네임 :<span id="oriNick"> ${user.nick }</span> <span id ="nickCh" class = "change" data-toggle="modal" data-target="#nickModal">변경</span> <br>
비밀번호 <span id ="passCh" class = "change" data-toggle="modal" data-target="#passModal" >변경</span><br>
연락처 : <span id="oriPhone">${user.phone }</span><span id ="phoneCh" class = "change" data-toggle="modal" data-target="#phoneModal">변경</span><br>
주소  : ${user.addr }<span id ="addrCh" class = "change" data-toggle="modal" data-target="#addrModal">변경</span><br>
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
        <button type="button" id = "Nconfirm" class="btn btn-primary"  data-dismiss="modal" disabled="disabled" >변경하기</button></div>
      </div>
    </div>
  </div>
</div>



<!-- password Modal -->
<div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="passModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="passModalLabel">비밀번호 변경</h4>
      </div>
      <div class="modal-body">
      
      	<form id="passForm">
      	<p>숫자와 문자를 포함 형태의 8~15자리 이내로 설정해주세요!</p>
      	비빌번호 : <input type="password" id ="password" name ="password"/>
      	<div id="passRule"></div></td>
      	
      	비밀번호 확인 :<input type="password" id ="password2" name ="password2" onkeyup="checkPw()"/>
      	<div id ="checkPW3"></div>
      
      	</form>
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <div data-toggle="tooltip" data-placement="left" title="비밀번호를 확인해주세요">
        <button type="button" id ="Pconfirm" class="btn btn-primary"  data-dismiss="modal" disabled="disabled" >변경하기</button></div>
      </div>
    </div>
  </div>
</div>




<!-- phone Modal -->
<div class="modal fade" id="phoneModal" tabindex="-1" role="dialog" aria-labelledby="phoneModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="phoneModalLabel">연락처 변경</h4>
      </div>
      <div class="modal-body">
      	<form id="phoneForm">
      	전화번호 : <input type="text" id ="phone" name ="phone"/>
      	<div id ="checkMsg2"></div>
      	<p>숫자만 입력해주세요.</p>
      	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" id = "Phconfirm" class="btn btn-primary"  data-dismiss="modal">변경하기</button></div>
      </div>
    </div>
  </div>
</div>




<!-- address Modal -->
<div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="addrModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="addrModalLabel">닉네임 변경</h4>
      </div>
      <div class="modal-body">
      	<form id="addrForm">
      	우편번호 : <input type="text" id ="postcode" name ="postcode"/> <button type ="button" class ="btn btn-default" onclick="DaumPostcode();">우편번호검색</button>
      	주소 : <input type="text" id ="addr" name ="addr"/>
      	상세주소 : <input type="text" id ="addrDetail" name ="addrDetail"/>
      	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <div data-toggle="tooltip" data-placement="left" title="닉네임 중복확인을 해주세요.">
        <button type="button" id = "Aconfirm" class="btn btn-primary"  data-dismiss="modal" disabled="disabled" >변경하기</button></div>
      </div>
    </div>
  </div>
</div>