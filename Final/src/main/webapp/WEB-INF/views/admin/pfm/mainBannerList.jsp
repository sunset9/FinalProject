<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/menu.jsp" />
<script type="text/javascript">
function mbDelete(mainbanIdx) {
	var conf = confirm("정말 삭제하시겠습니까?");
	if(conf == true){
		var mainbanIdx = mainbanIdx;
		location.href="/admin/mainbannerdelete?mainbanIdx="+mainbanIdx;
	}
}

function mbEdit(mb) {
	
}

function mbInsert() {
	
}
</script>
<style type="text/css">
.mainB {
	display: inline-block;
	width: 180px;
	margin-right: 15px; 
	padding: 15px;  
	border: 1px solid #edeeef;
}

.plusBox {
 	display: inline-block;
	width: 180px;
	height: 254px;
	background-color: #d9dde0;
}

.mainBannerBox {
	position: absolute;
	left: 245px; 
	top: 200px; 
	display: flex;
	width: 1090px;  
}

* {
    -webkit-box-sizing: content-box;
    box-sizing: content-box;		
}
</style>
<body>
<h3>배너관리 - 메인배너</h3>
<hr>

<p>최대 5개 까지만 등록이 가능합니다.</p>
<button class="finalSave">최종저장</button><br>

<div class="mainBannerBox">
	<c:forEach items="${mBannerList }" var="mb">
		<div class="mainB">	
			<div><img src="/resources/image/${mb.storedName }" style="width: 180px; height: 254px;"></div>
			<div style="height: 38px;">${mb.name}</div> 
			<div class="upDelBtn">
				<button id="mbUpdate" onclick="mbEdit('${mb}');">수정</button>
				<button id="mbDelete" onclick="mbDelete('${mb.mainbanIdx}');">삭제</button>
			</div>
		</div>
	</c:forEach>
	<div class="plusBox"> 
		<c:if test="${fn:length(mBannerList) < 5 }">
 			<a href="/admin/registMainbanner"><button>추가하기</button></a>   
		</c:if>
	</div>
</div>

</body>
</html> 