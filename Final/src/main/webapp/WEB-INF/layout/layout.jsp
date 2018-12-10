<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(document).ready(function() {
		// 검색
		$("#btnSearch").click(function() {
			$(location).attr("href", "/ticket/ticketsearch");
		});
	});
</script>

<style type="text/css">
/* 모든 페이지에 적용되는 스타일 */
#searchBox {
	margin-top: 10px;
	margin-left: 10px;
}

.maintext {
	margin-left: 10px;
}

.top_menu, .tap_menu {
	display: inline-block;
}

.top_menu ul, .tap_menu ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.logo_text {
	display: inline-block;
}

.top_menu ul>li, .tap_menu ul>li {
	margin: 0 5px 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}
</style>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	/* 모든 페이지에 적용되는 자바스크립트 */
</script>

</head>
<body>

	<!-- HEADER -->
	<tiles:insertAttribute name="header" />

	<!-- BODY -->
	<div class="wrap">
		<tiles:insertAttribute name="body" />
	</div>

	<!-- FOOTER -->
	<tiles:insertAttribute name="footer" />

</body>
</html>
















