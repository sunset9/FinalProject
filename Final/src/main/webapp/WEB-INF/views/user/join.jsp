<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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


	
<!-- 다음 주소 API -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	


<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->


<style type="text/css">

td {
	padding: 5px;
}

.joinActive{
	color: green;
}

.container{
	width: 1160px;
	margin: 30px auto;
	padding-top: 30px;
}
#logo{
	text-align: center;
}

.info{
	padding-right: 100px;
	font-weight: bold;
}

tr{
	border-bottom: 1px solid #CCC;
	margin: 5px;
}
#joinInfo{
/* 	text-align: center; */
/* 	display: inline-block; */
	margin: 0 auto;
}

.btnDiv{
	text-align: center;
	margin: 0 auto;
}

.btn-block{
	margin: 30px auto;
	height: 40px;
}

.checkbox-inline{
/* 체크박스 위치 조정 */

	margin: 10px;
}

#themeSec{
	border: 1px solid #CCC;
	background: #DDD;
}
.title{
	width: 300px;
	margin: 0 auto;
}
table{
	width: 100%;
}
</style>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------- -->
	
	
	
	
<script type="text/javascript">

$(document).ready(function() {

	// 체크박스 선택시 다음단계 버튼 활성화
	
	// 전체 체크 하는 체스 박스 선택시 
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
	
	// 필수 동의 3개 다 했을 때 버튼 활성화 
	 $("#agreement1").change(function(){
		  if($("#agreement1").is(":checked")){
			  if($("#agreement2").is(":checked")){
				  if($("#agreement3").is(":checked")){
					  $("#btnAgree").attr('disabled',false);
				  }
			  }
		  }else {
	        	$("#btnAgree").attr('disabled',true);

		  }
	 });
	 $("#agreement2").change(function(){
		  if($("#agreement2").is(":checked")){
			  if($("#agreement1").is(":checked")){
				  if($("#agreement3").is(":checked")){
					  $("#btnAgree").attr('disabled',false);
				  }
			  }
		  }else {
	        	$("#btnAgree").attr('disabled',true);

		  }
	 });
	 $("#agreement3").change(function(){
		  if($("#agreement3").is(":checked")){
			  if($("#agreement1").is(":checked")){
				  if($("#agreement2").is(":checked")){
					  $("#btnAgree").attr('disabled',false);
				  }
			  }
		  }else {
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


<head>
<body>

	<div class="container">
	
	<div class ="title">
	<img src="/resources/image/join.PNG" class ="title" >
</div>

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
<h1 class = "pageInfo">약관 동의 페이지</h1>

<label><input type="checkbox"  id="allAgreement" > 전체 동의 </label><br>

<hr>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
      <input type="checkbox"  id="agreement1" > 
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          이용약관(필수) ▽
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
       
	제1조(목적) 이 약관은 5조 회사(전자상거래 사업자)가 운영하는 5조 사이버 Banana(이하 “Banana”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 Banana과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.<br>
 	 ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br>
	제2조(정의)<br>
  ① “Banana”이란 5조 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버Banana을 운영하는 사업자의 의미로도 사용합니다.<br>
  ② “이용자”란 “Banana”에 접속하여 이 약관에 따라 “Banana”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
  ③ ‘회원’이라 함은 “Banana”에 회원등록을 한 자로서, 계속적으로 “Banana”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>
  ④ ‘비회원’이라 함은 회원에 가입하지 않고 “Banana”이 제공하는 서비스를 이용하는 자를 말합니다.<br>
	제3조 (약관 등의 명시와 설명 및 개정)<br>
  ① “Banana”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버Banana의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
  ② “Banana은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>
  ③ “Banana”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
  ④ “Banana”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 Banana의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "Banana“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br>
  ⑤ “Banana”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “Banana”에 송신하여 “Banana”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
  ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.<br>


      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
      <input type="checkbox"  id="agreement2" >
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          유료서비스약관(필수) ▽
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
       
       제1조 (목적)<br>
		이 약관은 주식회사 카카오(이하 ‘회사’라 합니다)가 제공하는 유무선 인터넷 음악서비스(웹, 모바일 웹•앱 서비스를 포함합니다.)인 Banana(바나나) 및 바나나 관련 제반 서비스의 유료서비스를 이용함에 있어 회사와 회원간 제반 법률관계 및 기타 관련 사항을 규정함을 목적으로 합니다.<br>
		제2조 (용어의 정의)<br>
		① 이 약관에서 사용되는 용어의 정의는 다음과 같습니다.<br>
		1. ‘회원가입’이라 함은 바나나 서비스 또는 유료서비스를 이용하고자 하는 자(‘고객’이라고도 합니다)가 바나나 이용약관에 동의하고 회사와 그 이용계약을 체결하는 것을 의미합니다. 회원가입을 하는 경우 고객은 바나나서비스 회원이 됩니다.<br>
		2. ‘회원탈퇴’라 함은 회원이 바나나 이용약관 또는 바나나 유료서비스약관의 체결로 발생한 제반 권리와 의무 등의 법률관계를 자의로 영구히 종료하거나, 포기하는 것을 의미합니다.<br>
		3. ‘유료서비스’라 함은 회원이 회사에 일정 금액을 지불해야만 이용할 수 있는 회사의 서비스 또는 이용권(상품)을 의미하거나, 회사 또는 제3자와의 거래 내지 약정 조건을 수락하는 대가로 이용하게 되는 회사의 서비스 또는 이용권(상품)을 의미합니다. 유료서비스의 세부내용은 각각의 서비스 또는 이용권(상품) 구매 페이지 및 해당 서비스 또는 이용권(상품)의 결제 페이지에 상세히 설명되어 있습니다. 단순히 바나나캐쉬를 충전하거나 회사 또는 제3자로부터 적립 받는 행위, 사이트에 연결(링크)된 유료 콘텐츠 제공업체 및 회사와 계약을 통하여 입점한 제휴서비스는 회사의 유료서비스 이용행위로 보지 않으며, 본 약관을 적용하지 아니합니다.<br>
		4. ‘유료회원’이라 함은 별도의 금액을 지불하여 유료서비스를 구매한 회원 및 회사 또는 제3자가 정하는 이벤트, 마케팅에 참여하는 등의 방법으로 회사의 유료서비스를 이용하는 회원을 말합니다.<br>
		5. ‘무료회원’이라 함은 유료회원이 아닌 회원으로 회원가입 이후에 기본적으로 모든 회원에게 부여되는 자격을 가진 회원을 의미합니다.<br>
		6. ‘바나나캐쉬’라 함은 회원이 직접 이 약관 제5조(결제수단 등)의 각종 수단에 의한 결제를 통하여 충전, 생성하거나, 회사 또는 제3자가 시행하는 이벤트, 프로모션, 기타 거래에 동의, 약정, 조건 이행 등의 대가, 환불수단으로 지급 받는 사이버머니로서, 바나나의 유료서비스를 이용하기 위해 현금처럼 지불할 수 있는 유무선인터넷상의 지급 수단을 의미합니다.<br>
		7. ‘충전’이라 함은 회원이 서비스의 구매 또는 이용을 위하여 바나나캐쉬를 회사가 제공하는 각종 지불수단을 통하여 현금으로 지급 후 바나나캐쉬를 획득하는 행위를 의미하며, 현금 1원당 바나나캐쉬 1원의 비율로 충전됩니다.<br>
		8. ‘결제’라 함은 회원이 특정 유료서비스를 이용하기 위하여 각종 지불수단을 통하여 회사가 정한 일정 금액을 회사에 지불하는 것을 의미합니다.<br>
		9. ‘구매’라 함은 회사가 유료서비스에 대한 이용 승낙 및 유료서비스 제공이 가능할 수 있도록 회원이 이용하고자 하는 유료서비스를 선택하여 해당 유료서비스의 가액과 동일한 바나나캐쉬의 차감을 청구하거나 지불수단을 통한 결제로써 그 대가를 지급하는 행위를 의미합니다.<br>
		② 이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계 법령 및 서비스별 안내에서 정하는 바에 의합니다.<br>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
      <input type="checkbox"  id="agreement3" >
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          개인정보 수집 및 이용(필수) ▽
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
       1. 회사는 회원 가입 및 서비스 이용과정에서 필요 최소한의 범위로 개인정보를 수집하며, 그 수집 항목 및 목적을 사전에 고지합니다. 고객이 본 개인정보처리방침을 읽고 필수항목을 입력한 후 “가입완료” 버튼을 누르거나, “확인” 내지 “동의합니다”에 체크하는 경우 개인정보의 처리에 동의한 것으로 봅니다.<br>
		2.멜론서비스의 본질적인 기능 수행 및 업무 처리를 위해 반드시 필요한 정보 (필수정보)와 회원의 필요에 따른 서비스를 제공하기 위해 추가적으로 요구하는 정보(선택정보)로 구분하여 회원의 개인정보를 수집하고 있습니다. 회원 가입시 필수정보의 제공에 동의하지 않을 경우, 멜론의 상품ㆍ서비스 제공을 받기 어렵다는 점을 설명해드리고 있으며, 선택정보 제공에 동의하지 않아도 서비스 이용에는 제한이 없음을 안내 드립니다.<br>
		3. 인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 등 회원의 기본적 인권을 현저하게 침해할 우려가 있는 개인정보를 수집하지 않습니다. 다만, 회원의 유형 및 제공하는 서비스의 특성에 따라 불가피한 경우, 해당 회원이 이미 외부 서비스 내지 연계 서비스를 통하여 불특정 다수에게 직접 공개 또는 멜론 서비스에서의 공개에 사전 동의한 정보인 경우에는 처리할 수 있습니다.<br>
		4. 회원의 개인정보는 홈페이지(웹 및 모바일 사이트 및 스마트폰 앱을 포함합니다.)•서면양식•휴대전화•유선전화•팩스를 통한 본인•대리인 확인, 전화•상담게시판•이메일을 통한 서비스 문의 및 이벤트•경품 행사 응모, 배송 요청을 통한 방법, 협력회사•제휴사로부터의 제공, 본인확인기관에 대한 처리위탁 및 이로부터의 제공, 유•무선인터넷 서비스 사용시 생성정보 수집툴을 통한 방법을 통하여 수집•이용됩니다.<br>
		5. 회원의 각 개인정보는 아래와 같은 목적에 따라 수집•이용•제공 등 처리되며, 아래 각 정보는 회원 가입 당시에 제공한 정보 뿐만 아니라 변경된 정보(회원이 직접 정보를 수정하는 경우 또는 회원이 수정을 요청하는 경우)를 포함합니다.

      </div>
    </div>
  </div>
    <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
      <input type="checkbox"  id="agreement4" >
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          이벤트, 서비스안내 수신(선택) ▽
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        개인정보 수집 이용 목적	: 이벤트, 신제품 정보,쿠폰 및 광고성 뉴스레터 발송 등 일체의 마케팅 활동<br>
		수집하려는 개인정보 항목 :	성명, 주소, 휴대전화번호, 이메일 주소	<br>
		개인정보의 보유, 이용기간 : 수신동의 철회 접수시 또는 회원탈퇴시 까지<br>
      </div>
    </div>
  </div>
</div>


<div>


</div>
<p>**필수사항을 동의하셔야 다음단계로 넘어 갈 수 있습니다.</p>
<div class ="btnDiv"><button style="width: 500px;" id="btnAgree" class="btn btn-warning btn-block" disabled="disabled" >다음단계</button></div>
<br><br><br>
</div>	
	
	
	
	
	
	
<!-- 회원 가입 div -->
<div id = "joinInfo" style="display: none;">
<h1 class = "pageInfo">회원 정보 입력</h1>
<form class ="form-inline" id = "join" name ="join" action="/user/join" method="POST">
	<table>
		<tr>
			<td class="info"><label >이메일 주소</label></td> 
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
			<td class="info"><label>닉네임</label></td>
			<td><input type="text" class="form-control"	name="nick" id = "nick" placeholder="닉네임을 입력하세요" onchange="changeNick();"value="testNick<%=new Date().getTime()%>"/>
			<input type="button" name="nickCheck" id="nickCheck" value="중복확인" class="btn btn-default" />
			<div id = "checkMsg2"></div></td>
		</tr>	

		<tr>
			<td class="info"><label>비밀번호</label></td>
			<td><input type="password" class="form-control"	name="password" id="password" placeholder="비밀번호 입력" value="123123abc"/>
			<div id="passRule"></div></td>
		</tr>

		<tr>
			<td class="info"><label>비밀번호 체크</label></td> 
			<td><input type="password" class="form-control"name="passwordc" id="passwordc"onkeyup="checkPw()" placeholder="비밀번호 확인 입력" value="123123abc"/>
			<div id="checkPW3"></div></td>
		</tr>	
	
		<tr>
			<td class="info"><label>이름</label></td>
			<td> <input type="text" class="form-control" name="name" id ="userName" placeholder="이름 입력" value="testName"/></td>
		<tr>
	
		<tr>	
			<td class="info"><label>성별</label> </td>
	
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
			<td class="info"><label>생년월일</label> </td>
			<td>
				<select class="form-control" name="year" id= "year" title="년도"></select> 
				<select class="form-control" name="month" id = "month" title="월" onchange="setDay();"></select> 
				<select class="form-control" name="day" id = "day" title="일">
				<option class="form-control" value=''>일</option>
				</select>
			</td>
		</tr>

		<tr>
			<td class="info"><label>연락처</label> </td>
			<td><input type="text" class="form-control" id = "phone" name="phone" placeholder="숫자만 입력"
			onblur="checkPhone();" value="01099998888"/>
			<div id = "phoneCheck"></div></td>
		</tr>

		<tr>
			<td class="info"><label>주소</label> </td>
			<td> 
				<input type="text" class="form-control"name="postcode" id="postcode" placeholder="우편번호" onclick="DaumPostcode();" value="05576"/> 
				<input type="button" class="btn btn-default" onclick="DaumPostcode();" value="우편번호 찾기" /><br>
				<input type="text" class="form-control" name="addr" id="addr" placeholder="주소" value="testAddr"/> 
				<input type="text" class="form-control" name="addrDetail" id="addrDetail" placeholder="상세주소" value="testAddrDetail"/> 
			</td>
		</tr>
	<hr>
</table>
		<button type="button"  id="btnJoin" class="btn btn-warning btn-block" style="width: 500px;">다음단계</button>
		
		
	</form>
</div>


<!-- 선호 테마 선택 -->
<div id = "theme" style="display: none;">
<h1 class="pageInfo">테마 선택</h1>

<div id="themeSec">

<c:forEach items="${tList }" var="t">
	<label class="checkbox-inline" style ="width:30%">
		<input type="checkbox" name ="themeIdx"  value="${t.themeIdx}"> ${t.themeName }
	</label>
</c:forEach>
</div>

	<button id="btnTheme" class="btn btn-warning btn-block" style="width: 500px;">다음단계</button>

</div>



<!-- 회원가입 완료! 선택 -->
<div id = "complete" style="display: none;">
<h1 class = "pageInfo">회원가입 완료</h1>

<div style="text-align: center">
	<h1>회원 가입에 성공했습니다!</h1><br><br>
	<div><img src="/resources/image/welcome.jpg"/></div>
	<button id="btnComplete" class="btn btn-warning btn-block" style="width: 500px;" onclick="location.href='/user/login'">로그인 하기</button>
	<button id="btnComplete" class="btn btn-default btn-block"  style="width: 500px;" onclick="location.href='/ticket/ticketmain'">메인으로 </button>
</div>	
</div>

</div>




<!-- footer -->
<jsp:include page="../../layout/footer.jsp"/>
