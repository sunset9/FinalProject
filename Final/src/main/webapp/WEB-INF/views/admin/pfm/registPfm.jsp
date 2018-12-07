<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="../resources/bootstrap-datepicker.kr.js" charset="UTF-8"></script>



<style>
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

.glyphicon-remove, .glyphicon-plus-sign{
	cursor:pointer
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

</style>

<script>
$(document).ready(function(){
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
		// 선택한 테마 목록들 보여주기
		thmSelected.each(function(idx){
			var labelName = $(thmSelected[idx]).next().text();
			themeTextList.append("<span>"+labelName+" </span>");
		});
		
	});
	
	
	// 티켓 오픈 일정 지정
	var startDate = new Date(); 
	var endDate = new Date(); 
	// 티켓 오픈 시작일 선택
	$('#ticketStartDate').datepicker({
		startDate: startDate, // 오늘 이후로 선택 가능
        todayHighlight: true,
        autoclose: true,
        format: "yyyy/mm/dd",
        language: "kr"
    }).on('changeDate', function(selected){ 
		// 종료일 조정(시작일보다 빠르지 않게)    	
        startDate = new Date(selected.date.valueOf()); 
        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf()))); 
        $('#ticketEndDate').datepicker('setStartDate', startDate); 
    });
    
	// 티켓 오픈 종료일 선택
	$('#ticketEndDate').datepicker({
		startDate: startDate, // 오늘 이후로 선택 가능
        todayHighlight: true,
        autoclose: true,
        format: "yyyy/mm/dd",
        language: "kr",
    }) .on('changeDate', function(selected){ 
    	// 시작일 조정(종료일보다 늦지 않게)
    	endDate = new Date(selected.date.valueOf()); 
    	endDate.setDate(endDate.getDate(new Date(selected.date.valueOf()))); 
        $('#ticketStartDate').datepicker('setEndDate', endDate); 
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
			
			console.log(inputTag);
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
	
	function addSeatInput(){
		var td = $('<td class="seatInfo">')
		var inputSec = $('<input type="text" name="app_sec" placeholder="VIP">석</input>');
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
	
	
	// 좌석 가격입력창 - 화폐 포멧으로 콤마 찍어주기
	$('input[name="sec_pay"]').on('change keyup',function(){
		getNumber(this);
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

<form id="registForm" action="/admin/registpfm" method="post" enctype="multipart/form-data" style="width:80%">
<div id="posterImg" style="float: right;width: 310px;">
	<img src="/resources/image/poster_empty.png" accept="image/*" width="143" height="201">
	
	<input class="posterName" value="파일선택" disabled="disabled">
	<label for="posterBtn">포스터 등록</label>
	<input type="file" id="posterBtn" class="upload-hidden" name="poster"> 
</div>
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
		<input type="text" name="ticketStart" class="form-control" id="ticketStartDate" placeholder="출발일" style="width:70%; float: left;">
		<span class="input-group-addon glyphicon glyphicon-calendar" style="clear:both"></span>
	</td>
	
</tr>
<tr>
	<td>
		<input type="text" name="ticketEnd" class="form-control" id="ticketEndDate" placeholder="도착일" style="width:70%; float: left;">
		<span class="input-group-addon glyphicon glyphicon-calendar"></span>
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


<br>
<button type="button" id="storeBtn">저장</button>

</form>



<hr>
