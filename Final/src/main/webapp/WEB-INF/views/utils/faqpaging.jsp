<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="text-center">
<nav>
  <ul class="pagination">
  
  
  	<!-- 이전 페이지 -->
  	<!-- 첫 페이지라면 금지 표시 -->
  	<c:if test="${paging.curPage eq 1 }"><!-- 첫페이지일때 -->
  	<li class="disabled">
      <a href="/admin/faqlist"
       aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
  	</c:if>
  	<c:if test="${paging.curPage ne 1 }"><!-- 첫페이지가아닐때 -->
  	<li>
  	  <fmt:parseNumber var="p" integerOnly="true" value="${(paging.curPage/paging.pageCount)}"/>
  	  <fmt:parseNumber var="prevPage" integerOnly="true" value="${(p-1)*paging.pageCount+1 }"/>
      <a href="/admin/faqlist?curPage=${prevPage }"
       aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    </c:if>
    
    
    
    
    
    <!-- 페이징 번호 -->
    <c:forEach begin="${paging.startPage }"
    	end="${paging.endPage }"
    	var="page">
    	
    	<c:if test="${paging.curPage eq page }">
	   	<li class="active">
	   		<a href="/admin/faqlist?curPage=${page }">${page }</a>
	   	</li>
	   	</c:if>
	
	   	<c:if test="${paging.curPage ne page }">
	   	<li>
		   	<a href="/admin/faqlist?curPage=${page }">${page }</a>
	   	</li>
	   	</c:if>
    </c:forEach>
    
    
    
    


    <!-- 다음 페이지 -->
  	<!-- 마지막 페이지라면 금지 표시 -->
  	<c:if test="${paging.curPage eq paging.totalPage }"><!-- 마지막 페이지일때 -->
  	<li class="disabled">
      <a href="/admin/faqlist?curPage=${paging.totalPage }"
       aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  	</c:if>
  	<c:if test="${paging.curPage ne paging.totalPage }"><!-- 마지막 페이지가아닐때 -->
    
    <fmt:parseNumber var="n" integerOnly="true" value="${(paging.curPage/paging.pageCount)}"/>
  	<fmt:parseNumber var="nextPage" integerOnly="true" value="${(p+1)*paging.pageCount+1 }"/>

  	<li>
      <a href="/admin/faqlist?curPage=${nextPage }"
       aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    </c:if>
    
  </ul>
</nav>
</div>



