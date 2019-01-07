<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/menu.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	var lastMainbanIdx = $('#lastMainbanIdx').val();
	var idxList = new Array();
	if(lastMainbanIdx == 'null'){
		console.log('null임');
	}else{
		console.log('조회되나? : '+lastMainbanIdx);
		idxList.push(lastMainbanIdx);
		console.log(idxList);
	}
	
	
	
	/* 삭제 버튼 눌렀을 경우 */
	$(document).on('click','.mbDelete',function(){
		var conf = confirm("정말 삭제하시겠습니까?");
		if(conf == true){
			var mainbanIdx = $(this).attr("id");
			console.log(mainbanIdx);
			location.href="/admin/mainbannerdelete?mainbanIdx="+mainbanIdx;
		}
	});
	
	/* 최종저장 버튼 눌렀을 경우 */
	$(document).on('click','.finalSave',function(){
		console.log('최종저장클릭');
	});
});
</script>
<style type="text/css">
.mainB {
	display: inline-block;
	width: 180px;
	margin-right: 15px; 
	padding: 15px;  
	border: 1px solid #edeeef;
}

.plus {
 	display: inline-block;
	width: 180px;
	height: 254px;
	background-color: #d9dde0;
}

.mainBannerBox {
	position: absolute;
    left: 270px;
    top: 190px;
	width: 1090px;
	display: grid;
    grid-template-columns: 20% 20% 20% 20% 20%;
    text-align: -webkit-center;  
}

.mbRegist {
	margin-top: 110px;
    margin-left: 55px;
}

* {
    -webkit-box-sizing: content-box;
    box-sizing: content-box;		
}

.finalSave {
    position: absolute;
    right: 137px;
    width: 85px;
    height: 38px;
    border-radius: 10px;
    background: #e27d24;
    border: 1px solid #e27d24;
    color: white;
    font-weight: 700;
}

.maxP {
    display: inline;
    padding-left: 13px;
    font-size: 17px;
    position: absolute;
    top: 116px;
}

.banRegistModalBtn {
	position: relative;
    left: 0px;
    top: 100px;
}
</style>
<body>
<div class="mainBannerWrap">
	<h1>배너관리 - 메인배너</h1>
	<hr>
	
	<p class="maxP" />최대 5개 까지만 등록이 가능합니다.</p>
	<input type="button" class="finalSave" value="최종저장" />
	<input type="hidden" value="${lastMainbanIdx }" id="lastMainbanIdx"/>
	
	<form action="/admin/mbfinalsave" method="post">
	
		<div class="mainBannerBox">
			<c:forEach items="${mBannerList }" var="mb">
				<div class="mainB">	
					<input type="hidden" value="${mb.mainbanIdx}" name="pfmIdx" />
					<div><img src="/resources/image/${mb.storedName }" style="width: 180px; height: 254px;"></div>
					<div >${mb.name}</div>
					<div><fmt:formatDate value="${mb.pfmStart }" pattern="yyyy.MM.dd" />
					     ~ <fmt:formatDate value="${mb.pfmEnd }" pattern="yyyy.MM.dd" /></div>
					    <div>${mb.hallName }</div> 
					<div class="upDelBtn">
						<input type="button" id="mbUpdate" onclick="mbEdit('${mb}');" value="수정" />
						<input type="button" id="${mb.mainbanIdx}" class="mbDelete" value="삭제" />
					</div>
				</div>
			</c:forEach>
			<div class="plusBox"> 
				<c:if test="${fn:length(mBannerList) < 5 }">
				<div class="plus">
		 			<a href="/admin/registMainbanner">
		 				<input type="button" class="banRegistModalBtn" value="추가하기">
		 				<input type="hidden" value="${lastMainbanIdx }" id="lastMainbanIdx"/>
		 			</a>
		 		</div>   
				</c:if>
			</div>
		</div>
	</form>
</div>


</div>
</body>
</html> 