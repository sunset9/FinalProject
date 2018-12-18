<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div id="searchBox">

	<input type="text" id="main_search" />
	<button id="main_searchbtn">검색</button>

</div>

<div class="main1">
<div class="logo_text">
	<h1 class="maintext text-left">
		<a href="/ticket/ticketmain">Banana</a>
	</h1>
</div>
<div class="top_menu">
	<ul>
		<li><a href="/admin/main">관리자</a></li>
		<c:if test="${login }">
		<li><a href="/user/logout">로그아웃</a></li>
		</c:if>
		<c:if test="${!login }">
		<li><a href="/user/login">로그인</a></li>
		</c:if>
		<li><a href="/user/join">회원가입</a></li>
		<li>고객센터</li>
		<li>이용안내</li>
	</ul>
</div>
</div>
<div class="tap_menu">
	<ul>
		<li><a href="/ticket/concert">콘서트</a></li>
		<li><a href="/ticket/musicalplay">뮤지컬&공연</a></li>
		<li><a href="/ticket/familychild">가족&아동</a></li>
		<li><a href="/ticket/ticketopen">티켓 오픈</a></li>
		<li><a href="/ticket/ranking">예매 랭킹</a></li>
		<li><a href="/mypage/myticket" id="current">마이페이지</a>
			<ul>
	        	<li><a href="#">예매 현황</a></li>
	        	<li><a href="/mypage/mychoice">찜</a></li>
	        	<li><a href="#">내 문의</a></li>
	        </ul>
        </li>
	</ul>
</div>