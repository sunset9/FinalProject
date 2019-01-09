<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/menu.jsp" />

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
    background: #b8b9ba;
    border: 1px solid #b8b9ba;
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

.finalSave[disabled] {
	position: absolute;
    right: 137px;
    width: 85px;
    height: 38px;
    border-radius: 10px;
    background: #b8b9ba;
    border: 1px solid #b8b9ba;
    color: white;
    font-weight: 700;
}

.finalSave:not([disabled]) {
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
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	var registCheckList = new Array();
	var mbSize = parseInt($('#mbSize').val());
	var apSize = 0;
	console.log(mbSize);
	
	<%-- var sessionList = "<%= session.getAttribute("mbannerList") %>"; --%>
	var isExistSession = $('#existSession').val();
	
	
	if(isExistSession == 1){
		activeSaveBtn(true);
		
		console.log('세션 존재함');
		$('.finalSave').css("background", "#e27d24");
		$('.finalSave').css("border", "1px solid #e27d24");
		
		$('#appendList').find('input').each(function(i, e){
			var appendPfm = $(this).val();
			/* console.log(appendPfm); */
			prepend(appendPfm);
		});
		
		/* 추가된 공연 디비에 저장하지 않고 그냥 화면에만 띄워주기 */
		function prepend(pfmIdx) {
			$.ajax({
				url : "/admin/getpfmbypfmidx"
				, method : "GET"
				, data : { "pfmIdx": pfmIdx }
				, success : function(data){
					var pfmInfo = data;
					var pfmIdx = pfmInfo['pfmIdx'];
					var storedName = pfmInfo['storedName'];
					var name = pfmInfo['name'];
					var pfmStart = pfmInfo['pfmStart'];
					var pfmEnd = pfmInfo['pfmEnd'];
					var hallName = pfmInfo['hallName'];
					
					var div = $('.mainBannerBox');
					var pfmDiv = $('<div id="appendDiv" style="display:inline-block; width:180px; margin-right:15px; padding:15px; border: 1px solid #edeeef;">');
					var pfmIdxDiv = $('<input type="hidden" value="'+pfmIdx+'" />');
					var imgDiv = $('<div><img src="/resources/image/'+storedName+'" style="width:180px; height: 254px;"/></div>');
					var nameDiv = $('<div id="nameDiv">'+name+'</div>');
					var dateDiv = $('<div id="dateDiv">'+pfmStart+' ~ '+pfmEnd+'</div>');
					var hallNameDiv = $('<div id="hallNameDiv">'+hallName+'</div>');
					var btnDiv = $('<div class="upDelBtn">');
					var upBtn = $('<input type="button" id="upBtn" value="수정" style="margin-right: 5px;"/>');
					var delBtn = $('<input type="button" id="delBtn" value="삭제" />');
					btnDiv.append(upBtn);
					btnDiv.append(delBtn);
					
					pfmDiv.append(imgDiv);
					pfmDiv.append(nameDiv);
					pfmDiv.append(dateDiv);
					pfmDiv.append(hallNameDiv);
					pfmDiv.append(btnDiv);
					
					div.prepend(pfmDiv);
					registCheckList.push(pfmIdx);
					console.log("registCheckList "+registCheckList);
					apSize += 1;
					console.log("apSize "+apSize);
				}
			});
		}
		
	}else {
		console.log('세션 존재하지 않음');
	}
	
	function activeSaveBtn(isActive){
		if(isActive){
			$(".finalSave").removeAttr("disabled"); //활성화
		}else{ 
			$(".finalSave").attr("disabled", 'disabled'); //비활성화 
		}
	}
	
	/* 삭제 버튼 눌렀을 경우 */
	$(document).on('click','.mbDelete',function(){
		var conf = confirm("정말 삭제하시겠습니까?");
		if(conf == true){
			mbSize-=1;
			var mainbanIdx = $(this).attr("id");
			console.log(mainbanIdx);
			location.href="/admin/mainbannerdelete?mainbanIdx="+mainbanIdx;
		}
	});
	
	/* 최종저장 버튼 눌렀을 경우 */
	$(document).on('click','.finalSave',function(){
		$('#appendDiv').html('');
		location.href="/admin/mbfinalsave";
	});
	
	
	/* 추가하기 버튼 누를때 */
	$(document).on('click', '.banRegistModalBtn', function(){
		var cnt = mbSize + apSize;
		console.log("cnt : "+cnt);
		if(cnt == 5){
			alert('최대 5개 까지만 등록이 가능합니다.');
			return false;
		}else {
			$('#regMbForm').submit();
		}
	});
	
	/* 수정 버튼 눌렀을 때 */
	$(document).on('click','#mbUpdate', function(){
		console.log("수정 버튼 누름 mainbanIdx : "+$(this).val());
		var mainbanIdx = $(this).val();
		location.href="/admin/updatemainbanner?mainbanIdx="+mainbanIdx;
	});
});
</script>

<body>
<div class="mainBannerWrap">
	<h1>배너관리 - 메인배너</h1>
	<hr>
	
	<p class="maxP" />최대 5개 까지만 등록이 가능합니다.</p>
	<input type="button" class="finalSave" value="최종저장" disabled="false"/>
	<input type="hidden" id="existSession" value="${existSession}" />
	<input type="hidden" id="appendSize" value="${appendSize }" />
	<div id="appendList">
		<c:forEach items="${appendList}" var="apList" varStatus="status">
			<input type="hidden" value="${apList}" id="apList${status.index}" />
		</c:forEach>
	</div>
		<input type="hidden" value="${fn:length(mBannerList)} " id="mbSize" />
		
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
						<button id="mbUpdate" value="${mb.mainbanIdx}">수정</button>
						<input type="button" id="${mb.mainbanIdx}" class="mbDelete" value="삭제" />
					</div>
				</div>
			</c:forEach>
			<div class="plusBox">
				<c:if test="${mBannerListSize < 5}">
			 		<form action="/admin/regMainbanner" method="get" id="regMbForm">
						<div class="plus">
			 				<input type="button" class="banRegistModalBtn" value="추가하기">
			 				
			 			</div>   
			 		</form>
				</c:if>
			</div>
		</div>
	</div>

</div>
</body>
</html> 