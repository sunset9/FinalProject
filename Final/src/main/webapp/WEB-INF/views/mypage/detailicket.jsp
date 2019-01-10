<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<style type="text/css">
.boxDiv{
 	border: 1px solid #CCC;
 	padding :10px;
}
#warpTicket{
	display: grid;
	width:1160px;
	margin: 20px auto;
/* 	padding :10px; */
	grid-template-columns: 200px auto ;
 	grid-gap: 10px;
 	grid-template-rows:50px, auto; 

}
#poster {
	display: inline-block;
	grid-area: 1 / 1 / 3 / 2  ;
}

#title{
	
	grid-area: 1/ 2 / 2 /3 ;
	text-align : center;
/* 	border: 1px solid black; */
	font-weight: bolder;
	font-size: 3em;
	
}


#bookDetail{
	grid-area: 2/ 2 / 3 /3;
	text-align: center;
	
}
.innerBox{
/* 	북 디테일 담고 있는 div */
	width: 500px;
	margin: 0 auto;
}
dt{
	float: left;
	margin-right: 10px;
}
th{
	text-align: center !important;
}

 td{ 
/* 	border: 1px solid black; */
	padding: 10px;

 }
 
dd{
	padding:5xp ;
 	text-align: center;
 } 
table{
	width: 100%;
	text-align: center;
}
.pfmInfo{
	width: 20%;
	background: #EEE;
	border-bottom: #fff;
}
.fontSize{
	font-size: 1.2em;
}

.btnDiv{
	margin: 20px auto;
	text-align: center;
}
.previous{
	width: 140px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    color:#fff;
    font-weight: bold;
}

#bookCancel{
	width: 140px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    color:#fff;
    background: #F2B134;
    font-weight: bold;
}
</style>

<script type="text/javascript">

$(document).ready(function() {
	
	// 숫자 금액 포멧으로 변환할 변수 
	 var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  
	  
	// 총 티켓 가격 
	var totalTicket= ${ss.secPay * sob.ea };
	console.log (totalTicket);
	
	$('#ticketPrice').text(totalTicket.toString().replace(regexp, ','));
	
	// 배송비 
	var delivery =0;
	
	if (${receive } == 2){
		delivery =2500 ;
	}
	$('#delivery').text(delivery.toString().replace(regexp, ','));
	
	// 추가 금액(수수료)
	var fee =${sob.ea * 1000 };
// 		fee *= 1;
		
	console.log(fee);
	console.log(typeof(fee));
// 	console.log( parseInt(fee) );
	
	// 총 추가비용
	var extraFee = fee + delivery;
	$('#extraFee').text(extraFee.toString().replace(regexp, ','));
	
	var totalFee = fee + parseInt(delivery)+ parseInt(totalTicket) ;
	console.log("총 결제 금액 : " +totalFee);
	
	$('#totalFee').text(totalFee.toString().replace(regexp, ','));
	
	
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
					.attr("value",${sob.pfmIdx})
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
	<img style ="width: 180px;" src="/resources/image/${sob.storedName }">
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
		<td class="pfmInfo">수량 방법</td>
		<td class="fontSize"><p>현장수령 | 공연 당일 현장 교부처에서 예매번호 및 본인 확인 후 티켓을 수령하여 입장이 가능합니다.</p></td>
	</tr>
	</c:if>
	<c:if test="${receive eq 2 }">
	<tr>
		<td class="pfmInfo">수량 방법</td>
		<td class="fontSize"><p>배송 | 예매완료(결제익일) 기준으로 4~5일 이내 배송됩니다.(주말/공휴일을 제외한 영업일 기준)</p></td>
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
	<td>
<!-- 		티켓 금액 -->
		<dl class="fontSize">
			<dt>총 티켓 가격</dt>
			<dd id = "ticketPrice" ></dd>
			<dt>좌석 가격</dt>
			<dd>${ss.appSec }석 : 
			<fmt:formatNumber value="${ss.secPay }" pattern="##,###"/> * ${sob.ea }</dd>
		</dl>
	</td>	
<!-- 		예매 수수료, 배송료 -->
	<td style="border-left: 1px solid #CCC;border-right: 1px solid #CCC;">	
		<dl class="fontSize">
			<dt>추가 비용</dt>
			<dd id="extraFee"> </dd>
			
			<dt>예매 수수료</dt>
			<dd id ="bookFee">1,000 * ${sob.ea } = 
			<fmt:formatNumber value="${sob.ea * 1000 }" pattern="#,###"/></dd>
			
			<dt>배송료</dt>
			<dd id="delivery">	</dd>
		</dl>
	</td>	
		
	<td>	
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
<div class="boxDiv">
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
		<td class="fontSize">${payment.paidAmount }원</td>
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

<!-- 좌석정보  -->
<h2>좌석정보</h2>
<div class="boxDiv"><table class="fontSize">
<tr >
<th>좌석등급</th>
<th>좌석번호</th>
<th>좌석 구매 가격</th>
<th>예매/취소</th>
</tr>
<c:forEach items="${seatList }" var="s">
<tr>
	<td>${ss.appSec }</td>
	<td>${s.seatFloor }층 ${s.seatRow }-${s.seatCol } 자리</td>
	<td>${ss.secPay } 원</td>
	
	<td>${s.state }
<%-- 	${s.state eq '예매완료(결제완료)' || s.state eq '예매완료(부분취소)'} --%>
		<c:if test='${s.state eq "예매완료(결제완료)" || s.state eq "예매완료(부분취소)"}'>
			<input type="checkbox" value="${s.bookIdx}" name="cancelCheck"/>취소 가능
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