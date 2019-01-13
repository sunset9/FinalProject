<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11b0d7e1cbaf8eb3510561bbddb85ae9&libraries=services"></script>

<div id="map" style="width: 1000px; height: 500px;"></div>

<!-- 위에 설정 시 지도 확인되지 않아 여기에 설정 -->
<script>
	// 현재 등록되어있는 공연장의 주소지를 불러옴
	var hallAddress = '서울 구로구 경인로 430고척스카이돔';
	console.log('등록된 공연장 주소지 : ' + hallAddress);

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표

		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 지도를 표시하는 div 크기를 변경하는 함수입니다
	function resizeMap() {
		var mapContainer = document.getElementById('map');
		mapContainer.style.width = '1000px';
		mapContainer.style.height = '500px';
	}

	function relayout() {

		// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		map.relayout();
	}

	// 주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					hallAddress,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === daum.maps.services.Status.OK) {

							var coords = new daum.maps.LatLng(result[0].y,
									result[0].x);

							y = result[0].x;
							x = result[0].y;

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new daum.maps.Marker({
								map : map,
								position : coords
							});

							var hallName = '고척돔';
							console.log('등록된 공연장 이름 : ' + hallName);

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new daum.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">'
												+ hallName + '</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>