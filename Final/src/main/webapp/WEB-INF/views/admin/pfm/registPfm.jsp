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
					console.log("checkbox만들기!!")
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


	// 저장 버튼
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
		
		// 유효성 검사 완료 후 submit
		if(complete){
			$('#registForm').submit();
		}
		
	});
});

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
		<input type="text" class="form-control" id="ticketStartDate" placeholder="출발일" style="width:70%; float: left;">
		<span class="input-group-addon glyphicon glyphicon-calendar" style="clear:both"></span>
	</td>
	
</tr>
<tr>
	<td>
		<input type="text" class="form-control" id="ticketEndDate" placeholder="도착일" style="width:70%; float: left;">
		<span class="input-group-addon glyphicon glyphicon-calendar"></span>
	</td>
</tr>
<tr>
	<th>런닝타임: </th> 
	<td><input type="number" name="ssss"/></td>
</tr>
<tr>
	<th>관람등급: </th> 
	<td><input type="text" name="ssss"/></td>
</tr>
<tr>
	<th>출연진: </th> 
	<td><input type="text" name="ssss"/></td>
</tr>
</table>


<div class="modal fade" id="themeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">장르 선택</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">선택</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<br>
<button type="button" id="storeBtn">저장</button>

</form>



<hr>
