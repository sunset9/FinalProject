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

<div id = "loginFrom">
	<h1 id = "loginlogo">TICKET</h1>
		<form action="/main/login" method="POST">
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
			      <label style="float: right">회원 가입</label>
			      <label style="float: right">비밀번호 찾기</label>
			      <label style="float: right">아이디 찾기</label>
		      </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-10" style="text-align: center;">
		      <button type="submit" class="btn btn-default login-btn">로그인</button>
		    </div>
		  </div>
		</form>
</div>
