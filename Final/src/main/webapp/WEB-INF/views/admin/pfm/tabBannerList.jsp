<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/menu.jsp" />
<script type="text/javascript">
function Delete(tabIdx) {
	var conf = confirm("정말 삭제하시겠습니까?");
	if(conf == true){
		var tabIdx = tabIdx;
		location.href="/admin/mainbannerdelete?mainbanIdx="+tabIdx;
	}
}

function Edit(mb) {
	
}

function mbInsert() {
	
}

function openList(listName) {
	var i;
	var x = document.getElementsByClassName("list");
	for(i = 0; i < x.length; i++){
		x[i].style.display = "none";
	}
	document.getElementById(listName).style.display= "block";
}

function submitWithTitle() {
	
}
</script>
<style type="text/css">
.tabB {
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

.tabBannerBox {
	position: absolute;
	left: 245px; 
	top: 200px; 
	display: flex;
	width: 1090px;  
}

.RegistBtn {
	margin-top: 110px;
    margin-left: 55px;
}

* {
    -webkit-box-sizing: content-box;
    box-sizing: content-box;		
}

.tab>button {
	border: none;
	font-size: 20px;
	margin-bottom:10px;
	width:120px;
	color: #686868;
	background: rgba(255,255,255,0);
	
}

.tab>button:hover {
	transform:scale(1.2,1.2);
	color: black;
	background-color: rgba( 227, 228, 229, 0);
}

.tabBannerBox{
	/* display: grid; 
	grid-template-columns:33% 33% 33%; */
}
}
</style>
<body>
<h3>배너관리 - 메인배너</h3>
<hr>

<p>최대 5개 까지만 등록이 가능합니다.</p>
<button class="finalSave">최종저장</button><br>

<div class="tabContainer">
	<div class="tab" style="height: 50px;">
		<button onclick="openList('newDiv')">New</button>
		<button onclick="openList('conDiv')">콘서트</button>
 		<button onclick="openList('muDiv')">뮤지컬</button>
	</div>
	
	<!-- New 탭 영역 -->
	<div id="newDiv" class="list">
		<div class="tabBannerBox" id="TabList">
			<c:forEach items="${newTabBanner }" var="ntb">
				<div class="tabB">	
					<div><img src="${ntb.bannerPath }" style="width: 180px; height: 254px;"></div>
					<div style="height: 38px;">${ntb.name}</div> 
					<div class="upDelBtn">
						<button id="ntbUpdate" onclick="Edit('${ntb}');">수정</button>
						<button id="ntbDelete" onclick="Delete('${ntb.tabIdx}');">삭제</button>
					</div>
				</div>
			</c:forEach>
			<div class="plusBox"> 
				<c:if test="${fn:length(newTabBanner) < 5 }">
		 			<a href="/admin/registTabbanner"><button class="RegistBtn">추가하기</button></a>   
				</c:if>
			</div>
		</div>
	</div>
	
</div>

	<!-- 뮤지컬&연극 탭 영역 -->
	<div id="muDiv" class="list" style="display: none">
		<div class="tabBannerBox" id="TabList">
			<c:forEach items="${muTabBanner }" var="mtb">
				<div class="tabB">	
					<div><img src="${mtb.bannerPath }" style="width: 180px; height: 254px;"></div>
					<div style="height: 38px;">${mtb.name}</div> 
					<div class="upDelBtn">
						<button id="mtbUpdate" onclick="mtbEdit('${mtb}');">수정</button>
						<button id="mtbDelete" onclick="mtbDelete('${mtb.tabIdx}');">삭제</button>
					</div>
				</div>
			</c:forEach>
			<div class="plusBox"> 
				<c:if test="${fn:length(muTabBanner) < 5 }">
		 			<a href="/admin/registTabbanner"><button class="RegistBtn">추가하기</button></a>   
				</c:if>
			</div>
		</div>
	</div>
	
	<!-- 콘서트 탭 영역 -->
	<div id="conDiv" class="list" style="display: none">
		<div class="tabBannerBox" id="TabList">
			<c:forEach items="${conTabBanner }" var="ctb">
				<div class="tabB">	
					<div><img src="${ctb.bannerPath }" style="width: 180px; height: 254px;"></div>
					<div style="height: 38px;">${ctb.name}</div> 
					<div class="upDelBtn">
						<button id="ctbUpdate" onclick="ctbEdit('${ctb}');">수정</button>
						<button id="ctbDelete" onclick="ctbDelete('${ctb.tabIdx}');">삭제</button>
					</div>
				</div>
			</c:forEach>
			<div class="plusBox"> 
				<c:if test="${fn:length(conTabBanner) < 5 }">
		 			<a href="/admin/registTabbanner"><button class="RegistBtn">추가하기</button></a>   
				</c:if>
			</div>
		</div>
	</div>
	
	
</div>



</body>
</html> 