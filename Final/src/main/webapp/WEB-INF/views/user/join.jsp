<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!-- 다음 주소 API -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">

$(document).ready(function() {

	// 체크박스 선택시 다음단계 버튼 활성화
	 $("#allAgreement").change(function(){
	        if($("#allAgreement").is(":checked")){
	        	console.log("동의 후 다음버튼 활성화");
	        	$("#agreement1").attr("checked","checked");
	        	$("#agreement2").attr("checked","checked");
	        	$("#agreement3").attr("checked","checked");
	        	$("#agreement4").attr("checked","checked");
	        	$("#btnAgree").attr('disabled',false);
	            
	        }else{
	        	console.log("동의 후 다음버튼 비활성화");
	        	$("#agreement1").attr("checked",false);
	        	$("#agreement2").attr("checked",false);
	        	$("#agreement3").attr("checked",false);
	        	$("#agreement4").attr("checked",false);
	        	$("#btnAgree").attr('disabled',true);
	           
	        
	        }
	    });
	
	// 약관 확인 하고 정보 입력창 넘어가기 
	$("#btnAgree").click(function() {
		
		$("#joinInfo").show();
		$("#agree").hide();
	  	$("#infoTab").addClass("joinActive");

	});
	
		
	// 정보입력 하고 선호테마 선택창으로 넘어가기 
	$("#btnJoin").click(function() {
		
// 		if($("#eCheck").length < 1){
// 			console.log("이메일 중복확인 안함");
// 			$('#emailCheck').attr('data-toggle', "tooltip");
// 			$('#emailCheck').attr('data-placement', "top");
// 			$('#emailCheck').attr('title', "이메일 중복 확인을 해주세요!");
// 			$('#emailCheck').focus();
			
// 			return;
			
// 		}
		
// 		if($("#nCheck").length < 1){
// 			console.log("닉네임 중복확인 안함");
// 			$('#nickCheck').attr('data-toggle', "tooltip");
// 			$('#nickCheck').attr('data-placement', "top");
// 			$('#nickCheck').attr('title', "닉네임 중복 확인을 해주세요!");
// 			$('#nickCheck').focus();
			
// 			return;
			
// 		}
		
// 		if($("#pwCheck").length < 1){
// 			console.log("비밀번호 정규식 확인 안함");
// 			$('#password').attr('data-toggle', "tooltip");
// 			$('#password').attr('data-placement', "top");
// 			$('#password').attr('title', "비밀번호를 확인을 해주세요!");
// 			$('#password').focus();
			
// 			return;
			
// 		}
		
// 		if($("#pw2Check").length < 1){
// 			console.log("비밀번호 일치 확인 안함");
// 			$('#passwordc').attr('data-toggle', "tooltip");
// 			$('#passwordc').attr('data-placement', "top");
// 			$('#passwordc').attr('title', "비밀번호 일치를 확인을 해주세요!");
// 			$('#passwordc').focus();
			
// 			return;
			
// 		}
		
// 		if($("#name").val().length < 1){
// 			console.log("이름 확인 안함");
// 			$('#name').attr('data-toggle', "tooltip");
// 			$('#name').attr('data-placement', "top");
// 			$('#name').attr('title', "이름을 확인 해주세요!");
// 			$('#name').focus();
			
// 			return;
			
// 		}
		
// 		if($("#sex").val().length < 1){
// 			console.log("이름 확인 안함");
// 			$('#sex').attr('data-toggle', "tooltip");
// 			$('#sex').attr('data-placement', "top");
// 			$('#sex').attr('title', "성별을 입력해주세요!");
// 			$('#sex').focus();
			
// 			return;
			
// 		}
		
// 		if($("#phCheck").length < 1){
// 			console.log("연락처 확인 안함");
// 			$('#phone').attr('data-toggle', "tooltip");
// 			$('#phone').attr('data-placement', "top");
// 			$('#phone').attr('title', "연락처를 확인해주세요!");
// 			$('#phone').focus();
			
// 			return;
			
// 		}
		
// 		if($("#postcode").val().length < 1){
// 			console.log("우편번호 확인 안함");
// 			$('#postcode').attr('data-toggle', "tooltip");
// 			$('#postcode').attr('data-placement', "top");
// 			$('#postcode').attr('title', "우편번호를 입력해주세요!");
// 			$('#postcode').focus();
			
// 			return;
			
// 		}
		
// 		if($("#addr").val().length < 1){
// 			console.log("주소 확인 안함");
// 			$('#addr').attr('data-toggle', "tooltip");
// 			$('#addr').attr('data-placement', "top");
// 			$('#addr').attr('title', "주소를 입력해주세요!");
// 			$('#addr').focus();
			
// 			return;
			
// 		}
	
		$("#joinInfo").hide();
		$("#theme").show();
		$("#preferTab").addClass("joinActive");

	});
	
	// 선호 테마 선택후 완료창 가기
	$("#btnTheme").click(function() {
	  	
	 // 선택된 체크박스 값 담기
		 var checkboxes = [];
		    $("input[name='themeIdx']:checked").each(function(i) {
		    	checkboxes.push($(this).val());
		    });
	  	
		    console.log("체크된 값");
		    console.log(checkboxes);
			console.log(checkboxes.length);
			
		if (checkboxes.length < 1) {
			alert ("하나는 선택해야함");
			
			return;
			
		}    
		    
		$.ajax ({
			type:"POST"
			, url : "/user/join"
			, data: {
				"themeIdx":checkboxes
				,"email": email.value+"@"+email2.value
				,"nick": nick.value
				,"password": password.value
				,"name": userName.value
				,"sex": $('input[name=sex]:checked').val()
				,"year": year.value
				,"month": month.value
				,"day": day.value
				,"phone":phone.value
				,"addr": addr.value
				,"addrDetail":addrDetail.value
				,"postcode":postcode.value
			}
			, success:function(data) {
				console.log("성공쓰");
				}
			
		}); // end ajax

		$("#theme").hide();
		$("#complete").show();
		
	  	$("#completeTab").addClass("joinActive");
	  	
	}); // end click
	

	
// 회원가입 날짜 선택하기 
	// 생년월일 뿌리는 함수 
	setDate();
	
	// 아이디 중복 체크 
	$("#emailCheck").click(function() {
		console.log("아이디 체크 실행?")
		$.ajax ({
			type:"POST"
			, url : "/user/emailcheck"
			, data: {
				"email":$('#email').val()+"@"+$('#email2').val()
			}
			, success:function(data) {
				if($.trim(data) == 0) {
					 $('#checkMsg').html('<span id = "eCheck"style="color:blue">사용가능</span>');
					 $('#emailCheck').attr('disabled', true);
				} else {
					 $('#checkMsg').html('<span style="color:red">사용불가</span>');
				}
			}
		}); // end ajax
	}); // end on
	
	
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
					 $('#emailCheck').attr('disabled', true);
				} else {
					 $('#checkMsg2').html('<span style="color:red">사용불가</span>');
				}
			}
		}); // end ajax
	}); // end click
	
	

// 첫번째 비밀번호입력칸 포커스 잃을때  정규식 확인
$("#password").blur(function() {
		console.log ("포커스 잃음");
		passRule();
	});

});

// 이메일 주소 선택 함수
function directInput(){
	changeEmail();
    if (join.email_select.value == '1') {
    	$("#email2").attr('readonly', false);
    	join.email2.value = '';
        join.email2.focus();
    }  else {
    	$("#email2").attr('readonly', true);
    	join.email2.value = join.email_select.value;
    }
}

	// 아이디 중복확인 후 변경하고 싶을 때
function changeEmail(){
	
		 $('#emailCheck').attr('disabled', false);
		 $('#checkMsg').html('');
}


// 닉네임 중복확인 후 변경하고 싶을 때
function changeNick(){

	 $('#nickCheck').attr('disabled', false);
	 $('#checkMsg2').html('');
}


// 비밀번호 정규식 체크
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
	var pw2 = $('#passwordc').val();
	console.log(pw1+" and "+pw2);
	
	if(pw1== pw2) {
		 $('#checkPW3').html('<span id = "pw2Check"style="color:blue">비밀번호 확인완료!</span>');
	} else{
		$('#checkPW3').html('<span style="color:red">동일한 비밀번호 입력해주세요.</span>');
	}
} 

// 연락처 정규식
function checkPhone() {
	console.log("연락처 폼 체크");
	
	var phRule =  /^[0-9]*.{10,11}$/;
	var p1 = phone.value;
	console.log("연락처 : " + p1);
	
	console.log("phRule.test(p1)" + phRule.test(p1))
	
	if(!phRule.test(p1)) {
	    $('#phoneCheck').html('<span id ="phCheck"style="color:red">잘못된 전화번호 형식입니다. 숫자만 입력해 주세요!</span>');
	}else {
		$('#phoneCheck').html('<span></span>');
	}
	
	
	
}

// select box 연도, 월, 일 표시 
function setDate() {
	
	console.log("실행?");
	
	var today = new Date();
	var year = "";
	var currYear = today.getFullYear();
	
	
	// 연도 뿌리기 
	$("#year").append("<option value=''>년도</option>");
	// 올해 기준으로 - 70년 까지 보여줌 
	for(var i =(currYear-70); i<=currYear ; i ++){
		$("#year").append("<option value='"+i+"'>"+i+"년"+"</option>");
	}
	
	// 월 뿌리기 
	var month;
	$("#month").append("<option value=''>월</option>");

	for(var i =1; i<=12 ; i ++){
		$("#month").append("<option value='"+i+"'>"+i+"월"+"</option>");
	}
	
    $("#year").val("1948");
    $("#month").val("12");
    $("#month").change();
    $("#day").val("13");

	
}

	// 월 별로 일 뿌리ㅣㄱ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function setDay(){
		var frm = document.getElementById('join');
		
		var year = frm['year'].value;
		var month = frm['month'].value;
		var day = frm['day'];
		
		var listMonth =[31,28,31,30,31,30,31,31,30,31,30,31,30,31];
		
		
		// 윤달 체크
		if(year%4 == 0 ){
			listMonth[1]=29;
		}
		
		// 기존 day 옵션 삭제
        for( var i=day.length; i>0; i--) {
           day.remove(day.selectedIndex);
        }
            
        // day 옵션 생성
        $("#day").append("<option value=''>일</option>");
        for (var i=1; i<=listMonth[month-1]; i++) {
        	$("#day").append("<option value='"+i+"'>"+i+"일"+"</option>");
        }

	}
	
	// 다음 우편번호/ 주소 API
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


<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->


<style type="text/css">
td {
	padding: 5px;
}

.joinActive{
	color: green;
}

</style>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->



<div class="container">

	<div class="row" id="joinStep">
		<ol class="breadcrumb">
		  <li id ="agreeTab" class="joinActive">약관동의<span class = "glyphicon glyphicon-ok-circle"/></li>
		  <li id ="infoTab" > 정보입력 <span class = "glyphicon glyphicon-ok-circle"/></li>
		  <li id = "preferTab">선호 테마 선택 <span class = "glyphicon glyphicon-ok-circle"/></li>
		  <li id = "completeTab">회원 가입 완료 <span class = "glyphicon glyphicon-ok-circle"/></li>
		</ol>
	</div>
		
		
		
		
		
		
		
		
<!-- 약관 동의 페이지 -->
<div id ="agree">
<h1>약관 동의 페이지 입니다아~</h1>

<div>

<label><input type="checkbox"  id="allAgreement" > 전체 동의 </label><br>

<hr>

<label><input type="checkbox"  id="agreement1" > 이용약관(필수) </label><br>
<label><input type="checkbox"  id="agreement2" > 유료서비스약관(필수) </label><br>
<label><input type="checkbox"  id="agreement3" > 개인정보 수집 및 이용(필수) </label><br>
<label><input type="checkbox"  id="agreement4" > 이벤트, 서비스안내 수신(선택) </label><br>

</div>

<button id="btnAgree" class="btn btn-default" disabled="disabled" >다음단계</button>
</div>	
	
	
	
	
	
	
<!-- 회원 가입 div -->
<div id = "joinInfo" style="display: none;">
<form class ="form-inline" id = "join" name ="join" action="/user/join" method="POST">
	<table>
		<tr>
			<td><label>이메일 주소</label></td> 
			<td><input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" onchange="changeEmail();"  value="test<%=new Date().getTime()%>"/> 
			 @ <input name="email2" type="text"  class="form-control" id="email2"  value="daum.net">
				<select class="form-control" name="email_select" id="email_select"  onchange="directInput(); " >
				
				    <option value="1" selected="selected">직접입력</option>
				    <option value="naver.com">naver.com</option>
				    <option value="daum.net">daum.net</option>
				    <option value="gmail.com">gmail.com</option>
				</select>
  
			<input type="button" name="emailCheck"  id="emailCheck"  value="중복확인" class="btn btn-default"/>
			<div id = "checkMsg"></div></td>
		</tr>

		<tr>
			<td><label>닉네임</label></td>
			<td><input type="text" class="form-control"	name="nick" id = "nick" placeholder="닉네임을 입력하세요" onchange="changeNick();"value="testNick<%=new Date().getTime()%>"/>
			<input type="button" name="nickCheck" id="nickCheck" value="중복확인" class="btn btn-default" />
			<div id = "checkMsg2"></div></td>
		</tr>	

		<tr>
			<td><label>비밀번호</label></td>
			<td><input type="password" class="form-control"	name="password" id="password" placeholder="비밀번호 입력" value="123123abc"/>
			<div id="passRule"></div></td>
		</tr>

		<tr>
			<td><label>비밀번호 체크</label></td> 
			<td><input type="password" class="form-control"name="passwordc" id="passwordc"onkeyup="checkPw()" placeholder="비밀번호 확인 입력" value="123123abc"/>
			<div id="checkPW3"></div></td>
		</tr>	
	
		<tr>
			<td><label>이름</label></td>
			<td> <input type="text" class="form-control" name="name" id ="userName" placeholder="이름 입력" value="testName"/></td>
		<tr>
	
		<tr>	
			<td><label>성별</label> </td>
	
			<td>
				<label class="radio-inline"> 
					<input type="radio" name="sex"  value="m" checked/> 남
				</label> 
				<label class="radio-inline"> 
					<input type="radio" name="sex" value="f"/> 여
				</label>
			</td>
		</tr>

		<tr>
			<td><label>생년월일</label> </td>
			<td>
				<select class="form-control" name="year" id= "year" title="년도"></select> 
				<select class="form-control" name="month" id = "month" title="월" onchange="setDay();"></select> 
				<select class="form-control" name="day" id = "day" title="일">
				<option class="form-control" value=''>일</option>
				</select>
			</td>
		</tr>

		<tr>
			<td><label>연락처</label> </td>
			<td><input type="text" class="form-control" id = "phone" name="phone" placeholder="숫자만 입력"
			onblur="checkPhone();" value="01099998888"/>
			<div id = "phoneCheck"></div></td>
		</tr>

		<tr>
			<td><label>주소</label> </td>
			<td> 
				<input type="text" class="form-control"name="postcode" id="postcode" placeholder="우편번호" onclick="DaumPostcode();" value="05576"/> 
				<input type="button" class="btn btn-default" onclick="DaumPostcode();" value="우편번호 찾기" /><br>
				<input type="text" class="form-control" name="addr" id="addr" placeholder="주소" value="testAddr"/> 
				<input type="text" class="form-control" name="addrDetail" id="addrDetail" placeholder="상세주소" value="testAddrDetail"/> 
			</td>
		</tr>

</table>
		<button type="button"  id="btnJoin"class="btn btn-default">다음단계</button>
		
		
	</form>
</div>


<!-- 선호 테마 선택 -->
<div id = "theme" style="display: none;">
<h1>테마 선택 창</h1>

user name = ${loginUser.name}<br>
useridx = ${loginUser.userIdx}
<div>

<c:forEach items="${tList }" var="t">
	<label class="checkbox-inline" style ="width:30%">
		<input type="checkbox" name ="themeIdx" value="${t.themeIdx}"> ${t.themeName }
	</label>
</c:forEach>
</div>

	<button id="btnTheme" class="btn btn-default">다음단계</button>

</div>



<!-- 회원가입 완료! 선택 -->
<div id = "complete" style="display: none;">
<h1>회원가입 완료 창</h1>
<button id="btnComplete" class="btn btn-default" onclick="location='/user/login'">로그인 하기</button>
		
</div>

</div>