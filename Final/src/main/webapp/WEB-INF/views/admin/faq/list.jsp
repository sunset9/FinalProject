<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>FAQ 리스트</h1>

<div id="accodian">

	<ul>
		<li>
			<h1>1 타이틀입니다<span class="ico_ar">▼</span></h1>
			<ul>
				<li>1 내용이 들어가겠졍</li>
			</ul>
		</li>
		<li class="active">
			<h1>2 타이틀입니다<span class="ico_ar">▼</span></h1>
			<ul>
				<li>2 내용이 들어가겠졍</li>
			</ul>
		</li>
		<li>
			<h1>3 타이틀입니다<span class="ico_ar">▼</span></h1>
			<ul>
				<li>3 내용이 들어가겠졍</li>
			</ul>
		</li>
		<li>
			<h1>4 타이틀입니다<span class="ico_ar">▼</span></h1>
			<ul>
				<li>4 내용이 들어가겠졍</li>
			</ul>
		</li>
	</ul>

</div>


<script type="text/javascript">

$("#accordian h1").click(function(){
	$("#accordian ul ul").slideUp();
	$('.ico_ar').css('transform','none');
	if(!$(this).next().is(":visible"))
	{
		$(this).next().slideDown();
		$(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
	}
})
})

</script>

<script type="text/javascript">

$(function(){
	$("#accordian h1").click(function(){
		$("#accordian ul ul").slideUp();
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown();
		}
	})
})
</script>




</body>
</html>