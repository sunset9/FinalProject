<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <link rel="stylesheet" href="/resources/css/melonweb_layout.css" type="text/css" />  -->
<!-- <link rel="stylesheet" href="/resources/css/melonweb_main_n.css" type="text/css" />  -->
<style>
/* Anchor Property */
a		{color:#1a1a1a; text-decoration:none;}
a:link	{color:#1a1a1a; text-decoration:none;}
a:hover	{color:#1a1a1a; text-decoration:underline;}
a:visited	{color:#1a1a1a; text-decoration:none;}
ol,ul,li	{list-style:none;font-weight:normal;}
div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, code, del, dfn, em, img, q, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, dialog, figure, footer, header, hgroup, nav, section {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
 }
fieldset {border:0; line-height:0;}
legend   {position:absolute; top:-7000px; left:-7000px; height:0; /* visibility:hidden */}
a img {border:none;}
img	  {border:none;line-height:0;font-size:0;}
#header	{
	position:relative;
	width:100%; 
	min-width:1048px; 
	height:192px; 
	z-index:20;
    border-bottom: 1.5px solid #d4d4d4;
    margin-bottom: 20px;}
#header_wrap	{width:1008px;margin:0 auto;padding:0 228px 0 20px;}
/*#header.more_lay		{background:url(//cdnimg.melon.co.kr/resource/image/web/common/bg_head02.png) repeat-x;} 140314_GNB수정 */
#header_wrap	{width:1008px;margin:0 auto;padding:0 228px 0 20px;}
#header_wrap.pr_none {padding:0 19px;}
.event_gnb #header_wrap		{padding-right:0;}
#header_wrap.my_fold,
#header_wrap.fold_off	{padding:0 228px 0 20px;}
#header_wrap.fold_on	{padding:0 20px;}
#util_menu		{width:100%;height:30px;}

#gnb h1	{float:left;line-height:0;}
#gnb_menu {position:relative;height:55px;z-index:14;}
#gnb_menu ul {width:819px;}/*170531 수정 kjh*/
#gnb_menu ul.sub_gnb {width:auto;}
.gnb2_expn #gnb_menu {height:105px !important;}
#header.main #gnb_menu ul.sub_gnb {width:auto; margin-left:0;}
#header.main #gnb_menu ul li .more_wrap ul {width:auto;}

#gnb fieldset {display:inline;position:relative;float:left;width:322px !important;height:40px;margin:36px 0 0 11px; border: 3px solid #FFD513; z-index:15; left:180px;}
#gnb fieldset:after{display:block; content:''; clear:both;}
#gnb fieldset input[type=text] {display:inline;float:left;border:none;padding-top:3px;margin:7px 0 0 18px;padding-left:0px;height:20px;box-shadow:none;color:#1a1a1a;font-size:12px;line-height:20px;*line-height:22px;color:#999999;*height:23px;}
/*@media \0screen {input[type=text] {margin-top:-5px;}} /* IE8 */
#gnb fieldset input#top_search	{ime-mode:active;}
#gnb fieldset ::-webkit-input-placeholder		{color:#999999;}
#gnb fieldset input::-moz-placeholder		{color:#999999;}
#gnb fieldset input:-moz-placeholder			{color:#999999;}
#gnb fieldset input:-ms-input-placeholder			{color:#999999;}
#gnb fieldset .select_type03		{margin-top:1px;}
#gnb fieldset .btn_auto {float:left;}
#util_menu		{width:100%;height:30px;}
#util_menu {position:relative;width:1008px;margin:0 auto;height:38px;}
#util_menu .top_left {position:absolute;top:0;left:0;font-size:0;line-height:0;}
#util_menu .top_left ul li {position:relative;float:left;margin:5px 7px 0 0;padding-left:9px;background:url(//cdnimg.melon.co.kr/resource/image/web/common/bl_head_menu.jpg) 0 11px no-repeat;font-size:0; line-height:0;}
#util_menu .top_left ul li a {display:inline-block;padding:9px 7px; vertical-align:top;}
#util_menu .top_left ul li a span {display:block;background:url(//cdnimg.melon.co.kr/resource/image/web/common/head_menu_161206.png) no-repeat 0 0;font-size:0;line-height:0;text-indent: -9999px;}/*160706 수정*/
#util_menu .top_left ul li .menu01 span {width:47px;height:13px;background-position:0 -31px}/*161206 수정*/
#util_menu .top_left ul li .menu02 span {width:48px;height:13px;background-position:0 0}/*161206 수정*/
#util_menu .top_left ul li .menu03 span {width:61px;height:13px;background-position:0 -155px}/*161206 수정*/
#util_menu .top_left ul li a.menu01:hover span {height:13px;background-position:-150px -31px}/*161206 수정*/
#util_menu .top_left ul li a.menu02:hover span {height:13px;background-position:-150px 0}/*161206 수정*/
#util_menu .top_left ul li a.menu03:hover span {height:13px;background-position:-150px -155px}/*161206 수정*/
#util_menu .top_left ul li.first_child {background:none;padding-left:0;}

#util_menu .top_right {position:absolute;top:0;right:0;font-size:0;line-height:0;}
#util_menu .top_right ul li {position:relative;float:left;margin:5px 7px 0 0;padding-left:9px;background:url(//cdnimg.melon.co.kr/resource/image/web/common/bl_head_menu.jpg) 0 11px no-repeat;font-size:0; line-height:0;}
#util_menu .top_right ul li a {display:inline-block;padding:9px 7px;vertical-align:top;}
#util_menu .top_right ul li a span {font-size:14px;line-height:14px;text-indent: -9999px;}
#util_menu .top_right ul li .menu01 span {width:79px;height:13px;background-position:0 -60px}
#util_menu .top_right ul li .menu01:hover span {background-position: -150px -60px;}
#util_menu .top_right ul li .menu02 span {width:53px;height:12px;background-position:0 -91px}
#util_menu .top_right ul li .menu02:hover span {background-position: -150px -91px;}
#util_menu .top_right ul li .menu03 span {width:32px;height:12px;background-position:0 -122px}
#util_menu .top_right ul li .menu03:hover span {background-position: -150px -122px;} 
#util_menu .top_right ul li.first_child {background:none;padding-left:0;}
#util_menu .top_right ul li.last_child {margin-right:0; padding-right:0;}
.clfix:after			{content: "."; display: block; height: 0px; clear: both; visibility: hidden; font-size:0; line-height:0;}
.clfix				{display: inline-block;}
.clfix				{display: block;}
* html .clfix		{height: 1%;} /* Hides from IE-mac */
.clfix				{zoom:1;} /*for IE 5.5-7*/
.clfix .line01 {position:relative; top:4px; *top:0;}
/* GNB 검색버튼 */
.btn_icon.search_m {float:right; height:40px;margin:0;}
.btn_icon.search_m span.odd_span {width:45px; height:40px; background:url(//cdnimg.melon.co.kr/resource/image/web/common/btn_search_bar.png) no-repeat 0 0; vertical-align:top}
.btn_icon.search_m.mhover span.odd_span,
.btn_icon.search_m:focus span.odd_span {background:url(//cdnimg.melon.co.kr/resource/image/web/common/btn_search_bar.png) no-repeat 0 -40px;}

</style>
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
			<c:if test="${!login }">
			<li><a href="/user/join"class="menu01 mlog"><span>회원가입</span></a></li>
			</c:if>
			
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
                        <form action="/ticket/ticketsearch" method="get">
                        <input type="text" title="검색 입력 편집창" name="top_search" id="top_search" class="placeholder">
                        <button type="submit" class="btn_icon search_m" id="btn_top_search" title="검색" ><span class="btn_comm">검색</span></button>
                        </form>
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
	        	<li><a href="/mypage/myticket"">예매 현황</a></li>
	        	<li><a href="/mypage/mychoice">찜</a></li>
	        	<li><a href="/mypage/viewinquiry">내 문의</a></li>
	        </ul>
        </li>
	</ul>
	</div>
</div><!-- end of clear_g -->
</div>
</div>
</div>