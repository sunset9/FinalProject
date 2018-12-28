<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/menu.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	
	$("ul.tabs li:first").addClass("active");
	
	$("ul.tabs li").click(function(){
		$("ul.tabs li").removeClass("active"); // "active" 클래스 삭제 
	    $(this).addClass("active"); // 선택된 탭에 "active" 클래스 부여
	});
});
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

.plusBox {
 	display: inline-block;
	width: 180px;
	height: 254px;
	background-color: #d9dde0;
}

.tabBannerBox {
	display: flex;
    overflow: hidden;
    width: 1080px;
    padding-left: 0;
    padding-top: 50px;
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
    width: 100%;
    margin-top: 20px;
}
ul.tabs li {
    float: left;
    margin: 0;
    padding: 0;
    height: 31px; /*--Subtract 1px from the height of the unordered list--*/
    line-height: 31px; /*--Vertically aligns the text within the tab--*/
    border: 1px solid #999;
    border-left: none;
    margin-bottom: -1px; /*--Pull the list item down 1px--*/
    overflow: hidden;
    position: relative;
    background: #e0e0e0;
}
ul.tabs li span {
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
    background: #ccc;
}
ul.tabs li.active, ul.tabs li.active span:hover  {
    /*--Makes sure that the active tab does not listen to the hover properties--*/
    background: #fff;
    /*--Makes the active tab look like it's connected with its content--*/
    border-bottom: 1px solid #fff; 
}

/* .tab>button:hover { */
/* 	transform:scale(1.2,1.2); */
/* 	color: black; */
/* 	background-color: rgba( 227, 228, 229, 0); */
/* } */

.tabbannerWrap{
	float: left;
    width: 80%;
    position: absolute;
    left: 230px;
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
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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

.newModalClose:hover,
.newModalClose:focus,
.conModalClose:hover,
.conModalClose:focus,
.muModalClose:hover,
.muModalClose:focus {
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
	width: 700px;
}

.forEach {
    display: grid;
    grid-template-columns: 33% 33% 33%;
    text-align: -webkit-center; 
}
 
.modal-footer{
	text-align: center;  
}
</style>
<body>
<div class="tabbannerWrap">
<h3>배너관리 - 탭 배너</h3>
<hr>

<p>최대 5개 까지만 등록이 가능합니다.</p>
<button class="finalSave">최종저장</button><br>

<div class="tabContainer">
<!-- 	<div class="tab" style="height: 50px;"> -->
<!-- 		<button onclick="openList('newDiv')">New</button> -->
<!-- 		<button onclick="openList('conDiv')">콘서트</button> -->
<!--  		<button onclick="openList('muDiv')">뮤지컬</button> -->
<!-- 	</div> -->
	<ul class="tabs">
	    <li><span onclick="openList('newDiv')">NEW</span></li>
	    <li><span onclick="openList('conDiv')">콘서트</span></li>
	    <li><span onclick="openList('muDiv')">뮤지컬&연극</span></li>
	</ul>
	<!-- New 탭 영역 -->
	<div id="newDiv" class="list">
		<div class="tabBannerBox" id="TabList">
			<c:forEach items="${newTabBanner }" var="ntb">
				<div class="tabB">	
					<div><img src="${ntb.bannerPath }" style="width: 180px; height: 254px;"></div>
					<div style="height: 38px;">${ntb.name}</div> 
					<div class="upDelBtn">
						<button id="ntbDelete" onclick="Delete('${ntb.tabIdx}');">삭제</button>
					</div>
				</div>
			</c:forEach>
			<div class="plusBox"> 
				<c:if test="${fn:length(newTabBanner) < 5 }">
		 			<button type="button" data-toggle="modal" data-target="#newModal">추가하기</button> 
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
						<button id="mtbDelete" onclick="mtbDelete('${mtb.tabIdx}');">삭제</button>
					</div>
				</div>
			</c:forEach>
			<div class="plusBox"> 
				<c:if test="${fn:length(muTabBanner) < 5 }">
		 			<button type="button" data-toggle="modal" data-target="#muModal">추가하기</button> 
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
						<button id="ctbDelete" onclick="ctbDelete('${ctb.tabIdx}');">삭제</button>
					</div>
				</div>
			</c:forEach>
			<div class="plusBox"> 
				<c:if test="${fn:length(conTabBanner) < 5 }">
		 			<button type="button" data-toggle="modal" data-target="#conModal">추가하기</button> 
				</c:if>
			</div>
		</div>
	</div>
</div>
	



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
          	<input type="search" name="newSearch"/>
          </div> 
          <hr>
          <div class="ordering">
          	<p class="newest">최신순</p> <p class="alphabet">가나다순</p>
          </div>
          <div class="forEach"> 
          <c:forEach items="${allPfmList }" var="apl">
          	<div class="ntb" data-dismiss="modal">  
			    <div><img src="/resources/image/${apl.storedName}" style="width: 140px; height: 198px;"></div>
			    <div>${apl.name }</div>
			    <div><fmt:formatDate value="${apl.pfmStart }" pattern="yyyy.MM.dd" />
			     ~ <fmt:formatDate value="${apl.pfmEnd }" pattern="yyyy.MM.dd" /></div>
			    <div>${apl.hallName }</div>
		    </div>
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
          	<input type="search" name="conSearch"/>
          </div> 
          <hr>
          <div class="ordering">
          	<p class="newest">최신순</p> <p class="alphabet">가나다순</p>
          </div>
          <div class="forEach"> 
          <c:forEach items="${allConPfmList }" var="acpl">
          	<div class="ctb" data-dismiss="modal">  
			    <div><img src="/resources/image/${acpl.storedName}" style="width: 140px; height: 198px;"></div>
			    <div>${acpl.name }</div>
			    <div><fmt:formatDate value="${acpl.pfmStart }" pattern="yyyy.MM.dd" />
			     ~ <fmt:formatDate value="${acpl.pfmEnd }" pattern="yyyy.MM.dd" /></div>
			    <div>${acpl.hallName }</div>
		    </div>
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
          	<input type="search" name="muSearch"/>
          </div> 
          <hr>
          <div class="ordering">
          	<p class="newest">최신순</p> <p class="alphabet">가나다순</p>
          </div>
          <div class="forEach"> 
          <c:forEach items="${allMuPfmList }" var="ampl">
          	<div class="mtb" data-dismiss="modal">  
			    <div><img src="/resources/image/${ampl.storedName}" style="width: 140px; height: 198px;"></div>
			    <div>${ampl.name }</div>
			    <div><fmt:formatDate value="${ampl.pfmStart }" pattern="yyyy.MM.dd" />
			     ~ <fmt:formatDate value="${ampl.pfmEnd }" pattern="yyyy.MM.dd" /></div>
			    <div>${ampl.hallName }</div>
		    </div>
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