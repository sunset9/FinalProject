<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<style>
.waiting {
	color:red;
}
#inqList { 
	margin: 0 auto;
	width: 90%;
}

/* 탭 메뉴 설정 */
.tabSec{
	border-top: 1px solid #e1e1e1; 
 	border-left: 1px solid #e1e1e1; 
	width: 33%;
	display: inline-block;	
 	height: 45px; 
	text-align: center;
	font-size: 1.5em;
	font-weight: bold;
    line-height: 2;
	vertical-align:middle;
	float: left;
    border-bottom: 2px solid #f2b133;
    color: #5f5f5f;
    background: #f6f6f6;
}

#tabDiv{
	margin-top: 20px; 
	width: 100%;
    height: 45px;
}

/* 활성화된 탭 */
#inquiry{
	color: #f2b133;
    border: 2px solid #f2b133;
    border-bottom: none;
    background: #fff;
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

<script type="text/javascript">

if($('#inqList tbody').find('tr').length == 0 ){
	$('#inqList tbody').append('<tr><td colspan=5>문의 내역이 없습니다.</td></tr>');
}
</script>

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
	<th style="width: 10%">글번호</th>
	<th style="width: 50%;">제목</th>
	<th style="width: 10%">답변 상태</th>
	<th style="width: 15%">작성자</th>
	<th style="width: 20%">작성일</th>
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