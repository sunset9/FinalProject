<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<style type="text/css">
/*로그인페이지전체 div*/
#loginFrom {
    position:relative;
    top: 40%;
    left: 40%;
    width: 530px;
    height: 350px;
    overflow: hidden;
    margin-left: -100px;
}

/*로그인페이지로고글씨 나중에 이미지처리해도됨*/
#loginlogo{
    text-align: center;
    padding: 10px;
    padding-right: 90px;
    }
    
/*로그인페이지 인풋박스*/    
.login-input{
	height: 50px;
}

/*로그인 BTN*/
.login-btn{
	width: 415px;
    padding: 10px;
    margin-top: 25px;
}

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디랑 비밀번호가 있을 때만 로그인 처리 
	$('#loginBtn').click(function() {
		console.log("로그인 유효성 실행?");
		
		if($('#inputEmail3').val()==""){
			alert("아이디를 입력해 주세요.");
		} else if($('#inputPassword3').val()=="" ){ 
			alert("비밀번호를 입력해 주세요.");
				
		} else {
				$('#loginForm').submit();
		}
	})
});

</script>

<div id = "loginFrom">
	<h1 id = "loginlogo">TICKET</h1>
		<form action="/user/login" method="POST" id="loginForm">
		  <div class="form-group">
		    <div class="col-sm-10">
		      <input type="email" class="form-control login-input" id="inputEmail3" name="email" placeholder="아이디(이메일)">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-10">
		      <input type="password" class="form-control login-input" id="inputPassword3"  name="password"  placeholder="비밀번호">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-10">
		      <div class="checkbox">
		        <label>
		          <input type="checkbox"> 아이디 저장
		        </label>
			      <a href ='/user/join'><label style="float: right">회원 가입</label></a>
			      <a href ='/user/findinfo?step=2'><label style="float: right">비밀번호 찾기</label></a>
			      <a href ='/user/findinfo?step=1'><label style="float: right">아이디 찾기</label></a>
		      </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-10" style="text-align: center;">
		      <button type="button" id="loginBtn" class="btn btn-default login-btn">로그인</button>
		    </div>
		  </div>
		</form>
</div>
