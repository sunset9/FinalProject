<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../layout/menu.jsp" />

<style type="text/css">
p {
	display: inline;
}

.tabB {
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

.tabBannerBox {
	overflow: hidden;
	width: 1080px;
	padding-left: 0;
	padding-top: 50px;
	display: grid;
    grid-template-columns: 20% 20% 20% 20% 20%;
    text-align: -webkit-center;
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
	margin-bottom: 10px;
	width: 120px;
	color: #686868;
	background: rgba(255, 255, 255, 0);
	padding-top: 20px;
	border: 1px solid #999;
}

ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px; /*--Set height of tabs--*/
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 93%;
	margin-top: 20px;
}

ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	/*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}

ul.tabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	/*--Gives the bevel look with a 1px white border inside the list item--*/
	border: 1px solid #fff;
	outline: none;
	cursor: pointer;
}

ul.tabs li a:hover {
	background: #fff;;
}


ul.tabs li.active,
ul.tabs li.active:hover {
	
	background: #fff;
	
	border-bottom: 1px solid #fff;
}


.tabbannerWrap {
	float: left;
	width: 80%;
	position: absolute;
	left: 270px;
}

.newModal, .conModal, .muModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.newModalContent, .conModalContent, .muModalContent {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* The Close Button */
.newModalClose, .conModalClose, .muModalClose {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.newModalClose:hover, .newModalClose:focus, .conModalClose:hover,
	.conModalClose:focus, .muModalClose:hover, .muModalClose:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.newpfmListBox {
	display: grid;
	grid-template-columns: 33% 33% 33%;
}

.ntb, .ctb, .mtb {
	padding-top: 22px;
	padding-bottom: 15px;
	border: 1px solid #d4dae4;
	margin: 8px;
}

.ntb:hover, .ctb:hover, .mtb:hover {
	border: 2px solid #8da7d3;
}

.ordering {
	display: inline-block;
}

.newest {
	position: absolute;
	right: 90px;
	top: 77px;
}

.alphabet {
	position: absolute;
	right: 25px;
	top: 77px;
}

.modal-content {
	width: 790px;
}

.forEach {
	display: grid;
	grid-template-columns: 33% 33% 33%;
	text-align: -webkit-center;
}

.modal-footer {
	text-align: center;
}

.finalSave {
	position: absolute;
    right: 135px;;
    width: 85px;
    height: 38px;
    border-radius: 10px;
    background: #e27d24;
    border: 1px solid #e27d24;
    color: white;
    font-weight: 700;
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

.tabbanRegistBtn{
	position: relative;
    top: 100px;
}

.tb {
    padding-top: 22px;
    padding-bottom: 15px;
    border: 1px solid #d4dae4;
    margin: 8px;
}

.tb:hover {
	border: 2px solid #8da7d3;
}

#nameDiv {
    overflow: hidden;
    text-overflow: ellipsis;
    width: 180px;
    white-space: nowrap;
    font-weight: 700;
    text-align: left;
}

#hallDiv {
	overflow: hidden;
    text-overflow: ellipsis;
    width: 180px;
    white-space: nowrap;
    font-size: 13px;
    font-weight: 400;
    text-align: left;
    margin-top: 10px;
    margin-bottom: 10px;
}

#dateDiv {
	overflow: hidden;
    text-overflow: ellipsis;
    width: 180px;
    white-space: nowrap;
    text-align: left; 
}

.tbDelete {
	border-radius: 7px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){

	
	/* 새로고침해도 선택한 탭 유지 */
	var link = document.location.href;
	var tab = link.split('/').pop();
	$("a[href='"+tab+"']").trigger('click');
	
	/* $("ul.tabs li").on('click',function(){
		$("ul.tabs li").removeClass("active"); // "active" 클래스 삭제 
	    $(this).addClass("active"); // 선택된 탭에 "active" 클래스 부여
	}); */
	
	$("ul.tabs li").on('click',function(){
		$("ul.tabs li").removeClass("active"); // "active" 클래스 삭제 
	    $(this).addClass("active"); // 선택된 탭에 "active" 클래스 부여
	});
	
	/* 삭제버튼 눌렀을 때 */
	$(document).on('click','.tbDelete',function(){
		var conf = confirm('정말 삭제하시겠습니까?');
		var tabIdx = $(this).attr("id");
		if(conf == true){
			tbDeleteAjax();	
		}
		
		function tbDeleteAjax(){
			/* 탭 배너 삭제하기 */
			$.ajax({
				url : "/admin/tabbannerdelete",
				method : "GET",
				data : {
					"tabIdx" : tabIdx
				},
				success : function(){
					console.log('배너 삭제 성공');
					location.reload();
				}
			});
		}
	});
	
	/* 모달창에서 공연 선택했을 때 */
	$(document).on('click', '.tb', function(){
		var np = $(this);
		var pfmIdx = $(this).attr('id');
		var tabGenre = $(this).find('#tabGenre').val();
		var storedName = $(this).find('#storedName').val();
		var pfmName = $(this).find('#pfmName').attr('class');
		var pfmStart = $(this).find('#pfmStart').val();
		var pfmEnd = $(this).find('#pfmEnd').val();
		var hallName = $(this).find('#hallName').attr('class');
		
		/* 이미 등록된 공연인지 확인하기 */
		$.ajax({
			url : "/admin/checktabbandup",
			method : "GET",
			data : {
				"pfmIdx" : pfmIdx,
				"tabGenre" : tabGenre
			},
			success : function(e){
				if(e == 0){
					/* 중복아닌경우 append */
					/* np.parent().submit(); */
					/* submitAjax(); */
					
					if(tabGenre == 3){
						/* New 탭 */
						var newTabList = $('#NewTabList');
						
						var tabB = $('<div class="tabB" >');
						
						var poster = $('<div><img src="/resources/image/'+storedName+'" style="width: 180px; height: 254px;"/></div>');
						var name = $('<div id="nameDiv">'+pfmName+'</div>');
						var hall = $('<div>'+hallName+'</div>');
						var cancelBtn = $('<button id="tabPrependcancel" class="tbDelete">삭제</button>');
						var tabgenre = $('<input type="hidden" value="'+tabGenre+'" />');
						var pfmidx = $('<input type="hidden" value="'+pfmIdx+'" />');
						
						tabB.append(poster);
						tabB.append(name);
						tabB.append(hall);
						tabB.append(cancelBtn);
						tabB.append(tabgenre);
						tabB.append(pfmidx);
						
						newTabList.prepend(tabB);
						
						setSession(pfmIdx,tabGenre, storedName);
						
						
					}else if(tabGenre == 1){
						/* 콘서트 탭 */
						var conTabList = $('#ConTabList');
						
						var tabB = $('<div class="tabB" >');
						
						var poster = $('<div><img src="/resources/image/'+storedName+'" style="width: 180px; height: 254px;"/></div>');
						var name = $('<div id="nameDiv">'+pfmName+'</div>');
						var hall = $('<div>'+hallName+'</div>');
						var cancelBtn = $('<button id="tabPrependcancel" class="tbDelete">삭제</button>');
						var tabgenre = $('<input type="hidden" value="'+tabGenre+'" />');
						var pfmidx = $('<input type="hidden" value="'+pfmIdx+'" />');
						
						tabB.append(poster);
						tabB.append(name);
						tabB.append(hall);
						tabB.append(cancelBtn);
						tabB.append(tabgenre);
						tabB.append(pfmidx);
						
						conTabList.prepend(tabB);
						
						setSession(pfmIdx,tabGenre, storedName);
					}else {
						/* 뮤지컬 탭 */
						var muTabList = $('#MuTabList');
						
						var tabB = $('<div class="tabB" >');
						
						var poster = $('<div><img src="/resources/image/'+storedName+'" style="width: 180px; height: 254px;"/></div>');
						var name = $('<div id="nameDiv">'+pfmName+'</div>');
						var hall = $('<div>'+hallName+'</div>');
						var cancelBtn = $('<button id="tabPrependcancel" class="tbDelete">삭제</button>');
						var tabgenre = $('<input type="hidden" value="'+tabGenre+'" />');
						var pfmidx = $('<input type="hidden" value="'+pfmIdx+'" />');
						
						tabB.append(poster);
						tabB.append(name);
						tabB.append(hall);
						tabB.append(cancelBtn);
						tabB.append(tabgenre);
						tabB.append(pfmidx);
						
						muTabList.prepend(tabB);
						
						setSession(pfmIdx,tabGenre, storedName);
					}
					
					
				} else {
					/* 중복인 경우 경고창 + 리로드 */
					alert("이미 등록된 공연입니다.");
					
				}
			}
			
			
		});
		
		/* 세션 등록 */
		function setSession(a, b, c){
			var pfmIdx = a;
			var tabGenre = b;
			var storedName = c;
			
			$.ajax({
				url: "/admin/setsession",
				method: "POST",
				data: {
					"pfmIdx" : pfmIdx,
					"tabGenre" : tabGenre,
					"storedName" : storedName
				},
				success: function(){
					console.log("세션 등록 성공");
					activeSaveBtn(true);
				}
			});
		}
		
		
		function submitAjax() {
			/* 탭 배너 추가하기 */
			$.ajax({
				url : "/admin/registtbanner",
				method : "POST",
				data : {
					"pfmIdx" : pfmIdx,
					"tabGenre" : tabGenre,
					"bannerPath" : bannerPath
				},
				success : function(){
					console.log('배너 등록 성공');
					location.reload();
				}
			});
		}
	});
	
	/* 최종저장 버튼 활성화 */
	function activeSaveBtn(isActive){
		if(isActive){
			$(".finalSave").removeAttr("disabled"); //활성화
		}else{ 
			$(".finalSave").attr("disabled", 'disabled'); //비활성화 
		}
	}
	
	/* 검색처리 */
	$(document).on('click', '.tbSearchBtn', function() {
		var search = "";
		var btnId = $(this).attr('id');
		var forEachClass = $(this).parent().parent().find('.forEach');
		if(btnId == 1){
			search = $('#newSearch').val();
			searchAjax();
		}else if(btnId == 2){
			search = $('#conSearch').val();
			searchAjax();
		}else {
			search = $('#muSearch').val();
			searchAjax();
		}
		
		function searchAjax(){
			$.ajax({
				url : "/admin/tbSetOrder",
				method : "POST",
				data : {
					"order" : 0,
					"search" : search,
					"btnId" : btnId
				},
				success : function(list){
					forEachClass.html(' ');
	    			  if(jQuery.isEmptyObject( list )){
	    				  forEachClass.append('검색결과가 없습니다.');
	    			  } else {
		     			  list.forEach(function(pL){ 
		     				  
		     				 var divPfmIdx = $('<div id="'+pL.pfmIdx+'" class="np" data-dismiss="modal">');
		
		     				 var divImg = $('<div>');
		     				 divImg.append($('<img src="/resources/image/'+pL.storedName+'" style="width:140px; height: 198px;">'));
		     				     
		     				 var divName = $('<div>');
		     				 divName.append(pL.name);
		     				 
		     				 var divDate = $('<div>');
		     				 divDate.append(getDateSimpleString(pL.pfmStart)+' ~ '+getDateSimpleString(pL.pfmEnd));
		     				   
		     				 var divHallName = $('<div>');
		     				 divHallName.append(pL.hallName); 
		     				  
		     				 divPfmIdx.append(divImg);
		     				 divPfmIdx.append(divName);
		     				 divPfmIdx.append(divDate);
		     				 divPfmIdx.append(divHallName);
		     				  
		     				 $('.newest').hide();
		     				 $('.alphabet').hide();
		     				 
		     				forEachClass.append(divPfmIdx);
		     			 }) 
	    			  }
				}
			});
		}
	});
	
	/* prepend된 포스터의 삭제 버튼 눌렀을 때 */
	$(document).on('click','#tabPrependcancel',function(){
		$(this).parents('.tabB').remove();
		/* 세션에서 해당값 삭제 */
	});
	
	/* 검색어 입력후 엔터치면 검색 버튼 눌리게 트리거 */
	$('.Search').keyup(function(e){
		if(e.which == 13){
			$(this).next().trigger('click'); 
		}
	});
	
	/* 최신순 클릭했을 때 */
	$(document).on('click','.newest', function(){
		var btnId = $(this).attr('id');
		var search = '';
		var forEachClass = $(this).parent().next();
		if(btnId == 1){
			search = $('#newSearch').val();
			newestAjax();
		}else if(btnId == 2){
			search = $('#conSearch').val();
			newestAjax();
		}else {
			search = $('#muSearch').val(); 
			newestAjax();
		}
		
		function newestAjax(){
			$.ajax({
				url : "/admin/tbSetOrder",
				method : "POST",
				data : {
					"order" : 0,
					"search" : search,
					"btnId" : btnId
				},
				success : function(list){
					forEachClass.html(' ');
					list.forEach(function(pL){
						var divPfmIdx = $('<div id="'+pL.pfmIdx+'" class="np" data-dismiss="modal">');

	    				 var divImg = $('<div>');
	    				 divImg.append($('<img src="/resources/image/'+pL.storedName+'" style="width:140px; height: 198px;">'));
	    				     
	    				 var divName = $('<div>');
	    				 divName.append(pL.name);
	    				 
	    				 var divDate = $('<div>');
	    				 divDate.append(getDateSimpleString(pL.pfmStart)+' ~ '+getDateSimpleString(pL.pfmEnd));
	    				   
	    				 var divHallName = $('<div>');
	    				 divHallName.append(pL.hallName); 
	    				  
	    				 divPfmIdx.append(divImg);
	    				 divPfmIdx.append(divName);
	    				 divPfmIdx.append(divDate);
	    				 divPfmIdx.append(divHallName);
	    				  
	    				 
	    				 forEachClass.append(divPfmIdx);
					});
				}
			});
		}
	});
	
	/* 가나다순 클릭했을 때 */
	$(document).on('click','.alphabet',function(){
		var search = '';
		var btnId = $(this).attr('id');
		var forEachClass = $(this).parent().next();
		
		if(btnId == 1){
			search = $('#newSearch').val();
			alphabetAjax();
		}else if(btnId == 2){
			search = $('#conSearch').val();
			alphabetAjax();
		}else {
			search = $('#muSearch').val();
			alphabetAjax();
		}
		
		function alphabetAjax(){
			$.ajax({
				url : "/admin/tbSetOrder",
				method : "POST",
				data : {
					"order" : 1,
					"search" : search,
					"btnId" : btnId
				},
				success : function(list){
					forEachClass.html(' ');
					list.forEach(function(pL){
						var divPfmIdx = $('<div id="'+pL.pfmIdx+'" class="np" data-dismiss="modal">');

	    				 var divImg = $('<div>');
	    				 divImg.append($('<img src="/resources/image/'+pL.storedName+'" style="width:140px; height: 198px;">'));
	    				     
	    				 var divName = $('<div>');
	    				 divName.append(pL.name);
	    				 
	    				 var divDate = $('<div>');
	    				 divDate.append(getDateSimpleString(pL.pfmStart)+' ~ '+getDateSimpleString(pL.pfmEnd));
	    				   
	    				 var divHallName = $('<div>');
	    				 divHallName.append(pL.hallName); 
	    				  
	    				 divPfmIdx.append(divImg);
	    				 divPfmIdx.append(divName);
	    				 divPfmIdx.append(divDate);
	    				 divPfmIdx.append(divHallName);
	    				  
	    				 
	    				 forEachClass.append(divPfmIdx);
					});
				}
			});
		}
	});
	
	
	//Date -> String: YYYY.MM.DD 형태로 반환
    function getDateSimpleString(date){
  		var date = new Date(date);
  		var month = date.getMonth() + 1;
  		var day = date.getDate();
  		return date.getFullYear() + "."
  			+ ((month < 10)? '0' + month : month) + "."
  			+ ((day < 10) ? '0' + day : day);
  	}
	
	/* 최종저장 눌렀을 때 */
    $(document).on('click','.finalSave',function(){
		
		activeSaveBtn(false);
		location.href="/admin/tbfinalsave";
	});
});

/* 탭 클릭했을 때 */
function openList(listName) {
	var i;
	var x = document.getElementsByClassName("list");
	for(i = 0; i < x.length; i++){
		x[i].style.display = "none";
	}
	document.getElementById(listName).style.display= "block";
} 
</script>
<body>
	<div class="tabbannerWrap">
		<h1>배너관리 - 탭 배너</h1>
		<hr>

		<p>최대 5개 까지만 등록이 가능합니다.</p>
		<button class="finalSave" disabled="disabled">최종저장</button>
		<br>

		<!-- 탭 버튼!! -->
		<div class="tabContainer">
			<ul class="tabs">
				<li><a href="tabBannerList#1" onclick="openList('newDiv')">NEW</a></li>
				<li><a href="tabBannerList#2" onclick="openList('conDiv')">콘서트</a></li>
				<li><a href="tabBannerList#3" onclick="openList('muDiv')">뮤지컬&연극</a></li>
			</ul>
			<!-- New 탭 영역 -->
			<div id="newDiv" class="list">
				<div class="tabBannerBox" id="NewTabList">
					<c:forEach items="${newTabBanner }" var="ntb">
						<div class="tabB">
							<input type="hidden" value="${ntb.tabIdx }" id="tabIdx">
							<div>
								<img src="/resources/image/${ntb.bannerPath }"
									style="width: 180px; height: 254px;">
							</div>
							<div id="nameDiv">${ntb.name}</div>
							<div id="dateDiv">
								<fmt:formatDate value="${ntb.pfmStart }" pattern="yyyy.MM.dd" />
								~
								<fmt:formatDate value="${ntb.pfmEnd }" pattern="yyyy.MM.dd" />
							</div>
							<div id="hallDiv">${ntb.hallName }</div>
							<div class="upDelBtn">
								<button id="${ntb.tabIdx}" class="tbDelete">삭제</button>
							</div>
						</div>
					</c:forEach>
					<div class="plusBox">
						<c:if test="${fn:length(newTabBanner) < 5 }">
						<div class="plus">
							<button type="button" data-toggle="modal" data-target="#newModal" class="tabbanRegistBtn">추가하기</button>
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<!-- 뮤지컬&연극 탭 영역 -->
		<div id="muDiv" class="list" style="display: none">
			<div class="tabBannerBox" id="MuTabList">
				<c:forEach items="${muTabBanner }" var="mtb">
					<div class="tabB">
						<div>
							<img src="/resources/image/${mtb.bannerPath }"
								style="width: 180px; height: 254px;">
						</div>
						<div id="nameDiv">${mtb.name}</div>
						<div id="dateDiv">
							<fmt:formatDate value="${mtb.pfmStart }" pattern="yyyy.MM.dd" />
							~
							<fmt:formatDate value="${mtb.pfmEnd }" pattern="yyyy.MM.dd" />
						</div>
						<div id="hallDiv">${mtb.hallName }</div>
						<div class="upDelBtn">
							<button id="${mtb.tabIdx}" class="tbDelete">삭제</button>
						</div>
					</div>
				</c:forEach>
				<div class="plusBox">
					<c:if test="${fn:length(muTabBanner) < 5 }">
					<div class="plus">					
						<button type="button" data-toggle="modal" data-target="#muModal" class="tabbanRegistBtn">추가하기</button>
					</div>
					</c:if>
				</div>
			</div>
		</div>

		<!-- 콘서트 탭 영역 -->
		<div id="conDiv" class="list" style="display: none">
			<div class="tabBannerBox" id="ConTabList">
				<c:forEach items="${conTabBanner }" var="ctb">
					<div class="tabB">
						<div>
							<img src="/resources/image/${ctb.bannerPath }"
								style="width: 180px; height: 254px;">
						</div>
						<div id="nameDiv">${ctb.name}</div>
						<div id="dateDiv">
							<fmt:formatDate value="${ctb.pfmStart }" pattern="yyyy.MM.dd" />
							~
							<fmt:formatDate value="${ctb.pfmEnd }" pattern="yyyy.MM.dd" />
						</div>
						<div id="hallDiv">${ctb.hallName }</div>
						<div class="upDelBtn">
							<button id="${ctb.tabIdx}" class="tbDelete">삭제</button>
						</div>
					</div>
				</c:forEach>
				<div class="plusBox">
					<c:if test="${fn:length(conTabBanner) < 5 }">
					<div class="plus">
						<button type="button" data-toggle="modal" data-target="#conModal" class="tabbanRegistBtn">추가하기</button>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	
	


	<!-- --------------------- 여기서부터는 모달 영역!!!! --------------------- -->

	<!-- 탭 배너 - New 모달 -->
	<!-- Modal -->
	<div class="modal fade" id="newModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">탭배너 등록 - New</h4>
				</div>
				<div class="modal-body">
					<div>
						<input type="search" name="newSearch" id="newSearch" class="Search"/>
						<input type="button" value="검색" id="1" class="tbSearchBtn"/>
					</div>
					<hr>
					<div class="ordering">
						<p id="1" class="newest">최신순</p>
						<p id="1" class="alphabet">가나다순</p>
					</div>
					<div class="forEach">
						<c:forEach items="${allPfmList }" var="apl">
						<form action="/admin/registtbanner" method="get" id="ntbForm">
							<div class="tb" data-dismiss="modal" id="${apl.pfmIdx}">
								<input type="hidden" value="${apl.pfmIdx }" name="pfmIdx" id="pfmIdx" />
								<input type="hidden" value="3" name="tabGenre" id="tabGenre"/>
								<input type="hidden" value="${apl.storedName}" name="storedName" id="storedName"/>
								<input type="hidden" value="${apl.pfmStart }" id="pfmStart" />
								<input type="hidden" value="${apl.pfmEnd }" id="pfmEnd" />
								
								<div>
									<img src="/resources/image/${apl.storedName}"
										style="width: 140px; height: 198px;">
								</div>
								<div id="pfmName" class="${apl.name}">${apl.name }</div>
								<div id="pfmDate">
									<fmt:formatDate value="${apl.pfmStart }" pattern="yyyy.MM.dd" />
									~
									<fmt:formatDate value="${apl.pfmEnd }" pattern="yyyy.MM.dd" />
								</div>
								<div id="hallName" class="${apl.hallName }">${apl.hallName }</div>
							</div>
						</form>
						</c:forEach>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<!-- 탭 배너 - 콘서트 모달 -->
	<!-- Modal -->
	<div class="modal fade" id="conModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">탭배너 등록 - 콘서트</h4>
				</div>
				<div class="modal-body">
					<div>
						<input type="search" name="conSearch" id="conSearch" class="Search"/>
						<input type="button" value="검색" id="2" class="tbSearchBtn"/>
					</div>
					<hr>
					<div class="ordering">
						<p id="2" class="newest">최신순</p>
						<p id="2" class="alphabet">가나다순</p>
					</div>
					<div class="forEach">
						<c:forEach items="${allConPfmList }" var="acpl">
						<form action="/admin/registtbanner" method="get" id="ntbForm">
							<div class="tb" data-dismiss="modal" id="${acpl.pfmIdx}">
								<input type="hidden" value="${acpl.pfmIdx }" name="pfmIdx" id="pfmIdx"/>
								<input type="hidden" value="1" name="tabGenre" id="tabGenre"/>
								<input type="hidden" value="${acpl.storedName}" name="storedName" id="storedName"/>
								<input type="hidden" value="${acpl.pfmStart }" id="pfmStart" />
								<input type="hidden" value="${acpl.pfmEnd }" id="pfmEnd" />
								
								<div>
									<img src="/resources/image/${acpl.storedName}" 
										style="width: 140px; height: 198px;">
								</div>
								<div id="pfmName" class="${acpl.name }">${acpl.name }</div>
								<div id="pfmDate">
									<fmt:formatDate value="${acpl.pfmStart }" pattern="yyyy.MM.dd" />
									~
									<fmt:formatDate value="${acpl.pfmEnd }" pattern="yyyy.MM.dd" />
								</div>
								<div id="hallName" class="${acpl.hallName }">${acpl.hallName }</div>
							</div>
						</form>
						</c:forEach>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<!-- 탭 배너 - 뮤지컬 모달 -->
	<!-- Modal -->
	<div class="modal fade" id="muModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">탭배너 등록 - 뮤지컬</h4>
				</div>
				<div class="modal-body">
					<div>
						<input type="search" name="muSearch" id="muSearch" class="Search"/>
						<input type="button" value="검색" id="3" class="tbSearchBtn"/>
					</div>
					<hr>
					<div class="ordering">
						<p id="3" class="newest">최신순</p>
						<p id="3" class="alphabet">가나다순</p>
					</div>
					<div class="forEach">
						<c:forEach items="${allMuPfmList }" var="ampl">
						<form action="/admin/registtbanner" method="get" id="ntbForm">
							<div class="tb" data-dismiss="modal" id="${ampl.pfmIdx}">
								<input type="hidden" value="${ampl.pfmIdx }" name="pfmIdx" id="pfmIdx"/>
								<input type="hidden" value="2" name="tabGenre" id="tabGenre"/> 
								<input type="hidden" value="${ampl.storedName}" name="storedName" id="storedName"/>
								<input type="hidden" value="${ampl.pfmStart }" id="pfmStart" />
								<input type="hidden" value="${ampl.pfmEnd }" id="pfmEnd" />
								<div>
									<img src="/resources/image/${ampl.storedName}"  
										style="width: 140px; height: 198px;">
								</div>
								<div id="pfmName" class="${ampl.name }">${ampl.name }</div>
								<div id="pfmDate">
									<fmt:formatDate value="${ampl.pfmStart }" pattern="yyyy.MM.dd" />
									~
									<fmt:formatDate value="${ampl.pfmEnd }" pattern="yyyy.MM.dd" />
								</div>
								<div id="hallName" class="${ampl.hallName }">${ampl.hallName }</div>
							</div>
						</form>
						</c:forEach>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	</div>
</body>
</html>
