<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
.info{
	padding-right: 20px;
	font-weight: bold;
	font-size: 1.5em;
}
td{
	padding: 20px;
}

#checkDiv{
	width: 800px;
	margin: 0 auto;
	
	border: 1px solid #CCC;
	
}
#checkform{
	margin-top:20px;
	text-align: center;
}
table{
	margin: 0 auto;
	border-spacing: 0 10px;
}
.btn-block{
	margin: 30px auto;
	height: 40px;
}
.title{
	text-align:center;
	margin: 30px auto;

	
}
#titleSpan{
	font-size: 2em;
	font-weight: bold;
}
</style>
    
    
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
    
<div class ="title"><span id="titleSpan">비밀번호 체크</span></div>


<div id = "checkDiv">
	<form id = "checkform" class="form-horizontal">
	<table>
		<tr>
			<td class="info">아이디</td>
			<td><input type="text"class="form-control" value="${loginUser.email }" style="width: 100%;" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="info">비밀번호</td>
			<td><input type="password" class="form-control"  id="password"  style="width: 100%;"placeholder="비밀번호를 입력해주세요."/></td>
		</tr>
	</table>
	</form>
	<button id="check" class="btn btn-warning btn-block" style="width: 500px;">입력</button>
</div><br><br>





