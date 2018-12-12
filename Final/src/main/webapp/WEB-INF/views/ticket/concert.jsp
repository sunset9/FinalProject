<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	$(document).ready(function() {
		$("#rnb").click(function() {
// 			 $.ajax({
// 		         type: "get"
// 		         , url: "/ticket/concert"
// //		          , data: { }
// 		         , dataType: "json"
// 		         , success: function(res){
// 		            console.log("성공!");
// 		            console.log(res);
// 		         }
// 		         ,error: function() {
// 		            console.log("실패!");
// 		         }
// 		      });
		});
	});
	
</script>

<style>
.container {
	margin-bottom: 20px;
}

.concertImg {
	width: 250px;
	height: 300px;
	margin: 5px;
}

.themeList {
	margin: 5px;
	text-align: center;
}

.concertList {
	margin: 10px;
	width: 200px;
	float: left;
	text-align: center;
}
</style>
<div class="container">
	<!-- 관리자가 선택한 콘서트 상단 배너 15개 -->
	<!-- 슬라이드 추가하기 -->
	<h3>콘서트</h3>
	<div class="conTopBanner">
		<c:forEach items="${topBanList }" var="topList">
			<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<img class="concertImg" src="/resources/image/${topList.originName}" />
			</a>
<%-- 			<strong>${topList.name }</strong> --%>
		</c:forEach>
	</div>
	
	<hr>
	<!-- 테마 리스트, 클릭시 해당 테마의 포스터만 확인가능하도록 수정 -->
	<div class="themeList">
		<c:forEach items="${themeList }" var="themeList">
			<button class="themeBtn" name="${themeList.themeIdx }" style="border: none; background-color: #FFFFFF;">
				${themeList.themeName }
			</button><br>
		</c:forEach>
	</div>
		
	<!-- 포스터 전체 리스트 출력 -->
	<c:forEach items="${posterList }" var="list">
	<div class="concertList">
		<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
		<button class="imgDetailInfo" style="border: none; background-color: #FFFFFF;">
			<img class="concertImg" src="/resources/image/${list.originName}" /><br>
			<strong>${list.name }</strong>
		</button>
		</a>
		
<%-- 		<c:if test="${countList % 4 == 0 }"><br></c:if> --%>
	</div>
	</c:forEach>
	
	<!-- 무한스크롤 추가하기 -->
</div>
