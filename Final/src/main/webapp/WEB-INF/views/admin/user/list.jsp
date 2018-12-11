<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	
});
</script>
<style type="text/css">
th, td:not(:nth-child(2)) {
	text-align: center;
}
td {
	border-left: 1px solid white;
	border-right: 1px solid white;
}

#pagingBox {
	position: relative;
}


/* 버튼 좌우정렬 및 상하정렬 */
#btnWriteBox, #btnDeleteBox {
	position: absolute;
	top: 0;
	bottom: 0;
	height: 30px;
	margin: auto;
}
#btnWriteBox {
	right: 10px;
}
#btnDeleteBox {
	left: 10px;
}
#btnDelete, #btnWrite {
	height: 25px;
}

</style>
</head>
<body>
<div class="container">

<h3>회원 목록</h3>
<hr>

<table class="table table-hover table-striped table-condensed">
<thead>
<tr>
<th style="width: 10%">NO</th>
<th style="width: 35%">회원 아이디</th>
<th style="width: 20%">닉네임</th>
<th style="width: 10%">총 예매금액(건수)</th>
<th style="width: 10%">가입일</th>
<th style="width: 20%">회원 구분</th>
</tr>
</thead>

<tbody>
<c:forEach items="${userList }" var="user">
<tr>
	<td>${user.no}</td>
	<td>${user.email }</td>
	<td>${user.nick }</a></td>
	<td>${user.amount }(${user.totalCnt })</td>
	<td>${user.createDate }</td>
	<td>
		<select name="mGradeIdx">
			<option value="1">일반회원</option>
			<option value="2">관리자</option>
			<option value="3">회원정지</option>
		</select>
	</td>
</tr>
</c:forEach>
</tbody>

</table>

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
 </div>
<div id="searchBox" class="text-center">
<form action="/admin/userlist" method="get">
	<input type="text" name="userSearchData" />
	<button id="btnSearch">검색</button>
</form>
</div>

</div>
</body>
</html>