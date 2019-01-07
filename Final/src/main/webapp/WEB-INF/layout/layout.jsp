<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 모든 페이지에 적용되는 스타일 */
#searchBox {
	margin-top: 10px;
	margin-left: 10px;
}

.maintext {
	margin-left: 10px;
}

/* .tap_menu ul { */
/* 	list-style: none; */
/* 	margin: 0; */
/* 	padding: 0; */
/* } */


.main_wrapper{
	width: 1160px;
	margin: 0 auto;
}
</style>

 <!-- jQuery 2.2.4 --> 
<!-- <script type="text/javascript" -->
<!-- 	src="http://code.jquery.com/jquery-2.2.4.min.js"></script> -->
 <!-- jQuery UI --> 
<!-- <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script> -->
 <!-- 부트스트랩 3.3.2 --> 
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

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
	/* 모든 페이지에 적용되는 자바스크립트 */
	$(document).ready(function() {
		// 검색
		$("#btn_top_search").click(function() {
			var top_searchh = $('#top_searchh').val();
			console.log("검색어 확인 : " + top_searchh);
			
// 			$("#btn_top_search").submit();
			
			$(location).attr("href", "/ticket/ticketsearch");
		});
	});
</script>

</head>
<body>

	<!-- HEADER -->
	<tiles:insertAttribute name="header" />

	<!-- BODY -->
	<div class="content-wrap">
		<tiles:insertAttribute name="body" />
	</div>

	<!-- FOOTER -->
	<tiles:insertAttribute name="footer" />

</body>
</html>
















