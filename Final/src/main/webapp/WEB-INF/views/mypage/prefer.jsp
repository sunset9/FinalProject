<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style type="text/css">
#userinfo{
	background-color: #CCC;
}

#userProfile{
	width: 150px;

	
}
#userNick{
	font-weight: bolder;
	font-size: 2em;
}

#preferTheme{

	border: 1px solid #CCC;
}
</style>
    
<h1>마이페이지 선호 찜</h1>
<hr>
<div id = "userinfo">
	<div class = "form-inline">
	
		<img id = "userProfile" src="${loginUser.profile }"  class="img-circle"/>
		<span id="userNick">${loginUser.nick }</span> <small>님 안녕하세요</small>
		<button id="userInfoChange" class="btn btn-default">정보 변경</button>
		<span>입금 대기</span><span>예매 완료</span><span>취소 현황</span>
	</div>
	
	
</div>

<hr>
<h3>선호 테마 선택</h3>
<div id ="preferTheme">

<c:forEach items="${tList }" var="t">
	<label class="checkbox-inline" style ="width:30%">
		<input type="checkbox" name ="themeIdx" value="${t.themeIdx}" <c:forEach items="${ptList }" var="p">
			<c:if test="${t.themeIdx eq p.themeIdx}">
			checked="checked"
			</c:if>
		 </c:forEach> /> ${t.themeName }
	</label>
</c:forEach>

</div>

<button> 변경하기 </button>