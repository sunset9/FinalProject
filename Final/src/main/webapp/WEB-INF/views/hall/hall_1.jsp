<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

function section() {
	console.log(1);
	$.ajax({
		type:"get",
		url:"/seatDemo",
		data:{},
		dataType:"html",
		success:function(res){
		$('.stage_img').html(res);
		$('.allScreen').html('전체화면으로');
		}
	})
	
}


</script>
<body>
	<!-- 이화여대 대강당 -->
	<div class="stage_img">
		<div id="wrapper" style="width: 682px; height: 602px;">
			<div id="scroller"
				style="transform-origin: 0px 0px 0px; transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) scale(1); width: 682px; height: 602px;">
				<div class="seat_block" id="ez_canvas_zone"
					style="width: 682px; height: 602px; display: block;">
					<svg height="1204" version="1.1" width="1364"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink"
						style="overflow: hidden; position: relative; top: -0.98261px; background-color: rgb(244, 244, 244); width: 824px; height: 695px;"
						viewBox="0 0 2950 2214" preserveAspectRatio="xMidYMid meet">
						<image x="0" y="0" width="2950" height="2214"
							preserveAspectRatio="none"
							xlink:href="https://cdnticket.melon.co.kr/resource/image/upload/seat/2018/11/20181114103509e79b2ba8-7b74-48dc-a0c8-afc9d3e96643.svg"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></image>
	                  <desc
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.2</desc>
						<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
						
						
						<!-- 1층 -->
	                  <rect onclick="section();" x="585.0185185185179" y="360.1240740740741"
							width="384.3888888888889" height="997.3333333333333" rx="0"
							ry="0" fill="#bea886" stroke="#000000" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
							
	                  <rect x="982.6759259259254" y="358.8351851851849"
							width="384.24259259259287" height="999.6259259259261" rx="0"
							ry="0" fill="#bea886" stroke="#000000" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
	                  <rect x="1553.603703703703" y="358.7962962962961"
							width="393.1870370370368" height="1000.0981481481481" rx="0"
							ry="0" fill="#bea886" stroke="#000000" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
						<rect x="1958.4555555555544" y="358.48333333333284"
							width="393.18703703703704" height="998.4666666666667" rx="0"
							ry="0" fill="#bea886" stroke="#000000" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
	                  <path fill="#bea886" stroke="#000000"
							d="M2362.596296296295,1356.72037037037L2757.718518518517,1356.72037037037L2759.249999999999,708.9037037037031L2561.688888888888,359.72592592592537L2362.596296296295,359.72592592592537L2362.596296296295,1356.72037037037Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
					  <path fill="#bea886" stroke="#000000"
							d="M187.44444444444247,1358.0537037037031L570.8425925925906,1358.0537037037031L570.8425925925906,361.2185185185182L379.9592592592573,361.2185185185182L189.07592592592397,703.8296296296294L187.44444444444247,1358.0537037037031Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
	                  <text x="382.26070601851853" y="890.706151335762"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  	<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">가</tspan></text>
							
	                  <text onclick="section();" x="777.9366319444445" y="895.6691142987248"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  	<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">나</tspan></text>
							
							
	                  <text x="1167.9181134259259" y="887.6968920765026"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  	<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">다</tspan></text>
	                  <text x="1743.0384837962963" y="894.5487439283545"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  	<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">라</tspan></text>
	                  <text x="2148.6495949074074" y="897.9005957802063"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">마</tspan></text>
	                  <text x="2567.1310763888887" y="900.9746698542804"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">바</tspan></text>
	                  
	                  
	                  
	                  <!-- 2층 -->
	                  <rect x="174.00185185185225" y="1497.677777777778"
							width="437.88888888888874" height="660.7851851851849" rx="0"
							ry="0" fill="#bea886" stroke="#000000" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
							
							
						<rect x="626.8000000000004" y="1497.677777777778"
							width="414.12222222222204" height="658.5222222222219" rx="0"
							ry="0" fill="#bea886" stroke="#000000" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
	                  <rect x="1054.5000000000002" y="1497.677777777778"
							width="409.59629629629626" height="658.5222222222219" rx="0"
							ry="0" fill="#bea886" stroke="#000000" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
						<rect x="1484.4629629629635" y="1497.6777777777777"
							width="416.38518518518526" height="658.5222222222221" rx="0"
							ry="0" fill="#bea886" stroke="#000000" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
	                  <rect x="1917.8203703703707" y="1497.6777777777777"
							width="414.12222222222226" height="658.5222222222221" rx="0"
							ry="0" fill="#bea886" stroke="#000000" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
						<rect x="2345.5203703703705" y="1497.677777777778"
							width="436.15740740740665" height="657.3907407407404" rx="0"
							ry="0" fill="#bea886" stroke="#000000" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
							
	                  <text x="392.9625578703701" y="1865.852447632059"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">가</tspan></text>
	                  <text x="828.2440393518517" y="1864.0468920765036"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">나</tspan></text>
						<text x="1258.518113425926" y="1865.1098550394665"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">다</tspan></text>
						<text x="1687.477372685185" y="1862.4820772616886"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">라</tspan></text>
						<text x="2122.490335648148" y="1862.030225409837"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">마</tspan></text>
						<text x="2566.377372685185" y="1865.3505957802072"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">바</tspan></text>
						
				</svg>
				</div>
				<div id="ez_canvas"
					style="width: 682px; height: 526px; display: none;">
					<svg height="526" version="1.1" width="682"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2950 2214"
						preserveAspectRatio="xMidYMid meet"
						style="overflow: hidden; position: relative; background-color: rgb(244, 244, 244);">
						<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.2</desc>
						<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs></svg>
				</div>
			</div>
			<div class="iScrollVerticalScrollbar  iScrollLoneScrollbar"
				style="position: absolute; z-index: 9999; width: 7px; bottom: 2px; top: 2px; right: 1px; overflow: hidden;">
				<div class="iScrollIndicator"
					style="box-sizing: border-box; position: absolute; background: rgba(0, 0, 0, 0.5); border: 1px solid rgba(255, 255, 255, 0.9); border-radius: 3px; width: 100%; transition-duration: 0ms; display: none; transform: translate(0px, -6.04553px); transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); height: 605.046px;"></div>
			</div>
			<div class="iScrollHorizontalScrollbar  iScrollLoneScrollbar"
				style="position: absolute; z-index: 9999; height: 7px; left: 2px; right: 2px; bottom: 0px; overflow: hidden;">
				<div class="iScrollIndicator"
					style="box-sizing: border-box; position: absolute; background: rgba(0, 0, 0, 0.5); border: 1px solid rgba(255, 255, 255, 0.9); border-radius: 3px; height: 100%; transition-duration: 0ms; display: none; transform: translate(-7.05952px, 0px); transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); width: 686.06px;"></div>
			</div>
		</div>
		<div class="wrap_seat_box">
			<div class="seat_box ">
				<!-- on class 컨트롤 -->
				<div class="seat_btn" id="txtSelectSeatInfo"
					onclick="$(this).parent().toggleClass('open');return false;">
					구역을 먼저 선택해주세요<span class="txt_seat_s">(화면을 직접 선택하거나 우측 좌석등급을
						선택해주세요)</span>
				</div>
				<div class="seat_choice">
					<ul id="partSeatSelected" class="seat_info"></ul>
				</div>
				<!-- //seat_choice끝 -->
			</div>
		</div>
	</div>
</body>
</html>