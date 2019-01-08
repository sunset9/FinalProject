<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <link rel="stylesheet" href="/resources/css/melonweb_layout.css" type="text/css" />  -->
<!-- <link rel="stylesheet" href="/resources/css/melonweb_main_n.css" type="text/css" />  -->
<style>
ul{	list-style:none;}

a {color:#1a1a1a; text-decoration:none;}
a:link	{color:#1a1a1a; text-decoration:none;}

#header {
    width: 1130px;
    margin: 0 auto;
}
#util_menu{
    display: flex;
    float: right;
}
#util_menu li:not(.first_child):after{
	content: '';
	
}
#util_menu li {
	float:left;
	margin-left:10px;
}

.srch_set{
	display: flex;
}
.tap_menu {
	display: inline-block;
}
.tap_menu li {
	float:left;
}

.logo_text {
	display: inline-block;
}

 .tap_menu li a{ 
 display:block; 
 font-weight:normal; 
 line-height:50px; 
 margin:0px; 
 padding:0px 25px; 
 text-align:center; 
 text-decoration:none; 
 } 

/* 마이페이지 드롭 박스 */
.tap_menu li ul{
background-color: white;
display:none;
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
}

.tap_menu li:hover ul{
display:block;
}

.tap_menu li li {
display:block;
float:none;
margin:0px;
padding:0px;
width:200px;
}

.tap_menu li ul a{
display:block;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}
</style>
<div id="wrap">
<div id="header" class="main">
<div id ="header_wrap" class="pr_none">

<div id="util_menu">
	<ul>
		<li class="first_child">
		<a href="/admin/main"><span>관리자</span></a>
		</li>
		<c:if test="${login }">
		<li><a href="/user/logout"><span>로그아웃</span></a></li>
		</c:if>
		
		<c:if test="${!login }">
		<li><a href="/user/login"><span>로그인</span></a></li>
		</c:if>
		<c:if test="${!login }">
		<li><a href="/user/join"><span>회원가입</span></a></li>
		</c:if>
		
		<li><a href="#"><span>고객센터</span></a></li>
		<li class="last_child"><a href="#" class="menu01 mlog"><span>이용안내</span></a></li>
	</ul>
</div><!-- util_menu -->

<h1 id="logo">
<a href="/ticket/ticketmain"><img  height="80" alt="바나나로고" src="/resources/image/bananalogo2.png"></a>
</h1>
<div class="main_srch">
	<form action="/ticket/ticketsearch" method="get">
	<input type="text" title="공연 검색" name="top_searchh" id="top_searchh" class="placeholder">
	<button type="submit" class="main_search_btn" title="검색" >검색</button>
	</form>
</div>

<div class="tap_menu">
	<ul >
		<li><a href="/ticket/concert">콘서트</a></li>
		<li><a href="/ticket/musicalplay">뮤지컬&공연</a></li>
		<li><a href="/ticket/familychild">가족&아동</a></li>
		<li><a href="/ticket/ticketopen">티켓 오픈</a></li>
		<li><a href="/ticket/ranking">예매 랭킹</a></li>
		<li><a href="/mypage/myticket" id="current">마이페이지</a>
			<ul>
	        	<li><a href="/mypage/myticket"">예매 현황</a></li>
	        	<li><a href="/mypage/mychoice">찜</a></li>
	        	<li><a href="/mypage/viewinquiry">내 문의</a></li>
	        </ul>
        </li>
	</ul>
	</div>
</div>
</div>
</div>