<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/menu.jsp" />

<style type="text/css">
.mainbannerRG {
	border: 1px solid lightgray;
}

#mbdiv {
	width: 
}

.mainBanModal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 50px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.mainBanModalContent {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 650px;
}

/* The Close Button */
.mainBanModalClose {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.mainBanModalClose:hover,
.mainBanModalClose:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.mainBanSearch {
	position: relative;
}

.sp1 {
	position: absolute;
	right: 70px;
}

.sp2 {
	position: absolute;
	right: 10px; 
}

.newpfmListBox {
    display: grid;
    grid-template-columns: 33% 33% 33%;
}

.np {
	padding-top: 30px;
}
</style>
<body>

<h3>배너관리 - 메인배너</h3>
<hr>

<h2>메인배너등록</h2>

<div class="mainbannerRG">
	<form action="">
	<div>
		공연 <input type="search" id="mainBanModalBtn">
		<div id="mbdiv mbPfmInfo">
		[ 여기에 공연 이름, 시작일~종료일, 경기장이름 표시됨 ]		
		</div>
	</div>
	<div>
		썸네일 이미지 <input type="button" value="첨부파일" />
		<div id="mbdiv mbThumbImg">
		[ 여기에 썸네일 이미지, 파일명 표시됨 ]
		</div>
	</div>
	<div>
		배너 이미지 <input type="button" value="첨부파일">
		<div id="mbdiv mbBannerImg">
		[ 여기에 배너 이미지, 파일명 표시됨 ]
		</div>
	</div>
	<button>등록</button> <input type="button" value="취소">
	</form>
</div>

<!-- The Modal -->
<div id="mainBanModal" class="mainBanModal">
  <!-- Modal content -->
  <div class="mainBanModalContent">
    <div class="mainBanModalClose">&times;</div>
    <div class="mainBanSearch">
	    	<input type="search" name="mainBanSearch">
	    	<hr>
	    	<div class="sp1">최신순</div> <div class="sp2">가나다순</div><br>
	    	<div class="newpfmListBox">
		    	<c:forEach items="${NewPfmList}" var="np">
		    		<div class="np">
		    			<div><img src="/resources/image/${np.storedName}" style="width: 140px; height: 198px;"></div>
		    			<div>${np.name }</div>
		    			<div><fmt:formatDate value="${np.pfmStart }" pattern="yyyy.MM.dd" />
		    			 ~ <fmt:formatDate value="${np.pfmEnd }" pattern="yyyy.MM.dd" /></div>
		    			<div>${np.hallName }</div>
		    		</div>
		    	</c:forEach>
	    	</div>
	    	<button>확인</button>
    </div>
    <div id="pagingBox" class="text-center">
  <ul class="pagination pagination-sm">
  	<!-- 처음으로 가기 -->
  	<c:if test="${paging.curPage ne 1 }">
    <li>
      <a href="/admin/userlist?userSearchData=${paging.search }" aria-label="First">
        <span aria-hidden="true">&larr;처음</span>
      </a>
    </li>
	</c:if>
	
	
	
	  
  
  	<!-- 이전 페이지 -->
  	<!-- 첫 페이지라면 버튼 동작 안 되게 만들기 -->
  	<c:if test="${paging.curPage eq 1 }">
    <li class="disabled">
        <span aria-hidden="true">&laquo;</span>
    </li>
    </c:if>
    
  	<c:if test="${paging.curPage ne 1 }">
    <li>
      <a href="/admin/userlist?curPage=${paging.curPage-1 }&userSearchData=${paging.search }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    
    
    
    
    <!-- 페이징 리스트 -->
    <c:forEach
     begin="${paging.startPage }"
     end="${paging.endPage }"
     var="i">

		<!-- 현재 보고 있는 페이지번호만 강조해주기 -->
		<c:if test="${paging.curPage eq i}">          
    	  <li class="active"><a href="/admin/userlist?curPage=${i }&userSearchData=${paging.search }">${i }</a></li>
    	</c:if>
		<c:if test="${paging.curPage ne i}">          
    	  <li><a href="/admin/userlist?curPage=${i }&userSearchData=${paging.search }">${i }</a></li>
    	</c:if>
    </c:forEach>




    
    <!-- 다음 페이지 -->
  	<c:if test="${paging.curPage eq paging.totalPage }">
    <li class="disabled">
        <span aria-hidden="true">&raquo;</span>
    </li>
	</c:if>
	
  	<c:if test="${paging.curPage ne paging.totalPage }">
    <li>
      <a href="/admin/userlist?curPage=${paging.curPage+1 }&userSearchData=${paging.search }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
 </div><br><br>
  
  
  </div>
</div>

<script>
// Get the modal
var mainBanModal = document.getElementById('mainBanModal');

// Get the button that opens the modal
var mainBanModalBtn = document.getElementById("mainBanModalBtn");

// Get the <span> element that closes the modal
var mainBanModalClose = document.getElementsByClassName("mainBanModalClose")[0];

// When the user clicks the button, open the modal 
mainBanModalBtn.onclick = function() {
	mainBanModal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
mainBanModalClose.onclick = function() {
	mainBanModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == mainBanModal) {
	  mainBanModal.style.display = "none";
  }
}
</script>
</body>
</html>