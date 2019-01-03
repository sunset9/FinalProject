<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- DATEPICKER -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
.wrapper {
	display : -webkit-flex;
	display : flex;
}

.main {
	width: 100%;
	-webkit-flex : 1;
	flex : 1;
}

.side {
	float: left;
	width : 240px;
	height: 2000px;
	background: #e0e0e0;
	margin-right: 20px;
}

.side > ul {
	width: 200px;
}

/* * { */
/*     -webkit-box-sizing: content-box; */
/*     box-sizing: content-box; */
/* } */

h1, h2, h3 {
	display: inline-block;
}
.thumbnail a>img, .thumbnail>img {
    height: 150px;
}
.pfmIdx>img{
 height: 150px;
}

.logo {    
    width: 170px;
    height: 60px;
    margin-bottom: 20px;
    margin-top: 5px;
    margin-left: 26px;
}

.contents-wrapper{
 	float: left;
    width: 1000px;
    position: absolute;
    left: 260px;
}

.dropdown {
	position: relative;
}

.dropdown ul {
	height: 0;
	overflow: hidden;
  	-webkit-transition: height linear .3s;
    -moz-transition: height linear .3s;
    -o-transition: height linear .3s;
    transition: height linear .3s;
    transition-duration: .3s;
}

.dropdown:hover ul {
	height: 65px;
}

.dropdown2 ul {
	height: 0;
	overflow: hidden;
  	-webkit-transition: height linear .3s;
    -moz-transition: height linear .3s;
    -o-transition: height linear .3s;
    transition: height linear .3s;
    transition-duration: .3s;
}

.dropdown2:hover ul {
	height: 100px;  
}

.menuUl a{
	text-decoration: none;
	color: #333333;
	font-size: 20px;
	font-weight: 800;
}

.menuUl a:hover{
	color: #747475;
}

.dropdown, .dropdown2 {
	color: #333333;
}
.dropdown:hover, .dropdown2:hover{
	
}

.menuUl ul {
	list-style: none;
}

.menuUl li {
	font-size: 20px;
	font-weight: 800;
	margin-bottom: 7px;
}
</style>
</head>
<body>
<div class = "side">
	<a href="/ticket/ticketmain"><img class="logo" src="/resources/image/bananalogo.png"/></a>
	<div class="menuUl">
	<ul>
		<li><a href="/admin/main">관리자 홈</a></li>
		<li><a href="/admin/userlist">회원 관리</a></li>
		<li><a href="/admin/soblist">예매 현황</a></li>
		<li><a href="/admin/managerpfm">공연 관리</a></li>
		<li class="dropdown">메인 배너 관리
			<ul>
				<li><a href="/admin/mainbannerlist" style="font-size: 16px;">메인배너</a></li>
				<li><a href="/admin/tabBannerList" style="font-size: 16px;">탭 배너</a></li>
			</ul>
		</li>
		<li class="dropdown2">카테고리 배너 관리			
			<ul>
				<li><a href="/admin/registcatecon" style="font-size: 16px;">콘서트</a></li>
				<li><a href="/admin/registcatemu" style="font-size: 16px;">뮤지컬&연극</a></li>
				<li><a href="/admin/registcatefam" style="font-size: 16px;">가족&아동</a></li>
			</ul>
		</li>
		<li><a href="/admin/viewinquiry">1:1 문의</a></li>
		<li><a href="/admin/noticelist">공지사항</a></li>
		<li><a href="/admin/faqlist">FAQ</a></li>
		<li><a href="/admin/registhall">공연장등록</a></li>
	</ul>
	</div>
</div>
<div class = "main">