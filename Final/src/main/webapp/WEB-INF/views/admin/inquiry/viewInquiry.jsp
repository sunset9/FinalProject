<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/menu.jsp" />

<style>
.waiting {
	color:red;
}
#inqList { 
    width: 1100px;
}

th, td {
	text-align: center;
}

hr {
    width: 1100px;
}

.inqBtn {
	float: right;
    width: 85px;
    height: 38px;
    border-radius: 10px;
    background: #e27d24;
    border: 1px solid #e27d24;
    color: white;
    font-weight: 700;
    margin-bottom: 5px;
    margin-top: 5px;
}
</style>

<div class="contents-wrapper" style="width: 1100px;">

<h1>1:1 문의 리스트</h1>
<hr>

<button onclick="location.href='/admin/writeinquiry'" class="inqBtn">1:1문의하기</button>
<table class="table table-hover table-striped table-condensed" id="inqList">
<thead>
<tr>
	<th style="width:5%">글번호</th>
	<th style="width:35%">제목</th>
	<th style="width:15%">답변 상태</th>
	<th style="width:10%">작성자</th>
	<th style="width:25%">작성일</th>
</tr>
</thead>
<tbody>
<c:forEach items="${inqList }" var="inq">
<tr>
	<td>${inq.inqIdx }</td>
	<td><a href="/admin/detailinquiry?inqIdx=${inq.inqIdx }">${inq.title }</a></td>
	<c:if test="${inq.replyStatus eq 0}"><td class="waiting">답변 대기</td></c:if>
	<c:if test="${inq.replyStatus eq 1}"><td>답변 완료</td></c:if>
	<td>${inq.userName }</td>
	<td>
	<fmt:formatDate value="${inq.createDate }" pattern="yyyy-MM-dd HH:mm"/>
	</td>
</tr>
</c:forEach>
</tbody>
</table>

<div class="text-center">
  <ul class="pagination">
  	<!-- 처음으로 가기 -->
  	<c:if test="${paging.curPage ne 1 }">
  	<li>
      <a href="/admin/viewinquiry" aria-label="Previous">
        <span aria-hidden="true">처음</span>
      </a>
    </li>
    </c:if>
    
	<!-- 이전 페이지 -->
	<!-- 첫 페이지라면 버튼 동작 안되게 만들기 -->
	<c:if test="${paging.curPage eq 1 }">
    <li class="disabled">
       <span aria-hidden="true">&laquo;</span>
    </li>
    </c:if>
    
    <c:if test="${paging.curPage ne 1 }">
    <li>
      <a href="/admin/viewinquiry?curPage=${paging.curPage-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    <!-- 페이징 리스트 -->
    <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }" step="1">
    	<!-- 현재 보고 있는 페이지 번호만 강조하기 -->
    	<c:if test="${paging.curPage eq i}">
    		<li class="active"><a href="/admin/viewinquiry?curPage=${i }">${i }</a></li>
    	</c:if>
    	<c:if test="${paging.curPage ne i}">
    		<li><a href="/admin/viewinquiry?curPage=${i }">${i }</a></li>
    	</c:if>
    </c:forEach>
    
    <!-- 다음 페이지 -->
    <c:if test="${paging.curPage eq paging.totalPage}">
    <li class="disabled">
       <span aria-hidden="true">&raquo;</span>
    </li>
    </c:if>
    <c:if test="${paging.curPage ne paging.totalPage}">
    <li>
      <a href="/admin/viewinquiry?curPage=${paging.curPage+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
  </ul>
</div>

</div>

</body>
</html>