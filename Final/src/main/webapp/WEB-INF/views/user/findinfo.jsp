<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">

.findDiv{
	text-align: center;
	border: 2px solid #CCC;
	width: 800px;
	margin: 30px auto;
	
}

table{
	margin: 0 auto;
}

td{
	padding-top: 20px;
}

/* 버튼 정렬 */
.btnDiv{
	text-align: center;
	margin: 0 auto;
}

.btn-block{
	margin: 30px auto;
	height: 40px;
}

.info{
	padding-right: 20px;
	font-weight: bold;
}

/* 탭 위치 조정 */
.tabLi{
	width: 300px;
	text-align: center;

}

.findUl{
	padding-left: 550px;
}

.nav-tabs>li.active>a{
	background: #CCC !important;
}
.title{
	width: 300px;
	margin: 0 auto;
}
</style>
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
					$('#ephone').val("");
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

<div role="tabpanel" class="contain">

<div class ="title">
	<img src="/resources/image/search.PNG" class ="title" >
</div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs findUl" role="tablist">
    <li class = "tabLi" role="presentation" id="emailTab"><a  class = "tabLi" href="#findEmail" aria-controls="findEmail" role="tab" data-toggle="tab">이메일 찾기</a></li>
    <li class = "tabLi" role="presentation" id="passwordTab"><a  class = "tabLi" href="#findPass" aria-controls="findPass" role="tab" data-toggle="tab">비밀번호 찾기</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  
	<div role="tabpanel" class="tab-pane" id="findEmail">
	<div class ="findDiv">
	  <div class="tab-content"  class ="form-inline">
	<form id="emailForm">
	<table>
		<tr>
			<td class = "info">이름</td>
			<td><input type="text" class="form-control" style="width: 100%;" name="name" id ="ename"/></td>
		</tr>
		<tr>
			<td class = "info">연락처</td>
			<td> <input type="text" class="form-control" style="width: 100%;"  name="phone" id ="ephone"/></td>
		</tr>	
	</table>
	</form><br><br>
	<p>가입하실 때 입력했던 이름과 연락처를 입력해 주세요.</p>
	</div>
		<div class="btnDiv"><button type = "button" id="emailBtn" class="btn btn-warning btn-block" style="width: 500px;" data-toggle="modal" data-target="#emailModal" >찾기</button></div>
	</div>
	
</div>	
	
    <div role="tabpanel" class="tab-pane" id="findPass">
    	<div class ="findDiv">
    	<form id="passForm" class ="form-inline">
		<table class="form-horizontal">
    	
    	<tr>
    		<td class="info"  >이메일</td>
    		<td><input type="text" class ="form-control" name="email" id ="email" value="skdud5011"/>
    		 @ <input name="email2" type="text"  class="form-control" id="email2"  value="daum.net">
				<select class="form-control" name="email_select" id="email_select"  onchange="directInput(); " >
				
				    <option value="1" selected="selected">직접입력</option>
				    <option value="naver.com">naver.com</option>
				    <option value="daum.net">daum.net</option>
				    <option value="gmail.com">gmail.com</option>
				</select></td>
    	</tr>
    	<tr>
    		<td class="info">이름</td>
    		<td><input type="text" class ="form-control"name="name" id ="name" style="width: 100%;"value="홍나영"/></td>
    	</tr>
    	<tr>
    		<td class="info">연락처</td>
    		<td><input type="text" class ="form-control" name="phone" id ="phone" style="width: 100%;"value="01040322028"/></td>
    	</tr>
		</table><br><br>
	</form>
    	<p>가입하실 때 입력했던 이메일과 이름과 연락처를 입력해 주세요.</p>
	<div class="btnDiv"><button type = "button" id="passBtn"  class="btn btn-warning btn-block" style="width: 500px;">찾기</button></div>
	</div>
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
 
