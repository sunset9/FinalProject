<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 배수연 슬라이드 테스트 jsp -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			  minSlides: 2,
			  maxSlides: 2,
			  slideWidth: 360,
			  slideMargin: 10
			});
	});
</script>
<style>
</style>
<ul class="bxslider">
  <li><img src="/images/730_200/trees.jpg" /></li>
  <li><img src="/images/730_200/tree_root.jpg" /></li>
  <li><img src="/images/730_200/houses.jpg" /></li>
  <li><img src="/images/730_200/hill_road.jpg" /></li>
  <li><img src="/images/730_200/me_trees.jpg" /></li>
  <li><img src="/images/730_200/hill_trees.jpg" /></li>
</ul>