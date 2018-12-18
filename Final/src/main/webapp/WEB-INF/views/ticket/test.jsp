<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.wrapper {
	width: 100%;
	margin: 0 auto;
}

.slider {
	list-style: none;
	width: 100%;
/* 	position: relative; */
}

.slider li {
	float: left;
	margin: 5px;
}

.controller {
	list-style: none;
}

.controller li {
	float: left;
	padding: 10px;
	cursor: pointer;
}

.concertImg {
	width: 200px;
	height: 250px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		//하나의 li의 width값을 구해 놓는다.
		var item_width = $('.slider li').outerWidth(true);
		//맨 마지막 item을 맨 앞으로 이동시켜 놓는다.
		$('.slider li:first').before($('.slider li:last'));
		//늘어난 만큰 -로 위치를 설정해 준다.
		$('.slider').css('left', -item_width + 'px');

		//이전버튼 클릭시 
		$('.prevBtn').click(function() {
			var left_indent = parseInt($('.slider').css('left')) + item_width;
			$('.slider').animate({
				'left' : left_indent + 'px'
			}, 600, function() {
				$('.slider li:first').before($('.slider li:last'));
				$('.slider').css('left', -item_width + 'px');
			});
		});

		//Next Button
		$('.nextBtn').click(function() {
			var left_indent = parseInt($('.slider').css('left')) - item_width; //
			$('.slider').animate({
				'left' : left_indent + 'px'
			}, 300, function() {
				$('.slider li:last').after($('.slider li:first'));
				$('.slider').css('left', -item_width + 'px');
			});
		});
	});
</script>

<div class="wrapper">
	<div class="viewport">
		<ul class="slider">
		<c:forEach items="${topBanList }" var="list">
			<li>
				<a href="/ticket/pfmdetail?pfmIdx=${list.pfmIdx}">
				<span class="thumImg">
					<img class="concertImg" src="/resources/image/${list.originName}" /><br>
				</span>
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	<ul class="controller">
		<li class="prevBtn">Prev</li>
		<li class="nextBtn">Next</li>
	</ul>
</div>