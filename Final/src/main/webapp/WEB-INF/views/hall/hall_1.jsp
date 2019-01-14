<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">

$(document).ready(function () {
	
	// 	$('.14').attr("fill","#FFF");
	
	$('path').attr("fill","#CCC");

	//섹션에 idx를 넣어주기위해 ajax로 DB에 저장된 원본 구역정보를 불러온다 
	$.ajax({
		type:"GET",
		url:"/ticket/oriSec",
		data:{"hallIdx": 1},
		dataType:"json",
		success:function(res){
			for(var i=0;i<res.hashMap.oriSecMap.length;i++){
				var str = 'path.'+res.hashMap.oriSecMap[i].secName; 
				var path = $('.seat_block').find(str); //seat_block 하위요소중 path중에 불러온 이름중 원본섹션이름을 가진걸 불러와라
				path.data("secIdx",res.hashMap.oriSecMap[i].oriSecIdx); //path에다가 커스텀 데이터 secIdx를 저장하라
			}
		},
		error:function(e){
			console.log(e);
		}
	})
	
	
})
</script>

<style>
.wrap_seat {
    position: relative;
    height: auto !important;
    background-color: #e2e2e2;
}
</style>
<body>
<!-- 잠실실내 체육관 -->
<div class="wrap_seat"><!-- 좌석영역-->
            <div class="box_stage" style="display: none;"><!-- 구역설명-->
                <div class="stage"><span>무대방향 (STAGE)</span></div>
                <div class="txt_stage">현재 보고 계신 구역은 <span class="area"></span> <span id="areaName"></span>입니다.</div>   
            </div>
	        <div class="stage_img">
	            <div id="wrapper" style="width: 682px; height: 602px;">
	                <div id="scroller" style="transform-origin: 0px 0px 0px; transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) scale(1); width: 682px; height: 602px;">
	                  <div class="seat_block" id="ez_canvas_zone" style="width: 682px; height: 602px;">
	                  <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: hidden; position: relative; background-color: rgb(244, 244, 244);" viewBox="0 0 2950 2220" preserveAspectRatio="xMidYMid meet">
	                  <image x="0" y="0" width="2950" height="2220" preserveAspectRatio="none" xlink:href="https://cdnticket.melon.co.kr/resource/image/upload/seat/2018/12/2018122414463996082bd4-e266-49ea-9067-ebac9a80ee28.svg" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></image>
	                  <desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.2</desc>
	                  <defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
	                      
	                  
	                  <!-- 스탠딩A -->
	                  <path fill="#bea886" stroke="#000000" class="A section" d="M945.3296296296296,721.7518518518519L944.1981481481482,1192.4481481481482L1462.4166666666665,1192.4481481481482L1464.6796296296297,857.5296296296297L1383.212962962963,857.5296296296297L1384.3444444444444,536.188888888889L1147.864814814815,535.0574074074076L945.3296296296296,721.7518518518519Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="1192.5975115740725" y="932.5102838494236" text-anchor="middle" font-family="Malgun Gothic" font-size="80px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 80px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">A</tspan></text>
	                  
	                  <!-- 스탠딩B -->
	                  <path fill="#bea886" stroke="#000000" class="B section" d="M1478.2148148148133,857.4425925925927L1479.4462962962948,1191.1740740740743L1995.4370370370355,1191.1740740740743L1996.668518518517,721.9796296296299L1795.9370370370355,537.2574074074076L1561.955555555554,537.2574074074076L1563.1870370370355,857.4425925925927L1478.2148148148133,857.4425925925927Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="1734.5424189814796" y="935.0732468123866" text-anchor="middle" font-family="Malgun Gothic" font-size="80px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 80px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">B</tspan></text>
	                  
	             
	                  <!-- 9구역 -->
	                  <path fill="#cccccc" stroke="#000000" class="9 section" d="M2239.979629629629,682.205555555556L2520.5870370370367,682.205555555556L2490.0370370370365,977.5222222222226L2223.007407407407,908.5018518518523L2238.8481481481476,684.468518518519L2239.979629629629,682.205555555556Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="2367.511342592593" y="857.6734744990894" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">9</tspan></text>
	                  
	                  
	                  <!-- 10구역 -->
	                  <path fill="#ff8ab4" stroke="#000000" class="10 section" d="M2131.627777777775,1136.624074074073L2362.775925925923,1296.8185185185173L2488.5907407407376,1004.9574074074065L2219.405555555553,927.4203703703696L2132.3592592592563,1135.16111111111L2131.627777777775,1136.624074074073Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="2298.743460648152" y="1135.6586596842724" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">10</tspan></text>
	                   
	                 <!-- 11구역 -->
	                  <path fill="#9076ff" stroke="#000000" class="11 section" d="M1959.961111111107,1310.9796296296288L2132.5907407407367,1544.3222222222214L2350.572222222218,1314.6370370370362L2122.349999999996,1152.2481481481475L1961.4240740740697,1309.516666666666L1959.961111111107,1310.9796296296288Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                   <text x="2130.260127314819" y="1379.6586596842726" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">11</tspan></text>
	                         
	                  <!-- 12구역 -->
	                  <path fill="#9076ff" stroke="#000000" class="12 section" d="M1746.4888888888854,1435.4166666666665L1842.9407407407373,1702.3222222222219L2118.992592592589,1555.9814814814813L1945.2129629629594,1326.4925925925925L1747.320370370367,1434.5851851851849L1746.4888888888854,1435.4166666666665Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                 <text x="1911.5749421296339" y="1558.177178202791" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">12</tspan></text>
	                  
	                   
	                  <!-- 13구역 -->
	                  <path fill="#9076ff" stroke="#000000" class="13 section" d="M1489.5611111111095,1474.496296296293L1493.718518518517,1755.5370370370335L1824.6481481481464,1708.1425925925892L1729.0277777777762,1442.0685185185152L1489.5611111111095,1474.496296296293L1489.5611111111095,1474.496296296293Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="1623.7138310185226" y="1645.2049559805687" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">13</tspan></text>
	                    
	                    <!-- 14구역 -->
	                  <path fill="#9076ff" stroke="#000000" class="14 section" d="M1236.7907407407395,1444.562962962961L1469.6055555555542,1477.82222222222L1474.594444444443,1755.5370370370347L1136.1814814814802,1713.1314814814793L1234.2962962962952,1444.562962962961L1236.7907407407395,1444.562962962961Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                   <text x="1322.4638310185228" y="1647.4364374620502" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">14</tspan></text>
	                      
	                  <!-- 15구역 -->
	                  <path fill="#9076ff" stroke="#000000" class="15 section" d="M841.0055555555547,1563.4648148148128L1012.2907407407399,1332.3129629629611L1220.1611111111101,1436.2481481481461L1117.0574074074066,1708.1425925925905L842.6685185185177,1565.127777777776L841.0055555555547,1563.4648148148128Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="1045.760127314819" y="1544.7882893139022" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">15</tspan></text>
	                  
	                
	                  
	                  <!-- 16구역 -->
	                  <path fill="#9076ff" stroke="#000000" class="16 section" d="M606.0092592592591,1322.4074074074065L840.1555555555553,1149.1185185185175L1000.0351851851849,1315.1870370370361L816.4314814814812,1542.1129629629618L607.0407407407406,1324.4703703703694L606.0092592592591,1322.4074074074065Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="804.7601273148191" y="1368.501252276865" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">16</tspan></text>
	              
	                
	                  <!-- 17구역 -->
	                  <path fill="#ff8ab4" stroke="#000000" class="17 section" d="M467.7907407407408,1018.12037037037L590.537037037037,1298.683333333333L829.8407407407408,1132.6148148148145L740.1018518518517,934.57037037037L467.7907407407408,1015.0259259259255L467.7907407407408,1018.12037037037Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="648.5564236111154" y="1129.7327337583465" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">17</tspan></text>
	                  
	                   <!-- 18구역 -->
	                  <path fill="#cccccc" stroke="#000000" class="18 section" d="M430.07962962962984,685.6000000000003L717.9074074074075,685.6000000000003L732.8111111111111,911.9500000000003L464.5444444444446,992.0574074074077L430.07962962962984,693.0518518518521L430.07962962962984,685.6000000000003Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="584.6582754629635" y="863.7364374620523" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">18</tspan></text>
	                  
	                  
	               
	                  <!-- 27구역 -->
	                  <path fill="#cccccc" stroke="#000000" class="27 section" d="M2544.912962962955,683.5240740740728L2512.9370370370293,988.8425925925912L2901.805555555548,1097.148148148147L2931.718518518511,679.3981481481469L2545.944444444437,683.5240740740728L2544.912962962955,683.5240740740728Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="2717.980497685197" y="914.4660670916795" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">27</tspan></text>
	                  
	                  <!-- 28구역 -->
	                  <path fill="#70d0ea" stroke="#000000" class="28 section" d="M2380.046296296295,1315.4962962962973L2509.351851851851,1015.0148148148157L2897.2685185185173,1120.9222222222231L2722.398148148147,1548.2462962962973L2394.824074074073,1326.5796296296305L2380.046296296295,1315.4962962962973Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="2630.908275462963" y="1285.1123633879781" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">28</tspan></text>
	                  
	                  <!-- 29구역 -->
	                  <path fill="#70d0ea" stroke="#000000" class="29 section" d="M2368.962962962962,1336.431481481482L2146.064814814814,1559.3296296296303L2409.6018518518513,1885.672222222223L2710.0833333333326,1567.9500000000007L2376.3518518518513,1340.1259259259266L2368.962962962962,1336.431481481482Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="2403.8471643518524" y="1627.6697707953854" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">29</tspan></text>
	                  
					  <!-- 30구역 -->	                  
	                  <path fill="#ff8ab4" stroke="#000000" class="30 section" d="M1849.7092592592567,1731.8629629629581L1996.1722222222195,2106.0092592592546L2391.6222222222195,1903.6240740740693L2129.3203703703675,1576.0796296296248L1851.040740740738,1731.8629629629581L1849.7092592592567,1731.8629629629581Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                  <text x="2073.054571759271" y="1873.0605115361238" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">30</tspan></text>
	                     
	                  <!-- 31구역 -->
	                  <path fill="#ff8ab4" stroke="#000000" class="31 section" d="M1494.2037037037016,1777.1333333333284L1494.2037037037016,2181.9037037036987L1974.8685185185166,2113.998148148143L1829.737037037035,1737.1888888888839L1495.5351851851833,1778.4648148148099L1494.2037037037016,1777.1333333333284Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
					  <text x="1691.9619791666782" y="2013.7716226472348" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">31</tspan></text>

					  <!-- 32구역 -->
	                  <path fill="#ff8ab4" stroke="#000000" class="32 section" d="M1130.7092592592574,1741.1833333333284L978.9203703703685,2121.987037037032L1468.9055555555535,2184.5666666666616L1468.9055555555535,1779.7962962962913L1133.3722222222202,1738.5203703703655L1130.7092592592574,1741.1833333333284Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
					  <text x="1249.3082754629745" y="2016.7031041287164" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">32</tspan></text>
					
					  <!-- 33구역 -->
	                  <path fill="#ff8ab4" stroke="#000000" class="33 section" d="M826.4722222222204,1586.7166666666633L565.0999999999981,1917.1092592592556L959.9870370370352,2117.381481481478L1113.868518518516,1734.9407407407373L829.8666666666647,1588.979629629626L826.4722222222204,1586.7166666666633Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); "></path>
	                  <text x="859.4212384259376" y="1881.8549559805683" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">33</tspan></text>
	                 
	                 <!-- 34구역 -->
	                  <path fill="#70d0ea" stroke="#000000" class="34 section" d="M255.87222222222138,1558.983333333334L584.6777777777769,1337.3166666666673L806.3444444444435,1567.6037037037042L546.501851851851,1901.3351851851858L260.79814814814733,1567.6037037037042L255.87222222222138,1558.983333333334Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                 <text x="545.2490162037043" y="1621.6068078324224" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">34</tspan></text>
	                  
	                  <!-- 35구역 -->
	                  <path fill="#70d0ea" stroke="#000000" class="35 section" d="M74.84444444444358,1129.1962962962966L447.9833333333324,1026.9833333333338L572.362962962962,1313.9185185185188L239.86296296296206,1535.5851851851855L77.30740740740652,1137.816666666667L74.84444444444358,1129.1962962962966Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
	                   <text x="339.10827546296343" y="1282.0808819064966" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">35</tspan></text>
	                  
	                  
	                  <!-- 36구역 -->
	                  <path fill="#cccccc" stroke="#000000" class="36 section" d="M20.861111111109153,687.0055555555542L407.82777777777574,688.1370370370357L444.0351851851832,997.0314814814801L70.64629629629428,1110.1796296296282L20.861111111109153,689.2685185185171L20.861111111109153,687.0055555555542Z" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); "></path>
	                  <text x="229.1527199074194" y="911.5345856101982" text-anchor="middle" font-family="Malgun Gothic" font-size="100px" font-style="normal" font-weight="bold" stroke="none" fill="#ffffff" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: &quot;Malgun Gothic&quot;; font-size: 100px; font-style: normal; font-weight: bold;">
	                  <tspan dy="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">36</tspan></text>
	                  </svg></div>
	                  
	                  <div id="ez_canvas" style="width: 682px; display: none; height: 526px;"><svg height="526" version="1.1" width="682" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 2950 2220" preserveAspectRatio="xMidYMid meet" style="overflow: hidden; position: relative; background-color: rgb(244, 244, 244);"><desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.2</desc><defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs></svg></div>
	                </div>
	            <div class="iScrollVerticalScrollbar iScrollLoneScrollbar" style="position: absolute; z-index: 9999; width: 7px; bottom: 2px; top: 2px; right: 1px; overflow: hidden;"><div class="iScrollIndicator" style="box-sizing: border-box; position: absolute; background: rgba(0, 0, 0, 0.5); border: 1px solid rgba(255, 255, 255, 0.9); border-radius: 3px; width: 100%; transition-duration: 0ms; display: none; transform: translate(0px, 0px); transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1);"></div></div><div class="iScrollHorizontalScrollbar iScrollLoneScrollbar" style="position: absolute; z-index: 9999; height: 7px; left: 2px; right: 2px; bottom: 0px; overflow: hidden;"><div class="iScrollIndicator" style="box-sizing: border-box; position: absolute; background: rgba(0, 0, 0, 0.5); border: 1px solid rgba(255, 255, 255, 0.9); border-radius: 3px; height: 100%; transition-duration: 0ms; display: none; transform: translate(0px, 0px); transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1);"></div></div></div>
	        </div>
        </div>
