<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/menu.jsp" />

<style type="text/css">
.mainbannerRG {
	border: 1px solid lightgray;
}

#mbdiv {
	width: 
}
</style>
<body>

<h3>배너관리 - 메인배너</h3>
<hr>

<h2>메인배너등록</h2>

<div class="mainbannerRG">
	<form action="">
	<div>
		공연 <input type="search">
		<div id="mbdiv mbPfmInfo"></div>
	</div>
	<div>
		썸네일 이미지 <input type="button" value="첨부파일" />
		<div id="mbdiv mbThumbImg"></div>
	</div>
	<div>
		배너 이미지 <input type="button" value="첨부파일">
		<div id="mbdiv mbBannerImg"></div>
	</div>
	<button>등록</button> <input type="button" value="취소">
	</form>
</div>
</body>
</html>