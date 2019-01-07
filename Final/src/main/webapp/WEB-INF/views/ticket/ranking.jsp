<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.sorting {
    text-align: center;	
}
.dateTitle {
    text-align: center;
}
.pfmRanking {
    margin-top: 30px;
}

.pfmRanking img {
	float: left;
	width: 90px;
} 
#dailyInfo {
	margin: 30px;
}
.ranking {
    font-size: 44px;
    padding: 20px 110px 0px 40px !important;
    width: 20px;
    color: #fdd508;
}
.pfmInfo p {
	display: inline-block;
    padding-top: 40px;
    padding-left: 10px;
}


</style>

<script>

$(document).ready(function(){
	
	// 조회 타입 버튼 클릭 시 (일간, 주간)
	$('.sorting button').click(function(){
		$('.sorting button').removeClass('clicked');
		$(this).addClass('clicked');

		var today = new Date(); // 오늘 일자
		var type; // 타입 (일간, 주간)
		
		// 일간 버튼 클릭 시
		if($(this).attr('id') == 'dailySort'){
			// 필터 기간 띄워주기
			var strDate = getDateStringDaily(today);
			$('#datePeriod').text(strDate);
			// 집계 안내 메세지 띄워주기
			$('#dailyInfo').show();
			
			type = 'daily';
		
		// 주간 버튼 클릭 시	
		}else if($(this).attr('id') == 'weeklySort'){
			// 필터 기간 띄워주기
			var strDate = getDateStringWeekly(today);
			$('#datePeriod').text(strDate);
			// 집계 안내 메세지 감추기
			$('#dailyInfo').hide();
			
			type = 'weekly';
		}
		
		// 공연 랭킹 가져오기
		$.ajax({
			url: '/ticket/getrank'
			, method : 'GET'
			, data: {
				type: type
// 				, today: today
			}
			, dataType: 'json'
			, success: function(d){
				// 랭킹 순으로 그려주기
				console.log(d);
				viewRank(d);
			}
			, error: function(e){
				console.log('에러');
				console.log(e);
			}
		});
	});
	
	
	$('#weeklySort').click(function(){
		$('.sorting button').removeClass('clicked');
		$(this).addClass('clicked');
		
		var today = new Date(); // 오늘 일자
		
		
	});
	
	// 처음 실행 시 '주간' default
	$('#weeklySort').click();
});

// Date -> String: YYYY.MM.DD 형태로 반환
function getDateSimpleString(date){
	var date = new Date(date);
	var month = date.getMonth() + 1;
	var day = date.getDate();
	return date.getFullYear() + "."
		+ ((month < 10)? '0' + month : month) + "."
		+ ((day < 10) ? '0' + day : day);
}
// Date -> String: YYYY년 MM월 DD일 (D) 형태로 반환
function getDateString(date){
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var week = date.getDay();
	var weeks = ['일', '월', '화', '수', '목', '금', '토'];
	
	var strDate = date.getFullYear() + '년 ' 
		+ ((month < 10) ? '0' + month : month) + '월 ' 
		+ ((day < 10) ? '0' + day : day) + '일 (' + weeks[week] +') ';
	
	return strDate;
}
// 조회 범위 띄워주기: '일간' 포멧
function getDateStringDaily(date) {
	var strDate = getDateString(date);
	var hours = date.getHours();
	var mins = date.getMinutes();
	var strDaily;
	
	console.log(hours);
	console.log(mins);
	// 오전 10시 30분 이전이라면 전날로 조회
	if(hours < 10 || (hours == 10 && mins <= 30)){
		var yesterDay = new Date(date.getTime() - (1 * 24 * 60 * 60 * 1000));
		hours = getDateString(yesterDay);
		
		strDaily = strDate
	    + '00:00 ~'
	    + '24:00';
			
	// 오전 10시 30분 이후인 경우
	} else {
		strDaily = strDate
		    + '00:00 ~'
		    + ((hours < 10) ? '0' + hours : hours) + ':00'
		    +' 현재';
	}
	
	
	return strDaily;
};
//조회 범위 띄워주기: '주간' 포멧
function getDateStringWeekly(date) {
	var lastDay = new Date(); // 7일 전 일자
	lastDay = new Date(lastDay.setDate(lastDay.getDate() - 6));
	
	var strDate = getDateString(date);
	var hours = date.getHours();
	
	var strDaily = getDateString(lastDay) 
		+ ' ~ ' + strDate
	    + ((hours < 10) ? '0' + hours : hours) + ':00'
	    +' 현재';
	
	return strDaily;
};

// 공연 랭킹 그려주는 메소드
function viewRank(pfmList){
	// 기존 리스트 초기화
	$('.pfmRanking .table tbody').html('');
	
	for(var i=0; i<pfmList.length; i++){
		var pfm = pfmList[i];
		var tr = $('<tr>');
		tr.append('<td class="ranking">'+ (i+1) +'</td>'); // 순위
		var mainInfo = $('<div class="pfmInfo">'); // 주요 정보(포스터, 이름)
		var mainInfo_a = $('<a href="/ticket/pfmdetail?pfmIdx='+pfm.pfmIdx+'" style="text-decoration:none">');
		mainInfo_a.append($('<img src="/resources/image/'+ pfm.posterName + '">'));
		mainInfo_a.append($('<p>'+ pfm.name +'</p>'));
		mainInfo.append(mainInfo_a);	
		
		tr.append($('<td>').append(mainInfo));
		
		tr.append('<td>'+getDateSimpleString(pfm.pfmStart)
				+'<br>~ '+getDateSimpleString(pfm.pfmEnd)+'</td>'); // 공연 일정
		tr.append('<td>'+pfm.hallName+'</td>'); // 공연장 이름
		tr.append('<td>'+(pfm.bookingRate).toFixed(2)+'%</td>'); // 예매율
		
		$('.pfmRanking .table tbody').append(tr);
	}
	
	
}
</script>

<div class="sorting">
<button id="dailySort">일간</button>
<button id="weeklySort" class="clicked">주간</button>
</div>
<div class="dateTitle"><p id="datePeriod"></p></div>

<div class="pfmRanking">
<table class="table">
<thead>
	<tr>
		<th>랭킹</th>
		<th>공연명</th>
		<th>공연일시</th>
		<th>공연장소</th>
		<th>예매</th>
	</tr>
</thead>
<tbody>
</tbody>
</table>

<div id="dailyInfo" style="display:none">
<b>집계 대상</b>
<ul>
<li>당일 오전의 경우 판매비중이 낮기 때문에 오전 10시 30분 이전까지는 전일 24시간의 집계 현황을 알려드립니다.</li>
</ul>
</div>

</div>
