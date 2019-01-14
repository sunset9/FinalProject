<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<style type="text/css">
h2 {
	font-size: 21px;
	font-weight: 900;
	margin-top: 35px;
}

.boxDiv{
 	border: 1px solid #EEE;
/*  	padding :10px; */
}
#warpTicket{
	border: 1px solid #ddd;
	display: grid;
	width:1160px;
	margin: 50px auto;
	padding: 23px 50px;
	grid-template-columns: 200px auto ;
 	grid-gap: 90px;
 	grid-row-gap: 10px;
 	grid-template-rows:50px, auto; 

}
#poster {
	display: inline-block;
	grid-area: 1 / 1 / 3 / 2  ;
}

#title{
	grid-area: 1/ 2 / 2 /3 ;
	text-align : left;
/* 	border: 1px solid black; */
	font-size: 3em;
    padding-top: 17px;
}


#bookDetail{
	grid-area: 2/ 2 / 3 /3;
	text-align: center;
	
}

#bookDetail dt {
    width: 100px;
}
#bookDetail dd {
	margin-bottom: 5px;
}
.innerBox{
/* 	북 디테일 담고 있는 div */
	width: 500px;
}

#receive p {
	margin: 0;
}

#buy dt {
    width: 132px;
    font-size: 14px;
    font-weight: normal;
}
#buy td {
    padding-top: 23px; 
    padding-left: 30px;
    vertical-align: text-bottom;
}
#buy td:last-child {
    background: #f7f7f7;
    vertical-align: middle;
    padding-left: 55px;
}
#buy td:last-child dt {
    width: 80px;
    font-size: 14px;
    font-weight: bold;
}
#buy dd {
	margin-bottom: 5px;
}

#totalFee {
    color: #f2b133;
    font-weight: 900;
}
.buy-cover {
	position: relative;
	width: 132px;
	height: 100%;
	background: #eee;
}
#payInfo td:nth-child(2n) {
    text-align: left;
    padding-left: 65px;
}
dl {
	margin-bottom: 0;
}
dt{
	text-align: left;
	float: left;
	margin-right: 10px;
}
dd {
	text-align: left;
}
th{
	text-align: center !important;
}

 td{ 
/* 	border: 1px solid black; */
	padding: 10px;

 }
 
table{
	width: 100%;
	text-align: center;
}
.pfmInfo{
	width: 20%;
	background: #f7f7f7;
	border-bottom: #fff;
}
.fontSize{
	font-size: 1.2em;
}

.btnDiv{
	margin: 55px auto;
	text-align: center;
}

#seat tr:first-child {
    background: #f7f7f7;
    height: 43px;
}
#seat th {
	font-size: 14px;
    font-weight: normal;
}
#cancelCkb {
	margin-left: 3px;
}

.previous{
	width: 140px;
    height: 40px;
    border-radius: 3px;
    border: 1px solid #cdcdcd;
    background: #FFF;
    font-size: 15px;
    color: #AAA;
}

#bookCancel{
	width: 140px;
    height: 40px;
    border-radius: 3px;
    border: 2px solid #F2B134;
    color:#fff;
    background: #F2B134;
    font-size: 15px;
}


</style>

<script type="text/javascript">

$(document).ready(function() {
	
	// 숫자 금액 포멧으로 변환할 변수 
	 var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  
	  
	// 총 티켓 가격 
	var totalTicket= ${ss.secPay * sob.ea };
	console.log (totalTicket);
	
	$('#ticketPrice').text(totalTicket.toString().replace(regexp, ',')+' 원');
	
	// 배송비 
	var delivery =0;
	
	if ('${receive }' == 2){
		delivery =2500 ;
	}
	$('#delivery').text(delivery.toString().replace(regexp, ',')+' 원');
	
	// 추가 금액(수수료)
	var fee =${sob.ea * 1000 };
// 		fee *= 1;
		
	console.log(fee);
	console.log(typeof(fee));
// 	console.log( parseInt(fee) );
	
	// 총 추가비용
	var extraFee = fee + delivery;
	$('#extraFee').text(extraFee.toString().replace(regexp, ',')+' 원');
	
	var totalFee = fee + parseInt(delivery)+ parseInt(totalTicket) ;
	
	totalFee = totalFee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
	console.log("총 결제 금액 : " +totalFee);
	
	$('#totalFee').text(totalFee.toString().replace(regexp, ',')+' 원');
	
	
	// 예매좌석중에 취소하고싶은 좌석 체크박스에 체크하고 삭제요청 버튼 누를 때 메소드
	$('#bookCancel').click(function() {
		var $checkboxes = $("input:checkbox[name='cancelCheck']:checked");
		
		// 체크된 대상들 map으로 만들고 map을 문자열로 만들기
		var map = $checkboxes.map(function() {
			return $(this).val();
		}); // map end
		
		var names = map.get().join(",");
		
		console.log( "map:" + map );	// 맵
		console.log( "map->array : " + map.get() );	// 맵->배열
		console.log( "array tostring : " + map.get().join("_qxq	x") ); // toString
		console.log(typeof(names));
		
		// 전송폼 
		var $form = $("<form>")
			.attr("action", "/mypage/bookcancel")
			.attr("method", "post")
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "names")
					.attr("value", names)
			)
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "pfmIdx")
					.attr("value","${sob.pfmIdx}")
			)
			.append(
					$("<input>")
					.attr("type", "hidden")
					.attr("name", "bookGroup")
					.attr("value","${sob.bookGroup}")
			);
			
		$(document.body).append($form);
		$form.submit();
		
	}); // end click 
	
}); // end ready

</script>


<div class="main_wrapper">
<div>
<!-- 유저 정보 담고 있는 jsp -->
<jsp:include page="userinfo.jsp" />
</div>


<!-- 구매 티켓 정보 -->
<div id = "warpTicket" class ="boxDiv">
	<div id = "poster">
	<img style ="width: 200px;" src="/resources/image/${sob.storedName }">
	</div>
	
<!-- 	공연 타이틀 -->
	<div id="title">
	<span>${sob.name }</span>
	</div>

<!-- 	예매 상세 정보	 -->
	<div id="bookDetail">
		<div class = "innerBox">
			<dl>
			<dt>예매번호</dt> <dd>${sob.bookGroup }</dd>
			<dt>공연장</dt> <dd>${sob.hallName }</dd>
			</dl>
			<dl>
			<dt>예매일시</dt> <dd>
			<fmt:formatDate value="${sob.createDate }" pattern="yyyy-MM-dd"/>
			</dd>
			<dt>상태</dt> <dd>${sob.state }</dd>
			</dl>
			<dl>
			<dt>관람일시</dt> <dd>
				<fmt:formatDate value="${sob.pfmDate}" pattern="yyyy-MM-dd"/>
				(<fmt:formatDate value="${sob.pfmDate}" pattern="E"/>)
				 &nbsp; ${sob.pfmTime} 
				 </dd>
			<dt>매수</dt> <dd>${sob.ea }매</dd>
			</dl>
		</div>
	</div>
	

</div>
<!-- //구매 티켓 정보 -->



<!-- 티켓 수령 방법 -->
<div id="receive">
	<h2>티켓 수령 방법</h2>
	<div class="boxDiv">
	<table>
	<c:if test="${receive eq 1 }">
	<tr>
		<td class="pfmInfo">수령 방법</td>
		<td class="fontSize"><p>현장수령 | &nbsp;&nbsp;&nbsp;공연 당일 현장 교부처에서 예매번호 및 본인 확인 후 티켓을 수령하여 입장이 가능합니다.</p></td>
	</tr>
	</c:if>
	<c:if test="${receive eq 2 }">
	<tr>
		<td class="pfmInfo">수량 방법</td>
		<td class="fontSize"><p>배송 | &nbsp;&nbsp;&nbsp;예매완료(결제익일) 기준으로 4~5일 이내 배송됩니다.(주말/공휴일을 제외한 영업일 기준)</p></td>
	</tr>
	<tr>
		<td class="pfmInfo">받으시는 분</td>
		<td class="fontSize">${shipment.name }</td>
	</tr>
	<tr>
		<td class="pfmInfo">연락처</td>
		<td class="fontSize">${shipment.phone }</td>
	</tr>
	<tr>
		<td class="pfmInfo">주소</td>
		<td class="fontSize">${shipment.addr }
			${shipment.addrDetail }
		<br> 우편번호 :	${shipment.postcode }
		</td>
	</tr>
	</c:if>
	</table>
	</div>
</div>
<!-- //티켓 수령 방법 -->



<!-- 구매내역 -->
<h2>구매 내역</h2>
<div id = "buy" class="boxDiv">
<table>
<tr>
	<td style="width: 35%;">
		<div class="buy-cover"></div>
<!-- 		티켓 금액 -->
		<dl class="fontSize">
			<dt>티켓 가격</dt>
			<dd id = "ticketPrice" ></dd>
			<dt>좌석당 티켓 가격</dt>
			<dd>${ss.appSec }석 : 
			<fmt:formatNumber value="${ss.secPay }" pattern="##,###"/> x ${sob.ea } 장</dd>
		</dl>
	</td>	
<!-- 		예매 수수료, 배송료 -->
	<td style="width: 35%; border-left: 1px solid #f1f1f1;">	
		<dl class="fontSize">
			<dt>추가 비용</dt>
			<dd id="extraFee"> </dd>
			
			<dt>예매 수수료</dt>
			<dd id ="bookFee">1,000 x ${sob.ea } 장 = 
			<fmt:formatNumber value="${sob.ea * 1000 }" pattern="#,###"/> 원</dd>
			
			<dt>배송료</dt>
			<dd id="delivery">	</dd>
		</dl>
	</td>	
	<td style="width: 30%;">	
		<dl class="fontSize">
			<dt>총 금액</dt>
			<dd id="totalFee"></dd>
		</dl>
	</td>


</tr>
</table>

</div>

<!-- //구매내역 -->


<!-- 결제내역 -->
<h2>결제내역</h2>
<div id="payInfo" class="boxDiv">
<table>
	<tr>
		<td class="pfmInfo">
			결제방법
		</td>
		<td class="fontSize">
			카드
		</td>
	</tr>
	<tr>
		<td class="pfmInfo"> 거래자명</td>
		<td class="fontSize">${payment.buyerName }</td>
	</tr>
	<tr>
		<td class="pfmInfo">결제 금액</td>
		<td class="fontSize"><fmt:formatNumber value="${payment.paidAmount }" pattern="#,###"/>원</td>
	</tr>
	<tr>
		<td class="pfmInfo">결제 날짜</td>
			<td class="fontSize">
			<fmt:formatDate value="${payment.createDate }" pattern="yyyy-MM-dd"/>
			(<fmt:formatDate value="${payment.createDate }" pattern="E"/>)
			
		</td>
	</tr>

</table>
</div>

<!-- //결제내역 -->

<!-- 환불 내역 -->
<c:if test="${! empty cancelSob }">
<h2>환불내역</h2>
<div class="boxDiv">
	<table>
		<tr>
			<td class="pfmInfo">
				환불방법
			</td>
			<td class="fontSize">
				카드
			</td>
		</tr>
		<tr>
			<td class="pfmInfo"> 거래자명</td>
			<td class="fontSize">${payment.buyerName }</td>
		</tr>
		<tr>
			<td class="pfmInfo">환불 금액</td>
			<td class="fontSize">${cancelSob.ea * ss.secPay }원</td>
		</tr>
	
	</table>
</div>
</c:if>
<!-- 좌석정보  -->
<h2>좌석정보</h2>
<div id="seat" class="boxDiv"><table class="fontSize">
<tr>
<th style="width:15%">좌석등급</th>
<th style="width:20%">좌석번호</th>
<th style="width:20%">좌석 구매 가격</th>
<th style="width:25%">예매/취소</th>
</tr>
<c:forEach items="${seatList }" var="s">
	<tr>
		<td>${ss.appSec }석</td>
		<td>${s.seatFloor }층 ${s.seatRow }-${s.seatCol } 자리</td>
		<td><fmt:formatNumber value="${ss.secPay }" pattern="#,###"/> 원</td>
		
		<td>${s.state }
	<%-- 	${s.state eq '예매완료(결제완료)' || s.state eq '예매완료(부분취소)'} --%>
			<c:if test='${s.state eq "예매완료(결제완료)" || s.state eq "예매완료(부분취소)"}'>
				<span id="cancelCkb"><input	type="checkbox" value="${s.bookIdx}" name="cancelCheck"/>취소 가능</span>
			</c:if>
		</td>
	</tr>
</c:forEach>

</table>

</div>

<!-- //좌석정보 -->
	<div class ="btnDiv">
		<button id = "bookCancel">취소 요청</button>
		<button class ="previous" onclick="location.href='/mypage/myticket'">목록</button>
	</div>






</div>