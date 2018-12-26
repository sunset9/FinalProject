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
	background: #ededed;
	color: #222;
}
 
.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
	width: 1000px;
}
 
.tab-content.current{
	display: inline-block;
/* 	text-align: center; */
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
		
		$('#ALL, #PFM, #ARTI, #HALL').click(function() {
			var tabmenu = $(this).attr("id");
			
			console.log(tabmenu);
		});
	});
</script>

<!-- 탭 배너 -->
<div class="main_tab">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1" id="ALL">통합검색</li>
	    <li class="tab-link" data-tab="tab-2" id="PFM">공연</li>
	    <li class="tab-link" data-tab="tab-3" id="ARTI">아티스트</li>
	    <li class="tab-link" data-tab="tab-4" id="HALL">공연장</li>
	</ul>

	<div id="tab-1" class="tab-content current">
		<ul>
		<c:forEach items="${allList }" var="list">
			<li id="tabPfmList">
			<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<img src="/resources/image/${list.originName}"
					style="width: 150px; height: 200px;"/>
					${list.name }
			</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	
	<div id="tab-2" class="tab-content">
		구현 중
	</div>
	
	<div id="tab-3" class="tab-content">
		구현 중
	</div>
	
	<div id="tab-4" class="tab-content">
		구현 중
	</div>
</div>
