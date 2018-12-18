<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function() {
	$('#opensearchbtn').click(function() {
		var opensearchtext = $('#opensearchtext').val();
// 		console.log(opensearchtext);

		var searchKind = $("select[name=searchKind]").val();
// 		console.log(searchKind);
		
		$.ajax({
			url: '/ticket/opensearch'
			, method: 'GET'
			, data: {
				"opentext": opensearchtext
// 				, "searchKind": searchKind
			}
			, dataType: 'json'
			, success: function(d) {
				console.log("성공");
				
// 				openArrayList(d.openPfmList);
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
		
		var div1 = $('<div class="pfmdate">');
		var h5 = $('<h5>티켓오픈일<br>' + list.ticketStart + '</h5>');
		// 수정해야함,,,,,,,,,,,
		div1.append(h5);
		
		var div2 = $('<div class="pfmtitle">');
		var h2 = $('<h2>' + list.name + ' 오픈 안내</h2>');
		div2.append(h2);
		
		var div3 = $('<div class="bannerImg">');
		var img = $('<img class="bannerImg" src="/resources/image/'+ list.posterName + '"><br>');
		div3.append(img);
		
		li.append(div1);
		li.append(div2);
		li.append(div3);
		
		$('#bottomlist').append(li);

		});
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

.bannerImg	{
	margin: 5px;
	width: 200px;
	height: 250px;
	
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

#opensearchtext {
	margin-left: 5%;
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
</style>


<div class="container">
	<h3>HOT OPEN 소식</h3>
	
	<!-- 관리자가 지정한 오픈소식 배너 ?-->
	<!-- 	일단 등록된 포스터에서 rownum으로 5개 걸러내서 리스트 뽑음 -->
<!-- 	<div class="topbanner"> -->
	<ul id="posterList">
		<c:forEach items="${openList }" var="list">
			<li class="pfmbanInfo">
				<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<span class="thumImg">
					<img class="bannerImg" src="/resources/image/${list.posterName}" /><br>
				</span>
				<strong class="pfmdate">${list.name }<br>
				[오픈] <fmt:formatDate value="${list.ticketStart }" pattern="yyyy-MM-dd"/>
				</strong>
				</a>
			</li>
		</c:forEach>
	</ul>
	</div>
	
	<hr>
	<div id="searchandsort">
<!-- 		<select name="searchKind"> -->
<!-- 			<option value="all">전체</option> -->
<!-- 			<option value="1">콘서트</option> -->
<!-- 			<option value="2">뮤지컬&연극</option> -->
<!-- 			<option value="3">가족&아동</option> -->
<!-- 		</select> -->
		<input id="opensearchtext" type="text"><button id="opensearchbtn" type="submit">검색</button>
	
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
		<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
			<span class="pfmdate">	
				티켓 오픈일 : <fmt:formatDate value="${list.ticketStart }" pattern="yyyy-MM-dd"/>
				${list.name } 오픈 안내
				<img class="bannerImg" src="/resources/image/${list.posterName}" /><br>
			</span>
		</a>
			</li>
		</c:forEach>
	</ul>
	
<!-- </div> -->