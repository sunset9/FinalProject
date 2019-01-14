<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banana Ticket</title>
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

<!-- 스크롤바 -->
<script type="text/javascript">
var basepay=0;
var fee=0;
var rp =0;
var delvyTypeCode = 1;
var isTempSeat = false;
$(window).load(function() {

	  var strWidth;
	  var strHeight;
	  
	  
	  $('#allDiv').css("width","800px");
	  $('body').css('width',"800")
	  $('html').css("height","800");
	  $('html').css("width","1100");
	  //innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
	  if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
	    strWidth = $('html').outerWidth() + (window.outerWidth - window.innerWidth);
	    strHeight = $('html').outerHeight() + (window.outerHeight - window.innerHeight);
	  }

	  else {
	    var strDocumentWidth = $(document).outerWidth();
	    var strDocumentHeight = $(document).outerHeight();

	    window.resizeTo ( strDocumentWidth, strDocumentHeight );

	    var strMenuWidth = strDocumentWidth - $(window).width();
	    var strMenuHeight = strDocumentHeight - $(window).height();


	    strWidth = $('html').outerWidth() + strMenuWidth;
	    strHeight = $('html').outerHeight() + strMenuHeight;

	  }

	 

	  //resize 

	  window.resizeTo( strWidth, strHeight );
	 

	}); 
$(document).ready(function() {


	$('#buyer_name').val("${sessionScope.loginUser.name}");
	$('#buyer_tel').val("${sessionScope.loginUser.phone}");
	$('#buyer_email').val("${sessionScope.loginUser.email}");
	
	//위에 스탭단계 보여주는곳 숨기기
	$('#stepInfo').hide();
	//처음에 이전버튼 숨기기
	$('#prevBtn').hide();
	//공연 섹션정보배열
	var pfmSeatSection = new Array();
	//배송유형코드 
	//창띄울때 섹션 정보 가져오기
	//오른쪽 큰 좌석 구역
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
				$('svg').css("height","630px");
				$('svg').css("margin-left","-37");
			    
				loadSectionData($('#selectedSeats'));
// 				loadSectionInfo();
			
			}
		});	

	
	//왼쪽 미니 좌석 구역
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
				$('#selectedSeats_small').html(res);
				
				//사이즈조절
				$('#selectedSeats_small #ez_canvas_zone')
				$('#selectedSeats_small #ez_canvas_zone').css("width","100px");
				$('#selectedSeats_small #ez_canvas_zone').css("height","100px");
				$('#selectedSeats_small #scroller').css("width","100px");
				$('#selectedSeats_small #scroller').css("height","100px");
				$('#selectedSeats_small svg').width('293px');
				$('#selectedSeats_small #wrapper').css("width","10px");
				$('#selectedSeats_small #wrapper').css("height","10px");
				$('#selectedSeats_small .stage_img').height('207px');
				
				var height = $('#selectedSeats_small .stage_img').css("height");
				$('#selectedSeats_small svg').css("height",height);
				
				loadSectionData($('#selectedSeats_small'));

			
			}
		});	
	
	
	//작은좌석구역 클릭시
		$('#selectedSeats_small svg').on('click','path,rect',function(){
			 var IsSeatSelect = $('#seat-map').find('.selected');
			  if (IsSeatSelect.size() != 0){
				  if(confirm("선택한 좌석 정보를 삭제하고 이동하시겠습니까?")){
			
				  }else{
					  return;
				  }
			  }
			  
			$('#selectedSeats').html("");  
			$('#selected-seats').html("");
			$('#seat-map').html("");
			$(".nth2_1").html("");
			$('#total').html("0");
			$('#counter').html("0");
			
			$('path').removeClass('clicked');
			$('rect').removeClass('clicked');
			if(!$(this).hasClass('clicked')){
				$(this).addClass('clicked');
			}else {
				$(this).removeClass('clicked');
			}
			
			$('#selectedSeats_small').find("path").css("opacity","0");
			$('#selectedSeats_small').find("rect").css("opacity","0");
			
			$(this).css("opacity","1");
			  var color = $(this).css("fill");
			  var secName = $(this).attr("class");
			  var pay = $(this).data("pay");
			  var appName = $(this).data("appName");
			  var oriSecIdx = $(this).data("secIdx");
			  var pfmIdx =${param.pfmIdx};
			  var hallIdx =${param.hallIdx};
			  
			  var secNameArr = secName.split(" ");
			  $("#seat-map").html("");
				$.ajax({
					type:"GET",
					url:"/hall/hall_2_seats/seat",
					data:{"color":color,
						"secName":secNameArr[0],
						"pay":pay,
						"appName":appName,
						"hallIdx":hallIdx,
						"oriSecIdx":oriSecIdx,
						"pfmIdx" :pfmIdx,
						"date" : "${param.date }",
						"time" : "${param.time }"
						},
					dataType:"html",
					success:function(res){
						$('#selectedSeats').html(res);
					}
				});
		});
	
		//구역이름 클릭시 구역 선택하게
		 $('text').click(function () {
			var selector = ".section."+$(this).children().text();
			$(this).parent().find(selector).click();
		})
		 
		
		 
	  //좌석 그리는 페이지띄어주기
	  $('#selectedSeats').on('click','.section', function(){
		  var color = $(this).css("fill");
		  var secName = $(this).attr("class");
		  var pay = $(this).data("pay");
		  var appName = $(this).data("appName");
		  var oriSecIdx = $(this).data("secIdx");
		  var pfmIdx =${param.pfmIdx};
		  var hallIdx =${param.hallIdx};
		  
		  var secNameArr = secName.split(" ");
		  
		  console.log($(this).data("secIdx"));
		  
			$.ajax({
				type:"GET",
				url:"/hall/hall_2_seats/seat",
				data:{"color":color,
					"secName":secNameArr[0],
					"pay":pay,
					"appName":appName,
					"hallIdx":hallIdx,
					"oriSecIdx":oriSecIdx,
					"pfmIdx" :pfmIdx,
					"date" : "${param.date }",
					"time" : "${param.time }"
					},
				dataType:"html",
				success:function(res){
					
					$('#selectedSeats').html(res);
				}
				
			});
			
			//좌석구역 선택시 미니화면도 해당 구역으로 선택
			var classAttr = $(this).attr("class").split(" ");
			var classStr = "."+classAttr[0]+"."+classAttr[1];
		     //미니화면 선택된거 리셋
		    $('path').removeClass('clicked');
		    $('rect').removeClass('clicked');
			if (!$('#selectedSeats_small').find(classStr).hasClass("clicked")){
				$('#selectedSeats_small').find(classStr).addClass("clicked");
			}else{
				$('#selectedSeats_small').find(classStr).removeClass("clicked");
			};
			
			$('#selectedSeats_small').find("rect").css("opacity","0");
			$('#selectedSeats_small').find("path").css("opacity","0");
			$('#selectedSeats_small').find(".clicked").css("opacity","1");
		
			
	  });
	  


	 
	
	//다음단계 혹은 이전단계 
	  $('.stepBtn').on('click', function () {
		  isTempSeat = false;
		  //선택된 좌석들
		  var IsSeatSelect = $('#seat-map').find('.selected');
		 
		  //선택된 좌석이 있는지 확인, 없으면 알림창 띄워주기
		  if (IsSeatSelect.size() == 0){
			  alert("좌석 선택이 되지 않았습니다");
			  return;
		  }

		 
		  
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
			  $('#seatBtn').hide();
		  }
		  
		  if($(this).is($('.nextBtn'))){
			  if(curStep == 1){
				  //이전단계 버튼 활성화
				  if (isTempSeat){
					  $('#stepInfo').hide();
					  $('#seatBtn').show();
					  alert("이미 선택된 좌석 입니다.");
					  return;
				  }else{
					  $('#seat-map').find('.selected').each(function() {
						  
						  var str = $(this).attr('id');
						  var array = new Array(); 
						  array = str.split("_");
						  
						  $.ajax({
								type:"POST",
								url:"/ticket/tempTicketing",
								data:{
									"pfmIdx":${param.pfmIdx}
						             , "hallIdx" : ${param.hallIdx}
						             , "secName" : array[0]
						             , "seatRow" : array[1]
						             , "seatCol" : array[2]
									},
								dataType:"json",
								success:function(res){
								},
								error:function(e){
									console.log(e);
								}
							})
						  
					  });
					  
				  }
				  
				  $('#prevBtn').show();
				  $('#bookStep_2_tb').html("");
				  $('.wrap_ticket_info').show();
				  $('#step2and3').show();
				  getSeatInfo();
				 
			  } 
			  else if(curStep == 2){ // 현재 STEP 3 단계라면(=다음이 4단계)
					// '다음 단계' 버튼 비활성화
					$('.nextBtn').hide();
					$('#step2and3').show();
					$('#payment').show();
			
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
			  $('#payment').hide();
			  if(curStep == 2){ // 현재 STEP2 단계라면 ( =전환될 화면이 1단계)
					// '이전 단계' 버튼 비활성화
	
				  if (confirm("선택된 좌석정보가 취소됩니다.") == true){    //확인

				  
				  }else{   //취소
				      return;
				  }

					
					$('#stepInfo').hide();
					$('#prevBtn').hide();
					$('.wrap_ticket_info').hide();
					$('#step2and3').hide();
					$('#seatBtn').show();
					deletTemp();
					
				} else if(curStep == 3){ // 현재 STEP4 단계라면 ( =전환될 화면이 3단계)
					// '다음 단계' 버튼 활성화
					$('.nextBtn').show();
					$('#seatBtn').hide();
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
		 var cnt = $(".nth2_1").find("tr").size();
		 var reservationFee_1 = 1000;
		 var resultfee = reservationFee_1*cnt;
		 resultfee=resultfee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		 $('#reservationFee').text(resultfee);
	
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
	
	$('#copyDelvyAddr').change(function() {
	
		if($('#copyDelvyAddr').is(":checked")){
			//체크박스 체크
			$('#buyerName').val("${sessionScope.loginUser.name}");
			var phone = "${sessionScope.loginUser.phone}";
			var phone01;
			var phone02;
			var phone03;
			if(phone.length == 11){
				phone01 = phone.substring(0,3);	//전화번호1
				phone02 = phone.substring(3,7); //전화번호2
				phone03 = phone.substring(7,11);	//전화번호3
			} else if(phone.length == 10){
				phone01 = phone.substring(0,3);	//전화번호1
				phone02 = phone.substring(3,6); //전화번호2
				phone03 = phone.substring(6,10);	//전화번호3
			}
			$('#delvyTel1').val(phone01);
			$('#delvyTel2').val(phone02);
			$('#delvyTel3').val(phone03);
			$('#buyer_addr').val("${sessionScope.loginUser.addr}");
			$('#buyer_addr_detail').val("${sessionScope.loginUser.addrDetail}");
			$('#postCode').val("${sessionScope.loginUser.postcode}");
		}else{
			//체크박스 체크해제
			$('#buyerName').val("");
			$('#delvyTel1').val("");
			$('#delvyTel2').val("");
			$('#delvyTel3').val("");
			$('#buyer_addr').val("");
			$('#buyer_addr_detail').val("");
			$('#postCode').val("");
		}
		
	})
	
});
	  
	  //섹션 데이터 받아오기
	  function loadSectionData(obj){
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
// 				  var color = ['#D47D9A','#3E4982','#B1D275','#F2E9B5','#C5B3D1','#8A7676'];
				  var color = ['#04775b','#EDD88A','#DBDBC8','#1B1D2B','#BB7A5C','#83A563'];
				  var json = { };
				  var secName; 
				  for(var i=0;i<res.hashMap.secName.length;i++){
					  secName = res.hashMap.secName[i];
					  //json : 섹션 네임의 키값과 컬러값을 가지고 있다.
					  json[secName]=color[i];
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
								  path.data("pay",res.hashMap.secMap[i].secPay); //pay라는 임의의 커스텀 데이터를 넣어줌
								  path.data("secName",res.hashMap.secMap[i].oriSecName);
								  path.data("appName",res.hashMap.secMap[i].appSec);
								  path.data("IsSec",true);
							  }
							  
						  }
					
					}
					if(obj.is($('#selectedSeats'))){
						loadSectionInfo();
					}
					
					//구역 저장안했으면 클릭안되게
					$('.seat_block').find('path').each(function () {
						
							if(typeof $(this).data("IsSec") == "undefined"){
								$(this).css("display","none");
								var classStr = $(this).attr("class");
								var classStrArr = new Array();
								console.log(classStr);
								if(typeof classStr != "undefined"){
									classStrArr = classStr.split(" ");
									$('.seat_block').find('text').each(function () {
	 									var textVal = $.trim($(this).text());
	 									if( textVal == classStrArr[0]){
	 										$(this).css("display","none");
	 									}
	 								});
								}
							}
// 							
					})
					
					$('.seat_block').find('rect').each(function () {
						
						if(typeof $(this).data("IsSec") == "undefined"){
							
							$(this).css("display","none");
							var classStr = $(this).attr("class");
							var classStrArr = new Array();
							console.log(classStr);
							if(typeof classStr != "undefined"){
								classStrArr = classStr.split(" ");
								$('.seat_block').find('text').each(function () {
 									var textVal = $.trim($(this).text());
 									if( textVal == classStrArr[0]){
 										$(this).css("display","none");
 									}
 								});
							}
						}
						
					})
					
			  },
			  error:function(e){
				  console.log(e);
			  }
			  
		  })
		  
	  }
	  
		//세션 정보 클래스에 넣어주기
		function loadSectionInfo() {
			$.ajax({
				type:"get",
				url:"/ticket/secInfo",
				data:{
					"pfmIdx":${param.pfmIdx }
					  },
			    async: false,
				dataType:"json",
				success:function(res){
					for(var i=0;i<res.secInfo.length;i++){
						var findClass = res.secInfo[i].secName;
						$('#selectedSeats').find("."+findClass).addClass(res.secInfo[i].appSec);
						$('#selectedSeats').find("."+findClass).addClass(""+res.secInfo[i].secPay);
					}
					
					loadSectionPay();
				}
			});	
			
			
		}
		
//구역별 가격 받아오기		
function loadSectionPay(){
	$.ajax({
		type:"post",
		url:"/ticket/sectionPay",
		data:{
			"pfmIdx":${param.pfmIdx },
			  },
		dataType:"json",
		async: false,
		success:function(res){
			var appSec;
			var secPay;
			var color;
			var findclass;
			for(var i =0; i<res.seatSecPay.length;i++){
				appSec = res.seatSecPay[i].appSec;
				secPay = res.seatSecPay[i].secPay;
				findclass="."+appSec+"."+secPay;
				$('#selectedSeats').find('path').each(function () {
					if($(this).hasClass(appSec)){
						$('#legend2').append("<li><div class='payRect' style='background-color: "+$(this).css("fill")+";'></div>"+appSec+" 석 "+secPay+" 원"+"</li>");
						return false;
					}; 
					
				})
			}
		}
	});	
	
}
	 
// 좌석정보 2스탭 테이블에 뿌려주기
function getSeatInfo(){
	var cnt = new Array();
	  $('#seat-map').find('.selected').each(function() {
  		  
  		  var seat = $(this).attr('id');
  		  
  		  var seatArr = new Array();
  		  seatArr= seat.split("_");
  		  
  		  var str = $(this).attr('class');
  		  var array = new Array(); 
  		  array = str.split(" ");
//   		array[2] : 석 (R석 VIP 석 등등),
//			array[3] : 구역이름, 
//		    seatArr[0] : 좌석행, 
//          seatArr[1] : 좌석열, 
//          array[4] : 좌석 가격
  		  
  		  var seatInfo = new Array();
  		  seatInfo = $('#selected-seats').find("li").text().split("[cancel]"); //li에 저장된 좌석정보 가져오기
  		  
  		  
  		 //각 가격구역 마다 좌석 갯수 구하기
  		for (var j = 0 ; j<pfmSeatSection.length; j++){
				cnt[j] = 0; //0으로 초기화
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
		 var IsSeatSelect = $('#seat-map').find('.selected');
		  if (IsSeatSelect.size() != 0){
			  if(confirm("선택한 좌석 정보를 삭제하고 이동하시겠습니까?")){
		
			  }else{
				  return;
			  }
		  }
		  location.reload();
	}
	 
$(window).bind("beforeunload", function (e){
	 var IsSeatSelect = $('#seat-map').find('.selected');
	  
	  //선택된 좌석이 있는지 확인, 없으면 알림창 띄워주기
	  if (IsSeatSelect.size() == 0){
	  }

	  deletTemp();
});

function deletTemp(){
	
	  $('#seat-map').find('.selected').each(function() {
		  var str = $(this).attr('id');
		  var array = new Array(); 
		  array = str.split("_");
		 $.ajax({
				type:"POST",
				url:"/ticket/deleteTemp",
				async: false,
				data:{
					"pfmIdx":${param.pfmIdx}
		             , "hallIdx" : ${param.hallIdx}
		             , "secName" : array[0]
		             , "seatRow" : array[1]
		             , "seatCol" : array[2]
					},
				dataType:"json",
				success:function(res){
				},
				error:function(e){
					console.log(e);
				}
			})
	
	  });
	
}

	  
function tempSeatAdd(){
	  $('#seat-map').find('.selected').each(function() {
		  var str = $(this).attr('id');
		  var array = new Array(); 
		  array = str.split("_");
		  
		  $.ajax({
				type:"GET",
				url:"/ticket/tempTicketing",
				async: false,
				data:{
					"pfmIdx":${param.pfmIdx}
		             , "hallIdx" : ${param.hallIdx}
		             , "secName" : array[0]
		             , "seatRow" : array[1]
		             , "seatCol" : array[2]
					},
				dataType:"json",
				success:function(res){
					if (res.isTempSeat){
						isTempSeat = true;
					}
				},
				error:function(e){
					console.log(e);
				}
			})
	  });
}
	

</script>

<style type="text/css">
.progressbar {
	counter-reset: step;
    margin-top: 11px;
    margin-left: -139px;
    display: flex;
    width: 1000px;
}
.progressbar li {
	list-style-type: none;
	float:left;
	width: 300px;
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
	color: #F2B134; 
}
/* 활성화된 요소의 step 서클 */
.progressbar li.completeStep:before {
	content: '';
	background-image: url(/resources/image/checked.png);
	background-size: 28px 28px;
    background-position: -1px -1px;
	border-color: #F2B134; 
}
/* 활성화 된 요소에 연결된 progress 줄 색 변경*/
.progressbar li.completeStep + li:after {
     background-color: #F2B134; 
}

/*결제버튼*/
.btn_onestop {
    position: absolute;
    left: 18px;
    margin-top: 25px;
}
.btn_onestop span.button {
	float:left; 
}
.clicked {
 	stroke: #222; 
 	stroke-width: 25; 
 } 
 
 #userSelect {
    height: 110px;
    border: 1px solid #d8d8d8;
    border-radius: 3px;
    padding: 14px 12px;
    overflow: hidden;
    background: #fff;
 }
 
 #selectedSeatInfo>h3, #payInfo>h3 {
 	color: #565656;
 }
 #selectedSeatInfo {
    padding-top: 9px;
    margin-bottom: 38px;
 }
 
 #selectedSeats_small>#wrapper{
	 height: 10px;
	 width: 10px;
 }
 
 #payInfo h3 {
    margin-top: 13px;
 }
 #booking-detail {
    padding: 10px 20px;
    width: 332px;
    height: 684px;
    position: absolute;
    left: 715px;
    top: 18px;
    background: #f9f9f9;
 }
 
 #booking-detail h3 {
     font-size: 20px;
 }
 
 /*가격정보 네모*/
 .payRect{
	 margin-right: 10px; 
	 margin-bottom: -5px; 
	 margin-top: 2px;
	 display: inline-block; 
	 height:22px; 
	 width:22px;
 }
 
 #legend2{
    list-style: none;
    padding: 5px 10px;
    background: #fff;
    border: 1px solid #d8d8d8;	
 }
 
 #legend2 li {
 	margin-bottom: 2px;
 }
 #totalPrice {
 	font-size:24px; 
 	color:#565656; 
 	display:inline
 }
 /*다음단계*/
 #seatBtn{
    width: 294px !important;
    background-color: #F2B134;
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius: 3px;
    color: #FFF !important;
    border: none !important;
    margin-top: 15px;
 }
 /* 다음단계버튼 hover*/
 #seatBtn:hover{
 background-color: #e6a03b;
}

/*좌석도 전체보기 버튼*/
#seatAllViewBtn{
    width: 293px;
    background-color: #fff;
    padding: 5px;
    font-size: 14px;
    line-height: 1.3333333;
    border-radius: 1px;
    color: #717171;
    border: 1px solid #bebebe;
}

/*좌석도 전체보기 버튼 hover*/
 #seatAllViewBtn:hover{
	border: 1px solid #d8d8d8;
	background-color: #f4f4f4;
}

::-webkit-scrollbar {
      width: 15px;
} /* this targets the default scrollbar (compulsory) */
::-webkit-scrollbar-track {
      background-color: #F2B134;
} /* the new scrollbar will have a flat appearance with the set background color */
 
::-webkit-scrollbar-thumb {
      background-color: rgba(0, 0, 0, 0.1); 
} /* this will style the thumb, ignoring the track */
 
::-webkit-scrollbar-button {
      background-color: #F2B134;
} /* optionally, you can style the top and the bottom buttons (left and right for horizontal bars) */
 
::-webkit-scrollbar-corner {
      background-color: #F2B134;
}
 
#selected-seats{
	padding-left: 4px;
    list-style: none;
    font-size: 15px;
    color: #333333;
}

/*티켓정보*/
.wrap_ticket_info{
    position: absolute !important;
    width: 269px !important;
    padding: 14px 10px 14px 13px; 
    height: 647px;
    left: 814px ;
    top: 24px;
    float: none !important;
    background: #f9f9f9;
}


.nth2_1{
	list-style: none;
	margin-left: -35px !important;
}

#bookStep_2, #bookStep_3{
    width: 760px;
    padding: 50px 50px 50px 55px;
    margin-left: -30px;
    margin-top: 21px;
    border: 1px solid #d6d6d6;
}
#bookStep_3 {
	display: flex;
}

.logo_onestop {
	height: 59px !important;
	margin-top: 0px !important; 
}
.logo_onestop img {
	margin-left: -50px;
    height: 58px;
}

/*스탭버튼*/
.stepBtn{
    width: 113px !important;
    background-color: #FFF;
    padding: 10px 16px;
    font-size: 15px;
    line-height: 1.3333333;
/*     border-radius: 6px; */
    color: #F2B134 !important;
    font-weight: bold;
    border: 1.5px solid #F2B134;
}

.stepBtn:hover{
  background-color: #F2B134;
  color: #fff !important;
}
.box_info:first-child{
	padding-top: 5px !important;
}

.select_tit{
    font-size: 20px;
    margin-top: -12px;
}

.tit_receipt{
    font-size: 20px !important;
    margin-left: -16px !important;
}

.btn_onestop .button.btNext {
/*     border: 1px solid #FFF !important; */
    background: #FFF !important;
}

#allDiv{
    padding: 70px;
    padding-left: 73px;
    padding-top: 20px;
}

#selectedSeats{
   float: left;
    width: 594px;
    padding-left: -9px;
    padding-top: -6px;
    padding-bottom: 20px;
    position: absolute;
    top: 73px;
}

#detailStep {
	float: left;
}

/*결제하기버튼*/
#payment{
  	width: 113px !important;
    background-color: #F2B134;
    padding: 10px 16px;
    font-size: 15px;
    line-height: 1.3333333;
    color: #ffffff !important;
    border: 1.5px solid #F2B134;
    font-weight: bold;
}
#payment:hover{
 background-color: #F2B134;
  color: #fff !important;
}

#pfmNameInfo{
    font-size: 20px;
}

#pfmNameInfo span{
    margin-left: 10px; 
}

#pfmNameDateInfoDiv{
    float: left;
    padding-bottom: 7px;
    border-bottom: 1px solid #BCBC !important;
    margin-left: -37px !important;
    width: 649px !important;
    margin-bottom: 15px;
}

svg > text:hover{
	cursor: pointer;
}

svg > path:hover{
	cursor: pointer;
}

svg > rect:hover{
	cursor: pointer;
}
</style>
</head>
<body>
<div id = allDiv>
<div id ="stepInfo">
<ul class="progressbar"">
	<li id="step-1" class='inProgress'>좌석선택</li>
	<li id="step-2">가격/수령방법</li>
	<li id="step-3">결제방법</li>
</ul>
</div>
<!-- STEP 1. 좌석선택 -->
<div id ="bookStep_1">
<div>
	<div id = "pfmNameDateInfoDiv" style="width: 611px;">
		<div id ="pfmNameInfo" style="display: inline;"><b>좌석 선택</b> <span> ${param.name}</span></div>
		<div id ="pfmDateInfo" style="display: inline; float: right; font-size: 16px;">
		${param.date} ${param.time}
		</div>
	</div>
	<br>
	<div id = "selectedSeats"></div>
</div>
	<div id="booking-detail">
	<div id="selectedSeats_small"></div> 
	<button id = "seatAllViewBtn" onclick="seatAllView()">좌석도 전체보기</button>
	
	<div id ="selectedSeatInfo">
	<h3>선택된 좌석 (<span id="counter">0</span>)</h3>
	<div id = "userSelect">
		<div class="allScreen"></div>
		<table id="selected-seats"></table>
		
<!-- 		<div id="legend"></div> -->
	</div>
	<div id ="payInfo">
		<!-- 좌석별 가격표 -->
		<h3>좌석등급/가격</h3>
		<ul id ="legend2">
		
		</ul>
	</div>	

	</div>
	
	<div id="totalPrice">총 결제금액 : </div> 
	<b style="font-size: 25px"><span id="total">0</span> 원</b><br>

	<button id = "seatBtn" class="stepBtn nextBtn">다음단계</button>
	</div>

</div>
<!-- STEP 1. 좌석선택 -->

<!-- 전체 묶음 DIV -->
<div id = "step2and3" style="display:none;">
<div class="wrap_ticket_info">
		<h2 class="logo_onestop">
			<a href="#none"><img src="/resources/image/bananalogo2.png" alt="바나나 티켓"></a>
		</h2>
		<div class="box_info">
		<h3 class="select_tit select_t txt_prod_name" title="공연제목">${param.name}</h3>
			<div class="box_ticket">
				<ul class="box_ticket_list" style="list-style: none;    margin: 16px -29px;
    font-size: 13px;
    line-height: 24px;">
					<li class="nth nth1 txt_prod_schedule" style="border-bottom: 1px solid #eeeeee;
    width: 205px; text-align: center; font-size: 15px;">${param.date} <br> ${param.time}</li>
					<li class="nth nth2 txt_ticket_info">
						<table class ="nth nth2_1">
						</table>
					</li>
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
<!-- 					<a href="javascript: goPrevPage();" class="btnOne">이전</a> -->
					<button id = "prevBtn" class="btnOne stepBtn">이전단계</button>
				</span> 
				<span class="button btNext">
					<button class="nextBtn btnOne stepBtn">다음단계</button>
					<button class="btnOne" id="payment" style="display: none">결제하기</button>
				</span>
	

	
	</div>
</div>
</div>


<div id="detailStep">

	<!-- STEP 2. 가격/수령방법 -->
	<div id ="bookStep_2" style=" display: none;">
		<table id ="bookStep_2_tb" class="table">
		</table>
		<h3 class="select_tit">수령방법을 선택하세요</h3>
		<hr style="margin-top: 0px; margin-bottom: 0px;">
		<ul class="list_receipt_how" id="partDeliveryType" style="">
			<li id="delvyType02">
			<label>
			<input type="radio"id="delvyTypeCode02" name="delvyTypeCode" value="DV02" onclick="setDeliveryType(this.value);"
						class="radio_delvy_type" title="현장수령" checked>
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

	<div class="box_info_use box_gray" style="background-color: #FFF">
	<!-- 현장수령 선택시-->
		<h3 class="tit_receipt">주문자정보</h3>
		<hr style="margin-top: 0px; margin-bottom: 0px;">
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
					<tr  style="line-height: 22px;">
						<th class="txt_gray" style="width: 70px;" id="labUserName">이름<span class="require">*</span></th>
						<td>
							<div class="wrap_form_input">
								<input type="text" name="buyerName" id="buyer_name"
									class="inputType inp_txt inp_w77" style="width: 90px;" >
							</div>
						</td>
						<th class="txt_gray" style="width: 120px; padding-left: 18px;">연락처<span class="require">*</span></th>
						<td>
							<div class="wrap_form_input">
							<input type="text" name="buyer_tel" id="buyer_tel"
									class="inputType inp_txt inp_w150" value="" placeholder="'-' 없이 입력해주세요">
							</div>
						</td>
						</tr>
						<tr  style="line-height: 22px;">
						<th class="txt_gray" style="width: 110px; padding-left: 0px; padding-bottom: 20px;">이메일<span class="require">*</span></th>
						<td>
							<div class="wrap_form_input" style="height: 46px;">
								<!-- form wrapper -->
								<input type="text" name="email" id="buyer_email"
									class="inputType inp_txt inp_w150" value="" style="width: 176px;"> <label
									for="email" class="place_holder"></label>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="txt_more txt_gray">입력하신 이메일로 예매확인 내역을 보내드립니다.</p>
		</div>
	</div>
	<div class="box_location box_gray" id="part_delivery_info" style="display: none; background-color: #FFF">
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
					<tr style="line-height: 22px;">
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
										class="inputType inp_txt inp_w60" value="" maxlength="4" style="width: 55px;">
									<input type="text" name="delvyTel2" id="delvyTel2"
										class="inputType inp_txt inp_w60" value="" maxlength="4" style="width: 55px;">
									<input type="text" name="delvyTel3" id="delvyTel3"
										class="inputType inp_txt inp_w60" value="" maxlength="4" style="width: 55px;">
									<label for="delvyTel" class="place_holder"></label>
								</div>
							</td>
						</tr>
						<tr style="line-height: 22px;">
							<th class="txt_gray txt_top"  rowspan="3">주소<span
								class="require">*</span></th>
							<td colspan="3">
									<input type="text" name="postCode"
									id="postCode" class="inputType inp_txt inp_l2" value="" style="width: 95px;"> 
								<button type="button" class="box_inp_btn" id="btnSearchAddress" onclick="openZipSearch()">우편번호</button>
							</td>
						</tr>
						<tr  style="line-height: 22px;">
							<td colspan="3" class="td_pd"><span class="wrap_form_input">
									<!-- form wrapper -->
									<input type="text" name="delvyAddr"
									id="buyer_addr" class="inputType inp_txt inp_l2" value=""
									style="margin-bottom: 6px;"> <label for="delvyAddr"
									class="place_holder"></label>
							</span> 
							</td>
						</tr>
						<tr  style="line-height: 22px;">
							<td colspan="3" class="td_pd"><span class="wrap_form_input">
									<!-- form wrapper -->
									<input type="text" name="delvyAddrDetail"
									id="buyer_addr_detail" class="inputType inp_txt inp_l2" value=""
									> <label for="delvyAddrDetail"
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

</div> 
<!-- AllDiv 끝 -->
</body>
</html>