<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
/* 탭 메뉴 */
.main_tab{
	width: 1000px;
	margin: 20px auto 10px auto;
}
 
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}
 
ul.tabs li.current{
    background: #f9f9f9;
    border: 1px solid #d8d5d5;
    border-bottom: 1px solid #f9f9f9;
    color: #222;
}
 
.tab-content{
    display: none;
    background: #ffffff;
    padding: 23px;
    width: 1000px;
    background: #f9f9f9;
    border: 1px solid #d8d5d5;
}
 
.tab-content.current{
	display: inline-block;
/* 	text-align: center; */
}

#tabPfmList {
    width: 192px;
    padding: 7px;
    padding-top: 20px;
    display: inline-block;
    margin: 16px;
    border: 1px solid #dedddd;
}

#tabPfmList:hover {
	border: 1.5px solid #f1c40f;
}

#tabPfmList img {
    display: block;
    margin-left: 15px;
}

#hallImgDiv {
    margin-left: 20px;
    width: 400px;
    float: left;
    text-align: center;
}

#hallNameDiv {
	width: 500px;
	float: left;
	text-align: center;
}

#hallImg {
	width: 100px;
	height: 100px;
}

#reviewContent{
    margin: 5px;
    height: 20px;
    text-align: center;
    border-bottom: 1px solid #dedddd;
    padding-bottom: 71px;
    padding-top: 71px;
    margin-left: 1px;
}

#reviewUser{
	margin: 5px;
	height: 120px;
	text-align: center;
	margin-right: 0;
}

.basicSize {
	border-bottom: 1px solid black;
	margin: 10px;
}

.basicSize ul {
    display: grid;
    grid-template-columns: 25% 25% 25% 25%;
    padding-left: 0px;    
}


.basicSize span {
	text-align: center;
    display: block;
    margin-left: 20px;
    margin-right: 20px;
    margin-bottom: 30px;
    margin-top: 30px;
}

.imgli {
	float: left;
}

#artistImg {
	width: 130px;
	height: 130px;
	margin: 10px;
	display: inline-block;
}

div.artimg {
	display: inline-block;
}

div#reviewUser {
	border-bottom: 1px solid #dedddd;
    margin-bottom: 28px;
    margin-top: 28px;
}

</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');
		 
		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');
		 
		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		});
		
	});
</script>

<!-- 탭 배너 -->
<div class="main_wrapper">
<div class="main_tab">

	<strong style="font-size: 20px; color: #F2B134;">'${top_searchh }'</strong><small style="font-size: 15px;">에 대한 검색 결과</small><br><br>
		
	<ul class="tabs">
		<!-- 테이블 명을 넘겨주어 조회 -->
		<li class="tab-link current" data-tab="tab-1" id="all">통합검색</li>
	    <li class="tab-link" data-tab="tab-2" id="performance">공연</li>
	    <li class="tab-link" data-tab="tab-3" id="artist">아티스트</li>
	    <li class="tab-link" data-tab="tab-4" id="hall">공연장</li>
	</ul>

	<div id="tab-1" class="tab-content current">
		<strong style="font-size: 20px;">공연 ( ${pfmCount }건 )</strong><br>
		<div class="basicSize">
		<ul>
		<c:forEach items="${pfmSearchList }" var="list">
			<li id="tabPfmList">
			<div id="tabPfm">
				<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
					<img src="/resources/image/${list.storedName}" style="width: 150px; height: 200px;"/>
					<span>${list.name }</span>
				</a>
			</div>
			</li>
			
<%-- 			<c:if test="${empty list }"> --%>
<!-- 				검색 결과가 없습니다.  -->
<%-- 			</c:if> --%>
		</c:forEach>
		</ul>
		</div>
		
		<strong style="font-size: 20px">아티스트( ${artCount }건 )</strong><br>
		<div class="basicSize" style="display: grid; grid-template-columns: 25% 25% 25% 25%;">
		<c:forEach items="${artSearchList }" var="list">
			<div class="artimg">
				<img id="artistImg" class="img-circle" src="<c:url value="${list.imgUri}"/>" style="margin-left: 50px;"/><br>
				<span>${list.name }</span>
			</div>
		</c:forEach>
		</div>
		
		<strong style="font-size: 20px">공연장 ( ${hallCount }건 )</strong><br>
		<div class="basicSize">
		<div id="hallImgDiv">
			<c:forEach items="${hallSearchList }" var="list">
				<div id="reviewUser">
					<img id="hallImg" src="/resources/image/${list.storedName }"/>
				</div>
			</c:forEach>
		</div>
					
		<div id="hallNameDiv">
			<c:forEach items="${hallNameList }" var="list">
				<div id="reviewContent">
					${list.hallName }<br>
				</div>
			</c:forEach>
		</div>
		</div>
	</div>
	
	<!-- 공연 : 공연 이름에 따른 검색 조회 -->
	<div id="tab-2" class="tab-content">
		<strong style="font-size: 20px">검색 결과 ( ${pfmCount }건 )</strong><br>
		<div class="basicSize">
		<ul>
		<c:forEach items="${pfmSearchList }" var="list">
			<li id="tabPfmList">
			<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<img src="/resources/image/${list.storedName}"
					style="width: 150px; height: 200px;"/>
				<strong style="text-align: center; height: 200px;">${list.name }</strong>
			</a>
			</li>
		</c:forEach>
		</ul>
		</div>
	</div>
	
	<div id="tab-3" class="tab-content">
		<strong style="font-size: 20px">검색 결과 ( ${artCount }건 )</strong><br>
		<div class="basicSize">
		<ul id="posterList" style="text-align: center;">
			<c:forEach items="${artSearchList }" var="list">
				<li class="imgli" style="text-align: center;">
					<span class="thumImg">
						<img id="artistImg" class="img-circle" src="<c:url value="${list.imgUri}"/>"/><br>
						<small>${list.name }</small>
					</span>
				</li>
			</c:forEach>
		</ul>
		</div>
	</div>
	
	<div id="tab-4" class="tab-content">
		<strong style="font-size: 20px">검색 결과 ( ${hallCount }건 )</strong><br>
		<div class="basicSize">
		<div id="hallImgDiv">
			<c:forEach items="${hallSearchList }" var="list">
				<div id="reviewUser">
					<img id="hallImg" src="/resources/image/${list.storedName }"/>
				</div>
			</c:forEach>
		</div>
					
		<div id="hallNameDiv">
			<c:forEach items="${hallNameList }" var="list">
				<div id="reviewContent">
					${list.hallName }<br>
				</div>
			</c:forEach>
		</div>
		</div>
	</div>
</div>
</div>