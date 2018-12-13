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

.familyImg {
	width: 250px;
	height: 300px;
	margin: 5px;
}

.themeList {
	margin: 5px;
	text-align: center;
}
</style>
<div class="container">
	<!-- 관리자가 선택한 콘서트 상단 배너 15개 -->
	<!-- 슬라이드 추가하기 -->
	<h3>가족&아동</h3>
	<c:forEach items="${topBanList }" var="topList">
	<span class="thumImg">
		<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
			<img class="familyImg" src="/resources/image/${topList.originName}" />
		</a>
<%-- 		<strong>${topList.name }</strong> --%>
	</span>
	</c:forEach>
	
	<hr>
	<!-- 테마 리스트, 클릭시 해당 테마의 포스터만 확인가능하도록 수정 -->
	<c:forEach items="${themeList }" var="themeList">
		<span class="themeList">
			<button class="themeBtn" name="${themeList.themeIdx }" style="border: none; background-color: #FFFFFF;">
				${themeList.themeName }
			</button>
		</span>
	</c:forEach><br>
		
	<!-- 포스터 전체 리스트 출력 -->
	<c:forEach items="${posterList }" var="list">
	<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
	<button class="imgDetailInfo" style="border: none; background-color: #FFFFFF;">
	<span class="thumImg">
		<img class="familyImg" src="/resources/image/${list.originName}" /><br>
		<strong>${list.name }</strong>
	</span>
	</button>
	</a>
	</c:forEach>
	
	<!-- 무한스크롤 추가하기 -->
</div>
