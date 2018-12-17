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

$(document).ready(function() {
	$.ajax({
		type:"get",
		url:"/ticket/seatSection",
		data:{},
		async: false,
		dataType:"html",
		success:function(res){
			$('#selectedSeats').html(res);
	// 			$('#legend').html('');
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
		  
			$.ajax({
				
				type:"GET",
				url:"/hall/hall_2_seats/seat",
				data:{"color":color,
					"secName":secName[0],
					"pay":pay,
					"appName":appName
					},
				dataType:"html",
				success:function(res){
					$('#selectedSeats').html(res);
				}
				
			});
		  
	  });
	
	  $('.stepBtn').on('click', function () {
		  var lastCompletedTab = $('.completeStep').last().attr('id');
		  var curStep = 0;
// // 		  //현재 단계구하기
		  if(!lastCompletedTab){
			  curStep = 1;
		  }else{
			  curStep = Number(lastCompletedTab.split("-")[1])+1;
		  }
	
		  var prevStep = curStep - 1;
		  var nextStep = curStep + 1;
		  
		  
		  if($(this).is($('#nextBtn'))){
			  
			  if(curStep == 1){
				  //이전단계 버튼 활성화
				  $('#prevBtn').show();
			  } else if(curStep == 3){ // 현재 STEP 3 단계라면(=다음이 4단계)
					// '다음 단계' 버튼 비활성화
					$('#nextBtn').hide();
					// '저장' 버튼 활성화
					$('#storeBtn').show();
				}
			  
			// 현재 단계 탭 완료 상태 전환
			$('#step-'+curStep).addClass('completeStep');
// 			// 다음 단계 탭 현재 진행 상태 표시로 전환
			$('#step-'+curStep).removeClass('inProgress');
			$('#step-'+nextStep).addClass('inProgress');
			// 현재 띄워주고 있는 등록 양식 숨김
			
			$('#bookStep_'+curStep).hide();
			// 다음 등록 양식 보여줌
			$('#bookStep_'+nextStep).show("slide", {direction: "right"}, 'fast');
			
			console.log("curStep::"+curStep);
			console.log("nextStep::"+nextStep);
			  
		  } else {//이전단계 클릭 시
				console.log("curStep::"+curStep);
				console.log("nextStep::"+nextStep);
			  if(curStep == 2){ // 현재 STEP2 단계라면 ( =전환될 화면이 1단계)
					// '이전 단계' 버튼 비활성화
					$('#prevBtn').hide();
					$('#nextBtn').show();
				} 
		  
				// 이전 단계 탭(전환될 탭) 미완료 상태 전환
				$('#step-'+prevStep).removeClass('completeStep');
				// 이전 단계 탭 현재 진행 상태 표시로 전환
				$('#step-'+curStep).removeClass('inProgress');
				$('#step-'+prevStep).addClass('inProgress');
				
				// 현재 띄워주고 있는 등록 양식 숨김
				$('#bookStep_-'+curStep).hide();
				// 다음 등록 양식 보여줌
				$('#bookStep_-'+prevStep).show("slide", {direction: "left"}, 'fast');
		  }
		  
		  
		  
		
	})
	  
})

	  
	  //섹션 데이터 받아오기
	  function loadSectionData(){
		  
		  $.ajax({
			  type:"POST",
			  url:"/ticket/seatSection",
			  data:{},
			  dataType:"json",
			  success:function(res){
				  
				  var color = ['#F8B195','#F67280','#C06C84','#6C5B7B','#355C7D','navy'];
				  
				  var json = { };
				  var secName; 
				  for(var i=0;i<res.hashMap.secName.length;i++){
					  secName = res.hashMap.secName[i];
					  json[secName]=color[i];
				  }
				  
				  for(var i=0;i<res.hashMap.secName.length;i++){
					  secName = res.hashMap.secName[i];
// 					  console.log(json[secName]);
				  }
				  
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
								  path.data("pay",res.hashMap.secMap[i].secPay);
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
</script>
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
	
	<div id="legend"></div>
</div>

<!-- STEP 2. 가격/수령방법 -->
<div id ="bookStep_2" style=" display: none">
</div>

<!-- STEP 3. 결제방법 -->
<div id ="bookStep_3"style=" display: none">
<%@ include file="payment.jsp" %>
</div>

<button id = "nextBtn" class="stepBtn">다음단계</button>
<button id = "prevBtn" class="stepBtn">이전단계</button>

</body>
</html>