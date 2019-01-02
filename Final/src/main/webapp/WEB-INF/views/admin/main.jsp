<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ticket.utils.CountManager" %>
<jsp:include page="../admin/layout/menu.jsp" />
<style type="text/css">
.Box {
	display: grid;
	width: fit-content;
	position: absolute;
    left: 295px;
}

.tableDiv1 {
	display: inline-flex;
}

.tableDiv2 {
	display: inline-flex;
}

.table1 {
	border: 4px solid black;
	width: 400px;
	margin: 20px;
	height: 450px;
}

.table2 {
	border: 4px solid black;
	width: 400px;
	margin: 20px;
	height: 300px;
}

.first {
	font-weight: 900px;
	font-size: 30px;
}

td {
	padding-left: 10px;
	padding-right: 10px;
	text-align: center;
}

img {
	width: 60px;
	height: 60px;
}

h1 {
    font-weight: bolder;
}

h3 {
	margin-top: 0px;
    margin-bottom: 0px;
}

h2 {
	margin-top: 0px;
    margin-bottom: 0px;
}
</style>

<div>

<div class="Box">
	<div class="tableDiv1">
	<table class="table1">
		<tr>
			<td colspan="2"><h1>오늘의 예매</h1></td>
		</tr>
		<tr>
			<td><img src="/resources/image/icon01.png" /></td>
			<td  ><h1>${todayBook}건</h1></td>
		</tr>
		<tr>
			<td colspan="2"><h1>오늘의 예매취소</h1></td>
		</tr>
		<tr>
			<td style="padding-bottom: 25px;"><img src="/resources/image/icon02.png" /></td>
			<td style="padding-bottom: 25px;"><h1>${todayCancel}건</h1></td>
		</tr>
	</table>
	<table class="table1">
		<tr>
			<td colspan="2"><h1>오늘 등록된 공연</h1></td>
		</tr>
		<tr>
			<td colspan="2"><h1 style="margin: 0px; font-size: 50px;">${todayAllPfm}건</h1></td>
		</tr>
		<tr>
			<td style="width: 170px;"><h3>콘서트</h3></td>
			<td><h2>${todayConcert}건</h2></td>
		</tr>
		<tr>
			<td style="width: 170px;"><h3>뮤지컬&연극</h3></td>
			<td><h2>${todayMusical}건</h2></td>
		</tr>
		<tr>
			<td style="width: 170px;"><h3>가족&아동</h3></td>
			<td><h2>${todayFamily}건</h2></td>
		</tr>
		<tr>
			<td colspan="2"><h3 style="padding-bottom: 20px;">총 누적공연 : 1000건</h3></td>
		</tr>
	</table>
	</div>
	
	
	
	
	
	<div class="tableDiv2">
	<table class="table2">
		<tr>
			<td colspan="2"><h1>현재 접속자</h1></td>
		</tr>
		<tr>
			<td><img src="/resources/image/icon03.png" /></td>
			<td><h1><%= CountManager.getCount() %>명</h1></td>
		</tr>
	</table>
	<table class="table2">
		<tr>
			<td colspan="2"><h1>1:1 문의</h1></td>
		</tr>
		<tr>
			<td><img src="/resources/image/icon04.png" /></td>
			<td><h1>${unansweredInq}건</h1></td>
		</tr>
	</table>
	</div>
</div>

</div>

</div>
</body>
</html>