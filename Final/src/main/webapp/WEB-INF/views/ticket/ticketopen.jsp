<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function() {
	$('#opensearchbtn').click(function() {
		
		var genreIdx = $("select[name=searchKind]").val();
		console.log('select 선택 값 : ' + genreIdx);
		
		var opentext = $('#opensearchtext').val();
		console.log('입력한 input 값 : ' + opentext);
		
		$.ajax({
			url: '/ticket/opensearch'
			, method: 'GET'
			, data: {
				"opentext": opentext
				, "genreIdx": genreIdx
			}
			, dataType: 'json'
			, success: function(d) {
				console.log("성공");
				
				openArrayList(d.openPfmList);
			}
			, error: function(e) {
				console.log("실패");
			}
		});
	}); // 검색 버튼 클릭시
	
	$("#registration, #openday").click(function() {
		var arrayList = $(this).attr('id');
		console.log(arrayList);
		
		$.ajax({
			url: '/ticket/openarray'
			, method: 'GET'
			, data: {
				"array" : arrayList
			}
			, dataType: 'json'
			, success: function(d) {
				console.log('성공');
				console.log(d);
				
				openArrayList(d.openPfmList);
			}
			, error: function(e) {
				console.log('실패');
			}
		});
	});
	
	function openArrayList(openPfmList) {
		
		$('#bottomlist').html('');
		
		openPfmList.forEach(function(list) {
			
		var li = $('<li class="pfmInfo">');
		var ul = $('<ul class="pfmInfoUl">');
		
		var ticketStart = getDateSimpleString(list.ticketStart);
		
		var now = new Date();
		var then = new Date(ticketStart); 
		var gap = then.getTime() - now.getTime();
		gap = Math.floor(gap / (1000 * 60 * 60 * 24));
		console.log(list.pfmIdx + '공연 : ' + gap + 'day');

		var li1 = $('<li class="ticketOpenDay ticketOpenLI">');
		var span1 = $('<span class="ticketStartDay">');
		if(gap > 0) {
			var dday = $('<strong id="dday">D-' + gap + '</strong><br>');
		} else if (gap < 0) {
			var dday = $('<strong id="dday">오픈</strong><br>	');
		}
		var strong11 = $('<strong>티켓 오픈일<br></strong><small>' + ticketStart + '</small>');

		span1.append(dday);
		span1.append(strong11);
		li1.append(span1);

		var createDate = getDateSimpleString(list.createDate);
		
		var li2 = $('<li class="ticketOpenInfo ticketOpenLI">');
		var a1 = $('<a href="/ticket/opendetail?pfmIdx=' + list.pfmIdx + '">');
		var span2 = $('<span>');
		var strong = $('<strong id="pfmName">' + list.name + ' 오픈 안내<br></strong>');
		var small = $('<small style="color: #666;">등록일 : ' + createDate + '</small>');
		span2.append(strong);
		span2.append(small);
		a1.append(span2);
		li2.append(a1);
		
		var li3 = $('<li class="ticketOpenImg">');
		var a2 = $('<a href="/ticket/opendetail?pfmIdx=' + list.pfmIdx + '">');
		var span3 = $('<span>');
		var img = $('<img class="bannerImg" src="/resources/image/' + list.posterName + '"/>');
		
		span3.append(img);
		a2.append(span3);
		li3.append(a2);
		
		ul.append(li1).append(li2).append(li3);
		li.append(ul);
		
		$('#bottomlist').append(li);

		});
	};

	function getDateSimpleString(date){
		var date = new Date(date);
		var month = date.getMonth() + 1;
		var day = date.getDate();
		return date.getFullYear() + "."
			+ ((month < 10)? '0' + month : month) + "."
			+ ((day < 10) ? '0' + day : day);
	};
	
});
</script>

<style>
.topbanner {
	text-align: center;
}

.TopBannerImg {
	margin: 5px;
	width: 200px;
	height: 250px;
}

.bannerImg	{
	margin: 5px;
	width: 100px;
	height: 130px;
	
}

li.pfmbanInfo {
	list-style: none;
	float: left;
}

li.pfmInfo {
	list-style: none;
	width: 100%;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.pfmInfoUl {
	padding: 0px;
}

/* #bottomlist, #searchandsort { */
/* 	margin: 20px 5% 10px 5%; */
/* } */

#searchandsort {
	margin: 10px;
}

#bottomlist {
/* 	width: 1000px; */
/* 	padding: 10px; */
	padding: 0;
}

/* 정렬 */
ul.array {
	float: right;
	list-style: none;
}
ul.array li {
	float: left;
}

ul.array li span{
    padding: 0 20px 0 21px;
    vertical-align: middle;
    cursor: pointer;
}
.arrayDiv {
	float: right;
}

#pfmName {
	font-size: 25px;
}

.container {
	text-align: center;
	margin-left: 30px;
}

.ticketOpenLI {
	float: left;
	height: 100px;
	text-align: center;
}

.ticketOpenDay {
	width: 350px;
	padding-top: 25px;
}

.ticketOpenInfo {
	width: 450px;
	margin-right: 80px;
	padding-top: 50px;
}

.ticketOpenImg {
	height: 140px;
}

.main_wrapper {
	margin-bottom: 50px;
}

.ticketStartDay {
	font-size: 20px;
}

#dday, #openTopStartDay {
	color: #01DF74;
}

a {
	color: black;
}
</style>


<div class="main_wrapper">
<div class="container">
	<h3 style="font-size: 30px; text-align: left;">HOT OPEN 소식</h3>
	
	<!-- 관리자가 지정한 오픈소식 배너 ?-->
	<!-- 	일단 등록된 포스터에서 rownum으로 5개 걸러내서 리스트 뽑음 -->
<!-- 	<div class="topbanner"> -->
	<ul id="posterList">
		<c:forEach items="${openList }" var="list">
			<li class="pfmbanInfo">
				<a href="/ticket/opendetail?pfmIdx=${list.pfmIdx}">
				<span class="thumImg">
					<img class="TopBannerImg" src="/resources/image/${list.posterName}" /><br>
				</span>
				<strong class="pfmdate">${list.name }<br></strong>
				<strong id="openTopStartDay">
					[오픈] <fmt:formatDate value="${list.ticketStart }" pattern="yyyy.MM.dd"/>
				</strong>
				</a>
			</li>
		</c:forEach>
	</ul>
	</div>
	
	<hr>
	<div id="searchandsort">
		<select name="searchKind">
			<option value="all">전체</option>
			<option value="1">콘서트</option>
			<option value="2">뮤지컬&연극</option>
			<option value="3">가족&아동</option>
		</select>
		<input id="opensearchtext" name="opensearchtext" type="text">
		<button id="opensearchbtn" type="submit">검색</button>
	
		<div class="arrayDiv">
			<ul class="array">
				<li><span id="registration">등록순</span></li>
				<li><span id="openday">오픈일순</span></li>
			</ul>
		</div>
	</div>
	
	<ul id="bottomlist">
		<c:forEach items="${openPfmList }" var="list">
			<li class="pfmInfo">
			<ul class="pfmInfoUl">
				<li class="ticketOpenDay ticketOpenLI">
				<span class="ticketStartDay">
					<c:if test="${list.dday > 0 }">
						<strong id="dday">D-${list.dday }</strong><br>
					</c:if>
					<c:if test="${list.dday < 0 }">
						<strong id="dday">오픈</strong><br>
					</c:if>
					<strong>티켓 오픈일<br></strong>
					<small><fmt:formatDate value="${list.ticketStart }" pattern="yyyy.MM.dd"/></small>
				</span>
				</li>
				
				<li class="ticketOpenInfo ticketOpenLI">
				<a href="/ticket/opendetail?pfmIdx=${list.pfmIdx}">
				<span>
					<strong id="pfmName">${list.name } 오픈 안내<br></strong>
					<small style="color: #666;">등록일 <fmt:formatDate value="${list.createDate }" pattern="yyyy.MM.dd"/></small>
				</span>
				</a>
				</li>
				
				<li class="ticketOpenImg">
				<a href="/ticket/opendetail?pfmIdx=${list.pfmIdx}">
				<span>
					<img class="bannerImg" src="/resources/image/${list.posterName}" />
				</span>
				</a>
				</li>
			</ul>
			</li>
		</c:forEach>
	</ul>
	
</div>
	
<!-- </div> -->