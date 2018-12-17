<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
#userProfile{
	width: 150px;
	
}
#userinfo{
	background-color: #CCC;
}

.artistSec {
	display: inline-block;
	width: 200px;
}

#choicePfm{
	display: inline-block;
}

.posterImg{
	width: 150px;
}

#recommendPfm{
	float : right;
	width: 250px;
}

.recomImg {
	width: 250px;
}

#recomPfm{
	border: 1px solid #CCC;
}

#myprefer {
	border: 1px solid #CCC;
	width: 250px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	// 오늘 날짜 구하기
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	today = yyyy +'/'+mm+'/'+dd;
	console.log(today);
	
	

	
	
});  // ready end


// 찜하기 버튼 눌렀을 때 반응할 메소드
function pfmChoice(pfmIdx){
	
	// form 태그 만들어서 공연IDX 보내기 
	var form = $("<form>");
	form.attr('action' , "/mypage/pfmchoice");
	form.attr('method', "post");
	
	form.append('<input type="hidden" name ="pfmIdx" value="pfmIdx"/>');
	
	form.submit();
}



</script>

<h1>내가 찜한 공연</h1>
<button onclick="location ='/mypage/prefer'">선호 수정하기</button>
<hr>
<div id = "userinfo">
	<div class = "form-inline">
	
		<img id = "userProfile" src="${loginUser.profile }"  class="img-circle"/>
		<span id="userNick">${loginUser.nick }</span> <small>님 안녕하세요</small>
		<button id="userInfoChange" class="btn btn-default">정보 변경</button>
		<span>입금 대기</span><span>예매 완료</span><span>취소 현황</span>
	</div>
	
	
</div>

<!-- 선택한 아티스트 이름과 사진 보여주기 -->
<div id = "selectedArt">
	<c:forEach items="${aList }" var ="a">
	<c:if test ="${! empty  a}">
	<div  data-paidx="${a.artistIdx }" class = "artistSec">
		<img id = "artistImg" src="${a.imgUri }"  class="img-circle"/>
		<span>${a.name } </span>
	</div>
	</c:if>
	</c:forEach>
</div>

<!-- 유저가 찜해 놓은 공연 목록 보여주기 -->
<div id ="choicePfm">
	<c:forEach items="${pfmList }" var ="pfm">
	<c:if test ="${! empty pfm}">
	<div  data-pfmidx="${pfm.pfmIdx }" class = "pfmSec">
		
		<span class="frame">
		<img class = "posterImg" src="/resources/image/${pfm.posterImg }" />
		</span>
		<span> 판매기간 : ~ ${pfm.ticketEnd }</span><br>
		<span>${pfm.pfmName } </span>
	</div>
	</c:if>
	</c:forEach>
</div>

<!-- 선택한 테마와 유저에 관한 추천공연  -->
<div id ="recommendPfm">
<h5>맞춤 공연</h5>
<div id="recomPfm" class="carousel slide" data-ride="carousel">


  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
   <div class="item active">
   </div>
    
     <c:forEach items="${recomList }" var ="recom"  varStatus="index">
     
     <div class="item <c:if test="${index.first }"> active </c:if>">
	<c:if test ="${! empty recom}">
	<div  data-pfmidx="${recom.pfmIdx }" class = "pfmSec">
		
		<span class="frame">
		<img class = "recomImg" src="/resources/image/${recom.posterName }" />
		</span>
	</div>
	<button class="btn btn-default" onclick="pfmChoice(${recom.pfmIdx });">찜찜찜하기</button>
	</c:if>
	</div>
	</c:forEach>
    </div>


  <!-- Controls -->
  <a class="left carousel-control" href="#recomPfm" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#recomPfm" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>





<!-- 선택한 테마와 아티스트 텍스트로 보여주기 -->
<div id="myprefer">
<h1>나의 취향</h1> <button id="changePrefer" onclick="location.href='/mypage/prefer'">취향 변경하기 </button>
<div>
	<h5>&lt;아티스트&gt;</h5>
	<c:forEach items="${aList }" var ="a">
	<c:if test ="${! empty  a}">
		<span style="color: green;">${a.name } </span>
	</c:if>
	</c:forEach>
	
	<h5>&lt;테마&gt;</h5>
	<c:forEach items="${ptList }" var ="pt">
	<c:if test ="${! empty  pt}">
		<span >${pt.themeName } </span>
	</c:if>
	</c:forEach>
</div>

</div>
</div>
