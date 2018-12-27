<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			minSlides : 4,
			maxSlides : 4,
				slideWidth : 170,

			slideMargin : 10,

			ticker : true,

			speed : 6000

		});

	});
</script>


<ul class="bxslider">
	<li><img src="/images/170_200/trees.jpg" /></li>

	<li><img src="/images/170_200/tree_root.jpg" /></li>

	<li><img src="/images/170_200/houses.jpg" /></li>

	<li><img src="/images/170_200/hill_road.jpg" /></li>

	<li><img src="/images/170_200/me_trees.jpg" /></li>

	<li><img src="/images/170_200/hill_trees.jpg" /></li>

	<li><img src="/images/170_200/mountain.jpg" /></li>

	<li><img src="/images/170_200/houses.jpg" /></li>

</ul>