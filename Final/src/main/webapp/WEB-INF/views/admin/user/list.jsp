<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	
});
</script>
<style type="text/css">
th, td:not(:nth-child(2)) {
	text-align: center;
}
td {
	border-left: 1px solid white;
	border-right: 1px solid white;
}

#pagingBox {
	position: relative;
}


/* 버튼 좌우정렬 및 상하정렬 */
#btnWriteBox, #btnDeleteBox {
	position: absolute;
	top: 0;
	bottom: 0;
	height: 30px;
	margin: auto;
}
#btnWriteBox {
	right: 10px;
}
#btnDeleteBox {
	left: 10px;
}
#btnDelete, #btnWrite {
	height: 25px;
}

</style>
</head>
<body>
<div>
<h3>회원 목록</h3>
<hr>

<table>
<thead>
<tr>
<th style="width: 5%">NO</th>
<th style="width: 29%">회원 아이디</th>
<th style="width: 15% ">닉네임</th>
<th style="width: 25%">총 예매금액(건수)</th>
<th style="width: 21%">가입일</th>
<th style="width: 20%">회원 구분</th>
</tr>
</thead>

<tbody>
<c:forEach items="${userList}" var="user">
<tr>
<td style="">${user.no }</td>
<td>${user.email }</td>
<td>${user.nick }</td>
<td>${user.amount }(${user.totalCnt })</td>
<td>${user.createDate }</td>
<td>${user.mGradeIdx }</td>
</tr>
</c:forEach>
</tbody>
</table>



<div id="userListSearchBox" class="text-center">
	<form action="/admin/userlist" method="get">
		<input type="text" name="userListSearch"/>
		<button>검색</button>
	</form>
</div>
</div>
</body>
</html>