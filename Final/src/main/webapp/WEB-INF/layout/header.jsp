<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/melonweb_layout.css" type="text/css" /> 
<link rel="stylesheet" href="/resources/css/melonweb_main_n.css" type="text/css" /> 

<div id="wrap">
<div id="header" class="main">
<div id ="header_wrap" class="pr_none">
<div id="gnb" class="clear_g">
<div id="util_menu">
<div class="top_right ">
						<ul class="clfix">
							
							<li class="first_child">
							<a href="/admin/main" class="menu01 mlog" ><span>관리자</span></a>
							</li>
							<c:if test="${login }">
							<li><a href="/user/logout" class="menu01 mlog"><span>로그아웃</span></a></li>
							</c:if>
							
							<c:if test="${!login }">
							<li><a href="/user/login" class="menu01 mlog"><span>로그인</span></a></li>
							</c:if>
							<li><a href="/user/join"class="menu01 mlog"><span>회원가입</span></a></li>
							<li><a href="#" class="menu01 mlog"><span>고객센터</span></a></li>
							<li class="last_child"><a href="#" class="menu01 mlog"><span>이용안내</span></a></li>
	
						</ul>
</div><!-- top_right -->
</div><!-- util_menu -->
<h1 id="logo">
<a href="/ticket/ticketmain"><img  height="80" alt="바나나로고" src="/resources/image/bananalogo2.png"></a>
</h1><!-- end of id =logo -->
<div class="srch_set">
                    <fieldset>
                        <legend>통합검색영역</legend>
                        <input type="text" title="검색 입력 편집창" name="" id="top_searchh" class="placeholder">
                        <button type="button" class="btn_icon search_m" id="btn_top_search" title="검색" ><span class="btn_comm">검색</span></button>
                    </fieldset>
</div><!-- end of class="srch_set -->

<div class="tap_menu">
	<ul >
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
</div><!-- end of clear_g -->
</div>
</div>
</div>