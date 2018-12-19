<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

</style>

<script>

$(document).ready(function(){
	// 일간 버튼 클릭 시
	$('#dailySort').click(function(){
		$('.sorting button').removeClass('clicked');
		$(this).addClass('clicked');
		$('#datePeriod').text('');
	});
	
	// 주간 버튼 클릭 시
	$('#weeklySort').click(function(){
		$('.sorting button').removeClass('clicked');
		$(this).addClass('clicked');
		
		var today = new Date(); // 오늘 일자
		
		// 필터 기간 띄워주기
		var strDate = getDateStringWeekly(today);
		$('#datePeriod').text(strDate);
		
		// 공연 랭킹 가져오기
		$.ajax({
			url: '/ticket/getrank'
			, method : 'GET'
			, data: {
				sort: 'weekly'
				, today: today
			}
			, dataType: 'json'
			, success: function(d){
				console.log('성공');
				console.log(d);
			}
			, error: function(e){
				console.log('에러');
				console.log(e);
			}
		});
	});
	
	// 처음 실행 시 '주간' default
	$('#weeklySort').click();
});


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
// '일간' 포멧
function getDateStringDaily(date) {
	var strDate = getDateString(date);
	var hours = date.getHours();
	
	var strDaily = strDate
	    + '00:00 ~'
	    + ((hours < 10) ? '0' + hours : hours) + ':00'
	    +' 현재';
	
	return strDaily;
};
// '주간' 포멧
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


</script>

<div class="sorting">
<button id="dailySort">일간</button>
<button id="weeklySort" class="clicked">주간</button>
</div>
<div class="dateTitle"><p id="datePeriod"></p></div>

<div class="pfmRanking">

</div>
