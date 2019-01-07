<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
  $( function() {
	  //활성화 시킬 날짜들
	  var enableDay = ${dates};
	  var enableDays = new Array();
	  for(var i =0;i < enableDay.length;i++){
		  enableDays.push(enableDay[i]);
	  }
	  function selectableDays(date) { 
		  
		  var year = date.getFullYear();
		  var month = (date.getMonth() + 1);
		  var day = date.getDate();
		  
		  if(month < 9){
			  month ="0"+month;
		  }
		  
		  if(day < 10){
			  day = "0"+day;
		  }
		  
		  dummy = year + "-" + month + "-" + day; 
		
		  if ($.inArray(dummy,enableDays) > -1)
		  { 
			  return [true, ""]; 
		  } 
		  
		  return [false, ""]; 
	  	} 
	 	
	  $("#datepicker").datepicker({ 
		  dateFormat: 'yy-mm-dd', 
		  beforeShowDay: selectableDays,
		  todayHighlight: true,
		  autoclose: true,
		  language: "kr",
	      onSelect: function (dateText, inst) {

	    	  $("#timeList").html("");
	    	  
				$.ajax({
					type:"GET",
					url:"/ticket/bookTimeInfo",
					data:{
						"pfmIdx":${pfm.pfmIdx}
						},
					dataType:"json",
					success:function(res){
						for(var i =0;i<res.hashMap.timeslist.length;i++){
							var date= new Date(res.hashMap.timeslist[i].pfmDate);
							  var year = date.getFullYear();
							  var month = (date.getMonth() + 1);
							  var day = date.getDate();
							  
							  if(month < 9){
								  month ="0"+month;
							  }
							  
							  if(day < 10){
								  day = "0"+day;
							  }
							  
							var dateStr = year + "-" + month +"-"+ day;
							if(dateStr==dateText){
								var time = res.hashMap.timeslist[i].pfmTime;
								$("#timeList").append("<li id='times_"+i+"' class='list-group-item times' onmouseover='overm($(this))' onmouseleave='leavem($(this))' onmousedown='downm($(this))'>"+time+"</li>");
							}
						}
					},
					error:function(e){
						console.log(e);
					}
				})
	       }
	  });
	  });
  function overm(obj) {
	  obj.css("border","2px solid #fddf48");
  }
  
  function leavem(obj) {
	  obj.css("border","0px solid #BCBCBC");
  }
  
  function downm(obj) {
	  var finds = $('#timeList').find("li");
	  for(var i =0;i<finds.length;i++){
		  var findsId = finds[i].id;
		  var id = '#'+findsId;
		  if(findsId==obj.attr("id")){
// 			  $(id).css("background-color",'yellow');
			  $(id).attr("class","list-group-item times selected");
		  }else{	
// 			  $(id).css("background-color",'white');
			  $(id).attr("class","list-group-item times non_selected");
		  } 
	  }
	  
	  //ajax 작동
	  
	  console.log($("#datepicker").val());
	  console.log(obj.text());
	  
		$.ajax({
			type:"POST",
			url:"/ticket/cntBookedSeats",
			data:{
				"pfmIdx":${pfm.pfmIdx}
		        ,"hallIdx":${pfm.hallIdx}
				, "date" : $("#datepicker").val()
				, "time" : obj.text()
				},
			dataType:"json",
			success:function(res){
				$('#ResidualSeatList').html("");
				
				console.log(res.hashMap.allSeats.length);
				console.log(res.hashMap.BookedSeats.length);
				for(var i =0;i<res.hashMap.allSeats.length;i++){ //전체좌석
					var pay = res.hashMap.allSeats[i].secPay;
					pay = pay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					if (res.hashMap.BookedSeats.length > 0){//예매된 좌석이 있을경우
						for(var j=0;j<res.hashMap.BookedSeats.length;j++){
							if(res.hashMap.allSeats[i].appSec == res.hashMap.BookedSeats[j].appSec){
								var ResidualSeat = res.hashMap.allSeats[i].cnt - res.hashMap.BookedSeats[j].cnt;
								$('#ResidualSeatList').append("<li>"+ res.hashMap.allSeats[i].appSec + " 석 "+" "+pay+"원 "+ ResidualSeat +" 석</li>");
								
							}else{
								$('#ResidualSeatList').append(
										"<li>"+ res.hashMap.allSeats[i].appSec 
										+ " 석 "+" "+pay+"원 "+ res.hashMap.allSeats[i].cnt +" 석</li>"
										
										
								);
							}
						}
					}else{//예매된 좌석이 없을경우
						$('#ResidualSeatList').append(
								"<li>"+ res.hashMap.allSeats[i].appSec 
								+ " 석 "+" "+pay+"원 "+ res.hashMap.allSeats[i].cnt +" 석</li>"
						);
					}
				
				}
				
			},
			error:function(e){
				console.log(e);
			}
		})
	  
  }
  
  $(document).ready(function () {
	  
	  //예매하기버튼 클릭
	  $('#bookBtn').click(function() {
		  
			  var date = new Date($('#datepicker').datepicker( "getDate" ));
			  var dateStr = date.getFullYear() + "-" + (date.getMonth()+1) +"-"+ date.getDate();
			  $(this).attr("data-date",dateStr);
			  
			  var selectDate = $(this).data("date");
			  var time = $('#timeList').find(".selected").html();
			  
			  if ((selectDate == undefined) || (time == undefined)){
				  alert('공연날짜,공연시간을 제대로 선택해주세요');
				  return;
			  }
			  var path = "/ticket/book?date="+selectDate+"&"+"time="+time+"&pfmIdx="+${pfm.pfmIdx}+"&hallIdx="+${pfm.hallIdx}+"&name="+"${pfm.name}";
			  window.open(path, "_blank", "width=1400,height=700");
		});


	  
	  

	  
	
});
  
  
  </script>
<style type="text/css">
.times{
     width: 350px;
    height: 59px;
    font-size: 19px;
    text-align: center;
    background-color: #fff;
    border: 1px solid #fddf48;
    color: #666;
  }
  
</style>
</head>
<body>
<div id = "ticketInfo">
<div id = "infoTitle" style="float: top"> 
<ul class="nav nav-pills" style="font-size: 27px;text-align: center;">
  <li role="presentation" style="width: 240px;">날짜선택</li>
  <li role="presentation" style="width: 372px;">시간선택</li>
  <li role="presentation" style="width: 250px;">잔여석</li>
</ul>
</div>
<div id = "info" style="float: bottom">
	<div id = "datepicker" style="float: left"></div>
	
	<div id = "timeDiv" style="float: left; width: 372px; padding-left: 20px;">
		<ul id = "timeList" class="list-group">
		</ul>
	</div>
	
	<div id = "ResidualSeats" style="float: left; width:250px; padding-left: 20px;">
		<ul id ="ResidualSeatList">
		</ul>
	</div>
	
	<div style="float: left; margin-top: 163px;">
		<button type="button" id ="bookBtn" class="btn btn-primary btn-lg" style="width: 300px;">
		  예매하기
		</button>
		</div>
</div>

</div>
<!-- <a href="" target="_blank"></a> -->


</body>
</html>