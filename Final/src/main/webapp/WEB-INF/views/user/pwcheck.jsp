<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

$(document).ready(function() {
	$('#check').click(function () {
		console.log("실행");
		$.ajax({
			type:"POST"
			, url:"/user/pwcheck"
			, data : { "password" : password.value}
			, success: function(data) {
					console.log(data);
				if(data){
					location.href='/user/update';
				} else {
					alert("비밀번호가 다릅니다.");
				}
			} 
			
		}); // ajax end
		
	}); // onclick end
}); // ready end
</script>
    
<h1>비밀번호 체크</h1>

<form id = "checkform">
아이디 : ${loginUser.email }

비밀번호 : 
<input type="password" id="password" placeholder="비밀번호를 입력해주세요."/>
<button type ="button" id="check">입력</button>
</form>