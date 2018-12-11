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

</style>
<div class="container">
	<!-- 관리자가 선택한 뮤지컬&공연 상단 배너 15개 -->
	<!-- 슬라이드 추가하기 -->
	<h3>뮤지컬&공연</h3>
	<div class="conTopBanner">
		<c:forEach items="${topBanList }" var="topList">
			<a href="#"><img id="concertImg" src="/resources/image/${topList.originName}" /></a>
		</c:forEach>
	</div>
	
	<hr>
	<!-- 테마 리스트, 클릭시 해당 테마의 포스터만 확인가능하도록 수정 -->
	<div class="themeList">
		<c:forEach items="${themeList }" var="list">
			<button name="${list.themeName }" style="border: none; background-color: #FFFFFF;">
				${list.themeName }
			</button>
		</c:forEach>
	</div>
		
	<!-- 포스터 전체 리스트 출력 -->
<%-- 	<c:forEach items="${posterList }" var="list"> --%>
<!-- 	<div class="concertList"> -->
<!-- 			<button id="imgDetailInfo" type="submit" style="border: none; background-color: #FFFFFF;"> -->
<%-- 				<img id="concertImg" src="/resources/image/${list.originName}" /> --%>
<!-- 			</button><br> -->
<!-- 	</div> -->
<%-- 	</c:forEach> --%>
	
	<!-- 무한스크롤 추가하기 -->
</div>
