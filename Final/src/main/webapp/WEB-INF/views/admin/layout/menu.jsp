<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrapper {
	display : -webkit-flex;
	display : flex;
}

.main {
	-webkit-flex : 1;
	flex : 1;
}

.side {
	width : 200px;
	height: -webkit-fill-available;
	background: #e6eaf2;
}
</style>
</head>
<body>
<div class = "wrapper">
	<div class = "side">
		<ul>
			<li><a href="/admin/main">관리자 홈</a></li>
			<li><a href="/admin/userlist">회원 관리</a></li>
			<li><a href="">예매 현황</a></li>
			<li><a href="/admin/managerpfm">공연 관리</a></li>
			<li>메인 배너 관리
				<ul>
					<li><a href="">메인배너</a></li>
					<li><a href="">탭 배너</a></li>
				</ul>
			</li>
			<li>카테고리 배너 관리
				<ul>
					<li><a href="/admin/pfm/cateCon">콘서트</a></li>
					<li><a href="/admin/pfm/cateMu">뮤지컬&연극</a></li>
					<li><a href="">가족&아동</a></li>
				</ul>
			</li>
			<li><a href="">1:1 문의</a></li>
			<li><a href="">공지사항</a></li>
			<li><a href="">FAQ</a></li>
		</ul>
	</div>
	<div class = "main">
		콘텐츠 영역
	</div>
</div>
</body>
</html>