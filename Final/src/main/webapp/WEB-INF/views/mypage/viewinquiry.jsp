<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<style>
.waiting {
	color:red;
}
#inqList { 
	width: 95%;
}

/* 탭 메뉴 설정 */
.tabSec{
/* 	border: 1px solid #CCC; */
	width: 33%;
	display: inline-block;	
/* 	height: 40px; */
	text-align: center;
	font-size: 1.5em;
	font-weight: bold;
	vertical-align:middle;
}
/* 화면 사용 범위 */

.temp{
	width: 95%;
	margin: 0 auto;
	margin-bottom: 30px;
	border-bottom: 1px solid #CCC;
	text-align: center;
}

#tabDiv{
	margin-top: 20px; 
}

/* 활성화된 탭 */
#inquiry{

	color :#fcd303;
	border-bottom: 3px solid #F2B134;
}	
#choice{
	border-left: 1px solid #CCC;
	border-right: 1px solid #CCC;
}
.btnDiv{
	text-align:right;
}

.btn-block{
	margin: 30px auto;
	height: 40px;
}

</style>
<hr>
<div class ="main_wrapper">
<div>
<!-- 유저 정보 담고 있는 jsp -->
<jsp:include page="userinfo.jsp" />
</div>

<div id="tabDiv"class ="temp">
	<a href='/mypage/myticket'><div class = "tabSec" id ="ticket">예매현황</div></a>
	<a href='/mypage/mychoice'><div class = "tabSec" id ="choice">찜</div></a>
	<a href='/mypage/viewinquiry'><div class = "tabSec" id ="inquiry">내 문의사항</div></a>
</div>

<div class="contents-wrapper">
<div class ="btnDiv">
<button  onclick="location.href='/mypage/writeinquiry'" style="width: 120px;" class="btn btn-warning btn-block" >1:1문의하기</button></div>


<table class="table" id="inqList">
<thead>
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>답변 상태</th>
	<th>작성자</th>
	<th>작성일</th>
</tr>
</thead>
<tbody>
<c:forEach items="${inqList }" var="inq">
<tr>
	<td>${inq.inqIdx }</td>
	<td><a href="/mypage/detailinquiry?inqIdx=${inq.inqIdx }">${inq.title }</a></td>
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
</div>
</div>
</div>