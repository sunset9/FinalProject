<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	scr="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 다음 주소 API -->
<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">

// 회원가입 날짜 선택하기 

$(document).ready(function() {
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
					 $('#checkMsg').html('<p style="color:blue">사용가능</p>');
				} else {
					 $('#checkMsg').html('<p style="color:red">사용불가</p>');
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
					 $('#checkMsg2').html('<p style="color:blue">사용가능</p>');
				} else {
					 $('#checkMsg2').html('<p style="color:red">사용불가</p>');
				}
			}
		}); // end ajax
	}); // end on

});

// 이메일 주소 선택 함수
function directInput(){
    if (join.email_select.value == '1') {
    	join.email2.readonly = false;
    	join.email2.value = '';
        join.email2.focus();
    }
    else {
    	join.email2.readonly = true;
    	join.email2.value = join.email_select.value;
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

<style type="text/css">
td {
	padding: 5px;
}
</style>
<div class="container">

<form class ="form-inline" id = "join" name ="join" action="/user/join" method="POST">
	<table>
		<tr>
			<td><label>이메일 주소</label></td> 
			<td><input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" /> 
			 @ <input name="email2" type="text"  class="form-control" id="email2" readonly="readonly">
				<select class="form-control" name="email_select" id="email_select" onchange="directInput(); ">
				
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
			<td><input type="text" class="form-control"	name="nick" placeholder="닉네임을 입력하세요" />
			<input type="button" name="nickCheck" id="nickCheck" value="중복확인" class="btn btn-default" />
			<div id = "checkMsg2"></div></td>
		</tr>	

		<tr>
			<td><label>비밀번호</label></td> 
			<td><input type="password" class="form-control"	name="password" placeholder="비밀번호 입력" /></td>
		</tr>

		<tr>
			<td><label>비밀번호 체크</label></td> 
			<td><input type="password" class="form-control" placeholder="비밀번호 확인 입력" /></td>
		</tr>	
	
		<tr>
			<td><label>이름</label></td>
			<td> <input type="text" class="form-control"name="name" placeholder="이름 입렵" /></td>
		<tr>
	
		<tr>	
			<td><label>성별</label> </td>
	
			<td>
				<label class="radio-inline"> 
					<input type="radio" name="sex"  value="m" /> 남
				</label> 
				<label class="radio-inline"> 
					<input type="radio" name="sex" value="f"/> 여
				</label>
			</td>
		</tr>

		<tr>
			<td><label>생년월일</label> </td>
			<td>
				<select class="form-control" name="year" id= "year" title="년도" ></select> 
				<select class="form-control" name="month" id = "month" title="월" onchange="setDay();"></select> 
				<select class="form-control" name="day" id = "day" title="일">
				<option class="form-control" value=''>일</option>
				</select>
			</td>
		</tr>

		<tr>
			<td><label>연락처</label> </td>
			<td><input type="text" class="form-control" name="phone" placeholder="숫자만 입력" /></td>
		</tr>

		<tr>
			<td><label>주소</label> </td>
			<td> 
				<input type="text" class="form-control"name="postcode" id="postcode" placeholder="우편번호" /> 
				<input type="button" class="btn btn-default" onclick="DaumPostcode()" value="우편번호 찾기" /><br>
				<input type="text" class="form-control" name="addr" id="addr"placeholder="주소" /> 
				<input type="text" class="form-control" name="addrDetail" id="addrDetail" placeholder="상세주소" /> 
			</td>
		</tr>
</table>
		<button type="submit" class="btn btn-default">다음단계</button>
		
		
	</form>

</div>