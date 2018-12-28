<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/menu.jsp" />

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
function cancelBook(bookGroup, userIdx) {
	var bookGroup = bookGroup;
	var userIdx = userIdx;
	console.log("bookgroup ::: "+bookGroup);
	$.ajax({
		type : 'POST',
		url : '/admin/getImpUid',
		data : {
			bookGroup : bookGroup,
			userIdx : userIdx
			},
		success : function(res) {
			location.href = "/admin/userdetail?userIdx="+userIdx;
		}
	});
};
</script>


<style type="text/css">
table, td, th, tr {border: 1px solid black;}

/* The Modal (background) */
.partCancelModal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.partCancelModalContent {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.partCancelModalClose {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.partCancelModalClose:hover,
.partCancelModalClose:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>
</head>
<body>
<div style="display: flow-root;">
<h3>회원 상세</h3>
<hr>

<div>
회원정보칸<br><br>
${curUser.email }님의 예매현황<br>
이름 ${curUser.name}<br>
성별 <c:if test="${curUser.sex eq 'female'}">여성</c:if>
    <c:if test="${curUser.sex eq 'male'}">남성</c:if><br>
닉네임 ${curUser.nick}<br>
생년월일 <fmt:formatDate value="${curUser.birth}" pattern="yyyy.MM.dd" /><br>
휴대폰번호 ${curUser.phone}<br>
주소 ${curUser.addr} ${curUser.addrDetail }<br>
회원등급 ${curUser.mGrade}

</div>
<hr>
<div style="width: 1100px;">
예매현황칸<br><br>
<table class="table table-hover table-striped table-condensed">
<thead>
<tr>
<th style="width: 60px;">예매일</th>
<th style="width: 500px;" colspan="2">공연정보</th>
<th style="width: 300px;">예매정보</th>
<th style="width: 150px;">상태</th>
<th style="width: 130px;">환불처리</th>
</tr>
</thead>

<tbody>
<c:forEach items="${sobList }" var="sob" varStatus="status">
<tr>
	<td><fmt:formatDate value="${sob.createDate}" pattern="yyyy.MM.dd(E)" /></td>
	<td style="width: 100px;"><img src="/resources/image/${sob.storedName }" style="width: 100px;"/></td>
	<td>
	${sob.name }<br><br>
	<fmt:formatDate value="${sob.pfmStart}" pattern="yyyy.MM.dd" /> ~ 
	<fmt:formatDate value="${sob.pfmEnd}" pattern="yyyy.MM.dd" /><br>
	${sob.hallName}
	</td>
	<td>
	 예매번호   ${sob.bookGroup}<br>
	 관람일    <fmt:formatDate value="${sob.pfmDate}" pattern="yyyy.MM.dd(E)" />  ${sob.pfmTime}<br>
	 매수 ${sob.ea }매<br>
	 <c:if test="${sob.state eq '취소중' }">
	 	취소일    <fmt:formatDate value="${sob.cancelDate}" pattern="yyyy.MM.dd(E)" />
	 </c:if>
	 <c:if test="${sob.state eq '예매완료(결제완료)' }">
	 	취소가능일    <fmt:formatDate value="${sob.createDate}" pattern="yyyy.MM.dd(E)" />
	 </c:if>
	</td>
	<td>
	${sob.state }<br>
	</td>
	<td>
	<c:if test="${sob.state eq '취소중'}">
		<button onclick="cancelBook('${sob.bookGroup}','${sob.userIdx }');">환불하기</button>
	</c:if>
	<c:if test="${sob.state eq '예매완료(부분취소)'}">
		<!-- 부분취소 모달 open btn-->
			<input type="hidden" id="userIdx" value="${curUser.userIdx}">
			<input type="hidden" id="bookGroup" value="${sob.bookGroup}">	
			<button id="partCancelModalBtn">환불하기</button>	
	</c:if>
	</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>

<!-- 부분취소 모달 시작 -->
<div id="partCancelModal" class="partCancelModal">
	
	<div class="partCancelModalContent">
		<span class="partCancelModalClose">&times;</span>
		<p>예약그룹 : ${sob.bookGroup}</p>
	</div>
</div>
<!-- 부분취소 모달 끝 -->

</div>
<!-- 부분취소 모달 자바스크립트 -->
<script type="text/javascript">
//Get the modal
var partCancelModal = document.getElementById('partCancelModal');

// Get the button that opens the modal
var partCancelModalBtn = document.getElementById("partCancelModalBtn");

// Get the <span> element that closes the modal
var partCancelModalClose = document.getElementsByClassName("partCancelModalClose")[0];

if(partCancelModalBtn != null){
	// When the user clicks on the button, open the modal 
	partCancelModalBtn.onclick = function() {
		partCancelModal.style.display = "block";
	}
}

// When the user clicks on <span> (x), close the modal
partCancelModalClose.onclick = function() {
	partCancelModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == partCancelModal) {
	  partCancelModal.style.display = "none";
  }
}
</script>

</div> 
</body>
</html>