<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/menu.jsp" />

<style type="text/css">
.sobBox {
	position: absolute;
    left: 242px;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    width: 1150px;
}
th {
	text-align: center;
}

.table-condensed>tbody>tr>td {
    vertical-align: middle;
    text-align: center;
}

.pfmInfo>span{
	display: block;
	text-align: left;
}

.table-condensed>tbody>tr>td>span{
	display: block;
}

.bookState{
	font-weight: 600;
}
</style>

<div class="sobBox">
<h1>예매현황</h1>
<hr>
<table class="table table-hover table-striped table-condensed">
<colgroup>
<col style=”width:48px;”>
<col style=”width:224px;”>
<col style=”width:111px;”>
<col style=”width:451px;”>
<col style=”width:218px;”>
<col style=”width:136px;”>
</colgroup>
<tr>
	<th >No.</th>
	<th >닉네임(이메일)</th>
	<th >예매일</th>
	<th colspan="2">공연정보</th>
	<th >예매정보</th>
	<th >예매상태</th>
</tr>

 
<tbody>
<c:forEach items="${sobList}" var="sob" varStatus="status">
	<tr>
		<td style="font-weight: 800; font-size: 17px;">${sob.no}</td>
		<td>${sob.nick}<br>(${sob.email})</td>
		<td><fmt:formatDate value="${sob.createDate}" pattern="yyyy.MM.dd" /></td>
		<td style="width: 1%;"><img src="/resources/image/${sob.storedName}" style="width: 100px;"></td>
		<td class="pfmInfo">
		<span style="font-weight: 600; font-size: 16px;">${sob.name}</span>
		<span><fmt:formatDate value="${sob.pfmStart}" pattern="yyyy.MM.dd" />
		~ <fmt:formatDate value="${sob.pfmEnd}" pattern="yyyy.MM.dd" /></span>
		<span>${sob.hallName}</span>
		</td>
		<td>
		<span>예약번호   ${sob.bookGroup}</span>
		<span>관람일   <fmt:formatDate value="${sob.pfmDate}" pattern="yyyy.MM.dd" />  ${sob.pfmTime}</span>
		<span>매수   ${sob.ea}매</span> 
		</td>
		<td class="bookState">${sob.state }</td>
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
<div id="sobSearchBox" class="text-center">
<form action="/admin/soblist" method="get">
	<input type="text" name="sobSearch" />
	<button id="btnSearch">검색</button>
</form>
<br><br><br>
</div>

</div>



</div>
</body>
</html>