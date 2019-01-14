<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<style type="text/css">

.artistName{
/* 	color: green; */
	margin-right:5px;
/* 	text-decoration: underline; */
}
.artistSec {
/* 	display: inline-block; */
	width: 200px;
	
}

#choicePfm{
	display: inline;
}

.posterImg{
	margin: 10px;
	width: 150px;
	height: 220px;
	cursor: pointer;
	margin-left: 30px;
}
.frame{
	float: left;
    margin-right: 20px;
}
.frametextbox {
	list-style: disc;
    padding: 10px;
}
.frametext {
	display: list-item;
	font-size: 1.4em;
	font-weight: bold;
	color: #888;
}
.frame_right {
    top: 93px;
    position: relative;
    display: inline-block;
    line-height: 2;
}

#recommend-wrapper{
	float : right;
	width: 250px;
    margin-top: 14px;
}

#recommendPfm{
	background: #f8f8f8;
	margin-top: 10px;
}

.recomImg {
	width: 250px;
	height: 365px;
}

#recomPfm{
	border: 1px solid #ebebeb;
}

#noRecPfm {
	width: 250px;
	height: 365px;
    display: table;
    text-align: center;
    padding: 18px;
	border: 1px solid #ebebeb;
}
#noRecPfm span {
	display:table-cell;
	vertical-align:middle;
}

.prefer-wrapper{
    position: relative;
    top: -26px;
    z-index: 1;
    border: 1px solid #cdcdcd;
    padding: 24px;
    padding-top: 33px;
    padding-bottom: 40px;
}
#myprefer {
	float : right;
	border: 1px solid #ebebeb;
	width: 250px;
	margin-top: 20px;
	padding-top: 20px;
	text-align: center;
	background: #f8f8f8;
    padding: 20px;
}

.preferTitle{
	margin-left:10px;
	width:700px;
	font-size: 31.5px;
	font-weight: bold;	
}
.artist .preferTitle{
    width: 255px;
    left: 33px;
    position: relative;
    background: #fff;
    z-index: 5;
}
/* 탭 메뉴 설	정 */
.tabSec{
	border: 1px solid #e1e1e1; 
	width: 33%;
	display: inline-block;	
 	height: 45px; 
	text-align: center;
	font-size: 1.5em;
	font-weight: bold;
    line-height: 2;
	vertical-align:middle;
	float: left;
    border-bottom: 2px solid #f2b133;
    color: #5f5f5f;
    background: #f6f6f6;
}
/* 화면 사용 범위 */

.temp{
	width: 95%;
	margin: 0 auto;
	margin-bottom: 30px;
	text-align: center;
}

#tabDiv{
	margin-top: 20px; 
	width: 100%;
    height: 45px;
}

/* 활성화된 탭 */

#choice{
	color: #f2b133;
    /* border-bottom: none; */
    /* border-left: 3px solid #fcd303; */
    border: 2px solid #f2b133;
    border-bottom: none;
    background: #fff;
}	

/* 선택한 아티스트 목록 리스트	 */
#selectedArt{
    clear: left;
    display: inline-block;
    width: 818px;
    border: 1px solid #cdcdcd;
    position: relative;
    top: -26px;
    z-index: 1;
    padding: 5px 35px 5px 5px;
}
.btnDiv{
	text-align: center;
	margin: 15px auto;
    margin-top: 5px;
}

.cateinfo{
	font-weight: bold;
    text-align: left;
    margin-top: 20px;
}

/* 공연 제목 */
.pfmName{
	font-size:1.7em;	
/* 	font-weight: bold; */
	cursor: pointer;
}
/* 공연 티케팅 날짜 */
.pfmDate{
	font-size: 1.2em;
	color: #777;
	cursor: pointer;
    font-weight: 100;
}
.pfmSec{
	margin: 5px;
}

#noPfm {
	padding-left: 30px;
	font-size: 18px;
}

/* 왼쪽 정렬할 아이들  */
.artist{
	display: inline;
	float : left;
	margin-top: 50px;
}
#mypreferSpan{
	display: inline;
	font-size: 1.5em;
	font-weight: bold;	
}


.clearFloat{
	clear:both;
}
.choiceBtn{
	width: 140px;
    height: 40px;
    border-radius: 6px;
	border: 1px solid #a5a5a5;
    background: #FFF;
    color:#888;
    font-weight: bold;
    margin-bottom: 5px;
}

.choiceBtn:hover {
	border: 1px solid #acacac; 
	background: #f9f9f9;
}

.carousel-control{
	background: none !important;
}

.pfmSec:before {
	content: " ";
	float: left;
	width: 2px;
	height: 290px;
	background-color: #d8d8d8;
	display: inline-block;
    position: relative;
    top: 22px;
    right: 3px;
    z-index: -1;
}

</style>

<script type="text/javascript">
function artList(curPage) {
	// 페이징 처리 선호처리한 아티스트
	$.ajax({
		url:"/mypage/preferartist"
		,data: {"curPage" : curPage}
		, type:"POST"
		, dataType:"HTML"
		, success:function(data){
			console.log("ajax 성공");
			$('#selectedArt').html(data)
			
		} // end success
	
	}); // end ajax 
}

$(document).ready(function() {
	
	// 선호 선택한 아티스트 리스트 조회하는 메소드 
	artList(0);
	
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
	
	console.log($('.frametext'));
// 	$('.date').append("<span>"+today);
	
	// 선택된 아티스트 없는 경우
	console.log($('#pfmUl li'));
	if( $('#pfmUl li').length == 0 ) {
		$('#pfmUl').after($('<li style="list-style-type:none"><span id="noPfm"> 찜한 공연이 없습니다. </span>'));		
// 		$('.alist').after($('<li class="alist"><p> 선호 아티스트가 없습니다. </p></li>'));		
	}
	
	// 맞춤 공연이 없는 경우
	if( $('.recomImg').length == 0 ) {
		$('#recomPfm').hide();
		$('#noRecPfm').show();
	}
});  // ready end


// 찜하기 버튼 눌렀을 때 반응할 메소드
function pfmChoice(pfmIdx){
	console.log("함수 실행 되나용");
	// form 태그 만들어서 공연IDX 보내기 
	var form = $("<form>");
	form.attr('action' , "/mypage/pfmchoice");
	form.attr('method', "post");
	form.appendTo('body');
	
	form.append('<input type="hidden" name ="pfmIdx" value="'+pfmIdx+'"/>');
	
	form.submit();
}



</script>

<div class ="main_wrapper">


<div>
<!-- 유저 정보 담고 있는 jsp -->
<jsp:include page="userinfo.jsp" />
</div>

<div id="tabDiv"class ="temp">
	<a href='/mypage/myticket'><div class = "tabSec" id ="ticket">예매현황</div></a>
	<a href='/mypage/mychoice'><div class = "tabSec" id ="choice">찜</div></a>
	<a href='/mypage/viewinquiry'><div class = "tabSec" id ="inquiry">내 문의사항</div></a>
</div>



<!-- 선택한 아티스트 이름과 사진 보여주기 -->
<div class="artist">
<div class ="preferTitle"><span class ="preferTitle">선호 아티스트</span></div>
<div id = "selectedArt">
	<ul>
<%-- 		<c:forEach items="${aList }" var ="a"> --%>
<%-- 		<c:if test ="${! empty  a}"> --%>
<%-- 		<li data-paidx="${a.artistIdx }" class = "artistSec"> --%>
<%-- 			<img class = "artistImg" src="${a.imgUri }" /> --%>
<%-- 			<span>${a.name } </span> --%>
<!-- 		</li> -->
<%-- 		</c:if> --%>
<%-- 		</c:forEach> --%>
	</ul>
</div>


<!-- 유저가 찜해 놓은 공연 목록 보여주기 -->
<div id ="choicePfm">
<div class ="preferTitle"><span class ="preferTitle">찜한 공연</span></div>
<div class="prefer-wrapper">
<ul id = "pfmUl">
	<c:forEach items="${pfmList }" var ="pfm">
	<c:if test ="${! empty pfm}">
	<li  data-pfmidx="${pfm.pfmIdx }" class = "pfmSec pfmdate">
		<div class = "innerBox">
			<div class="frame">
			<div class="frametextbox"><span class="frametext">${pfm.saleState }</span></div>
			<img class = "posterImg" src="/resources/image/${pfm.posterImg }"
				onclick="location.href='/ticket/pfmdetail?pfmIdx=${pfm.pfmIdx }'" />
			</div>
			<div class="frame_right">
			<span class="pfmDate" onclick="location.href='/ticket/pfmdetail?pfmIdx=${pfm.pfmIdx }'"> 티켓판매기간 : ~ 
			<fmt:formatDate  value="${pfm.ticketEnd }" pattern="yyyy-MM-dd"/>(<fmt:formatDate value="${pfm.ticketEnd }" pattern="E"/>)</span><br>
			<span class="pfmName" onclick="location.href='/ticket/pfmdetail?pfmIdx=${pfm.pfmIdx }'">${pfm.pfmName }</span>
			</div>
		</div>
	<div class="clearfix"></div>
	</li>
	</c:if>
	</c:forEach>
</ul>
</div>
</div>
</div>

<!-- 선택한 테마와 유저에 관한 추천공연  -->
<div id ="recommend-wrapper">
<div class ="preferTitle"><span>맞춤 공연</span></div>
<div id ="recommendPfm">

<!-- 추천 공연 없는 경우 활성화 -->
<div id="noRecPfm" style="display:none">
	<span>취향에 맞는 공연이 등록되면 <br>알려드릴게요</span>
</div>

<div id="recomPfm" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
  
<!--   초기 활성화 하기 위한 div  -->
<!--    <div class="item active"> -->
<!--    </div> -->
    
     <c:forEach items="${recomList }" var ="recom"  varStatus="index">
     
     <div class="item <c:if test="${index.first }"> active </c:if>">
		<c:if test ="${! empty recom}">
		<div  data-pfmidx="${recom.pfmIdx }" >
			<span>
			<img class = "recomImg" src="/resources/image/${recom.posterName }" />
			</span>
		</div>
		</c:if>
		
		<div class ="btnDiv">
		<hr>
		<button onclick="pfmChoice(${recom.pfmIdx });" class="choiceBtn" >내 공연에 담기</button></div>
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
</div>

<!-- 선택한 테마와 아티스트 텍스트로 보여주기 -->
<div id="myprefer">
<div id ="mypreferSpan"><span>나의 취향</span></div>
	<div class ="btnDiv">
	<button id="changePrefer" onclick="location.href='/mypage/prefer'" class="choiceBtn " >취향 변경하기</button></div>

<div>
	<h5 class ="cateinfo">선호 아티스트</h5>
	<c:forEach items="${aNameList }" var ="a" varStatus="status">
	<c:if test ="${! empty  a}">
		<c:if test="${status.count%4 == 0 }"><br></c:if>
		<span class="artistName">${a.name } </span>
	</c:if>
	</c:forEach>
	
	<h5 class ="cateinfo">선호 테마</h5>
	<c:forEach items="${ptList }" var ="pt" varStatus="status">
	<c:if test ="${! empty  pt}">
		<c:if test="${status.count%4 == 0 }"><br></c:if>
		<span style="margin: 2px;">${pt.themeName } </span>
	</c:if>
	</c:forEach>
</div>

</div>
</div>

<div class="clearFloat">
<br>
<hr>
</div>






</div>