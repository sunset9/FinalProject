<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	$(document).ready(function() {
		// 상세페이지로 이동
		$("#imgDetailInfo").click(function() {
			// 주소 수정하기
			$(location).attr("href", "/ticket/pfmdetail");
		});
	});
</script>

<style>
.container {
	margin-bottom: 20px;
}

#concertImg {
	width: 250px;
	height: 300px;
}

#themeList {
	margin: 5px;
	text-align: center;
}

#concertList {
	margin: 10px;
	width: 200px;
	float: left;
	text-align: center;
}
</style>
<div class="container">
	<div id="themeList">
		<c:forEach items="${themeList }" var="list">
			${list.themeName }
		</c:forEach>
	</div>
	
	<c:forEach items="${posterList }" var="list">
	<div id="concertList">
			<button id="imgDetailInfo" type="submit" style="border: none; background-color: #FFFFFF;">
				<img id="concertImg" src="/resources/image/${list.originName}" />
			</button><br>
	</div>
	</c:forEach>
</div>
