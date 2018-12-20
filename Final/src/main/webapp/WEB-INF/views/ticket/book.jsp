<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- DATEPICKER -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
<script type="text/javascript">
var basepay=0;
var fee=0;
var rp =0;
$(document).ready(function() {
	$('#stepInfo').hide();
	$('#prevBtn').hide();
	console.log(${param.pfmIdx });
	console.log(${param.hallIdx });
	var pfmSeatSection = new Array();
	//창띄울때 섹션 정보 가져오기
	
		$.ajax({
			type:"get",
			url:"/ticket/seatSection",
			data:{
				"pfmIdx":${param.pfmIdx },
				  "hallIdx":${param.hallIdx }
				  },
			async: false,
			dataType:"html",
			success:function(res){
				$('#selectedSeats').html(res);
				$('svg').css("width","650px");
				$('svg').css("height","530px");
				loadSectionData();
			
			}
		});	
	
	
	  //좌석 그리는 페이지띄어주기
	  $('#selectedSeats').on('click','.section', function(){
		  
		  var color = $(this).css("fill");
		  var secName = $(this).attr("class");
		  var pay = $(this).data("pay");
		  var appName = $(this).data("appName");
		  var oriSecIdx = $(this).data("secIdx");
		  
			$.ajax({
				
				type:"GET",
				url:"/hall/hall_2_seats/seat",
				data:{"color":color,
					"secName":secName[0],
					"pay":pay,
					"appName":appName,
					"hallIdx":${param.hallIdx},
					"oriSecIdx":oriSecIdx
					},
				dataType:"html",
				success:function(res){
					$('#selectedSeats').html(res);
					
				}
				
			});
		  
	  });
	  


	 
	
	//다음단계 혹은 이전단계 
	  $('.stepBtn').on('click', function () {
		  
		  var lastCompletedTab = $('.completeStep').last().attr('id');
		  var curStep = 0;
		  //현재 단계구하기
		  if(!lastCompletedTab){
			  curStep = 1;
		  }else{
			  curStep = Number(lastCompletedTab.split("-")[1])+1;
		  }
	
		  var prevStep = curStep - 1;
		  var nextStep = curStep + 1;
		  
		  if(curStep == 0){
			  $('#stepInfo').hide();
		  }else{
			  $('#stepInfo').show();
			  
		  }
		  
		  if($(this).is($('#nextBtn'))){
			  
			  if(curStep == 1){
				  //이전단계 버튼 활성화
				  $('#prevBtn').show();
				  $('#bookStep_2_tb').html("");
				  $('.wrap_ticket_info').show();
				  $('#step2and3').show();
				  getSeatInfo();
				  
			  } 
			  else if(curStep == 2){ // 현재 STEP 3 단계라면(=다음이 4단계)
					// '다음 단계' 버튼 비활성화
					$('#nextBtn').hide();
					$('#step2and3').show();
			  }
			  
			// 현재 단계 탭 완료 상태 전환
			$('#step-'+curStep).addClass('completeStep');
// 			// 다음 단계 탭 현재 진행 상태 표시로 전환
			$('#step-'+curStep).removeClass('inProgress');
			$('#step-'+nextStep).addClass('inProgress');
			
			//현재띄우고있는 예매페이지숨김
			$('#bookStep_'+curStep).hide();
			// 다음 등록 양식 보여줌
			$('#bookStep_'+nextStep).show();
		  } else {//이전단계 클릭 시
			  if(curStep == 2){ // 현재 STEP2 단계라면 ( =전환될 화면이 1단계)
					// '이전 단계' 버튼 비활성화
					$('#stepInfo').hide();
					$('#prevBtn').hide();
					$('.wrap_ticket_info').hide();
					$('#step2and3').hide();
				} else if(curStep == 3){ // 현재 STEP4 단계라면 ( =전환될 화면이 3단계)
					// '다음 단계' 버튼 활성화
					$('#nextBtn').show();
					$('#bookStep_2_tb').html("");
					$('#step2and3').show();
					getSeatInfo();
				}
		  
				// 이전 단계 탭(전환될 탭) 미완료 상태 전환
				$('#step-'+prevStep).removeClass('completeStep');
				// 이전 단계 탭 현재 진행 상태 표시로 전환
				$('#step-'+curStep).removeClass('inProgress');
				$('#step-'+prevStep).addClass('inProgress');
				
				// 현재 띄워주고 있는 등록 양식 숨김
				$('#bookStep_'+curStep).hide();
				// 다음 등록 양식 보여줌
				$('#bookStep_'+prevStep).show();
		  }
		  
		 $('#basePriceTotal').text( $('#ticketPriceTotal').text());
		 $('#reservationFee').text("1,000");
	
		 basepay = $('#basePriceTotal').text();
		 basepay=basepay.replace(/,/g, '');
		 
		 fee = $('#reservationFee').text();
		 fee=fee.replace(/,/g,'');
		 
		 var deliverypay = $('#deliveryCost').text();
		 deliverypay = deliverypay.replace(/,/g,'');
		 
		 
		 rp=(+basepay+(+fee));
		 var resultPay = parseInt(basepay)+parseInt(fee)+parseInt(deliverypay);
		 resultPay=resultPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		 
		 $('#paymentAmount').text(resultPay);
		 
		 
	})
});

	  
	  //섹션 데이터 받아오기
	  function loadSectionData(){
		  $.ajax({
			  type:"POST",
			  url:"/ticket/seatSection",
			  data:{
				  "hallIdx":${param.hallIdx},
				  "pfmIdx":${param.pfmIdx}
		  },
			  dataType:"json",
			  success:function(res){
				  pfmSeatSection = res.hashMap.pfmSeatSection;
				  
				  //정해진 구역 랜덤으로 색 칠해주기 위해 선언한 color 배열
				  var color = ['#1E88E5','#3E4982','#DEB069','#FFE561','#A0B7E3','#7EB2B3'];
				  
				  var json = { };
				  var secName; 
				  for(var i=0;i<res.hashMap.secName.length;i++){
					  secName = res.hashMap.secName[i];
					  //json : 섹션 네임의 키값과 컬러값을 가지고 있다.
					  json[secName]=color[i];
				  }
				  
// 				  for(var i=0;i<res.hashMap.secName.length;i++){
// 					  secName = res.hashMap.secName[i];
// 				  }
				  
					for(var i=0;i<res.hashMap.secMap.length;i++){
						
						var str = 'path.'+res.hashMap.secMap[i].oriSecName;
						var path = $('.seat_block').find(str); //seat_block 하위요소중 path중에 불러온 이름중 원본섹션이름을 가진걸 불러와라
						
						if(path.data("secIdx") == undefined){ // 만약 path를 찾을수 없다면 rect로 찾자
							var str_rect='rect.'+res.hashMap.secMap[i].oriSecName;
							path = $('.seat_block').find(str_rect);
						}
						
						  for(var j=0;j<res.hashMap.secName.length;j++){
							  
							  if(res.hashMap.secName[j] ==res.hashMap.secMap[i].appSec ){
								  var secName = res.hashMap.secName[j];
								  path.attr("fill",json[secName]);
								  path.data("pay",res.hashMap.secMap[i].secPay); //pay라는 임의의 커스텀 데이터를 넣어줌
								  path.data("secName",res.hashMap.secMap[i].oriSecName);
								  path.data("appName",res.hashMap.secMap[i].appSec);
							  }
						  
						  }
					
					}
					
			  },
			  error:function(e){
				  console.log(e);
			  }
			  
		  })
		  
	  }
	  
function getSeatInfo(){
	var cnt = new Array();
	  $('#seat-map').find('.selected').each(function() {
  		  
  		  var seat = $(this).attr('id');
  		  
  		  var seatArr = new Array();
  		  seatArr= seat.split("_");
  		  
  		  var str = $(this).attr('class');
  		  var array = new Array(); 
  		  array = str.split(" ");
//   		  console.log(array[2]+" 석"); // 무슨좌석인지
  		  //array[3] : 구역이름, seatArr[0] : 좌석행, seatArr[1] : 좌석열 , array[4] : 좌석 가격
//   		  console.log(array[3]+" 구역 "+" "+seatArr[0]+" 행 "+seatArr[1]+" 열"+" : "+array[4]) ;
  		  
  		  var seatInfo = new Array();
  		  seatInfo = $('#selected-seats').find("li").text().split("[cancel]");
  		  
  		
  		for (var j = 0 ; j<pfmSeatSection.length; j++){
				cnt[j] = 0;
		}	
	  		
  		  for(var i =0; i<seatInfo.length-1;i++){
  			  var info = seatInfo[i].split(" ");
	    		for (var j = 0 ; j<pfmSeatSection.length; j++){
	    			if (info[0] == pfmSeatSection[j].appSec){
	    				cnt[j] = cnt[j]+1;
	    			}
	    		}	    		
	    		
	    	}	  
//   		 
  	  });
		  
	   for (var i=0;i<pfmSeatSection.length; i++){
		   if (cnt[i] != 0){
    		$('#bookStep_2_tb').append("<tr><td>"+pfmSeatSection[i].appSec+"석 </td><td style='text-align:right'> "+cnt[i]+"매 </td></tr>");
		   }
		}
	 }
	 
	 function seatAllView() {
			$.ajax({
				type:"get",
				url:"/ticket/seatSection",
				data:{
					"pfmIdx":${param.pfmIdx },
					  "hallIdx":${param.hallIdx }
					  },
				async: false,
				dataType:"html",
				success:function(res){
					$('#selectedSeats').html(res);
					$('#selected-seats').html("");
					$('#total').html("0");
					$('#counter').html("0");
					$('svg').css("width","650px");
					$('svg').css("height","530px");
					loadSectionData();
				
				}
			});	
	}
	 

</script>

<style type="text/css">
.progressbar {
	counter-reset: step;
}
.progressbar li {
	list-style-type: none;
	float:left;
	width: 25%;
	position: relative;
	text-align: center;
    color: #7d7d7d;
    font-size: 12px;
}
/* 현재 머물러있는 단계 */
.progressbar li.inProgress{
	font-weight: bold;
	font-size: 14px;
}
.progressbar li.inProgress:before{
	border-color: #999;
	background-color: #eee;
}
/* step 글자 위에 서클 모양 */
.progressbar li:before { 
	content: counter(step);
	counter-increment: step;
	width: 30px;
    height: 30px;
    line-height: 28px;
    border: 2px solid #7d7d7d;
    border-radius: 50%;
    display: block;
    text-align: center;
    margin: 0 auto 10px auto;
    background-color: white;
}
.progressbar li:after {
    content: '';
    width: 100%;
    height: 2px;
    position: absolute;
    background-color: #7d7d7d;
    top: 15px;
    left: -50%;
    z-index: -1;
}
/* 첫번째 li 의 progress bar 줄 제거*/
.progressbar li:first-child:after {
     content: none; 
}
/* 활성화된 요소의 글자 색 */
.progressbar li.completeStep {
	color: green; 
}
/* 활성화된 요소의 step 서클 */
.progressbar li.completeStep:before {
	content: '';
	background-image: url(/resources/image/checked.png);
	background-size: 28px 28px;
    background-position: -1px -1px;
	border-color: #55b776; 
}
/* 활성화 된 요소에 연결된 progress 줄 색 변경*/
.progressbar li.completeStep + li:after {
     background-color: #55b776; 
}


/*결제버튼*/
.btn_onestop {
    margin-bottom: -50px;
    position: absolute;
    left: 15px;
    bottom: 10px;
}

</style>
</head>
<body>

<div id ="stepInfo">
<ul class="progressbar">
	<li id="step-1" class='inProgress'>좌석선택</li>
	<li id="step-2">가격/수령방법</li>
	<li id="step-3">결제방법</li>
</ul>
</div>
<!-- STEP 1. 좌석선택 -->
<div id ="bookStep_1">
	<div id = "selectedSeats" style="float: left; width: 650px; " ></div>
	<div class="booking-details"style="float: right"></div>
	<h2>예매정보</h2>
	<h3>
	   선택된 좌석 (<span id="counter">0</span>):
	</h3>
	<div class="allScreen"></div>
	<ul id="selected-seats"></ul>
	
	총 결제금액 : <b>$<span id="total">0</span></b>
	
	<button class="checkout-button">Checkout &raquo;</button>
	
<!-- 	<div id="legend"></div> -->
	
	<button onclick="seatAllView()">좌석도 전체보기</button>
</div>
<!-- STEP 1. 좌석선택 -->

<!-- 전체 묶음 DIV -->
<div id = "step2and3" style="display:none;">
<div class="wrap_ticket_info" style="float:right">
		<h2 class="logo_onestop">
			<a href="#none"><img src="https://cdnticket.melon.co.kr/resource/image/web/onestop/logo_onestop.png" alt="바나나 티켓"></a>
		</h2>
		<div class="box_info">
		<h3 class="select_tit select_t txt_prod_name" title="공연제목">${param.name}</h3>
			<div class="box_ticket">
				<ul class="box_ticket_list" style="list-style: none;    margin: 16px -29px;
    font-size: 13px;
    line-height: 24px;">
					<li class="nth nth1 txt_prod_schedule">${param.date} ${param.time}</li>
					<li class="nth nth2 txt_ticket_info"></li>
				</ul>
			</div> <!-- box_ticket -->
		</div><!-- box_info -->
		<div class="box_info">
		<h3 class="select_tit">결제금액</h3>
		<div class="box_ticket">
				<div class="box_total_inner">
					<p class="tk_b">
						<span class="tk_tit">티켓금액</span><span class="pay pay_comp">
						<span id="ticketPriceTotal">88,000</span>원</span>
					</p>
					<ul class="list_tkpay" style="list-style: none;x">
						<li>
							<span class="tk_tit">기본가</span><span class="pay">
							<span id="basePriceTotal">88,000</span>원</span>
						</li>
					</ul>
				</div>
				<div class="box_total_inner">
					<p class="tk_b">
						<span class="tk_tit tk_tit_b">예매수수료</span>
						<span class="pay pay_comp"><span id="reservationFee">1,000</span>원</span>
					</p>
				</div>
				<div class="box_total_inner lst">
					<p class="tk_b">
						<span class="tk_tit tk_tit_b">배송료</span><span class="pay pay_comp">
						<span id="deliveryCost">0</span>원</span>
					</p>
				</div>
				<div class="box_total_inner box_result">
					<span class="tk_tit tot_tit">총 결제금액</span>
					<strong class="pay tot_pay"><span id="paymentAmount">89,000</span>원</strong>
				</div>
		</div>
		</div><!-- box_info -->
		<div class="box_info_bm">
<!-- 티켓 정보 -->
	<div class="btn_onestop">
				<span class="button btWhite frt">
					<a href="javascript: goPrevPage();" class="btnOne">이전</a></span> <span class="button btNext">
					<a href="#" class="btnOne" id="payment">결제하기</a>
				</span>
			</div>
</div>
</div>


<div id="detailStep" style="float: left">

	<!-- STEP 2. 가격/수령방법 -->
	<div id ="bookStep_2" style=" display: none; width: 630px; padding: 50px; padding-left: 70px;">
		<table id ="bookStep_2_tb" class="table">
		</table>
		<h3 class="select_tit">수령방법을 선택하세요</h3>
		<ul class="list_receipt_how" id="partDeliveryType" style="">
			<li id="delvyType02">
			<label>
			<input type="radio"id="delvyTypeCode02" name="delvyTypeCode" value="DV02" onclick="setDeliveryType(this.value);"
						class="radio_delvy_type" title="현장수령">
			<span class="txt_lab" id="delvyTypeNameDV0002"
						style="">&nbsp;현장수령</span></label></li>
			<li id="delvyType03">
			<label><input type="radio"id="delvyTypeCode03" name="delvyTypeCode" value="DV03" class="radio_delvy_type" onclick="setDeliveryType(this.value);"
						title="배송">
						<span class="txt_lab" id="delvyTypeNameDV0003"
						style="">&nbsp;배송(2,500원)</span></label></li>			
		</ul>
		<div class="txt" id="txtDeliveryInfo">
			<span>예매완료(결제익일) 기준으로 4~5일 이내 배송됩니다.(주말/공휴일을 제외한 영업일 기준)</span>
		</div>
		
		<div class="box_how"> 

	<div class="box_info_use box_gray">
	<!-- 현장수령 선택시-->
		<h4 class="tit_receipt">주문자정보</h4>
		<div class="box_inp_opt">
			<table class="tbl">
				<caption class="hide"></caption>
				<colgroup>
					<col style="width: 43px;">
					<col style="width: 90px;">
					<col style="width: 50px;">
					<col style="width: 195px;">
					<col style="width: 50px;">
					<col style="width: 150px;">
				</colgroup>
				<tbody>
					<tr>
						<th class="txt_gray" style="width: 70px;" id="labUserName">이름<span class="require">*</span></th>
						<td>
							<div class="wrap_form_input">
								<input type="text" name="buyerName" id="buyer_name"
									class="inputType inp_txt inp_w77" >
							</div>
						</td>
						<th class="txt_gray" style="width: 80px;">연락처<span class="require">*</span></th>
						<td>
							<div class="wrap_form_input">
							<input type="text" name="buyer_tel" id="buyer_tel"
									class="inputType inp_txt inp_w150" value="">
							</div>
						</td>
						<th class="txt_gray" style="width: 75px;">이메일<span class="require">*</span></th>
						<td>
							<div class="wrap_form_input">
								<!-- form wrapper -->
								<input type="text" name="email" id="buyer_email"
									class="inputType inp_txt inp_w150" value=""> <label
									for="email" class="place_holder"></label>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="txt_more txt_gray">입력하신 이메일로 예매확인 내역을 보내드립니다.</p>
		</div>
	</div>
	<div class="box_location box_gray" id="part_delivery_info" style="display: none;">
	<!-- 일반배송 선택시-->
	<h4 class="tit_receipt">
			배송지 정보 <span class="box_check"> <label><input
					type="checkbox" id="copyDelvyAddr"> 주문자정보와 동일</label>
			</span>
		</h4>
		<div class="box_inp_opt">
		<div class="box_inp_opt">
				<table class="tbl ">
					<caption class="hide"></caption>
					<colgroup>
						<col style="width: 72px;">
						<col style="width: 240px;">
						<col style="width: 60px;">
						<col style="width: 198px;">
					</colgroup>
					<tbody>
					<tr>
					<th class="txt_gray">수령인<span class="require">*</span></th>
					<td>
					<div class="wrap_form_input">
									<!-- form wrapper -->
					<input type="text" name="buyerName" id="buyerName"
					class="inputType inp_txt inp_w190" value=""> <label
					for="delvyName" class="place_holder"></label>
						</div>
					</td>
					<!--  -->
					<th class="txt_gray">연락처<span class="require">*</span></th>
							<td>
								<div class="wrap_form_input">
									<!-- form wrapper -->
									<input type="hidden" name="delvyTel" id="delvyTel"
										class="inputType inp_txt inp_w190" value=""> <input
										type="text" name="delvyTel1" id="delvyTel1"
										class="inputType inp_txt inp_w60" value="" maxlength="4">
									<input type="text" name="delvyTel2" id="delvyTel2"
										class="inputType inp_txt inp_w60" value="" maxlength="4">
									<input type="text" name="delvyTel3" id="delvyTel3"
										class="inputType inp_txt inp_w60" value="" maxlength="4">
									<label for="delvyTel" class="place_holder"></label>
								</div>
							</td>
						</tr>
						<tr>
							<th class="txt_gray txt_top" rowspan="3">주소<span
								class="require">*</span></th>
							<td colspan="3">
								<button type="button" class="box_inp_btn" id="btnSearchAddress" onclick="openZipSearch()">우편번호</button></td>
						</tr>
						<tr>
							<td colspan="3" class="td_pd"><span class="wrap_form_input">
									<!-- form wrapper -->
									<input type="text" name="delvyAddr"
									id="buyer_addr" class="inputType inp_txt inp_l2" value=""
									> <label for="delvyAddr"
									class="place_holder"></label>
							</span> 
							</td>
						</tr>
						</tbody>
						</table>
						</div>
						
		</div>
	</div>
</div>
		</div>
		
		
	<!-- STEP 2. 가격/수령방법 -->
	
	<!-- STEP 3. 결제방법 -->
	<div id ="bookStep_3"style=" display: none;">
		<%@ include file="payment.jsp" %>	
	</div>
	<!-- STEP 3. 결제방법 -->

</div>


</div>



<button id = "nextBtn" class="stepBtn">다음단계</button>
<button id = "prevBtn" class="stepBtn">이전단계</button>

</body>
</html>