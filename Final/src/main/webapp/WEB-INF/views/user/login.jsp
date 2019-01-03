<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<!-- JQuery -->
<script type="text/javascript" src ="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>    



<style type="text/css">

/* footer 부분 css */
.text-center a:link {
	color: gray;
	text-decoration: none;
}

.text-center a:visited {
	color: black;
	text-decoration: none;
}

.text-center a:hover {
	color: blue;
	text-decoration: underline;
}

/* footer end */


/*로그인페이지전체 div*/
#loginFrom {
/*     position:relative; */
/*     top: 40%; */
/*     left: 40%; */
     width: 530px; 
/*     height: 350px; */
/*     overflow: hidden; */
/*     margin-left: -100px; */
	margin: 0 auto;
}

/*로그인페이지로고글씨 나중에 이미지처리해도됨*/
#loginlogo{
    text-align: center;
    padding: 10px;
    padding-right: 90px;
    }
    
#inputEmail3{
	margin-bottom: 10px;
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

#loginlogo{
	margin-bottom: 30px;
}
.title{
	width: 200px;
	margin: 0 auto;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
// 	console.log("??"+'${mistake}');
	// 아이디나 비밀번호가 틀렸을 때 session이 false 로 저장 되어서 
	// 로그인 화면으로 redirect 되었을 때 뜨는 경고창
// 	if(${mistake eq true }){
// 		console.log("??"+'${mistake}');
		
// 		alert("아이디나 비밀번호가 잘못되었습니다.");
// 	}
	
	
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

<body>


<div id = "loginFrom">
	<div id = "loginlogo"><img style="width: 400px;" src="/resources/image/bananalogo.png"/></div>
<div class ="title">
	<img src="/resources/image/login.PNG" class ="title" >
</div>
<div>
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
			      <a href ='/user/join'><label style="float: left">회원 가입</label></a>
			      <a href ='/user/findinfo?step=2'><label style="float: left">비밀번호 찾기</label></a>
			      <a href ='/user/findinfo?step=1'><label style="float: left">아이디 찾기</label></a>
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
</div>


<!-- footer -->
<div class="text-center" style="position:absolute;right: 570px; bottom: 30px; ">
	<p>
		<a href="#">회사소개</a>&nbsp; | &nbsp;<a href="/ticket/agreement" target="_blank">바나나 이용약관</a>&nbsp; |
		&nbsp;<a href="/ticket/billing" target="_blank">전자금융약관</a>&nbsp; | &nbsp;<br> 사업자정보확인고객센터(평일/주말
		09:00~18:00) : 1899-0042 (유료)
	<p class="subcopy" style="padding-bottom: 10px color: gray;">
		㈜KH특별자치도 제주시 첨단로 242(영평동)공동대표이사 : ㅇㅇㅇ, ㅇㅇㅇ &nbsp;사업자등록번호 :
		120-81-47521 <br> 통신판매업 신고번호 : 제2015-제주아라-0032호 &nbsp; <br>
		<small>Copyright 2018. 저작권자 All pictures cannot be copied
			without permission. </small>
</div>
</body>
</head>
</html>
