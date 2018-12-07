<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<img src="/resources/image/poster_empty.png" width="143" height="201">
	
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
	<th>티켓오픈: </th> 
	<td><input type="text" name="ssss"/></td>
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
