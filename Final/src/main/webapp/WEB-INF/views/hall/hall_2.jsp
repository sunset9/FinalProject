<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">

$(document).ready(function () {
	
// 	$('.14').attr("fill","#FFF");

$('path').attr("fill","#CCC");
$('rect').attr("fill","#CCC");

//섹션에 idx를 넣어주기위해 ajax로 DB에 저장된 원본 구역정보를 불러온다 
	$.ajax({
		type:"GET",
		url:"/ticket/oriSec",
		data:{},
		dataType:"json",
		success:function(res){
			
			for(var i=0;i<res.hashMap.oriSecMap.length;i++){
				var str = 'path.'+res.hashMap.oriSecMap[i].secName; 
				var path = $('.seat_block').find(str); //seat_block 하위요소중 path중에 불러온 이름중 원본섹션이름을 가진걸 불러와라
				path.data("secIdx",res.hashMap.oriSecMap[i].oriSecIdx); //path에다가 커스텀 데이터 secIdx를 저장하라
				
				if(path.data("secIdx") == undefined){ // 만약 path를 찾을수 없다면 rect로 찾자
					var str_rect='rect.'+res.hashMap.oriSecMap[i].secName;
					var rect=$('html').find(str_rect);
					rect.data("secIdx",res.hashMap.oriSecMap[i].oriSecIdx);
				}
			}
		},
		error:function(e){
			console.log(e);
		}
	})
	
	
})


</script>

	<!-- 올림픽공원 SK올림픽핸드볼경기장 -->
	<div class="stage_img" style="height: 390px;">
		<div id="wrapper" style="width: 682px; height: 602px;">
			<div id="scroller"
				style="transform-origin: 0px 0px 0px; transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) scale(1); width: 682px; height: 602px;">
				<div class="seat_block" id="ez_canvas_zone"
					style="width: 682px; height: 602px; display: block;">
					<svg version="1.1"  
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink"
						style="overflow: hidden; position: relative; top: -0.98261px; background-color: rgb(244, 244, 244);"
						viewBox="0 0 3730 2570" preserveAspectRatio="xMidYMid meet">
	                  <image x="0" y="0" width="3730" height="2570"
							preserveAspectRatio="none"
							xlink:href="https://cdnticket.melon.co.kr/resource/image/upload/seat/2018/09/2018092810190620e95552-5b0d-4263-8199-54f95b868ebc.svg"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></image>
						<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.2</desc>
						<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
						
						<!-- 1층 -->
						
						<!-- 14구역  -->
						<path fill="#9076ff" stroke="#000000" class ="14 section"
							d="M570.8666666666691,1066.6740740740747L932.3203703703729,969.3962962962969L1016.2462962962987,1140.10925925926L691.9870370370394,1331.8037037037045L570.8666666666691,1066.6740740740747Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 13구역 -->
						<path fill="#9076ff" stroke="#000000" class= "13 section"
							d="M713.5444444444438,1352.8574074074052L1042.0148148148144,1164.8018518518497L1162.37037037037,1322.7685185185164L882.7944444444439,1576.0166666666646L713.5444444444438,1355.3648148148127L713.5444444444438,1352.8574074074052Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 12구역 -->	
						<path fill="#9076ff" stroke="#000000" class="12 section"
							d="M904.0074074074071,1593.8685185185152L1174.8074074074073,1336.859259259256L1332.774074074074,1457.2148148148115L1120.898148148148,1766.8796296296264L905.2611111111108,1597.6296296296264L904.0074074074071,1593.8685185185152Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 11구역 -->
						<path fill="#bea886" stroke="#000000" class="11 section"
							d="M1148.7796296296294,1777.8629629629584L1360.6555555555553,1471.9592592592546L1534.9203703703702,1555.9574074074028L1391.998148148148,1904.4870370370325L1148.7796296296294,1779.116666666662L1148.7796296296294,1777.8629629629584Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 10구역 -->	
						<path fill="#bea886" stroke="#000000" class="10 section"
							d="M1552.0722222222219,1562.2259259259213L1732.6055555555552,1606.1055555555508L1696.248148148148,1974.6944444444398L1422.9407407407405,1915.7703703703658L1552.0722222222219,1559.718518518514L1552.0722222222219,1562.2259259259213Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
											
						<!-- 9구역 -->
						<path fill="#bea886" stroke="#ffffff" class="9 section"
							d="M1755.1373611111114,1608.0425925925924L1956.4625462962968,1613.3037037037034L2004.9962962962966,1983.3351851851849L1717.3888888888891,1979.8277777777776L1755.1373611111114,1608.0425925925924Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 8구역 -->
						<path fill="#bea886" stroke="#000000" class="8 section"
							d="M1973.2240740740738,1610.4666666666626L2158.7722222222214,1565.3333333333294L2290.4111111111106,1913.8629629629588L2018.357407407407,1981.562962962959L1974.4777777777774,1614.2277777777738L1973.2240740740738,1610.4666666666626Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 7구역 -->
						<path fill="#bea886" stroke="#000000" class="7 section"
							d="M2182.3925925925914,1558.6111111111072L2315.285185185184,1905.8870370370332L2562.2648148148137,1794.3074074074036L2352.896296296295,1474.612962962959L2183.646296296295,1556.1037037037L2182.3925925925914,1558.6111111111072Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!--  6구역  -->
						<path fill="#9076ff" stroke="#000000" class="6 section"
							d="M2380.077777777775,1460.0222222222208L2590.699999999997,1772.194444444443L2812.6055555555527,1601.690740740739L2530.522222222219,1344.68148148148L2382.585185185182,1458.768518518517L2380.077777777775,1460.0222222222208Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
							
						<!-- 5구역 -->
						<path fill="#9076ff" stroke="#000000" class="5 section"
							d="M2549.327777777775,1330.8907407407394L2675.951851851849,1172.9240740740725L3004.4222222222193,1359.7259259259245L2833.9185185185156,1576.6166666666652L2553.088888888886,1333.3981481481467L2549.327777777775,1330.8907407407394Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 4구역 -->	
						<path fill="#9076ff" stroke="#000000" class="4 section"
							d="M2686.6351851851828,1150.357407407406L2775.6481481481455,969.8240740740727L3137.9685185185162,1071.374074074073L3021.374074074072,1327.1296296296284L2690.3962962962937,1152.8648148148136L2686.6351851851828,1150.357407407406Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 2층 -->
							
						<!-- 2층 왼쪽 맨끝 -->
						<path fill="#70d0ea" stroke="#000000"
							d="M191.9425925925938,688.2018518518526L282.1537037037049,691.470370370371L328.56666666666786,952.2981481481488L242.277777777779,973.8703703703711L190.63518518518632,686.8944444444451L191.9425925925938,688.2018518518526Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); display: none;"></path>
							
							
						<!-- 42구역 왼쪽 -->
						<path fill="#70d0ea" stroke="#000000"
							d="M183.8055555555562,1020.7370370370405L340.50370370370433,988.6222222222258L446.81481481481546,1238.8962962962999L288.4555555555562,1312.5388888888924L184.35925925925986,1022.9518518518554L183.8055555555562,1020.7370370370405Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); display: none;"></path>
							
							
						<!-- 42구역 -->
						<path fill="#70d0ea" stroke="#000000" class="42 section"
							d="M294.64074074074045,1333.3170694567266L382.3708158330148,1293.2648148148169L514.7222222222218,1528.2884222418725L431.52990963472024,1578.1648148148165L296.9096219931268,1336.3398811278141L294.64074074074045,1333.3170694567266Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 42구역 뒤 -->
						<path fill="#70d0ea" stroke="#000000"
							d="M35.43518518518663,1058.3481481481492L150.28888888889043,1029.8981481481494L266.1962962962978,1351.277777777779L408.4462962962978,1597.8444444444456L312.5592592592607,1661.0666666666677L149.2351851851867,1395.5333333333344L36.48888888889035,1062.562962962964L35.43518518518663,1058.3481481481492Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); display: none;"></path>
							
							
						<!-- 41구역 -->
						<path fill="#70d0ea" stroke="#000000" class="41 section"
							d="M330.02037037037235,1694.5370370370358L613.2703703703723,1511.425925925925L786.8444444444464,1686.9074074074063L538.8814814814834,1928.1944444444428L329.06666666666865,1696.4444444444432L330.02037037037235,1694.5370370370358Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 40번구역 -->
						<path fill="#70d0ea" stroke="#000000" class="40 section"
							d="M557.7555555555575,1947.8222222222212L808.5796296296317,1710.349999999999L1007.9037037037057,1862.9425925925916L814.3018518518538,2156.683333333332L558.7092592592612,1951.6370370370364L557.7555555555575,1947.8222222222212Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 39번구역 -->
						<path fill="#ff8ab4" stroke="#000000" class="39 section"
							d="M1035.4907407407425,1887.0092592592582L843.2962962962978,2174.1703703703693L1138.7481481481498,2318.1277777777764L1263.8629629629647,1994.0351851851842L1038.505555555557,1888.5166666666655L1035.4907407407425,1887.0092592592582Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 38구역 -->	
						<path fill="#ff8ab4" stroke="#000000" class="38 section"
							d="M1247.4203703703722,2136.2037037037026L1512.746296296298,2206.596296296295L1478.9037037037056,2409.6518518518506L1167.5518518518536,2324.368518518517L1244.7129629629646,2136.2037037037026L1247.4203703703722,2136.2037037037026Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 37구역 -->
						<path fill="#ff8ab4" stroke="#000000" class="37 section"
							d="M1581.785185185187,2086.1166666666654L1838.9888888888906,2102.3611111111095L1838.9888888888906,2297.294444444443L1538.4666666666683,2276.9888888888872L1576.370370370372,2086.1166666666654L1581.785185185187,2086.1166666666654Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 36구역 -->	
						<path fill="#ff8ab4" stroke="#000000" class="36 section"
							d="M1872.8314814814833,2102.3611111111095L1874.1851851851868,2298.6481481481464L2180.1222222222236,2272.927777777776L2134.096296296298,2083.4092592592574L1874.1851851851868,2102.3611111111095L1872.8314814814833,2102.3611111111095Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 35구역 -->	
						<path fill="#ff8ab4" stroke="#000000" class="35 section"
							d="M2190.9518518518544,2188.998148148147L2236.97777777778,2411.0055555555546L2549.6833333333357,2320.307407407406L2452.216666666669,2114.5444444444433L2189.5981481481504,2187.6444444444433L2190.9518518518544,2188.998148148147Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 34구역 -->	
						<path fill="#ff8ab4" stroke="#000000" class="34 section"
							d="M2435.3777777777805,1995.0074074074046L2666.0111111111137,1875.9222222222195L2864.2351851851877,2161.575925925923L2570.2907407407433,2308.548148148145L2437.6388888888914,1998.775925925923L2435.3777777777805,1995.0074074074046Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 33구역 -->	
						<path fill="#70d0ea" stroke="#000000" class="33 section"
							d="M2696.005555555559,1857.2333333333302L2896.490740740744,1707.9999999999968L3155.0111111111146,1945.4166666666636L2890.4611111111144,2145.9018518518487L2696.7592592592628,1860.248148148145L2696.005555555559,1857.2333333333302Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 32구역 -->	
						<path fill="#70d0ea" stroke="#000000" class="32 section"
							d="M2923.1648148148192,1685.3999999999983L3094.4351851851893,1503.016666666665L3386.640740740745,1698.4740740740724L3176.1481481481524,1926.616666666665L2923.8185185185225,1687.3611111111095L2923.1648148148192,1685.3999999999983Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 31구역 -->	
						<path fill="#70d0ea" stroke="#000000" class="31 section"
							d="M3196.037037037052,1533.0740740740694L3274.4888888889036,1586.1444444444398L3412.933333333348,1350.788888888884L3327.559259259274,1304.640740740736L3196.037037037052,1531.9203703703656L3196.037037037052,1533.0740740740694Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- 31오른쪽 -->	
						<path fill="#70d0ea" stroke="#000000"
							d="M3268.7203703703854,1232.7111111111064L3364.4777777777927,998.5092592592546L3525.996296296311,1033.1203703703657L3427.931481481496,1308.8555555555508L3268.7203703703854,1233.86481481481L3268.7203703703854,1232.7111111111064Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); display: none;"></path>
							
						<!-- 2층 왼쪽 맨끝 -->	
						<path fill="#70d0ea" stroke="#000000"
							d="M3418.501851851868,707.2222222222174L3374.6611111111274,955.2685185185137L3469.264814814831,980.6499999999951L3509.644444444461,708.375925925921L3420.8092592592757,706.0685185185137L3418.501851851868,707.2222222222174Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); display: none;"></path>
						
						<!-- 31구역 뒤 -->	
						<path fill="#70d0ea" stroke="#000000"
							d="M3298.916666666683,1597.2814814814765L3403.9037037037197,1667.6574074074024L3591.9574074074235,1340.0055555555505L3692.3296296296453,1065.424074074069L3565.4222222222384,1035.427777777773L3461.588888888905,1311.162962962958L3301.22407407409,1592.6666666666617L3298.916666666683,1597.2814814814765Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); display: none;"></path>
							
						<!-- 장애인석2 -->	
						<path fill="#70d0ea" stroke="#000000"
							d="M2510.8240740740894,1861.077777777772L2731.7759259259415,1725.7611111111055L2783.418518518534,1772.1740740740684L2536.318518518534,1927.7555555555498L2511.477777777793,1861.7314814814758L2510.8240740740894,1861.077777777772Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); display: none;"></path>
							
						<!-- 장애인석3 -->	
						<path fill="#70d0ea" stroke="#000000"
							d="M917.1870370370514,1775.3499999999945L970.790740740755,1723.0537037036981L1195.0111111111255,1859.6777777777722L1166.2481481481625,1927.009259259254L921.7629629629772,1777.9648148148094L917.1870370370514,1775.3499999999945Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); display: none;"></path>
							
						<text x="805.0978587963112" y="1152.665945658769"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">14</tspan></text>
							
							
						<text x="947.5793402777928" y="1384.378908621732"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">13</tspan></text>
							
							
						<text x="1132.2960069444596" y="1568.2955752883988"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">12</tspan></text>
							
							
						<text x="1347.367824074089" y="1709.57705676988"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">11</tspan></text>
							
							
						<text x="1599.1756365740891" y="1800.0085382513619"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">10</tspan></text>
							
							
						<text x="2099.3616898148293" y="1795.6603901032133"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">8</tspan></text>
							
							
						<text x="2352.0302083333486" y="1715.880760473584"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">7</tspan></text>
							
							
						<text x="2572.324652777793" y="1579.5048345476578"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">6</tspan></text>
							
							
	                  	<text x="2760.3283564814965" y="1391.9011308439542"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
	                  		<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">5</tspan></text>
							
							
	                  	<text x="2901.4431712963114" y="1170.091871584695"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
	                  		<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">4</tspan></text>
							
							
	                  	<text x="403.0561342592594" y="1447.5336520947171"
							text-anchor="middle" font-family="Arial" font-size="50px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 50px; font-style: normal; font-weight: bold;">
	                  		<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">42</tspan></text>
							
							
	                  	<text x="555.101562499995" y="1733.4122419550697"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
	                  		<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">41</tspan></text>
							
							
	                  	<text x="782.1237847222178" y="1944.4048345476644"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
	                  		<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">40</tspan></text>
							
							
	                  	<text x="1068.5126736111065" y="2117.167797510627"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
	                  		<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">39</tspan></text>
							
							
						<text x="1341.8274884259215" y="2303.81039010322"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
	                  		<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">38</tspan></text>
							
							
	                  	<text x="1690.3663773148105" y="2221.1881678809978"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
	                  		<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">37</tspan></text>
							
							
	                  	<text x="2008.3182291666615" y="2217.8381678809947"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
	                  		<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">36</tspan></text>
							
							
						<text x="2352.997858796291" y="2287.0326123254395"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
	                  		<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">35</tspan></text>
							
							
						<text x="2621.40711805555" y="2107.8474271402542"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">34</tspan></text>
							
							
						<text x="2898.4923032407355" y="1943.5529826958095"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">33</tspan></text>
							
							
						<text x="3136.349710648143" y="1730.1548345476617"
							text-anchor="middle" font-family="Arial" font-size="100px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">32</tspan></text>
							
							
						<text x="3301.9589120370424" y="1460.10124468731"
							text-anchor="middle" font-family="Arial" font-size="50px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: Arial; font-size: 50px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">31</tspan></text>
							
							
						<text x="2642.441550925931" y="1832.7480950212519"
							text-anchor="middle" font-family="돋움" font-size="50px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: 돋움; font-size: 50px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">장애인2</tspan></text>
							
							
						<text x="1061.1322916666716" y="1836.3406876138445"
							text-anchor="middle" font-family="돋움" font-size="50px"
							font-style="normal" font-weight="bold" stroke="none"
							fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: 돋움; font-size: 50px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">장애인3</tspan></text>
							
							
						<!-- 37,36구역뒤 -->
						<path fill="#ff8ab4" stroke="#ffffff"
							d="M1531.0018518518518,2310.718518518519L1853.6833333333334,2335.2703703703705L2181.625925925926,2305.4574074074076L2204.4240740740743,2417.694444444445L1848.4222222222222,2449.2611111111114L1502.9425925925925,2415.9407407407407L1531.0018518518518,2310.718518518519Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); display: none;"></path>
		
							
						<!-- C구역 -->
							
						<path fill="#bea886" stroke="#ffffff" class="C section"
							d="M1601.25,746.3982363315696L1140.175925925926,744.4259259259259L1140.175925925926,1077.746384479718L1244.6072333016775,1156.638800705467L1601.25,1158.611111111111L1601.25,746.3982363315696Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<!-- B구역 -->	
						<rect x="1616.525925925926" y="746.3796296296296" class="B section"
							width="477.41111111111076" height="411.78518518518524" rx="0"
							ry="0" fill="#bea886" stroke="#ffffff" stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>
							
						<!-- A구역 -->	
						<path fill="#bea886" stroke="#ffffff" class="A section"
							d="M2110.4851851851854,745.8154741863074L2568.8277777777776,745.8154741863074L2570.3814814814814,1076.1305274971942L2467.837037037037,1154.40423681257L2108.9314814814816,1157.5351851851854L2110.4851851851854,745.8154741863074Z"
							stroke-width="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							
						<text x="2319.677025462963" y="978.512708712811"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">A</tspan>
							</text>
							
						<text x="1852.414525462963" y="978.512708712811"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">B</tspan>
							</text>
							
							
						<text x="1378.6052083333334" y="978.512708712811"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">C</tspan>
							</text>
							
							
						<text x="1847.2872685185177" y="1820.8904864905887"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">9</tspan>
							</text>
							
							
						<text x="1056.003703703703" y="1256.948148148148"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></tspan>
							</text>
						<text x="432.5777777777771" y="1082.2648148148148"
							text-anchor="middle" font-family="Malgun Gothic"
							font-size="100px" font-style="normal" font-weight="bold"
							stroke="none" fill="#ffffff"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
						<tspan dy="0"
							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></tspan></text>
							
							
<!-- 						<path fill="#9076ff" stroke="#000000" -->
<!-- 							d="M570.8666666666691,1066.6740740740747L932.3203703703729,969.3962962962969L1016.2462962962987,1140.10925925926L691.9870370370394,1331.8037037037045L570.8666666666691,1066.6740740740747Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#9076ff" stroke="#000000" -->
<!-- 							d="M713.5444444444438,1352.8574074074052L1042.0148148148144,1164.8018518518497L1162.37037037037,1322.7685185185164L882.7944444444439,1576.0166666666646L713.5444444444438,1355.3648148148127L713.5444444444438,1352.8574074074052Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#9076ff" stroke="#000000" -->
<!-- 							d="M904.0074074074071,1593.8685185185152L1174.8074074074073,1336.859259259256L1332.774074074074,1457.2148148148115L1120.898148148148,1766.8796296296264L905.2611111111108,1597.6296296296264L904.0074074074071,1593.8685185185152Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#bea886" stroke="#000000" -->
<!-- 							d="M1148.7796296296294,1777.8629629629584L1360.6555555555553,1471.9592592592546L1534.9203703703702,1555.9574074074028L1391.998148148148,1904.4870370370325L1148.7796296296294,1779.116666666662L1148.7796296296294,1777.8629629629584Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#bea886" stroke="#000000" -->
<!-- 							d="M1552.0722222222219,1562.2259259259213L1732.6055555555552,1606.1055555555508L1696.248148148148,1974.6944444444398L1422.9407407407405,1915.7703703703658L1552.0722222222219,1559.718518518514L1552.0722222222219,1562.2259259259213Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#bea886" stroke="#000000" -->
<!-- 							d="M1973.2240740740738,1610.4666666666626L2158.7722222222214,1565.3333333333294L2290.4111111111106,1913.8629629629588L2018.357407407407,1981.562962962959L1974.4777777777774,1614.2277777777738L1973.2240740740738,1610.4666666666626Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 83석</title></path> -->
<!-- 						<path fill="#bea886" stroke="#000000" -->
<!-- 							d="M2182.3925925925914,1558.6111111111072L2315.285185185184,1905.8870370370332L2562.2648148148137,1794.3074074074036L2352.896296296295,1474.612962962959L2183.646296296295,1556.1037037037L2182.3925925925914,1558.6111111111072Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#9076ff" stroke="#000000" -->
<!-- 							d="M2380.077777777775,1460.0222222222208L2590.699999999997,1772.194444444443L2812.6055555555527,1601.690740740739L2530.522222222219,1344.68148148148L2382.585185185182,1458.768518518517L2380.077777777775,1460.0222222222208Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 73석</title></path> -->
<!-- 						<path fill="#9076ff" stroke="#000000" -->
<!-- 							d="M2549.327777777775,1330.8907407407394L2675.951851851849,1172.9240740740725L3004.4222222222193,1359.7259259259245L2833.9185185185156,1576.6166666666652L2553.088888888886,1333.3981481481467L2549.327777777775,1330.8907407407394Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 40석</title></path> -->
<!-- 						<path fill="#9076ff" stroke="#000000" -->
<!-- 							d="M2686.6351851851828,1150.357407407406L2775.6481481481455,969.8240740740727L3137.9685185185162,1071.374074074073L3021.374074074072,1327.1296296296284L2690.3962962962937,1152.8648148148136L2686.6351851851828,1150.357407407406Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M191.9425925925938,688.2018518518526L282.1537037037049,691.470370370371L328.56666666666786,952.2981481481488L242.277777777779,973.8703703703711L190.63518518518632,686.8944444444451L191.9425925925938,688.2018518518526Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M183.8055555555562,1020.7370370370405L340.50370370370433,988.6222222222258L446.81481481481546,1238.8962962962999L288.4555555555562,1312.5388888888924L184.35925925925986,1022.9518518518554L183.8055555555562,1020.7370370370405Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M294.64074074074045,1333.3170694567266L382.3708158330148,1293.2648148148169L514.7222222222218,1528.2884222418725L431.52990963472024,1578.1648148148165L296.9096219931268,1336.3398811278141L294.64074074074045,1333.3170694567266Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M35.43518518518663,1058.3481481481492L150.28888888889043,1029.8981481481494L266.1962962962978,1351.277777777779L408.4462962962978,1597.8444444444456L312.5592592592607,1661.0666666666677L149.2351851851867,1395.5333333333344L36.48888888889035,1062.562962962964L35.43518518518663,1058.3481481481492Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M330.02037037037235,1694.5370370370358L613.2703703703723,1511.425925925925L786.8444444444464,1686.9074074074063L538.8814814814834,1928.1944444444428L329.06666666666865,1696.4444444444432L330.02037037037235,1694.5370370370358Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M557.7555555555575,1947.8222222222212L808.5796296296317,1710.349999999999L1007.9037037037057,1862.9425925925916L814.3018518518538,2156.683333333332L558.7092592592612,1951.6370370370364L557.7555555555575,1947.8222222222212Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#ff8ab4" stroke="#000000" -->
<!-- 							d="M1035.4907407407425,1887.0092592592582L843.2962962962978,2174.1703703703693L1138.7481481481498,2318.1277777777764L1263.8629629629647,1994.0351851851842L1038.505555555557,1888.5166666666655L1035.4907407407425,1887.0092592592582Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#ff8ab4" stroke="#000000" -->
<!-- 							d="M1247.4203703703722,2136.2037037037026L1512.746296296298,2206.596296296295L1478.9037037037056,2409.6518518518506L1167.5518518518536,2324.368518518517L1244.7129629629646,2136.2037037037026L1247.4203703703722,2136.2037037037026Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 48석</title></path> -->
<!-- 						<path fill="#ff8ab4" stroke="#000000" -->
<!-- 							d="M1581.785185185187,2086.1166666666654L1838.9888888888906,2102.3611111111095L1838.9888888888906,2297.294444444443L1538.4666666666683,2276.9888888888872L1576.370370370372,2086.1166666666654L1581.785185185187,2086.1166666666654Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 6석</title></path> -->
<!-- 						<path fill="#ff8ab4" stroke="#000000" -->
<!-- 							d="M1872.8314814814833,2102.3611111111095L1874.1851851851868,2298.6481481481464L2180.1222222222236,2272.927777777776L2134.096296296298,2083.4092592592574L1874.1851851851868,2102.3611111111095L1872.8314814814833,2102.3611111111095Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 8석</title></path> -->
<!-- 						<path fill="#ff8ab4" stroke="#000000" -->
<!-- 							d="M2190.9518518518544,2188.998148148147L2236.97777777778,2411.0055555555546L2549.6833333333357,2320.307407407406L2452.216666666669,2114.5444444444433L2189.5981481481504,2187.6444444444433L2190.9518518518544,2188.998148148147Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 54석</title></path> -->
<!-- 						<path fill="#ff8ab4" stroke="#000000" -->
<!-- 							d="M2435.3777777777805,1995.0074074074046L2666.0111111111137,1875.9222222222195L2864.2351851851877,2161.575925925923L2570.2907407407433,2308.548148148145L2437.6388888888914,1998.775925925923L2435.3777777777805,1995.0074074074046Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 74석</title></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M2696.005555555559,1857.2333333333302L2896.490740740744,1707.9999999999968L3155.0111111111146,1945.4166666666636L2890.4611111111144,2145.9018518518487L2696.7592592592628,1860.248148148145L2696.005555555559,1857.2333333333302Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 113석</title></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M2923.1648148148192,1685.3999999999983L3094.4351851851893,1503.016666666665L3386.640740740745,1698.4740740740724L3176.1481481481524,1926.616666666665L2923.8185185185225,1687.3611111111095L2923.1648148148192,1685.3999999999983Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M3196.037037037052,1533.0740740740694L3274.4888888889036,1586.1444444444398L3412.933333333348,1350.788888888884L3327.559259259274,1304.640740740736L3196.037037037052,1531.9203703703656L3196.037037037052,1533.0740740740694Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M3268.7203703703854,1232.7111111111064L3364.4777777777927,998.5092592592546L3525.996296296311,1033.1203703703657L3427.931481481496,1308.8555555555508L3268.7203703703854,1233.86481481481L3268.7203703703854,1232.7111111111064Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M3418.501851851868,707.2222222222174L3374.6611111111274,955.2685185185137L3469.264814814831,980.6499999999951L3509.644444444461,708.375925925921L3420.8092592592757,706.0685185185137L3418.501851851868,707.2222222222174Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M3298.916666666683,1597.2814814814765L3403.9037037037197,1667.6574074074024L3591.9574074074235,1340.0055555555505L3692.3296296296453,1065.424074074069L3565.4222222222384,1035.427777777773L3461.588888888905,1311.162962962958L3301.22407407409,1592.6666666666617L3298.916666666683,1597.2814814814765Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M2510.8240740740894,1861.077777777772L2731.7759259259415,1725.7611111111055L2783.418518518534,1772.1740740740684L2536.318518518534,1927.7555555555498L2511.477777777793,1861.7314814814758L2510.8240740740894,1861.077777777772Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#70d0ea" stroke="#000000" -->
<!-- 							d="M917.1870370370514,1775.3499999999945L970.790740740755,1723.0537037036981L1195.0111111111255,1859.6777777777722L1166.2481481481625,1927.009259259254L921.7629629629772,1777.9648148148094L917.1870370370514,1775.3499999999945Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#ff8ab4" stroke="#ffffff" -->
<!-- 							d="M1531.0018518518518,2310.718518518519L1853.6833333333334,2335.2703703703705L2181.625925925926,2305.4574074074076L2204.4240740740743,2417.694444444445L1848.4222222222222,2449.2611111111114L1502.9425925925925,2415.9407407407407L1531.0018518518518,2310.718518518519Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></path> -->
<!-- 						<path fill="#bea886" stroke="#ffffff" -->
<!-- 							d="M1755.1373611111114,1608.0425925925924L1956.4625462962968,1613.3037037037034L2004.9962962962966,1983.3351851851849L1717.3888888888891,1979.8277777777776L1755.1373611111114,1608.0425925925924Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 36석</title></path> -->
<!-- 						<path fill="#bea886" stroke="#ffffff" -->
<!-- 							d="M1601.25,746.3982363315696L1140.175925925926,744.4259259259259L1140.175925925926,1077.746384479718L1244.6072333016775,1156.638800705467L1601.25,1158.611111111111L1601.25,746.3982363315696Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
	                  
<!-- 	                  <title -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 290석</title></path> -->
<!-- 						<rect x="1616.525925925926" y="746.3796296296296" -->
<!-- 							width="477.41111111111076" height="411.78518518518524" rx="0" -->
<!-- 							ry="0" fill="#bea886" stroke="#ffffff" stroke-width="0" -->
<!-- 							opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"></rect> -->
<!-- 						<path fill="#bea886" stroke="#ffffff" -->
<!-- 							d="M2110.4851851851854,745.8154741863074L2568.8277777777776,745.8154741863074L2570.3814814814814,1076.1305274971942L2467.837037037037,1154.40423681257L2108.9314814814816,1157.5351851851854L2110.4851851851854,745.8154741863074Z" -->
<!-- 							stroke-width="0" opacity="0" -->
<!-- 							style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); opacity: 0;"> -->
<!-- 						<title style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">잔여 283석</title> -->
<!-- 						</path> -->

				</svg> 
				</div>
				<div id="ez_canvas"
					style="width: 682px; height: 526px; display: none;">
					<svg height="526" version="1.1" width="682"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 3730 2570"
						preserveAspectRatio="xMidYMid meet"
						style="overflow: hidden; position: relative; background-color: rgb(244, 244, 244);">
						<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.2</desc>
						<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs></svg>
				</div>
			</div>
			<div class="iScrollVerticalScrollbar iScrollLoneScrollbar"
				style="position: absolute; z-index: 9999; width: 7px; bottom: 2px; top: 2px; right: 1px; overflow: hidden;">
				<div class="iScrollIndicator"
					style="box-sizing: border-box; position: absolute; background: rgba(0, 0, 0, 0.5); border: 1px solid rgba(255, 255, 255, 0.9); border-radius: 3px; width: 100%; transition-duration: 0ms; display: none; transform: translate(0px, 0px); transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1);"></div>
			</div>
			<div class="iScrollHorizontalScrollbar iScrollLoneScrollbar"
				style="position: absolute; z-index: 9999; height: 7px; left: 2px; right: 2px; bottom: 0px; overflow: hidden;">
				<div class="iScrollIndicator"
					style="box-sizing: border-box; position: absolute; background: rgba(0, 0, 0, 0.5); border: 1px solid rgba(255, 255, 255, 0.9); border-radius: 3px; height: 100%; transition-duration: 0ms; display: none; transform: translate(0px, 0px); transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1);"></div>
			</div>
		</div>
	</div>
