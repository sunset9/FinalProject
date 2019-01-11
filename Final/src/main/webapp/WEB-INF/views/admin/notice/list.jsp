<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/menu.jsp"/>

 
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>

.container {
	display: inline-block;
	width: 1000px;
}

.btnwrite {
 position:fixed;
 right:20px;
 bottom:50px;
}

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



<div class="container">
<a href="/admin/noticelist">
<h1> 공지사항 </h1></a>
<br><br>

<div class="search row">
	<div class="col-xs-2 col-sm-2">
 <select name="searchType" class="form-control">
<%--   <option value="n"<c:out value="${searchpagingt.searchType == null ? 'selected' : ''}"/>>-----</option> --%>
  <option value="t"<c:out value="${searchpagingt.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
  <option value="c"<c:out value="${searchpagingt.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
  <option value="tc"<c:out value="${searchpagingt.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
 </select>
</div>
<div class="col-xs-10 col-sm-10">
	<div class="input-group">
		 <input type="text" name="keyword" id="keywordInput" value="${searchpagingt.keyword}" class="form-control"/>
		<span class="input-group-btn">
			 <button id="searchBtn" class="btn btn-default">검색</button>
			 </span>
	</div>
</div>
	 <script>
	 $(function(){
	  $('#searchBtn').click(function() {
	   self.location = "noticelistsearch"
	     + '${pageMaker.makeQuery(1)}'
	     + "&searchType="
	     + $("select option:selected").val()
	     + "&keyword="
	     + encodeURIComponent($('#keywordInput').val());
	    });
	 });   
 	 </script> 
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
	</tr>

  
	<c:forEach items="${noticelist }" var="noli">
	<tr>		
		<%--**name값이 Controller와 연결, value값이 Idx값을 가져오므로 필수 --%>
		<td><input type="checkbox" name="noticeIdx" id="checknotice" value="${noli.noticeIdx }"> 
		<td>${noli.noticeIdx }</td>
		<td>${noli.NTypeIdx }</td>
		<td><a href="/admin/noticeview?noticeIdx=${noli.noticeIdx }"> ${noli.noticeTitle }</a></td>
		<td><fmt:formatDate value="${noli.createDate }" pattern="yyyy-MM-dd"/></td>
<%-- 		<td>${noli.createDate }</td> --%>
	</tr>	
	</c:forEach>

</table>

<div class="col-md-offset-3">
 <ul class="pagination">
  <c:if test="${pageMaker.prev}">
   <li><a href="noticelist${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전 목록</a></li>
  </c:if> 
  
  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
   <li <c:out value="${pageMaker.pagingt.page == idx ? 'class=active': '' }"/>>
   <a href="noticelist${pageMaker.makeQuery(idx)}">${idx}</a></li>
  </c:forEach>
    
  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
   <li><a href="noticelist${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음 목록</a></li>
  </c:if> 
 </ul>
</div>


<!-- <div class="btndel"> -->
<!-- <a href="/admin/noticedelete"> <button> -->
<!-- <img src="/resources/image/notidelete.png"></button></a> -->
<!-- </div> -->



<div class="btndel">
<a href="/admin/noticedelete"> <button>글삭제</button></a>
</div>

</form>

<div class="btnwrite">
<a href="/admin/noticewrite">
<img src="/resources/image/notiwrite.png"></a>

</div>

</div>
</div>
</body>
</html>