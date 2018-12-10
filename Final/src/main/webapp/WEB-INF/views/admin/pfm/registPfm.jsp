<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
.registPfmTab {
	width:100%;
}

#registStep-2 {
	display: flex;
}
.pfmDate{
	display: inline;
    width: 110px;
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

#ticketStartDate, #ticketEndDate{
	width:70%;
	float: left;
}

#resultArtist{
	display: flex; /* 자식이 float 인 경우 높이 자동 조절 */
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
	color: green; 
}
/* 활성화된 요소의 step 서클 */
.progressbar li.completeStep:before {
	content: '';
	background-image: url(/resources/image/checked.png);
	background-size: 28px 28px;
    background-position: -1px -1px;
	border-color: #55b776; 
}
/* 활성화 된 요소에 연결된 progress 줄 색 변경*/
.progressbar li.completeStep + li:after {
     background-color: #55b776; 
}

/*<input type="number"/> 화살표 지우기*/
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#seatDiv input[type='text']{
	text-align: right;
}

#registStep-2 div{
	flex: 1; 
}

#registTimeForm{
	float:left;
}
#registTimeRes {
	float:right;
	border: 1px solid #aaa;
	margin-top: 40px;
	padding: 10px;
}

#registStep-3 div{
/* 	display: inline; */
}
</style>

<script>
$(document).ready(function(){
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
		$('#themeModal').find('.modal-body').html('');
	});
	
	// 테마 선택 버튼 클릭시
	$("#themeSelBtn").on("click",function(){
		var genreIdx = $("select[name=genreIdx]").val();
		if(genreIdx == 0){
			alert('공연 분류를 먼저 선택해주세요.');
			return;
		}
		// 장르에 맞는 테마 리스트 가져오기
		$.ajax({
			url: "/viewtheme"
			, method : "GET"
			, dataType: "json"
			, data: {"genreIdx": genreIdx }
			, success : function(d){
				var thmDiv = $('#themeModal').find('.modal-body');
				var idx = 0;
				if(thmDiv.find("input").length == 0){
					d.forEach(function(theme){
						var inputTag = $("<input type='checkbox'/>") ;
						var id = 'thmList['+ (idx++) + '].themeIdx';
						inputTag.attr('id', id);
						inputTag.attr('name', id);
						inputTag.attr('value', theme.themeIdx);
						var labelTag = ("<label for='"+id+"'>"+theme.themeName+"</label>");
						thmDiv.append(inputTag);
						inputTag.after(labelTag);
					});
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
	$('.pfmDate').datepicker({
		startDate: startDate, // 오늘 이후로 선택 가능
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
		$.ajax({
			url: "/searchartist"
				, method : "GET"
				, dataType: "json"
				, data: {"name": $('#searchArtist').val() }
				, success : function(d){
					$('#resultArtist').html('');
					if(d.length == 0){
						$('#resultArtist').html('검색 결과가 없습니다.');
					}
					d.forEach(function(artist){
						// 하나의 검색 결과 저장할 div
						var resDiv = $('<div style="width: fit-content; float:left">');
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
						$('#resultArtist').append(resDiv);
					});
				}
				, error: function(){
					console.log("아티스트 검색 실패");
				}
		})
	});
	
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
		$('#artistBtn').parent().find('input[name="artistIdx"]').remove();
		
		
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
			addSeatInput();
		}else{
			$('#seatDiv').slideUp(250);
		}
	});
	
	// 좌석 정보 추가 하는 경우(석, 가격)
	$('#seatDiv').on('click', '.glyphicon-plus-sign', function(){
		addSeatInput();
	});
	// 좌석 정보 추가 input 태그 생성 메소드
	function addSeatInput(){
		var td = $('<td class="seatInfo">')
		var inputSec = $('<input type="text" name="app_sec" placeholder="(VIP)">석</input>');
		var inputPay = $('<input type="text" name="sec_pay" placeholder="0">원</input>');
		var plus = $('<span class="glyphicon glyphicon-plus-sign"></span>');
		var minus = $('<span class="glyphicon glyphicon-minus-sign"></span>');
			
		td.append(inputSec);
		td.append(inputPay);
		
		var existTd = $('#seatDiv tr').find('td');
		
		// 입력창이 0개인 경우 - 처음 만들어지는 경우
		if(existTd.length == 0){
			td.append(plus);
			$('#seatDiv tr').append(td);
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
				
				var tr = $('<tr>');
				tr.append(td);
				$('#seatDiv table').append(tr);
				$('#seatDiv tr').find('th').attr('rowspan', existTd.length +1);
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
		var th = thisTr.parents('table').find('th:first-child');
		th.attr('rowspan', th.attr('rowspan') -1)
		
	});
	
	// 좌석 가격입력창 - 화폐 포멧으로 콤마 찍어주기
	$('#seatDiv table').on('change keyup','input[name="sec_pay"]', function(){
		getNumber(this);
	});
	
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
	var timeList = [];
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
			var pfmDate = new Date(pfmStartDate);
			pfmDate.setDate(pfmDate.getDate() + day);
			
			// json list 만들기
			$('#pfmTimeTarget div').each(function(){
				// 공연 시간
				var pfmTime = $(this).find('span').first().text();

				// json 만들기
				var timeJson = {};
				timeJson['date'] = formatDate(pfmDate);
				timeJson['time'] = pfmTime;
				
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
		var target = $('#registTimeRes tbody');
		// 초기화
		target.html('');
		
		var isFirst = true;
		var prevDate ="";
		var rowspanCnt = 1; 
		
		for(var i=0; i<list.length ; i++){
			// td 삽입(보여주기 용)
			var tr = $("<tr>");
			var dateTd = $("<td>").text(list[i].date);
			var timeTd = $("<td>").text(list[i].time);
			var removeTd = $("<td>").append("<span class='glyphicon glyphicon-remove'></span>");
			
			tr.append(dateTd);
			tr.append(timeTd);
			tr.append(removeTd);
			target.append(tr);
			
			// input 삽입(서버에 값 넘기기 위해)
			var inputD = $('<input type="hidden">');
			inputD.attr('name', 'pfmDbtList['+ i +'].pfmDate');
			inputD.val(list[i].date);
			var inputT = $('<input type="hidden">');
			inputT.attr('name', 'pfmDbtList['+ i +'].pfmTime');
			inputT.val(list[i].time);
			$('#registTimeRes').append(inputD);
			$('#registTimeRes').append(inputT);
			
			
			// 같은 날인 경우 rowspan 설정을 위한 코드
			// 첫 요소인 경우
			if(i == 0){
				prevDate = list[i].date; continue;
			}
			if(prevDate == list[i].date){ // 이전날과 같은 날인경우
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
				prevDate = list[i].date;
				// 초기화
				rowspanCnt = 1;
			}
		}
		
		// 오른쪽 뷰 - 기간 정보 보여주기
		var periodP = $('#registTimeRes').find('p:nth-child(2)');
		periodP.show();
		pfmStartDate = $('#registTimeRes tbody tr').first().find('td:first-child').text();
		pfmEndDate = $('#registTimeRes tbody tr').last().find('td:first-child').text();
		periodP.find('span:nth-child(1)').text(pfmStartDate);
		periodP.find('span:nth-child(2)').text(pfmEndDate);
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
		width: '900' // 너비
		, heightMin : 400 // 초기화시 크기
		, heightMax : 400 // 스크롤 생기는 지점의 크기
		, language: 'ko'
// 		, dragInline: false
		// 툴바 버튼 목록
		, toolbarButtons: ['fontFamily','bold', 'italic', 'underline','align','|','insertLink','insertImage','|', 'undo', 'redo']
		// 이미지 드래그&드롭 가능
// 		, pluginsEnabled: ['image', 'link', 'draggable']
		 // Set the image upload URL.
        , imageUploadURL: '/resources/image'
        , imageUploadParams: {
          id: 'my_editor'
        }
	}).on('froalaEditor.image.error', function (e, editor, error, response) { //이미지업로드 실패
  	  console.log(error);
	  console.log(response);
	})
// 	.on('froalaEditor.image.removed', function (e, editor, $img) { //이미지 삭제 
//         $.ajax({
//             method: "POST",
//             url: "/resources/image/", //이미지삭제 경로
//             data: {
//               src: $img.attr('src')
//             }
//           }).done (function (data) { //이미지 삭제 성공
//             console.log ('image was deleted');
//             console.log($img.attr('src'));
//           }).fail (function () { //이미지 삭제 실패
//             console.log ('image delete problem');
//           })
//      });
	
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

<form id="registForm" action="/admin/registpfm" method="post" enctype="multipart/form-data" style="width:80%">
<!-- 공연등록 1st Tab : 공연 기본 정보 -->
<div class='registPfmTab' id='registStep-1'>
	<!-- 포스터 등록 -->
	<div id="posterImg" style="float: right;width: 310px;">
		<img src="/resources/image/poster_empty.png" accept="image/*" width="143" height="201">
		
		<input class="posterName" value="파일선택" disabled="disabled">
		<label for="posterBtn">포스터 등록</label>
		<input type="file" id="posterBtn" class="upload-hidden" name="poster"> 
	</div>
	<!-- 기본 정보 입력 -->
	<table>
	<tr>
		<th>공연 제목:</th> 
		<td><input type="text" name="name"/></td>
	</tr>
	<tr>
		<th>공연 분류: </th> 
		<td>
			<select name="genreIdx">
			<option value="0" selected="selected">분류 선택</option>
			<c:forEach var="genre" items="${genreList }">
				<option value="${genre.genreIdx }">${genre.genre }</option>
			</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>테마: </th> 
		<td>
			<button type="button" id="themeSelBtn">테마 선택</button>
			<p style="display:none;"></p>
		</td>
	</tr>
	<tr>
		<th rowspan=2>티켓오픈: </th> 
		<td>
			<input type="text" name="ticketStart" class="form-control pfmDate" id="ticketStartDate" placeholder="시작일" >
		</td>
		
	</tr>
	<tr>
		<td>
			<input type="text" name="ticketEnd" class="form-control pfmDate" id="ticketEndDate" placeholder="종료일">
		</td>
	</tr>
	<tr>
		<th>런닝타임: </th> 
		<td><input type="number" name="runningTime" min='0' onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"/></td>
	</tr>
	<tr>
		<th>관람등급: </th> 
		<td>
			<select name="ageGradeIdx">
			<option value="0" selected="selected">관람등급 선택</option>
			<c:forEach var="ageGrade" items="${ageList }">
				<option value="${ageGrade.ageGradeIdx }">${ageGrade.ageLimit }</option>
			</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th>출연진: </th> 
		<td>
			<button type="button" id="artistBtn">출연진 선택</button>
			<p style="display:none;"></p>
		</td>
	</tr>
	<tr>
		<th>공연장: </th> 
		<td>
			<select name="hallIdx">
			<option value="0" selected="selected">공연장 선택</option>
			<c:forEach var="hall" items="${hallList }">
				<option value="${hall.hallIdx }">${hall.hallName }</option>
			</c:forEach>
			</select>
		</td>
	</tr>
	</table>
	<!-- 좌석 관련 div -->
	<div id="seatDiv" style="display:none;"> 
	<table>
	<tr>
		<th>좌석정보: </th>
		<!-- 아래에 td로 석,가격 input 태그 동적으로 추가됨 -->
	</tr>
	</table>
	</div>
</div> <!-- registStep-1 Div-->

<!-- 모달창 -->
<!-- 장르 선택 모달창 -->
<div class="modal fade" id="themeModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">장르 선택</h4>
      </div>
      <div class="modal-body">
      <!-- 장르 선택 checkbox 란 -->
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
      	<div id="viewArtist">
      		<input type="text" id="searchArtist" placeholder="출연진 검색" onkeypress="if(event.keyCode==13){$('#searchArtistBtn').trigger('click'); return false;}"/> 
      		<button type="button" id="searchArtistBtn">검색</button> 
      		<div id="resultArtist">
      		</div>
      	</div>
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
	<input type="checkbox"><label for='onceRegist'>날짜/시간 일괄등록 하기</label> 
	<table>
	<tr>
		<th>공연 날짜: </th>
		<td>
			<input type="text" name="pfmStart" class="form-control pfmDate" id="pfmStartDate" placeholder="시작일" >
			<span id="onceRegForm" style="display:none;">
			 ~ 
			<input type="text" name="pfmEnd" class="form-control pfmDate" id="pfmEndDate" placeholder="종료일" >
			</span>
		</td>
	</tr>
	<tr>
		<th>공연 시간: </th>
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
		<p style="display:none">(<span>시작일</span> ~ <span>종료일</span>)</p>
		<hr>
		<table class='table' style="width: 70%;">
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
	</div>
</div>

<!-- 공연등록 3st Tab : 상세정보 등록-->
<div class='registPfmTab' id='registStep-3' style="display:none">
<span>공연<br> 상세정보 등록</span>
<div>
<textarea></textarea>
</div>
</div>

<!-- 공연등록 4st Tab : 예매정보 등록-->
<div class='registPfmTab' id='registStep-4' style="display:none">
예매정보 등록
</div>

<br>
<button type="button" class="stepBtn" id="prevBtn" style="display:none">이전 단계</button>
<button type="button" class="stepBtn" id="nextBtn">다음 단계</button>
<button type="button" id="storeBtn" style="display:none">저장</button>

</form>



<hr>
