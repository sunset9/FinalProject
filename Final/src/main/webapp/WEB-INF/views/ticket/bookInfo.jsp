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
	    	  
	    	  var times = ${times};
	    	  console.log(times);
	    	  for(var i =0;i<times.length;i++){
	    		  
// 	    		  if(times[i] == date){
	    			  
	    			  
// 	    		  }
	    		  
	    	  }
		    		  
	    	  
	       }
	  });

	  });
  
  </script>

</head>
<body>
<div id = "datepicker">
<div id = "timeDiv">
<ul id = "timeList">
	<c:forEach items="${times}" var = "times">
	<c:if test=""></c:if>
		<li>${times.pfmTime}</li>
	</c:forEach>
</ul>
</div>

</div>
</body>
</html>