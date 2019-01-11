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
	margin-right: 16px;
}
.alist:first-child{
	position: relative;
    top: 15px;
}
nav{
	float: right;
}

ul{
	clear :right;
	padding-left: 5px;
}

#preferImg{
	clear: right;
	display: inline-block;
    width: 155px;
    height: auto;
	border: 1px soild #F2B134;
	margin-right: 13px;
	
}
.artistImg	 {
	width: 120px;
	height: auto;
    position: relative;
    top: -23px;
}
.circle {
	width: 120px;
	height: 120px;
	overflow: hidden;
    border-radius: 50%; 
}
.preArtistName{
	display: block;
	margin-top: 7px;
}
#noArtist {
	position: relative;
    top: -71px;
    font-size: 18px;
}
</style>

<script>
$(document).ready(function() {
	// 선택된 아티스트 없는 경우
	console.log("dddd: " + $('li.alist').length);
	console.log($('.alist'));
	if( $('.alist').length == 1 ) {
		$('.alist').after($('<span id="noArtist"> 선호 아티스트가 없습니다. </span>'));		
// 		$('.alist').after($('<li class="alist"><p> 선호 아티스트가 없습니다. </p></li>'));		
	}
	
});
</script>

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
		<span>&nbsp;</span>
<!-- 			<span>내 아티스트</span> -->
	</li>	  

	<c:forEach items="${aList }" var ="a"> 
		<li class ="alist">
			<div class="circle">
				<img src="${a.imgUri }"  class="artistImg"/>
			</div>
			<span class="preArtistName">${a.name }</span>
		</li>	  
	</c:forEach>
</ul>
</div>
	
</div>
