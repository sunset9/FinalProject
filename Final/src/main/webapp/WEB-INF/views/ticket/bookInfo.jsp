<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- DATEPICKER -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
								$("#timeList").append("<li class='list-group-item times' onmouseover='overm($(this))' onmouseleave='leavem($(this))'>"+time+"</li>");
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
	  obj.css("background-color","yellow");
  }
  
  function leavem(obj) {
	  obj.css("background-color","white");
  }
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
</div>


</body>
</html>