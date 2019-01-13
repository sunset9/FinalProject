<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../layout/menu.jsp" />

<!-- Datepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/bootstrap-datepicker.kr.js" charset="UTF-8"></script>

<!-- Timepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timepicker/1.10.0/jquery.timepicker.min.js"></script>

<!-- Froara Editor 관련 -->
<!-- Include external CSS. -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<!-- Include Editor style. -->
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_style.min.css" rel="stylesheet" type="text/css" />
<!-- Include external JS libs. -->
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
<!-- Include Editor JS files. -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/js/froala_editor.pkgd.min.js"></script>

<style>
#registForm {
	margin: 0 auto;
}

.registPfmTab {
	width:100%;
}

th {
   	width: 110px;
}

tr:not(.not_space){
	border-bottom: 10px solid #fff;
}

td:not(.seatInfoInput) {
	width: 280px;
}

.long {
	width: inherit !important;
}

table button {
	color: #555;
    background-color: #fdfdfd;
    border: 1px solid #7e7e7e;
    border-radius: .25em;
    height: 34px;
    width: 135px;
}

#selectSec {
    display: inline;
    width: 200px;
}

#setSecBtn {
    margin-left: 5px;
    padding-top: 4px;
}

#registStep-2 {
 	display: flex; 
}
.ticketDate{
	display: inline;
/*     width: 110px; */
	float: left;
}

#posterImg input[type="file"] { 
	position: absolute;
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0; 
} 

#posterImg label { 
	display: inline-block; 
	padding: .5em .75em; 
	color: #999; 
	font-size: inherit; 
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
  	border-bottom-color: #e2e2e2; 
  	border-radius: .25em; 
  	margin-bottom: 0px;
  } 
  
/* named upload */ 
#posterImg .posterName { 
	display: inline-block; 
	padding: .5em .75em;
	/* label의 패딩값과 일치 */ 
	font-size: inherit;
	font-family: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #f5f5f5; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em; 
	-webkit-appearance: none; 
	/* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
}
 
#posterImg img{
	left: 29px;
    position: relative;
}

#themeContent label {
	margin-left: 6px;
}

.resSelect {
    margin-top: 5px;
}
.resSelect span{
    margin-right: 10px;
}

#resultArtist{
/* 	display: flex;  자식이 float 인 경우 높이 자동 조절 */
}
.resUnit {
	display: flex;
}
.resUnit div {
	float:left;
    margin: 8px 10px;
}
.resUnit img {
	width: 120px;
}

#searchArtist {
    width: 230px;
    display: inline;
}

#selectedArtist{
	display: flex; /* 자식이 float 인 경우 높이 자동 조절 */
    border-top: 1px solid;
    margin-top: 20px;
    padding-top: 20px;
}

#selectedArtist div{
	margin-right: 15px;
}

.glyphicon-remove, .glyphicon-plus-sign, .glyphicon-minus-sign{
	cursor:pointer
}

.tempSecName {
	text-align: right;
  	width: 125px;
    display: inline;
}

.tempSecPay {
	text-align: right;
  	width: 133px;
    display: inline;
    margin-left: 8px;
}

#seatHall td{
    overflow: hidden;
}

/* 구역 선택 시 */
.clicked {
	stroke: #222;
	stroke-width: 25;
}
/* 구역 선택 완료 시 */
.completeSet {
/* 	fill: #1e88e5; */
}

.pfmDate{
	display: inline;
	width: 125px;
}

#registStep{
	width: 700px;
    height: 100px;
    margin: 0px auto;
}
.progressbar {
	counter-reset: step;
}
.progressbar li {
	list-style-type: none;
	float:left;
	width: 25%;
	position: relative;
	text-align: center;
    color: #7d7d7d;
    font-size: 12px;
}
/* 현재 머물러있는 단계 */
.progressbar li.inProgress{
	font-weight: bold;
	font-size: 14px;
}
.progressbar li.inProgress:before{
	border-color: #999;
	background-color: #eee;
}
/* step 글자 위에 서클 모양 */
.progressbar li:before { 
	content: counter(step);
	counter-increment: step;
	width: 30px;
    height: 30px;
    line-height: 28px;
    border: 2px solid #7d7d7d;
    border-radius: 50%;
    display: block;
    text-align: center;
    margin: 0 auto 10px auto;
    background-color: white;
}
.progressbar li:after {
    content: '';
    width: 100%;
    height: 2px;
    position: absolute;
    background-color: #7d7d7d;
    top: 15px;
    left: -50%;
    z-index: -1;
}
/* 첫번째 li 의 progress bar 줄 제거*/
.progressbar li:first-child:after {
     content: none; 
}
/* 활성화된 요소의 글자 색 */
.progressbar li.completeStep {
	color: #f2b134; 
	font-weight: 600;
}
/* 활성화된 요소의 step 서클 */
.progressbar li.completeStep:before {
	content: '';
	background-image: url(/resources/image/checked.png);
	background-size: 28px 28px;
    background-position: -1px -1px;
	border-color: #f2b134; 
}
/* 활성화 된 요소에 연결된 progress 줄 색 변경*/
.progressbar li.completeStep + li:after {
     background-color: #f2b134; 
}

/*<input type="number"/> 화살표 지우기*/
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#registStep-2 div{
/* 	flex: 1;  */
}

#registStep-2 select {
    width: 125px;
}

#registTimeForm{
	float:left;
}
#registTimeRes {
	float:right;
	border: 1px solid #aaa;
	margin-top: 40px;
	padding: 10px;
	width: 365px;
}

#registStep-3, #registStep-4{
/* 	display: flex;	 */
}
#registStep-3 div:first, #registStep-3 div:first{
/*     float: left;   */
}

</style>

<script>
var sectionColor = ['#1E88E5', '#7EB2B3', '#D8D7B7', '#FE7079', '#FFAA63', '#F87608'];

$(document).ready(function(){
	var secNamePay = []; // 좌석정보: 구역명-가격 정보 담고 있음
	var completeSetSec = []; // 구역 지정 완료한 정보 담고 있음 
	
	// 홀 선택 되어 있으면, 홀 정보 띄워주기
	var hallIdx = ${pfm.hallIdx };
	if(hallIdx > 0){
		$('#seatDiv').show();
	}
	
	// 서버에서 받아온 좌석 구역 정보 양식 변환 : secNamePay 리스트 생성
	var seatSecList = ${seatSecList };
	seatSecList.forEach(function(seatSec){
		var unique = true;
		secNamePay.some(function(item){
			if(seatSec.appSec == item.secName){
				unique = false;
				return false;
			}
		});
		if(unique){
			// 구역명, 가격 정보 삽입(구역명 중복 제거)
			secNamePay.push({"secName":seatSec.appSec, "secPay":seatSec.secPay});
		}
	});
	console.log(secNamePay);
	console.log(completeSetSec);
	
	// 좌석정보 란 그려주기
	console.log(secNamePay);
	if(secNamePay.length > 0){
		// 가격순으로 내림차순 정렬
		secNamePay.sort(function(a,b){
			if (a.secPay < b.secPay) { return 1;}
			  if (a.secPay> b.secPay) { return -1;}
			  return 0;
		});
		console.log(secNamePay);
		secNamePay.forEach(function(secInfo){
			addSeatInput();
			$('.tempSecName').last().val(secInfo.secName);
			$('.tempSecPay').last().val(secInfo.secPay);
		});
	}else{
		addSeatInput();
	}
	// 서버에서 넘어온 구역 정보들 리스트 형태로 삽입 : completeSetSec 리스트 생성
	seatSecList.forEach(function(seatSec){
		completeSetSec.push({"oriSec" : seatSec.oriSecName, "appSec": seatSec.appSec, "secPay":seatSec.secPay})
	});
	var servCompleteSetSec = completeSetSec; // 구역 색 칠해주기 위해 하나 copy(홀 그려줄 때 초기화됨)
	// 홀 좌석도 그려주기
	viewSeatSec(function(){
		// 이미 지정된 구역들 색 칠해주기 (콜백함수)
		servCompleteSetSec.forEach(function(setSec){
			// 지정 완료 클래스 부여
			$('.section.'+setSec.oriSec).addClass('completeSet');
			// 색 지정해서 칠해주기
			for(var i=0;i<secNamePay.length;i++){
				if(secNamePay[i].secName == setSec.appSec){
					$('.section.'+setSec.oriSec).attr('fill',sectionColor[i]);
				}
			}
		});
	});
	// 서버에 넘길 좌석정보 삽입
	addSetSecInput();
	
	
	var timeList = []; // 공연 일정 담겨있는 list 
	
	// 처음 수정모드 실행 시 공연일정 그려주기
	var pfmDbtlist = ${pfmdbtList };
	// 기존코드와 같게 json 형식 맞춰주기 
	pfmDbtlist.forEach(function(dbt){
		// json 만들기
		var timeJson = {};
		timeJson['date'] = formatDate(dbt.pfmDate);
		timeJson['time'] = dbt.pfmTime;
		
		// list에 json 추가하기
		timeList.push(timeJson);
	});
	// 일정 - 날짜, 시간 순으로 오름차순 정렬
	timeList = sortJsonList(timeList);
	// 화면에 그려주기
	viewTimeList(timeList);
		
	
	// 단계 이동 버튼 클릭 시
	$('.stepBtn').on('click', function(){
		var lastCompletedTab = $('.completeStep').last().attr('id');
		var curStep = 0;
		// 현재 단계 구하기
		if(!lastCompletedTab){
			curStep = 1;
		}else{
			curStep = Number(lastCompletedTab.split("-")[1]) + 1;
		}
		var prevStep = curStep - 1;
		var nextStep = curStep + 1;
		
		// 다음 단계 클릭 시
		if($(this).is($('#nextBtn'))){
			// 유효성 검사
			if(curStep == 1){
				if($('input[name="name"]').val().length == 0){
		 			alert("공연 제목을 입력해주세요."); return;
		 		} else if($('select[name="genreIdx"]').val() == 0){
		 			alert('공연 분류를 선택해주세요.'); return;
		 		} else if($('.resSelect span').text().length == 0){
		 			alert('공연 테마를 선택해주세요.'); return;
		 		} else if($('#ticketStartDate').val() == '' || $('#ticketEndDate').val() == ''){
		 			alert('티켓 오픈일을 입력해주세요.'); return;
		 		} else if($('select[name="ageGradeIdx"]').val() == 0){
		 			alert('관람 등급을 선택해주세요.'); return;
		 		} else if(!checkEmptyArtist){
		 			alert('출연진을 선택해주세요.'); return;
		 		} else if($('select[name="hallIdx"]').val() == 0){
		 			alert('공연장을 선택해주세요.'); return;
		 		} 
			
			} else if(curStep == 2){
				var pfmStartDate = $('#registTimeRes').last('p').find('span').text();
				if(pfmStartDate == ""){
					alert("공연일을 추가해주세요.")
					return;
				}
			}
			
			// 화면 맨 위로 올리기
			$("html").scrollTop(0);
			
			// 다음,이전 버튼 활성화 조정
			if(curStep == 1){ // 현재 STEP1 단계라면
				// '이전 단계' 버튼 활성화
				$('#prevBtn').show();
			} else if(curStep == 3){ // 현재 STEP 3 단계라면(=다음이 4단계)
				// '다음 단계' 버튼 비활성화
				$('#nextBtn').hide();
				// '저장' 버튼 활성화
				$('#storeBtn').show();
			}
			
			// 현재 단계 탭 완료 상태 전환
			$('#step-'+curStep).addClass('completeStep');
			// 다음 단계 탭 현재 진행 상태 표시로 전환
			$('#step-'+curStep).removeClass('inProgress');
			$('#step-'+nextStep).addClass('inProgress');
			
			// 현재 띄워주고 있는 등록 양식 숨김
			$('#registStep-'+curStep).hide();
			// 다음 등록 양식 보여줌
			$('#registStep-'+nextStep).show("slide", {direction: "right"}, 'fast');
			
		} else { // 이전 단계 클릭 시
			// 화면 맨 위로 올리기
			$("html").scrollTop(0);
		
			if(curStep == 2){ // 현재 STEP2 단계라면 ( =전환될 화면이 1단계)
				// '이전 단계' 버튼 비활성화
				$('#prevBtn').hide();
			} else if(curStep == 4){ // 현재 STEP4 단계라면 ( =전환될 화면이 3단계)
				// '다음 단계' 버튼 활성화
				$('#nextBtn').show();
				// '저장' 버튼 비활성화
				$('#storeBtn').hide();
			}
		
			// 이전 단계 탭(전환될 탭) 미완료 상태 전환
			$('#step-'+prevStep).removeClass('completeStep');
			// 이전 단계 탭 현재 진행 상태 표시로 전환
			$('#step-'+curStep).removeClass('inProgress');
			$('#step-'+prevStep).addClass('inProgress');
			
			// 현재 띄워주고 있는 등록 양식 숨김
			$('#registStep-'+curStep).hide();
			// 다음 등록 양식 보여줌
			$('#registStep-'+prevStep).show("slide", {direction: "left"}, 'fast');
		}
		
	});
	
	
	// 포스터 업로드
	var fileTarget = $('#posterImg .upload-hidden');
	fileTarget.on('change', function(){ // 값이 변경되면 
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name; }
		else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
		} 
		// 추출한 파일명 삽입 
		$(this).siblings('.posterName').val(filename);
	});

	// 포스터 업로드 버튼 클릭 시 미리보기 띄워주기
	$('#posterBtn').on('change',function(){
		var file = this.files; // files 를 사용하면 파일의 정보를 알 수 있음

        var reader = new FileReader(); // FileReader 객체 사용
        reader.onload = function(rst) { // 이미지를 선택후 로딩이 완료되면 실행될 부분
			var postImg = $('#posterImg').find('img');
            postImg.attr('src', rst.target.result);
           // 이미지는 base64 문자열로 추가
           // 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
        }
       
        reader.readAsDataURL(file[0]); // 파일을 읽는다, 배열이기 때문에 0 으로 접근
	});
	
	// 장르 변경 시
	$("select[name='genreIdx']").on("change",function(){
		// 테마 체크 박스 창 초기화
		$('#themeModal').find('#themeContent').html('');
		// 선택한 테마목록들도 함께 초기화
		$('#themeSelBtn').next().html('');
		
	});
	
	// 테마 선택 버튼 클릭시
	$("#themeSelBtn").on("click",function(){
		var genreIdx = $("select[name=genreIdx]").val();
		if(genreIdx == 0){
			alert('공연 분류를 먼저 선택해주세요.');
			return;
		}
// 		var initSelectedTheme = ${thmAllListJson };
// 		console.log(initSelectedTheme);
		
		// 장르에 맞는 테마 리스트 가져오기
		$.ajax({
			url: "/viewtheme"
			, method : "GET"
			, dataType: "json"
			, data: {"genreIdx": genreIdx }
			, success : function(d){
				var thmTable = $('#themeModal').find('#themeContent');
				var idx = 0;
				if(thmTable.find("input").length == 0){
					var tr = $("<tr>");
					for(var i = 1; i <= d.length ; i++) {
						var theme = d[i-1];  
						var inputTag = $("<input type='checkbox'/>") ;
						var id = 'thmList['+ (idx++) + '].themeIdx';
						inputTag.attr('id', id);
						inputTag.attr('name', id);
						inputTag.attr('value', theme.themeIdx);
						var labelTag = ("<label for='"+id+"'>"+theme.themeName+"</label>");
						
						if(i%5 == 1) tr = $("<tr>"); 
						thmTable.append(tr.append($("<td>").append(inputTag)));
						inputTag.after(labelTag);
					};
				}
				$('#themeModal').modal('show');
			}
			, error: function(){
				console.log("테마 리스트 로드 실패");
			}
		});
	});
	
	
	// 테마 선택 완료 시
	$('#themeModal').find('.btn').on('click', function(){
		var thmSelected = $("input[name^='thmList']:checked");
		// 선택한 테마 목록들 띄우는 영역 활성화
		var themeTextList = $('#themeSelBtn').next();
		themeTextList.show();
		themeTextList.html('');
		// 선택한 테마 목록들 보여주기
		thmSelected.each(function(idx){
			var labelName = $(thmSelected[idx]).next().text();
			themeTextList.append("<span>"+labelName+" </span>");
		});
		
	});
	
	
	// 티켓 오픈 일정, 공연 일정 지정
	var startDate = new Date(); 
	var endDate = new Date(); 
	$('.date').datepicker({
// 		startDate: startDate, // 오늘 이후로 선택 가능
	    todayHighlight: true,
	    autoclose: true,
	    format: "yyyy-mm-dd",
	    language: "kr"
	}).on('changeDate', function(selected){ 
		if($(this).is('#ticketStartDate')){ // 티켓 오픈 시작일 선택
			// 종료일 조정(시작일보다 빠르지 않게)    	
		    startDate = new Date(selected.date.valueOf()); 
		    startDate.setDate(startDate.getDate(new Date(selected.date.valueOf()))); 
		    $('#ticketEndDate').datepicker('setStartDate', startDate); 
		
		} else if($(this).is('#ticketEndDate')){ // 티켓 오픈 종료일 선택
			// 시작일 조정(종료일보다 늦지 않게)
			endDate = new Date(selected.date.valueOf()); 
			endDate.setDate(endDate.getDate(new Date(selected.date.valueOf()))); 
			$('#ticketStartDate').datepicker('setEndDate', endDate); 
		
		} else if($(this).is('#pfmStartDate')){ // 공연 시작일 선택
			// 종료일 조정(시작일보다 빠르지 않게)    	
		    startDate = new Date(selected.date.valueOf()); 
		    startDate.setDate(startDate.getDate(new Date(selected.date.valueOf()))); 
		    $('#pfmEndDate').datepicker('setStartDate', startDate); 
		
		} else if($(this).is('#pfmEndDate')){ // 공연 종료일 선택
			// 시작일 조정(종료일보다 늦지 않게)
			endDate = new Date(selected.date.valueOf()); 
			endDate.setDate(endDate.getDate(new Date(selected.date.valueOf()))); 
			$('#pfmStartDate').datepicker('setEndDate', endDate); 
		
		}
	});



	// 출연진 선택 버튼 
	$('#artistBtn').on('click', function(){
		$('#artistModal').modal('show');
		checkEmptyArtist();
	});
	
	// 출연진 검색 버튼
	$('#searchArtistBtn').on('click', function(){
		searchArtistAjax();
	});
	
	// 출연진 - 페이지 버튼 클릭 시
	$('ul.pagination').on('click','a',function(){
		searchArtistAjax($(this).attr('url'));
	});
	
	// 아티스트 검색을 위한 ajax 통신
	function searchArtistAjax(url){
		if(!url) url = "/searchartist"
		$.ajax({
			url: url
			, method : "GET"
			, data: {"name": $('#searchArtist').val() }
			, dataType: "json"
			, success : function(d){
				var artists = d.artists;
				var paging = d.paging;
				
				// 아티스트 검색 결과 띄워주기
				$('#resultArtist').html('');
				if(artists.length == 0){
					$('#resultArtist').html('검색 결과가 없습니다.');
				}
				var unit = 1;
				var unitDiv = $('<div class="resUnit">'); 
				artists.forEach(function(artist){
					// 4개 결과 단위로 줄바꿈
					if((unit++)%4 == 1){
						unitDiv = $('<div class="resUnit">'); 
					}
					
					// 하나의 검색 결과 저장할 div
					var resDiv = $('<div>');
					resDiv.data('aIdx', artist.artistIdx); // 커스텀 태그로 artist 정보 삽입
					resDiv.data('aName', artist.name); // 커스텀 태그로 artist 정보 삽입
					// 아티스트 이미지 띄울 태그
					var img = $('<img>');
					img.attr('src', artist.imgUri);
					// 아티스트명 띄울 태그
					var name = $('<p>');
					name.text(artist.name);

					resDiv.append(img);
					resDiv.append(name);
					resDiv.append("<input type='button' class='addArtist' value='추가'>")
					
					// 모달의 검색 결과 창에 결과 태그들 추가
					$('#resultArtist').append(unitDiv.append(resDiv));
				});
				
				// 페이징 처리
				var pagination = $('ul.pagination');
				pagination.html('');

				// 이전 페이지
				var prePage = $('<li>');
				if(paging.curPage == 1) prePage.addClass('disabled');
				var a = $('<a url="/searchartist?curPage=' + (paging.curPage-1) + '" aria-label="Previous">');
				var span = $('<span aria-hidden="true">&laquo;</span>');
				pagination.append(prePage.append(a.append(span)));
				
				// 페이징 리스트
				for(var i=paging.startPage; i<=paging.endPage; i++){
					// 현재 보고 있는 페이지 번호만 강조하기
					var li = $('<li>');
					if(paging.curPage == i){
						li.addClass('active');
					}
					var a = $('<a url="/searchartist?curPage='+i+'">'+i+'</a>');
					
					pagination.append(li.append(a));
				}
				
				// 다음 페이지
				var nextPage = $('<li>')
				if(paging.curPage == paging.totalPage) nextPage.addClass('disabled');
				var a = $('<a url="/searchartist?curPage=' + (paging.curPage+1) + '" aria-label="Next">');
				var span = $('<span aria-hidden="true">&raquo;</span>');
				pagination.append(nextPage.append(a.append(span)));

			}
			, error: function(){
				console.log("아티스트 검색 실패");
			}
		});
	}
	
	// 출연진 검색 후 추가 버튼 클릭 시 호출되는 메소드
	$('#resultArtist').on('click', '.addArtist', function(){
		// 현재 선택된 출연진 목록이 없는 경우
		if($('#selectedArtist').find('div').length == 0){
			$('#selectedArtist').html('');
		}
		
		var artistIdx = $(this).parent().data('aIdx');
		var artistName = $(this).parent().data('aName');
		
		// 이미 등록된 출연진인 경우
		var isExist = false;
		var selectedList = $('#selectedArtist').find('div');
		selectedList.each(function(i){
			if($(selectedList[i]).data('aIdx') == artistIdx){
				isExist = true;
				return false; // each문 중단
			}
		});
		if(isExist){return;} // 메소드 중단
		
		// 선택 결과 태그
		var selected = $("<div style='float:left'>");
		selected.data('aIdx', artistIdx); // idx 정보 저장해놓음 
		selected.data('aName', artistName); // name 정보 저장해놓음 
		// 선택된 출연진 명 띄우기 위한 태그
		var name = $("<span>");
		name.text(artistName);
		selected.append(name);
		selected.append("<span class='glyphicon glyphicon-remove' ></span>")
		
		$('#selectedArtist').append(selected);
		
	});
	
	// 모달의 선택된 출연진 목록에서 삭제 버튼 클릭 시
	$('#selectedArtist').on('click', '.glyphicon-remove', function(){
		$(this).parent().remove();
		checkEmptyArtist();
	});
	
	// 현재 선택된 출연진 목록이 없는 경우 검사
	function checkEmptyArtist(){
		if($('#selectedArtist').find('div').length == 0){
			$('#selectedArtist').html('');
			$('#selectedArtist').append('<p> 출연진을 선택해주세요 </p>');
		}
		return false;
	}
	
	// 출연진 선택 모달에서 최종 선택 버튼 클릭 시
	$('#artistModal .btn-primary').on('click', function(){
		var selectedList = $('#selectedArtist').find('div');
		// 아무도 선택안한 경우
		if(selectedList.length == 0){
			alert("출연진을 한 명이상 선택해야합니다.");
			return;
		}
		
		// 모달 창 밖 출연진 리스트 텍스트로 보여주는 p 태그
		var artistTextList = $('#artistBtn').next();
		artistTextList.show();
		artistTextList.html(''); // 초기화
		
		// 서버에 값 넘기기위한 input 태그들(기존에 존재하던)
		$('#artistBtn').parent().find('input[name^="castList"]').remove();
		
		
		// 선택된 출연진 목록을 가져와서
		var idx = 0;
		selectedList.each(function(i){
			// 서버에 값을 넘기기위해 input 태그 생성
			var inputTag = $('<input type="hidden">');
			inputTag.attr('name','castList['+ (idx++) +'].artistIdx');
			inputTag.attr('value', $(selectedList[i]).data('aIdx'));
			inputTag.data('aName', $(selectedList[i]).data('aName'));
			
			$('#artistBtn').parent().append(inputTag);
			
			// 메인 화면에 선택한 출연진 리스트를 텍스트로 띄워줌
			artistTextList.append("<span style='margin-right:10px;'>"+ $(selectedList[i]).data('aName') +"</span>")
		});
		
		$('#artistModal').modal('hide');
	});
	
	// 공연장 선택 시 좌석 정보칸 보여주기
	$('select[name="hallIdx"]').on('change', function(){
		if($('select[name="hallIdx"]').val() > 0){
			$('#seatDiv').slideDown(250);
			// 이전 좌석 정보 입력 칸 초기화
			$('.seatInfo:not(:first)').remove();
			$('.seatInfoInput').remove();
			// 좌석 정보 입력 칸(input태그) 생성
			addSeatInput();
			// '좌석 구간'란 초기화
			viewSeatSec();
		}else{
			$('#seatDiv').slideUp(250);
		}
	});
	
	// 좌석 정보 추가 하는 경우(석, 가격)
	$('#seatDiv').on('click', '.glyphicon-plus-sign', function(){
		addSeatInput();
		// '좌석 구간'란 초기화
		viewSeatSec();
	});
	// 좌석 정보 추가 input 태그 생성 메소드
	function addSeatInput(){
		var td = $('<td class="seatInfoInput">')
		var inputSec = $('<input type="text" class="form-control tempSecName" placeholder="(VIP)">석</input>');
		var inputPay = $('<input type="text" class="form-control tempSecPay" placeholder="0">원</input>');
		var plus = $('<span class="glyphicon glyphicon-plus-sign"></span>');
		var minus = $('<span class="glyphicon glyphicon-minus-sign"></span>');
			
		td.append(inputSec);
		td.append(inputPay);
		
		var existTd = $('#seatDiv .seatInfoInput');
		// 입력창이 0개인 경우 - 처음 만들어지는 경우
		if(existTd.length == 0){
			td.append(plus);
			$('#seatDiv .seatInfo:first').append(td);
			// rowspan 변경
			$('#seatDiv .seatInfo:first').find('th').attr('rowspan', 1);
		}else{ // 이미 만들어져있는게 있는 경우
			// 입력창이 6개 미만인 경우 - 추가 
			if(existTd.length < 6){
				var lastTd = existTd.last();
				lastTd.find('span').remove(); // 기존에 + 삭제
				lastTd.append(minus); // - 삽입
			
				if(existTd.length == 5){ // 6번째 추가하는 경우라면 
					td.append(minus.clone()); // 더이상 추가 못하도록 - 삽입
				}else{
					td.append(plus);
				}
				
				// tr 추가
				var tr = $('<tr class="seatInfo">');
				tr.append(td);
				$('#seatDiv .seatInfo:last').after(tr);
				// rowspan 변경
				$('#seatDiv .seatInfo:first').find('th').attr('rowspan', existTd.length +1);
			}
		}
	}
	
	// 좌석 정보 삭제 하는 경우(석, 가격)
	$('#seatDiv').on('click', '.glyphicon-minus-sign', function(){
		// 첫번째 요소 삭제하는 경우(첫번째 요소의 <tr>에만 <th>태그 존재함)
		var thisTr = $($(this).parents('tr'));
		if(thisTr.find('th').length == 1){
			// '좌석정보:' 라는 th요소를
			var th = thisTr.find('th:first-child');
			// 두번째 tr 로 위치 옮김
			var secondTr = thisTr.parents('table').find('tr:nth-child(2)');
			secondTr.prepend(th);
		} 
		// 지우려는 요소를 담고있는 tr 전체 삭제
		thisTr.remove();
		
		// rowspan 변경
		var th = $('#seatDiv .seatInfo:first').find('th');
		th.attr('rowspan', th.attr('rowspan') -1)
		
		// '좌석 구간'란 초기화
		viewSeatSec();
	});
	
	// 좌석 가격입력창 - 화폐 포멧으로 콤마 찍어주기
	$('#seatDiv').on('change keyup','.tempSecPay', function(){
		getNumber(this);
	});
	
	// 좌석 정보 - 구역명 입력시 
	$('#seatDiv').on('change','.tempSecName', function(){
		// '좌석 구간'란 초기화
		viewSeatSec();
	});


	// 좌석 정보 - 가격정보 입력시
	$('#seatDiv').on('change','.tempSecPay', function(){
		// 구역명 , 좌석정보 담고 있는 리스트의 값 변경
		var targetSecName = $(this).parent().find('.tempSecName').val();
		console.log(targetSecName);
		var changePay = $(this).val();
		if(changePay == ''){
			changePay = 0;
		}
		// 화폐단위 (,) 로 구분되어 있는 경우 콤마 제거
		if(changePay != 0) changePay = changePay.split(',').join('');
		console.log(changePay);
		
		if( targetSecName != ''){ // 구역명을 입력한 경우에만
			// 지정 완료된 구역 정보 담은 배열에서도 가격 정보 바꿔줌
			completeSetSec.forEach(function(setSec){
				if(setSec.appSec == targetSecName){
					setSec.secPay = changePay;				
				}
			});
		}
		console.log("------최종 배열")
		console.log(completeSetSec);
		
		// 서버에 넘길 좌석 정보 세팅
		addSetSecInput();
	});
	
	// 좌석구간 그려주기
	function viewSeatSec(drawCompletedSec){
		// 좌석명, 가격 정보 담는 리스트 초기화 (콜백함수 없는 경우만 = 서버에서 넘어온 직후가 아닐 때)
		secNamePay = []; 
		// 구역 지정 완료한 정보 초기화
		if(!drawCompletedSec) completeSetSec = [];
		// 서버에 넘길 값 초기화
		// 초기화
		$('#seatDiv').find('input[name^=seatSecList]').remove();
		
		// 셀렉트 박스 그려주기
		var select = $('<select name="selectedSecName" id="selectSec" class="form-control">')
		var isFirstOption = true;
		$('.seatInfoInput').each(function(){
			var secName = $(this).find('.tempSecName').val(); // 좌석정보란에서 입력한 구역명
			var secPay = $(this).find('.tempSecPay').val(); // 가격정보
			
			if(secName){
				var option = $('<option>'+secName+'석</option>');
				// 첫 option 태그 추가인 경우
				if(isFirstOption){
					// selected 속성 추가
					option.prop('selected', 'selected');
					isFirstOption = false;
				}
				// option 추가
				select.append(option);
				
				if(secPay == ''){
					secPay = 0;
				}
				// 구역명 - 좌석 정보 리스트에 넣어주기
				secNamePay.push({"secName":secName, "secPay":secPay});
			}
		});
		if(select.find('option').length == 0) {// 아무 <option>도 추가되지 않았을 때
			select.append('<option selected="selected">구역을 입력하세요</option>');
		}
		
		// 홀 좌석도 가져오기
		$.ajax({
            method: "GET",
            url: "/ticket/seatSection", 
            data: {
              hallIdx: $('select[name="hallIdx"]').val()
            }
			, dataType: "html"
			, success: function(d){
				// 홀 jsp 삽입
				$('#seatHall td').html(d);
				// 사이즈 조절
				$('#seatHall .stage_img').height('260px');
				$('#seatHall .stage_img').width('380px');
				$('#seatHall svg').width('380px');
				// 구역 선택 시
				$('#seatHall svg').on('click','path, rect',function(){
					// 클릭안된 상태
					if(!$(this).hasClass('clicked')){
						// 클릭한 요소만 clicked 클래스 부여
						$(this).addClass('clicked');
						
						// 이미 구역 설정한 요소이면 선택한 석 띄워주기
						if($(this).hasClass('completeSet')){
							var selectedOriSec = $(this).attr('class').split(' ')[0];
							var selectedAppSec;
							// 선택한 요소의 좌석명 구하기
							completeSetSec.forEach(function(setSec){
								if(setSec.oriSec == selectedOriSec){
									selectedAppSec = setSec.appSec;
								}
							});
							// 선택한 요소의 좌석명과 일치하는 option태그 찾아서 selected 속성 부여
							$('#seatSecSelect').find('option').each(function(){
								if($(this).text() == selectedAppSec+"석" ){
									$(this).prop('selected', 'selected');
								}
							});
							
						// 구역 설정 미완료 요소이면 첫번째 option 띄워주기
						}else{
							$('#seatSecSelect').find('option:first').prop('selected', 'selected');
						}
					// 클릭된 상태	
					}else {
						// 클릭 상태 해제
						$(this).removeClass('clicked');
					}
				});
				
				// 콜백 함수 호출 - 이미 지정된 구역들 색 칠해주기
				if(drawCompletedSec){
					drawCompletedSec();
				}
			}
			, error: function(){
				console.log("좌석 배치도 로드 실패");
			}
        }); // end ajax
		
		
		console.log("초기 json");
		console.log(secNamePay);
		console.log("--------");
		$('#seatSecSelect td').html('');
		$('#seatSecSelect td').append(select);
		$('#seatSecSelect td').append($('<button type="button" id="setSecBtn">구역 설정</button>'));
		
	}
	
	//' 구역 설정' 버튼 클릭 시
	$('#seatSecSelect').on('click','#setSecBtn', function(){
			// 선택한 섹션 정보
			var clickedSections = $('#seatHall').find('.clicked');
			if(clickedSections.length == 0) return;
			console.log(clickedSections);
			
			// 부여할 이름
			var appSec = $('select[name="selectedSecName"]').val();
			appSec = appSec.split('석')[0];
			console.log(appSec);
			
			// 구역 가격
			var secPay = 0;
			// 선택한 구역명에 해당하는 가격 찾기
			secNamePay.forEach(function(secInfo){
				if (secInfo.secName == appSec){ 
					secPay = secInfo.secPay;
				} 
			});
			// 화폐단위 (,) 로 구분되어 있는 경우 콤마 제거
			if(secPay != 0) secPay = secPay.split(',').join('');
			console.log(secPay);
			
			// 선택한 섹션들 반복문으로 돌면서 완료 섹션 배열에 추가
			clickedSections.each(function(){
				var clickedSec = $(this);
				
				// 원본 섹션 명 추출
				var oriSec = clickedSec.attr('class').split(' ')[0];
				console.log(oriSec);
				
				// 처음 구역 설정해주는 경우
				if(!clickedSec.hasClass('completeSet')){
					// 구역 설정이 완료된 것들 모아두는 배열에 추가
					var setSec = {"oriSec" : oriSec, "appSec": appSec, "secPay":secPay}
					completeSetSec.push(setSec);
					
					// 선택한 섹션 태그에 완료되었다는 class 명 추가
					clickedSec.addClass('completeSet');
					// 색 지정해서 칠해주기
					for(var i=0;i<secNamePay.length;i++){
						if(secNamePay[i].secName == appSec){
							clickedSec.attr('fill',sectionColor[i]);
						}
					}
				// 이미 이전에 구역이 설정된 경우
				}else{
					// 기존 배열에서 원본 구역 이름과 일치하는 요소 찾아서 값 바꿔주기
					completeSetSec.forEach(function(setSec){
						if(setSec.oriSec == oriSec){
							setSec.appSec = appSec;
							setSec.secPay = secPay;
						}
					});
				}
				
				// 클릭 상태 해제
				clickedSec.removeClass('clicked');
			});
			
			console.log(completeSetSec);
			
			// 서버에 넘길 좌석 정보 세팅
			addSetSecInput();
	});
	
	// 서버에 넘길 좌석 정보 
	function addSetSecInput(){
		// 초기화
		$('#seatDiv').find('input[name^=seatSecList]').remove();
		
		for(var i=0; i<completeSetSec.length; i++){
			var inputOriSec = $('<input type="hidden">');
			inputOriSec.attr('name', 'seatSecList['+i+'].oriSecName');
			inputOriSec.attr('value', completeSetSec[i].oriSec);
			
			var inputAppSec = $('<input type="hidden">');
			inputAppSec.attr('name', 'seatSecList['+i+'].appSec');
			inputAppSec.attr('value', completeSetSec[i].appSec);
			
			var inputSecPay = $('<input type="hidden">');
			inputSecPay.attr('name', 'seatSecList['+i+'].secPay');
			inputSecPay.attr('value', completeSetSec[i].secPay);
			
			$('#seatDiv').append(inputOriSec);
			$('#seatDiv').append(inputAppSec);
			$('#seatDiv').append(inputSecPay);
		}
	}
	
	// 공연 시간 '일괄등록' 버튼 클릭 시
	$('#registTimeForm input[type="checkbox"]').on('click', function(){
		if($(this).is(":checked")){
			$('#onceRegForm').show();
		}else{{
			$('#onceRegForm').hide();
		}}
	});
	 

	$('#pfmTimeSelect').timepicker();
	$('#pfmTimeSelect').timepicker('option', { useSelect: true });
	$('#pfmTimeSelect').timepicker('option', { 'timeFormat': 'H:i a' });
	$('.ui-timepicker-select').addClass('form-control');
	$('.ui-timepicker-select').prepend('<option value="0" selected="selected">시간 선택</option>');
	// 공연 시간 선택
	$('.ui-timepicker-select').on('change', function() {
		var targetTime = $('#pfmTimeTarget'); 
		var selectedTime = $('.ui-timepicker-select').val();
		if(selectedTime == 0){
			return;
		}
		// 이미 추가한 시간이라면 pass
		var isExist = false;
		targetTime.find("div").each(function(){
			var existTime = $(this).find('span').first().text();
			if(selectedTime == existTime){
				isExist = true;
				return;
			}
		});
		if(isExist){ return;}
		
		
		// 선택한 시간 추가하기
		var resDiv = $("<div style='float:left'>");
		var time = $("<span>");
		time.text(selectedTime);
		
		// 삭제용 x 추가
		var removeSpan = $("<span class='glyphicon glyphicon-remove' ></span>");
		removeSpan.click(function(){$(this).parent().remove();});
		
		resDiv.append(time);
		resDiv.append(removeSpan);
		targetTime.append(resDiv);
	  
	});

	
	// '공연일 추가' 버튼 클릭 시
	$('#addPfmTimeBtn').on('click', function(){
		// 공연 시작일
		var pfmStartDate = $('#pfmStartDate').val();
		var pfmEndDate = pfmStartDate;
		
		// 일괄등록 시
		if($('#registTimeForm input[type="checkbox"]').is(':checked')){
			pfmEndDate = $('#pfmEndDate').val();
		}
		
		var one_day = 1000 * 60 * 60 * 24;
		var diffDay = new Date(pfmEndDate) - new Date(pfmStartDate);
		diffDay = Math.round (diffDay / one_day);
		
		for(var day=0; day<=diffDay; day++){
			var date = new Date(pfmStartDate);
			date.setDate(date.getDate() + day);
			
			// json list 만들기
			$('#pfmTimeTarget div').each(function(){
				// 공연 시간
				var time = $(this).find('span').first().text();

				// json 만들기
				var timeJson = {};
				timeJson['date'] = formatDate(date);
				timeJson['time'] = time;
				
				// list에 json 추가하기
				timeList.push(timeJson);
			});
		}

		// 중복 제거
		timeList = arrUnique(timeList);
		// 날짜, 시간 순으로 오름차순 정렬
		timeList = sortJsonList(timeList);
		
		// 오른쪽 뷰 - 날짜, 시간 정보 보여주기
		viewTimeList(timeList);
		
		// 기존 선택 정보들 초기화
		$('#pfmStartDate').val(''); $('#pfmStartDate').datepicker('setEndDate', '');
		$('#pfmEndDate').val(''); $('#pfmEndDate').datepicker('setStartDate', new Date()); 
		$('.ui-timepicker-select').val(0);
		$('#pfmTimeTarget').text('');
	});
	
	// 공연 시간 json 담고있는 list 중복값 제거 메소드
	function arrUnique(arr) {
	    var cleaned = [];
	    arr.forEach(function(itm) {
	        var unique = true;
	        cleaned.forEach(function(itm2) {
	            if(itm.date == itm2.date && itm.time == itm2.time)	unique = false;
	        });
	        if(unique)  cleaned.push(itm);
	    });
	    return cleaned;
	}
	
	// 공연 시간 json list 정렬
	function sortJsonList(arr){
		arr.sort(function(a, b){
			if(a.date < b.date) return -1;
			else if(a.date > b.date) return 1;
			else {
				if(a.time < b.time) return -1;
				else if(a.time > b.time) return 1;
				else return 0;
			}
		});
		return arr;
	}
	
	// 추가한 공연 일정 보여주는 메소드
	function viewTimeList(list){
		var target = $('#registTimeRes tbody'); // 뷰 용
		target.html(''); // 초기화
		
		var targetInput = $('#pfmDbtValue'); // 서버에 값 넘기는 용
		targetInput.html(''); // 초기화
		
		var isFirst = true;
		var prevDate ="";
		var rowspanCnt = 1; 
		
		for(var i=0; i<list.length ; i++){
			date = formatDate(list[i].date);
			time = list[i].time;
			// td 삽입(보여주기 용)
			var tr = $("<tr class='not_space'>");
			var dateTd = $("<td>").text(date);
			var timeTd = $("<td>").text(time);
			var removeTd = $("<td>").append("<span class='glyphicon glyphicon-remove'></span>");
			
			tr.append(dateTd);
			tr.append(timeTd);
			tr.append(removeTd);
			target.append(tr);
			
			// input 삽입(서버에 값 넘기기 위해)
			var inputD = $('<input type="hidden">');
			inputD.attr('name', 'pfmDbtList['+ i +'].pfmDate');
			inputD.val(date);
			var inputT = $('<input type="hidden">');
			inputT.attr('name', 'pfmDbtList['+ i +'].pfmTime');
			inputT.val(time);
			targetInput.append(inputD);
			targetInput.append(inputT);
			
			
			// 같은 날인 경우 rowspan 설정을 위한 코드
			// 첫 요소인 경우
			if(i == 0){
				prevDate = date; continue;
			}
			if(prevDate == date){ // 이전날과 같은 날인경우
				rowspanCnt++;
				// 이전 tr에 같은 날이 있다는 표시를 남김
				target.find('tr:nth-child(' + i +')').addClass('existSameDate');
				// 오늘 날짜와 같은 날이 있다는 표시를 남김
				target.find('tr:nth-child(' + (i+1) +')').addClass('existSameDate');
				// for 문 마지막 요소인 경우
				if(i == list.length-1){
					// 같은 날로 표시되어있는 첫번째 요소의 rowspan을 속성을 지정한다
					target.find('.existSameDate:first').find('td:first-child').attr('rowspan', rowspanCnt);
					// 위의 rowspan 준 첫번째 요소를 제외한 같은 날 표시 요소들의 td를 숨긴다
					target.find('.existSameDate:not(:first)').find('td:first-child').hide();
					target.find('tr').removeClass('existSameDate');
				}
			} else { // 이전날과 다른 날인 경우
				// 같은 날이 있다는 표시가 있는 요소 중에 첫번째 요소의 td에 rowspan을 줌 (같은 날이 있는 카운트 만큼)
				target.find('.existSameDate:first').find('td:first-child').attr('rowspan', rowspanCnt);
				// 위에서 rowspan준(첫번째) 요소가아닌 요소들의 날짜정보 td는 숨김
				target.find('.existSameDate:not(:first)').find('td:first-child').hide();
				// 같은 날이 있다는 표시는 모두 삭제
				target.find('tr').removeClass('existSameDate');
				// 비교에 쓰일 이전 날짜를 현재 날짜로 변경
				prevDate = date;
				// 초기화
				rowspanCnt = 1;
			}
		}
		
		// 오른쪽 뷰 - 기간 정보 보여주기 & 서버에 넘길 값을 위한 태그 추가
		var periodP = $('#registTimeRes').find('p:nth-child(2)');
		periodP.show();
		pfmStartDate = $('#registTimeRes tbody tr').first().find('td:first-child').text();
		pfmEndDate = $('#registTimeRes tbody tr').last().find('td:first-child').text();
		periodP.find('span:nth-child(1)').text(pfmStartDate);
		periodP.find('span:nth-child(2)').text(pfmEndDate);
		
		targetInput.append('<input type="hidden" name="pfmStart" value="'+pfmStartDate+'">');
		targetInput.append('<input type="hidden" name="pfmEnd" value="'+pfmEndDate+'">');
	}
	
	// Date  'yyyy-mm-dd' 포멧으로 변환
	function formatDate(date){
		 var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();

	    if (month.length < 2) month = '0' + month;
	    if (day.length < 2) day = '0' + day;

	    return [year, month, day].join('-');
	}
	
	// 공연 일정 뷰에서 '삭제(x)' 버튼 클릭 시
	$('#registTimeRes').on('click', '.glyphicon-remove', function(){
		// 지우려는 날짜, 시간
		var targetDate = $(this).parent().prev().prev().text();
		var targetTime = $(this).parent().prev().text();
		// json 리스트에서 해당 요소 삭제
		for(var i=0; i<timeList.length; i++){
			if(timeList[i].date == targetDate && timeList[i].time == targetTime ){
				timeList.splice(i,1); break;
			}
		}
		// 다시 그려주기
		viewTimeList(timeList);
	});
	
	$('textarea').froalaEditor({
		language: 'ko'
		, width: '800' // 너비
		, heightMin : 400 // 초기화시 크기
		, heightMax : 400 // 스크롤 생기는 지점의 크기
		// 툴바 버튼 목록
		, toolbarButtons: ['fontFamily','bold', 'italic', 'underline','align','|','insertLink','insertImage','|', 'undo', 'redo']
		 // Set the image upload URL.
        , imageUploadURL: '/admin/uploadpfmimg'
        , imageUploadParams: {
          id: 'my_editor'
        }
	}).on('froalaEditor.image.error', function (e, editor, error, response) { //이미지업로드 실패
  	  console.log(error);
	  console.log(response);
	}).on('froalaEditor.image.removed', function (e, editor, $img) { //이미지 삭제 
        $.ajax({
            method: "POST",
            url: "/admin/deletepfmimg", //이미지삭제 경로
            data: {
              src: $img.attr('src')
            }
          }).fail (function () { //이미지 삭제 실패
            console.log ('image delete problem');
         });
     });
	
	//저장 버튼
	$('#storeBtn').on('click', function(){
		var complete = false;
		var complete = true;
// 		if($('input[name="name"]').val().length == 0){
// 			alert("공연 제목을 입력해주세요.");
// 		} else if($('select[name="genreIdx"]').val() == 0){
// 			alert('공연 분류를 선택해주세요.');
// 		} else if($('input[name^="thmList"]:checked').length == 0){
// 			alert('공연 테마를 선택해주세요.')
// 		} else{
// 			complete = true;
// 		}
		// 출연진 목록 검사는 따로 메소드 있음(checkEmptyArtist: boolean)
		
		// 유효성 검사 완료 후 submit
		if(complete){
			$('#registForm').submit();
		}
	});
});



/* 화폐 단위로 숫자 찍기 관련 */
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 
function getNumber(obj){
   var num01;
   var num02;
   num01 = obj.value;
   num02 = num01.replace(rgx1,"");
   num01 = setComma(num02);
   obj.value =  num01;
}
function setComma(inNum){
   var outNum;
   outNum = inNum; 
   while (rgx2.test(outNum)) {
        outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
    }
   return outNum;
}
</script>

<div class="contents-wrapper">
<h1>공연 등록 페이지</h1>
<hr>

<!-- 공연 등록 STEP 탭 -->
<div id="registStep">
<ul class="progressbar">
	<li id="step-1" class='inProgress'>공연 기본 정보</li>
	<li id="step-2">공연일 등록</li>
	<li id="step-3">상세 정보</li>
	<li id="step-4">예매 정보</li>
</ul>
</div>

<form id="registForm" action="/admin/editpfm" method="post" enctype="multipart/form-data" style="width:80%">
<input type="hidden" name="pfmIdx" value="${pfm.pfmIdx }">
<!-- 공연등록 1st Tab : 공연 기본 정보 -->
<div class='registPfmTab' id='registStep-1'>
	<!-- 포스터 등록 -->
	<div id="posterImg" style="float: right;width: 310px;">
		<img src="/resources/image/${poster.storedName }" accept="image/*" width="143" height="201">
		
		<input class="posterName" value="${poster.originName }" disabled="disabled">
		<label for="posterBtn">포스터 등록</label>
		<input type="file" id="posterBtn" class="upload-hidden" name="poster"> 
	</div>
	<!-- 기본 정보 입력 -->
	<table>
	<tr>
		<th>공연 제목</th> 
		<td><input type="text" name="name" value="${pfm.name }" class="form-control long"/></td>
	</tr>
	<tr>
		<th>공연 분류</th> 
		<td>
			<select name="genreIdx" class="form-control long">
			<option value="0" >분류 선택</option>
			<c:forEach var="genre" items="${genreList }">
				<c:choose>
					<c:when test="${genre.genreIdx eq pfm.genreIdx }">
						<option value="${genre.genreIdx }" selected="selected">${genre.genre }</option>
					</c:when>
					<c:when test="${genre.genreIdx ne pfm.genreIdx }">
						<option value="${genre.genreIdx }">${genre.genre }</option>
					</c:when>
				</c:choose>
			</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>테마</th> 
		<td>
			<button type="button" id="themeSelBtn">테마 선택</button>
			<p class="resSelect">
				<c:forEach var="theme" items="${thmList }">
					<span>${theme.themeName }</span>
				</c:forEach>
			</p>
		</td>
	</tr>
	<tr>
		<th rowspan=2>티켓오픈</th> 
		<td>
			<input type="text" name="ticketStart" class="form-control long date ticketDate" id="ticketStartDate" placeholder="시작일"
			 value=<fmt:formatDate pattern = "yyyy-MM-dd" value = "${pfm.ticketStart }" />>
		</td>
		
	</tr>
	<tr>
		<td>
			<input type="text" name="ticketEnd" class="form-control long date ticketDate" id="ticketEndDate" placeholder="종료일"
			 value=<fmt:formatDate pattern = "yyyy-MM-dd" value = "${pfm.ticketEnd }" />>
		</td>
	</tr>
	<tr>
		<th>런닝타임</th> 
		<td><input type="number" name="runningTime" class="form-control long" value=${pfm.runningTime } min='0' onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
	</tr>
	<tr>
		<th>관람등급</th> 
		<td>
			<select name="ageGradeIdx" class="form-control long">
			<option value="0">관람등급 선택</option>
			<c:forEach var="ageGrade" items="${ageList }">
				<c:choose>
					<c:when test="${ageGrade.ageGradeIdx eq pfm.ageGradeIdx }">
						<option value="${ageGrade.ageGradeIdx }" selected="selected">${ageGrade.ageLimit }</option>
					</c:when>
					<c:when test="${ageGrade.ageGradeIdx ne pfm.ageGradeIdx }">
						<option value="${ageGrade.ageGradeIdx }">${ageGrade.ageLimit }</option>
					</c:when>
				</c:choose>
			</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>출연진</th> 
		<td>
			<button type="button" id="artistBtn">출연진 선택</button>
			<p class="resSelect">
				<c:forEach var="artist" items="${artistList }">
					<span style='margin-right:10px;'>${artist.name } </span>
				</c:forEach>
			</p>
			<!-- 서버에 넘길 아티스트 인덱스값 -->
			<c:forEach var="artist" items="${artistList }" varStatus="status">
				<input type="hidden" name="castList[${status.index }].artistIdx"
					value="${artist.artistIdx }" aName="${artist.name }">
			</c:forEach>			
		</td>
	</tr>
	<tr>
		<th>공연장</th> 
		<td>
			<select name="hallIdx" class="form-control long">
			<option value="0">공연장 선택</option>
			<c:forEach var="hall" items="${hallList }">
				<c:choose>
					<c:when test="${hall.hallIdx eq pfm.hallIdx }">
						<option value="${hall.hallIdx }" selected="selected">${hall.hallName }</option>
					</c:when>
					<c:when test="${hall.hallIdx ne pfm.hallIdx }">
						<option value="${hall.hallIdx }">${hall.hallName }</option>
					</c:when>
				</c:choose>
			</c:forEach>
			</select>
		</td>
	</tr>
	<!-- 좌석 관련 tbody -->
	<tbody id="seatDiv" style="display:none;">
	<tr class="seatInfo">
		<th>좌석정보</th>
		<!-- 아래에 td로 석,가격 input 태그 동적으로 추가됨 -->
	</tr>
	<tr>
		<td colspan="2">* 좌석정보를 추가, 삭제하거나 좌석명을 변경하는 경우, <br>
			&nbsp;좌석 구간 설정이 초기화 됩니다.</td>
	</tr>
	<tr id="seatSecSelect">
		<th rowspan=2 valign="top">좌석구간: </th>
		<td>
		</td>
	</tr>
	<tr id="seatHall">
		<td>
		</td>
	</tr>
	</tbody>
	</table>
</div> <!-- registStep-1 Div-->

<!-- 모달창 -->
<!-- 테마 선택 모달창 -->
<div class="modal fade" id="themeModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">테마 선택</h4>
      </div>
      <div class="modal-body">
     	<table id="themeContent">
	      <!-- 테마 선택 checkbox 란 -->
      	</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">선택</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 출연진 선택 모달창 -->
<div class="modal fade" id="artistModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">출연진 선택</h4>
      </div>
      <div class="modal-body">
      	<!-- 검색 & 결과 뷰-->
      	<div id="viewArtist" class="text-center">
      		<input type="text" id="searchArtist" class="form-control long" placeholder="출연진 검색" onkeypress="if(event.keyCode==13){$('#searchArtistBtn').trigger('click'); return false;}"/> 
      		<button type="button" id="searchArtistBtn">검색</button> 
      		<div id="resultArtist">
      		</div>
	      	<div class="text-center">d
				<ul class="pagination">
			 	</ul>
			</div>
      	</div>
      	
      	<!-- 선택한 리스트 띄워주기 -->
      	<div id="selectedArtist">
      	</div>
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">선택</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 공연등록 2st Tab : 공연일 등록-->
<div class='registPfmTab' id='registStep-2' style="display:none">
	<div id='registTimeForm'>
	<input type="checkbox" id='onceRegist'><label for='onceRegist'>날짜/시간 일괄등록 하기</label> 
	<table>
	<tr>
		<th>공연 날짜</th>
		<td>
			<input type="text" class="form-control date pfmDate" id="pfmStartDate" placeholder="시작일" >
			<span id="onceRegForm" style="display:none;">
			 ~ 
			<input type="text" class="form-control date pfmDate" id="pfmEndDate" placeholder="종료일">
			</span>
		</td>
	</tr>
	<tr>
		<th>공연 시간</th>
		<td>
			<div id="pfmTimeSelect"></div>
		</td>
	</tr>
	<tr>
		<th></th>
		<td>
			<p id="pfmTimeTarget"> </p>
		</td>
	</tr>
	</table>
	<button type="button" id="addPfmTimeBtn">공연일 추가</button>
	</div><!-- // registTimeForm -->
	
	<div id='registTimeRes'>
		<p style='font-size: 13px; font-weight:bold;'>등록예정 공연일정</p>
		<p>(<span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${pfm.pfmStart }" /></span>
		 ~ <span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${pfm.pfmEnd }" /> </span>)</p>
		<hr>
		<table class='table'>
		<thead>
			<tr>
				<th>날짜</th>
				<th>시간</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan=3>추가된 공연 일정이 없습니다.</td>
			</tr>
		</tbody>
		</table>
		<div id="pfmDbtValue" style="display:none">
		</div>
	</div>
</div>

<!-- 공연등록 3st Tab : 상세정보 등록-->
<div class='registPfmTab' id='registStep-3' style="display:none">
<h4>공연 상세정보</h4>
<div>
<textarea name="pfmDetailContents">${detail.contents }</textarea>
</div>
</div>

<!-- 공연등록 4st Tab : 예매정보 등록-->
<div class='registPfmTab' id='registStep-4' style="display:none">
<h4>공연 예매정보</h4>
<div>
<textarea name="pfmBookinfoContents">${bookinfo.contents }</textarea>
</div>
</div>

<br>
<button type="button" id="cancelBtn" onclick="location.href='/admin/managerpfm'">취소</button>
<button type="button" class="stepBtn" id="prevBtn" style="display:none">이전 단계</button>
<button type="button" class="stepBtn" id="nextBtn">다음 단계</button>
<button type="button" id="storeBtn" style="display:none">저장</button>

</form>

</div>
</div>
</body>
</html>