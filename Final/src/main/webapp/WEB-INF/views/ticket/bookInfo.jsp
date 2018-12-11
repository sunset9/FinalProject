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
	  
	  function selectableDays(date) { 
		  dummy = 
		  date.getFullYear() + "-" 
		  + (date.getMonth() + 1) + "-" 
		  + date.getDate(); 
		  if ($.inArray(dummy, enableDay) > -1)
		  { return [true, ""]; } 
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
					data:{},
					dataType:"json",
					success:function(res){
						for(var i =0;i<res.hashMap.timeslist.length;i++){
							var date= new Date(res.hashMap.timeslist[i].pfmDate);
					
							var dateStr = date.getFullYear() + "-" + (date.getMonth()+1) +"-"+ date.getDate();
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
	  obj.css("border","2px solid cyan");
  }
  
  function leavem(obj) {
	  obj.css("border","1px solid #BCBCBC");
  }
  
  function downm(obj) {
	  var finds = $('#timeList').find("li");
	  for(var i =0;i<finds.length;i++){
		  var findsId = finds[i].id;
		  var id = '#'+findsId;
		  if(findsId==obj.attr("id")){
			  $(id).css("background-color",'yellow');
			  $(id).attr("class","list-group-item times selected");
		  }else{	
			  $(id).css("background-color",'white');
			  $(id).attr("class","list-group-item times non_selected");
		  } 
	  }
  }
  
  
  $(document).ready(function () {
  $('#bookBtn').click(function() {
	  

		  var date = new Date($('#datepicker').datepicker( "getDate" ));
			var dateStr = date.getFullYear() + "-" + (date.getMonth()+1) +"-"+ date.getDate();
		  $(this).attr("data-date",dateStr);
		  
		  var selectDate = $(this).data("date");
		  var time = $('#timeList').find(".selected").html();
		  
		  
		  $("#dates").text(selectDate+' '+time);

		$.ajax({
			type:"get",
			url:"/ticket/seatSection",
			data:{},
			dataType:"html",
			success:function(res){
			$('#selectedSeats').html(res);
// 			$('#legend').html('');
			
			}
		});	
	  
	});
	
});
  
  
  </script>
<style type="text/css">
.times{
    width: 249px;
    height: 59px;
    font-size: 19px;
  }
</style>
</head>
<body>
<div>
	<div id = "datepicker" style="float: left"></div>
	
	<div id = "timeDiv" style="float: left;">
		<ul id = "timeList" class="list-group">
		</ul>
	</div>
	
	<div style="float: left;">여기 잔여석 나올공간~</div>
	
	<div style="float: left;">
		<!-- Button trigger modal -->
		<button type="button" id ="bookBtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
		  예매하기
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content" style="    width: 900px; height: 700px;">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">좌석선택  공연이름넣어주기</h4>
		        <span id= "dates"></span>
		      </div>
		      <div class="modal-body" style="height: 560px;">
		        <div id = "selectedSeats" style="float: left; width: 650px; " ></div>
				<div class="booking-details"style="float: right">
		            <h2>Booking Details</h2>
		            <h3>
		               Selected Seats (<span id="counter">0</span>):
		            </h3>
		            <div class="allScreen"></div>
		            <ul id="selected-seats"></ul>
		
		            Total: <b>$<span id="total">0</span></b>
		
		            <button class="checkout-button">Checkout &raquo;</button>
		
		            <div id="legend"></div>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</div>


</body>
</html>