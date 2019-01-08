<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<style type="text/css">


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

#cancel{
	display: none;
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
#ticket{
	color :#fcd303;
	border-bottom: 3px solid #F2B134;
/* 	border-left: 3px solid #fcd303; */
/* 	border-right: 3px solid #fcd303; */
/* 	border:3px solid #fcd303; */
}
#choice{
	border-left: 1px solid #CCC;
	border-right: 1px solid #CCC;
}

/* 예매 확인 취소 버튼  */
#completeBtn{
	width: 140px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    background: #F2B134;
    font-weight: bold;
}

#cancelBtn{
	width: 140px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    background: #FFF;
    color:#AAA;
    font-weight: bold;
}

.btn{
	display: inline-block;
	margin: 20px auto;
}

th{
	text-align: center;
	border-left: 1px solid #CCC;
	border-right: 1px solid #CCC;
}
dt{
	font-weight: bold;
	float: left;
}
.poster{
	display: inline-block;
	float: left;
}
td{
	vertical-align:middle !important;
}
.pfminfo{
	display: inline-block;
	margin-top: 30px;
}
.bookTr{
	height: 132px;
}

</style>

<script type="text/javascript">

$(document).ready(function(){
	$('#completeBtn').click(function() {
		$('#complete').show();
		$('#cancel').hide();
		$('#completeBtn').css("background","#F2B134");
		$('#completeBtn').css("color","black");
		$('#cancelBtn').css("background","#FFF");
		$('#cancelBtn').css("color","#AAA");
		
	}); // click end
	
	$('#cancelBtn').click(function() {
		$('#cancel').show();
		$('#complete').hide();
		$('#cancelBtn').css("background","#F2B134");
		$('#cancelBtn').css("color","black");
		$('#completeBtn').css("background","#FFF");
		$('#completeBtn').css("color","#AAA");
		
	}); // click end
});
</script>


<hr>
<div class = "main_wrapper">
<!-- 유저 정보 담고 있는 jsp -->
<jsp:include page="userinfo.jsp" />
</div>

<div id="tabDiv"class ="temp">
	<a href='/mypage/myticket'><div class = "tabSec" id ="ticket">예매현황</div></a>
	<a href='/mypage/mychoice'><div class = "tabSec" id ="choice">찜</div></a>
	<a href='/mypage/viewinquiry'><div class = "tabSec" id ="inquiry">내 문의사항</div></a>
</div>

<div class ="contain temp">

<div class = "btn">
<button id="completeBtn">예매확인</button>
<button id="cancelBtn">예매취소</button>
</div>

<div id="complete">
<table class="table table-hover table-striped table-condensed">
<thead>
<tr>
	<th style="width: 10%">예매일</th>
	<th style="width: 35%">공연정보</th>
	<th style="width: 35%">예매정보</th>
	<th style="width: 20%">상태</th>
</tr>
</thead>

<tbody>
<c:forEach items="${sob }" var="sob"  >
	<c:if test='${sob.state eq "예매완료(결제완료)"||sob.state eq "예매완료(부분취소)"}'>
	<tr class="bookTr">
		<td><fmt:formatDate value="${sob.createDate }" pattern="yyyy-MM-dd"/></td>

		<td>
		<div>
		
		<div class="poster">
			<a><img style="width: 80px" src="/resources/image/${sob.storedName }"></a> <!-- 포스터 -->
		</div>
		<div class ="pfminfo">
			<span>${sob.name }</span> <!-- 공연제목 --><br>
			<span><fmt:formatDate value="${sob.pfmStart }" pattern="yyyy-MM-dd"/> ~ 
			<fmt:formatDate value="${sob.pfmEnd }" pattern="yyyy-MM-dd"/></span><br>
			<span>${sob.hallName }</span>
		</div>
		</div>
		</td>

		<td><div>
		<dl>
			<dt>예약번호</dt>
			<dd>${sob.bookGroup }</dd>
			<dt>관람일</dt>
			<dd>
			<fmt:formatDate value="${sob.pfmDate}" pattern="yyyy-MM-dd"/>
			(<fmt:formatDate value="${sob.pfmDate}" pattern="E"/>)
			 &nbsp; ${sob.pfmTime}  </dd>
			<dt>매수</dt>
			<dd>${sob.ea }매</dd>
		</dl>
		</div></td>

		<td>${sob.state }
			<button onclick="location.href='/mypage/detailicket?pfmIdx=${sob.pfmIdx}'">예매 상세</button>
		</td>
	</tr>
	</c:if>
</c:forEach>
</tbody>
</table>
</div>

<div id ="cancel">
<table class="table table-hover table-striped table-condensed">
<thead>
<tr>
	<th style="width: 10%">예매일</th>
	<th style="width: 35%">공연정보</th>
	<th style="width: 35%">예매정보</th>
	<th style="width: 20%">상태</th>
</tr>
</thead>

<tbody>
<c:forEach items="${csob }" var="sob"  >
	<c:if test='${sob.state eq "취소중"||sob.state eq "취소완료"}'>
	<tr class="bookTr">
		<td><fmt:formatDate value="${sob.createDate }" pattern="yyyy-MM-dd"/></td>

		<td>
		<div>
		<div class="poster">
		<a><img style="width: 80px" src="/resources/image/${sob.storedName }"></a> <!-- 포스터 -->
		</div>
			<div class ="pfminfo">
			<span>${sob.name }</span><br> <!-- 공연제목 -->
			<span><fmt:formatDate value="${sob.pfmStart }" pattern="yyyy-MM-dd"/> ~ 
			<fmt:formatDate value="${sob.pfmEnd }" pattern="yyyy-MM-dd"/></span><br>
			<span>${sob.hallName }</span><br>
			</div>
		</div></td>

		<td><div>
		<dl>
			<dt>예약번호</dt>
			<dd>${sob.bookGroup }</dd>
			<dt>관람일</dt>
			<dd>
			<fmt:formatDate value="${sob.pfmDate}" pattern="yyyy-MM-dd"/>
			(<fmt:formatDate value="${sob.pfmDate}" pattern="E"/>)
			 &nbsp; ${sob.pfmTime}  </dd>
			<dt>매수</dt>
			<dd>${sob.ea }매</dd>
		</dl>
		</div></td>

		<td>${sob.state }
			<button onclick="location.href='/mypage/canceldetail?pfmIdx=${sob.pfmIdx}'">취소 상세</button>
		</td>
	</tr>
	</c:if>
</c:forEach>
</tbody>
</table>
</div>




</div>
