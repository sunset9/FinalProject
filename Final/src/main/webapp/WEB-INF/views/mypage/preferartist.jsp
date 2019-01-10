<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
.alist{
	display: inline-block;
	text-align: center;
	margin-right: 5px;
}

nav{
	float: right;
}

ul{
	clear :right;
}

#preferImg{
	clear: right;
	display: inline-block;
	width:120px;
	height:150px;
	border: 1px soild #F2B134;
}
.artistImg{
/* 	display: block; */
	margin-top: 3px;
	font-weight: bol
}
.preArtistName{
	display: block;
	margin-top: 10px;
}
</style>

<div class = "main_wrap">



<div class="text-center">
<nav>
  <ul class="pagination">
  
  
  	<!-- 이전 페이지 -->
  	<!-- 첫 페이지라면 금지 표시 -->
  	<c:if test="${paging.curPage eq 1 }"><!-- 첫페이지일때 -->
  	<li class="disabled">
        <span aria-hidden="true">&laquo;</span>
    </li>
  	</c:if>
  	<c:if test="${paging.curPage ne 1 }"><!-- 첫페이지가아닐때 -->
  	<li>
        <span aria-hidden="true" style="cursor: pointer" onclick="artList(${paging.curPage-1 })">&laquo;</span>
    </li>
    </c:if>
    
    
    
    <!-- 페이징 번호 -->
    
    <li><span>${paging.curPage }/${paging.endPage }</span></li>
    


    <!-- 다음 페이지 -->
  	<!-- 마지막 페이지라면 금지 표시 -->
  	<c:if test="${paging.curPage eq paging.totalPage }"><!-- 마지막 페이지일때 -->
  	<li class="disabled">
        <span aria-hidden="true" >&raquo;</span>
    </li>
  	</c:if>
  	<c:if test="${paging.curPage ne paging.totalPage }"><!-- 마지막 페이지가아닐때 -->
  	<li>
        <span aria-hidden="true" style="cursor: pointer" onclick="artList(${paging.curPage+1 })">&raquo;</span>
    </li>
    </c:if>
    
  </ul>
</nav>
</div>

<div>
<ul>
		<li class ="alist"><img id="preferImg" src="/resources/image/prefera.PNG"  class="img-circle artistImg"/><br>
			<span>내 아티스트</span>
		</li>	  

	<c:forEach items="${aList }" var ="a"> 
		<li class ="alist"><img src="${a.imgUri }"  class="img-circle artistImg"/><br>
			<span class="preArtistName">${a.name }</span>
		</li>	  
	</c:forEach>
</ul>
</div>
	
</div>
