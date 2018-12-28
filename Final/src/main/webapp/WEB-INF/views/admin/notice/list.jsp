<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/menu.jsp" />

 
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>

.con{width:50%; }

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


<h1>공지 리스트</h1>
<hr>
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




<form action="/admin/noticedelete" method="post">

<div>
<table class="table table-striped table-hover">
	
	<tr>
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
	</tr>	
	</c:forEach>

</table>

<a href="/admin/noticedelete"> <button>글삭제</button></a>

</form>
</div>
<a href="/admin/noticewrite"><button> 글쓰기 </button></a>

<jsp:include page="../../utils/noticepaging.jsp"/>
</div>
</body>
</html>