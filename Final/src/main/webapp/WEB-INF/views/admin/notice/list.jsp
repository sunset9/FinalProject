<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/menu.jsp"/>

 
<!-- 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>

.con {
	display: inline-block;
	width: 500px;
}

/* body { */
/*   	position:relative;   */
/*  	background-color:blue; */
/*   	z-index:100;  */
/*  } */

</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnDelete").click(function(){
		$(location).attr("href", "/admin/noticedelete?noticeIdx=${noli.noticeIdx}");
	});
	
	$("#checknoticeall").click(function(){
			// 최상단 체크박스 클릭
		if($("#checknoticeall").prop("checked")){
				// 클릭되었다면 			
			$("input[id=checknotice]").prop("checked", true);
				// name이나 id을 찾아 클릭된것을 true로 (체크on)			
		} else {
			$("input[id=checknotice]").prop("checked", false);
				// 그렇지 않으면 false로 (체크off)
		};
	});
	
});
</script>


<!-- conta = container -->

<div class="con">


<div class="form-inline">
	<select id="searchTypeSel" name="searchType">
		<option value="">검색조건</option>
		<option value="all"><c:out value="${map.searchOption == 'all'?'selected':'' }"/> 제목+내용 </option>		
		<option value="title"><c:out value="${map.searchOption == 'title'?'selected':'' }"/>제목</option>
		<option value="content"><c:out value="${map.searchOption == 'content'?'selected':'' }"/>내용</option>
	</select>

	<input class="form-control" type="text" id="keyword" name="keyword"
		value="${cri.keyword }" placeholder="검색어를 입력하세요"/>
		
	<button id="searchBtn" class="btn btn-primary">Search</button>

	</div>



<div class="list">
<form action="/admin/noticedelete" method="post">


<table class="table table-striped table-hover">
	
	<tr>
<!-- 		<th>선택</th> -->
		<th><input type="checkbox" id="checknoticeall" value="${noli.noticeIdx }"></th>
		<th>글번호</th>
		<th>분류</th>
		<th>제목</th>
		<th>등록일</th>	
<!-- 		<th> <img src="../../../../../test.PNG"> </th> -->
	</tr>

  
	<c:forEach items="${noticelist }" var="noli">
	<tr>		
		<%--**name값이 Controller와 연결, value값이 Idx값을 가져오므로 필수 --%>
		<td><input type="checkbox" name="noticeIdx" id="checknotice" value="${noli.noticeIdx }"> 
		<td>${noli.noticeIdx }</td>
		<td>${noli.NTypeIdx }</td>
		<td><a href="/admin/noticeview?noticeIdx=${noli.noticeIdx }"> ${noli.noticeTitle }</a></td>
		<td><fmt:formatDate value="${noli.createDate }" pattern="yyyy-MM-dd"/></td>
	</tr>	
	</c:forEach>

</table>

<div>
 <ul>
  <c:if test="${pageMaker.prev}">
   <li><a href="noticelist${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
  </c:if> 
  
  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
   <li><a href="noticelist${pageMaker.makeQuery(idx)}">${idx}</a></li>
  </c:forEach>
    
  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
   <li><a href="noticelist${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
  </c:if> 
 </ul>
</div>




<div class="btndel">
<a href="/admin/noticedelete"> <button>글삭제</button></a>
</div>

</form>
<div class="btnwrite">
<a href="/admin/noticewrite"><button> 글쓰기 </button></a>
</div>
<a href="/admin/noticelist">페이징 테스트</a>
<%-- <jsp:include page="../../utils/noticepaging.jsp"/> --%>
</div>
</div>
</body>
</html>