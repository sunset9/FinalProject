<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">

</script>

<style>
.topbanner {
	text-align: center;
	margin: 20px;  
}

.bannerImg	{
	margin: 5px;
	width: 200px;
	height: 250px;
}

li.pfmInfo {
	list-style: none;
	float: left;
}
</style>


<div class="container">
	<h3>HOT OPEN 소식</h3>
	
	<!-- 관리자가 지정한 오픈소식 배너 ?-->
	<!-- 	일단 등록된 포스터에서 rownum으로 5개 걸러내서 리스트 뽑음 -->
	<div class="topbanner">
	<ul id="posterList">
		<c:forEach items="${openList }" var="list">
			<li class="pfmInfo">
				<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<span class="thumImg">
					<img class="bannerImg" src="/resources/image/${list.originName}" /><br>
				</span>
				<strong>${list.name }</strong>
				</a>
			</li>
		</c:forEach>
	</ul>
	</div>
	
</div>