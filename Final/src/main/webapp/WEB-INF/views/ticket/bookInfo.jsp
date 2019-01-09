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
	  obj.css("border","2px solid #F2B134");
	  obj.css("color","#F2B134");
  }
  
  function leavem(obj) {
	  obj.css("border-top"," 0px solid #f6f6f6");
	  obj.css("border-left","0px solid #f6f6f6");
	  obj.css("border-right","0px solid #f6f6f6");
	  obj.css("border-bottom","3px solid #f6f6f6");
	  obj.css("color","#666");
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
				for(var i =0;i<res.hashMap.allSeats.length;i++){ //전체좌석
					var pay = res.hashMap.allSeats[i].secPay;
					pay = pay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					if (res.hashMap.BookedSeats.length > 0){//예매된 좌석이 있을경우
						for(var j=0;j<res.hashMap.BookedSeats.length;j++){
							if(res.hashMap.allSeats[i].appSec == res.hashMap.BookedSeats[j].appSec){
								var ResidualSeat = res.hashMap.allSeats[i].cnt - res.hashMap.BookedSeats[j].cnt;
								$('#ResidualSeatList').append("<li><table class='table'><tr><td style='width:20%'>"+ res.hashMap.allSeats[i].appSec + " 석</td> <td style='width:30%; text-align: right;'>"+" "+pay+"원 </td> <td style='width: 20%; text-align: right;'>"+ ResidualSeat +" 석</td></tr></table></li>");
								
							}else{
								$('#ResidualSeatList').append(
										"<li><table class='table'><tr><td style='width:20%'>"+ res.hashMap.allSeats[i].appSec 
										+ " 석 </td> <td style='width:30%; text-align: right;'>"+" "+pay+"원 </td> <td style='width:20%;  text-align: right;'>"+ res.hashMap.allSeats[i].cnt +" 석</td></tr></table></li>"
										
										
								);
							}
						}
					}else{//예매된 좌석이 없을경우
						$('#ResidualSeatList').append(
								"<li><table class='table'><tr><td style='width:20%;'>"+ res.hashMap.allSeats[i].appSec 
								+ " 석</td> <td style='width:30%; text-align: right;'> "+" "+pay+"원 </td> <td style='width:20%; text-align: right;'>"+ res.hashMap.allSeats[i].cnt +" 석</td></tr></table></li>"
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
			  var userwidth = screen.width - 550;
			  var userheight = screen.height - 170;
			  
			  
			  window.open(path, "_blank", "width="+userwidth+",height="+userheight);
// 			  window.open(path, "_blank", "width=1150px,height=750px");

		});


	  
	  

	  
	
});
  
  
  </script>
<style type="text/css">
.table{
	margin-bottom: 1px !important;
}
.selected{
	 border: 2px solid #3E4982 !important;
	 color: #F2B134 !important;
    margin-bottom: 0px !important;
}
.times{
    width: 110%;
    height: 59px;
    font-size: 19px;
    text-align: center;
    background-color: #fff;
    border-top: 0px solid #f6f6f6;
    border-left: 0px solid #f6f6f6;
    border-right: 0px solid #f6f6f6;
    border-bottom: 3px solid #f6f6f6;
    color: #666;
  }
  

.list-group{
    -webkit-box-shadow: 0 0px 0px rgba(0,0,0,.075) !important;
    /* border-radius: 4px; */
    box-shadow: 0 0px 0px rgba(0,0,0,.075);
}

#bookBtn{
   width: 300px;
   background-color: #FFF;
   padding: 10px 16px;
   font-size: 18px;
   line-height: 1.3333333;
   border-radius: 6px;
   color: #F2B134;
   border: 2px solid #F2B134;
   margin-left: 15px;
}

#bookBtn:hover{
 background-color: #F2B134;
  color: #fff;
}
.ui-widget.ui-widget-content {
    border: 1px solid #F2B134;
}
.ui-datepicker{ 
	font-size: 14px;
    width: 100%;
    height: 100%;
    color: #F2B134;
    background: 1px solid #F2B134; 
}

.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {
    border: 1px solid #F2b134;
    background: #eed0988a;
    font-weight: normal;
    color: #454545;
}

.ui-widget-header {
    border: 1px solid #f9e8e8;
    background: #f2b134;
    color: #333333;
    font-weight: bold;
}
  
</style>
</head>
<body>
<div id = "ticketInfo">
<div id = "infoTitle" style="float: top"> 
<ul class="nav nav-pills" style="font-size: 27px;text-align: center;">
  <li role="presentation" style="width: 40%; color:#F2B134 ">날짜선택</li>
  <li role="presentation" style="width: 30%; color:#F2B134 ">시간선택</li>
  <li role="presentation" style="width: 29%; color:#F2B134 ">잔여석</li>
</ul>
</div>
<div id = "info" style="float: bottom">
	<div id = "datepicker" 
	style="float: left;
    width: 30%;">
    </div>
	
	<div id = "timeDiv" style="float: left; width: 40%;">
		<ul id = "timeList" class="list-group">
		</ul>
	</div>
	<div style="float: left;
    width: 30%;
    padding-left: 20px;">
		<div id = "ResidualSeats" 
		style="overflow: auto; float: left; width:300px; padding-left: 20px; height: 160px;">
			<ul id ="ResidualSeatList" style="padding:0px; width: 100%;">
			</ul>
		</div>
		<button type="button" id ="bookBtn" style="width: 300px;">
		  예매하기
		</button>
	</div>
</div>

</div>
<!-- <a href="" target="_blank"></a> -->


</body>
</html>