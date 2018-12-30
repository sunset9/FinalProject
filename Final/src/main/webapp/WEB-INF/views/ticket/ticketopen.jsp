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
			
		var li =$('<li class="pfmInfo">');
		
		var a = $('<a href="/ticket/opendetail?pfmIdx=' + list.pfmIdx + '>');
		var span = $('<span class="pfmdate">');
		
		var ticketStart = getDateSimpleString(list.ticketStart);
		var h5 = $('<h5>티켓오픈일 : ' + ticketStart + '</h5>');
		
		span.append(h5);
		
		var h2 = $('<h2>' + list.name + ' 오픈 안내</h2>');
		span.append(h2);
		
		var img = $('<img class="bannerImg" src="/resources/image/'+ list.posterName + '"><br>');
		span.append(img);
		li.append(span);
		
		$('#bottomlist').append(li);

		});
	}

	function getDateSimpleString(date){
		var date = new Date(date);
		var month = date.getMonth() + 1;
		var day = date.getDate();
		return date.getFullYear() + "."
			+ ((month < 10)? '0' + month : month) + "."
			+ ((day < 10) ? '0' + day : day);
	}
	
});
</script>

<style>
.container {
	margin: 0 5% 10px 5%;
}

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
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

#bottomlist, #searchandsort {
	margin: 20px 5% 10px 5%;
}

#bottomlist {
/* 	width: 1000px; */
/* 	padding: 10px; */
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

#openInfoSpan {
/*  	margin: 0 20px 0 20px; */
	text-align: center;
	width: 400px;
	height: auto;
}

#pfmName {
	font-size: 25px;
}
</style>


<div class="container">
	<h3 style="font-size: 30px;">HOT OPEN 소식</h3>
	
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
				<strong style="color: #F8D83B">
					[오픈] <fmt:formatDate value="${list.ticketStart }" pattern="yyyy-MM-dd"/>
				</strong>
				</a>
			</li>
		</c:forEach>
	</ul>
	</div>
	
	<div style="margin: 0 50px 0 50px;">
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
			<span id="openInfoSpan">
				티켓 오픈일<fmt:formatDate value="${list.ticketStart }" pattern="yyyy-MM-dd"/>
			</span>
			<a href="/ticket/opendetail?pfmIdx=${list.pfmIdx}">
				<span class="pfmdate">
				<span id="openInfoSpan" style="display: inline-block;">
					<strong id="pfmName">${list.name } 오픈 안내<br></strong>
					<small style="color: #666;">등록일 : <fmt:formatDate value="${list.createDate }" pattern="yyyy-MM-dd"/></small>
				</span>
				<span id="openInfoSpan" style="display: inline-block;">
					<img class="bannerImg" src="/resources/image/${list.posterName}" />
				</span>
				</span>
			</a>
			</li>
		</c:forEach>
	</ul>
	</div>
	
<!-- </div> -->