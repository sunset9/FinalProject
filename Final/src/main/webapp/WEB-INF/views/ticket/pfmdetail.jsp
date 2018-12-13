<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	$(document).ready(function() {
		$("#rnb").click(function() {
			
		});
	});
</script>

<style>
.container {
	margin: 0 5% 10px 5%;
}

.posterImgDiv {
	float: left;
/* 	margin: 10px 0 10px 0; */
}

.choicePosterImg {
	width: 250px;
	height: 300px;
}

.posterInfoDiv {
	float: left;
/* 	margin: 10px 0 10px 20px; */
}
</style>

<div class="container">
	<div class="topDiv">
	<div class="posterImgDiv">
		<img class="choicePosterImg" src="/resources/image/${posterList.originName}" />
	</div>
	
	<div class="posterInfoDiv">
		<h1>${pfmInfoList.name }</h1>
		<h5>관람시간 : ${pfmInfoList.runningTime }시간</h5>
	</div>
	</div>
</div>