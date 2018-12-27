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
<script type="text/javascript">
function enterkey() {
	if (window.event.keyCode == 13) {
		console.log('엔터키 클릭');
		
   }
};

function clickPfm(np){
	console.log('dd'+np);
};
</script>
<body>

<h3>배너관리 - 메인배너</h3>
<hr>

<h2>메인배너등록</h2>

<div class="mainbannerRG">
	<form action="">
	<div>
		공연 <a data-toggle="modal" href="#myModal"><input type="search" id="mainBanModalBtn"></a>
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

 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">메인 배너 공연 검색</h4>
        </div>
        <div class="modal-body">
          <div class="ordering">
          	<p>최신순</p> <p>가나다순</p>
          </div>
          <div class="forEach">
          <c:forEach items="${NewPfmList }" var="np">
          	<div class="np">
			    <input type="radio" name="pfmCheck" onclick="clickPfm('${np}');">   
			    <div><img src="/resources/image/${np.storedName}" style="width: 140px; height: 198px;"></div>
			    <div>${np.name }</div>
			    <div><fmt:formatDate value="${np.pfmStart }" pattern="yyyy.MM.dd" />
			     ~ <fmt:formatDate value="${np.pfmEnd }" pattern="yyyy.MM.dd" /></div>
			    <div>${np.hallName }</div>
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