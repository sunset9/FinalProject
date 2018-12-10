<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	  //활성화 시킬 날짜들 (DB에서 읽어오면 될듯?)
	  var enableDay = ['2018-12-10','2018-12-11']; 
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
		  language: "kr"
	  });

	  });
  
  $(document).ready(function () {
  })
  
  </script>

</head>
<body>
<div id = "datepicker">

</div>
</body>
</html>