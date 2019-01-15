<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<style type="text/css">


/* 탭 메뉴 설정 */
.tabSec{
 	border-top: 1px solid #e1e1e1; 
 	border-right: 1px solid #e1e1e1; 
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

#cancel{
	display: none;
}

/* 화면 사용 범위 */
.temp{
	width: 95%;
	margin: 0 auto;
	margin-bottom: 30px;
/* 	border-bottom: 1px solid #e1e1e1; */
	text-align: center;
}

#tabDiv{
	margin-top: 20px; 
	width: 100%;
    height: 45px;
}

/* 활성화된 탭 */
#ticket{
    color: #f2b133;
    /* border-bottom: none; */
    /* border-left: 3px solid #fcd303; */
    border: 2px solid #f2b133;
    border-bottom: none;
    background: #fff;
}

/* 예매 확인 취소 버튼  */
#completeBtn, #cancelBtn{
    width: 140px;
    height: 40px;
    border-radius: 5px;
    border: 1px solid #cdcdcd;
    background: #FFF;
	font-size: 15px;
    color: #AAA;
}

#completeBtn.clicked, #cancelBtn.clicked{
    border: 2px solid #F2B134;
    background: #F2B134;
    color: #fff;
    font-weight: bold;
}

.btn{
	display: inline-block;
	margin: 20px auto;
}

.btn:active {
	-webkit-box-shadow: none;
	box-shadow: none;
}

th{
	text-align: center;
    border-top: 1px solid #e1e1e1 !important;
    border-bottom: 1px solid #e1e1e1 !important;
    line-height: 1.8;
    
}
td{
	border-top: 1px solid #e1e1e1 !important;
}
dt{
    font-weight: bold;
    float: left;
    width: 75px;
    text-align: left;
    color: #444;
}
dd{
    text-align: left;	
}
.table {
	margin-bottom: 0;
	border-bottom: 1px solid #e1e1e1;
}
.poster{
	display: inline-block;
	float: left;
	margin-left: 37px;
}
td{
	vertical-align:middle !important;
}
.bookTr td:nth-child(3) div{
	height: 118px;
	padding-top: 31px;
    padding-left: 10px;
}
.bookTr td:nth-child(4) button{
    display: block;
    margin: 0 auto;
    margin-top: 10px;
    background: #fff;
    border: 1px solid #ddd;
    width: 80px;
    height: 28px;
}
.bookTr td:nth-child(4) button:hover{
	border: 1px solid #888;
}
.pfminfo{
	display: inline-block;
	margin-top: 25px;
	position: relative;
	left: -18px;
    text-align: left;
}
.pfminfo span:first-child {
	display: block;
	width: 220px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	
}
.pfminfo span:not(:first-child) {
	color: #666;
    font-size: 13px;
}
.bookTr{
	height: 153px;
}
.posterImg{
	width: 88px;
    height: 121px;
}
.cancelBookGroup{

	color: #F2B134;
}
.cancelBookGroup span{

    text-decoration-line: line-through;
}
</style>

<script type="text/javascript">

$(document).ready(function(){
	$('#completeBtn').click(function() {
		$('#complete').show();
		$('#cancel').hide();
		$('#cancelBtn').removeClass('clicked');
		$('#completeBtn').addClass('clicked');
		
	}); // click end
	
	$('#cancelBtn').click(function() {
		$('#cancel').show();
		$('#complete').hide();
		$('#completeBtn').removeClass('clicked');
		$('#cancelBtn').addClass('clicked');
		
	}); // click end
	
	// 예매 관련 정보 없는 경우
	if($('#cancel tbody').find('tr').length == 0 ){
		$('#cancel tbody').append('<tr><td colspan=4>취소 내역이 없습니다.</td></tr>');
	}
	if($('#complete tbody').find('tr').length == 0 ){
		$('#complete tbody').append('<tr><td colspan=4>예매 내역이 없습니다.</td></tr>');
	}
});
</script>


<div class = "main_wrapper">
<div>
<!-- 유저 정보 담고 있는 jsp -->
<jsp:include page="userinfo.jsp" />
</div>

<div id="tabDiv"class ="temp">
	<a href='/mypage/myticket'><div class = "tabSec" id ="ticket">예매현황</div></a>
	<a href='/mypage/mychoice'><div class = "tabSec" id ="choice">찜</div></a>
	<a href='/mypage/viewinquiry'><div class = "tabSec" id ="inquiry">내 문의사항</div></a>
</div>

<div class ="contain temp">

<div class = "btn">
<button id="completeBtn" class="clicked">예매확인</button>
<button id="cancelBtn">예매취소</button>
</div>

<div id="complete">
<table class="table">
<thead>
<tr>
	<th style="width: 15%">예매일</th>
	<th style="width: 35%">공연정보</th>
	<th style="width: 35%">예매정보</th>
	<th style="width: 20%">상태</th>
</tr>
</thead>

<!-- 예매완료된 예약 -->
<tbody>
<c:forEach items="${sob }" var="sob"  >
	<c:if test='${sob.state eq "예매완료(결제완료)"||sob.state eq "예매완료(부분취소)"}'>
	<tr class="bookTr">
		<td><fmt:formatDate value="${sob.createDate }" pattern="yyyy-MM-dd"/></td>

		<td>
		<div>
		
		<div class="poster">
			<a href='/ticket/pfmdetail?pfmIdx=${sob.pfmIdx }'><img class = "posterImg" src="/resources/image/${sob.storedName }"></a> <!-- 포스터 -->
		</div>
		<div class ="pfminfo">
			<a href='/ticket/pfmdetail?pfmIdx=${sob.pfmIdx }'>
			<span>${sob.name }</span> <!-- 공연제목 --><br>
			<span><fmt:formatDate value="${sob.pfmStart }" pattern="yyyy-MM-dd"/> ~ 
			<fmt:formatDate value="${sob.pfmEnd }" pattern="yyyy-MM-dd"/></span><br>
			<span>${sob.hallName }</span>
			</a>
		</div>
		</div>
		</td>

		<td><div>
		<dl>
			<dt>예약번호</dt>
			<dd>${sob.bookGroup }</dd>
			<dt>관람일</dt>
			<dd>
			<fmt:formatDate value="${sob.pfmDate}" pattern="yyyy-MM-dd"/>
			(<fmt:formatDate value="${sob.pfmDate}" pattern="E"/>)
			 &nbsp; ${sob.pfmTime}  </dd>
			<dt>매수</dt>
			<dd>${sob.ea }매</dd>
		</dl>
		</div></td>

		<td>${sob.state }
			<button onclick="location.href='/mypage/detailicket?bookGroup=${sob.bookGroup}'">예매 상세</button>
		</td>
	</tr>
	</c:if>
</c:forEach>
</tbody>
</table>
</div>

<div id ="cancel">
<table class="table">
<thead>
<tr>
	<th style="width: 15%">예매일</th>
	<th style="width: 35%">공연정보</th>
	<th style="width: 35%">예매정보</th>
	<th style="width: 20%">상태</th>
</tr>
</thead>

<!-- 취소된 예매 -->
<tbody>
<c:forEach items="${csob }" var="sob"  >
	<c:if test='${sob.state eq "취소중"||sob.state eq "취소완료"}'>
	<tr class="bookTr">
		<td><fmt:formatDate value="${sob.createDate }" pattern="yyyy-MM-dd"/></td>

		<td>
		<div>
		<div class="poster">
		<a href='/ticket/pfmdetail?pfmIdx=${sob.pfmIdx }'><img class = "posterImg" src="/resources/image/${sob.storedName }"></a> <!-- 포스터 -->
		</div>
			<div class ="pfminfo">
			<span>${sob.name }</span><br> <!-- 공연제목 -->
			<span><fmt:formatDate value="${sob.pfmStart }" pattern="yyyy-MM-dd"/> ~ 
			<fmt:formatDate value="${sob.pfmEnd }" pattern="yyyy-MM-dd"/></span><br>
			<span>${sob.hallName }</span><br>
			</div>
		</div></td>

		<td><div>
		<dl>
			<dt>예약번호</dt>
			<dd class="cancelBookGroup">[취소]<span>${sob.bookGroup }</span></dd>
			<dt>관람일</dt>
			<dd>
			<fmt:formatDate value="${sob.pfmDate}" pattern="yyyy-MM-dd"/>
			(<fmt:formatDate value="${sob.pfmDate}" pattern="E"/>)
			 &nbsp; ${sob.pfmTime}  </dd>
			<dt>매수</dt>
			<dd>${sob.ea }매</dd>
		</dl>
		</div></td>

		<td>${sob.state }
			<button onclick="location.href='/mypage/canceldetail?bookGroup=${sob.bookGroup}'">취소 상세</button>
		</td>
	</tr>
	</c:if>
</c:forEach>
</tbody>
</table>
</div>



</div>
</div>
