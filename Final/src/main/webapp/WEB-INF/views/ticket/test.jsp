<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 배수연 슬라이드 테스트 jsp -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
	$(document).ready(function() {
		var page = 2;

		$(window).scroll(function() {
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		      console.log(++page);
		      $("body").append('<div class="big-box"><h1>Page ' + page + '</h1></div>');
		      
		    }
		});
	});
</script>
<style>
.big-box {
  width: 100%;
  background-color: gray;
  height: 100vh;
  border-top: 1px solid black;
}
</style>

<div class="big-box"><h1>Page 1</h1></div>
<div class="big-box"><h1>Page 2</h1></div>