<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(document).ready(function(){
	// 테마 선택 버튼 클릭시
	$("#themeSelBtn").on("click",function(){
		// 장르에 맞는 테마 리스트 가져오기
		$.ajax({
			url: "/viewTheme"
			, method : "GET"
			, dataType: "json"
			, data: {"genreIdx": $("select[name=genreIdx]").val()}
			, success : function(d){
				var thmDiv = $('#themeModal').find('.modal-body');
				d.forEach(function(theme){
					var inputTag = "<input type='checkbox' name='themeIdx' value='"+theme.themeIdx+"'/>"+theme.themeName ;
					thmDiv.append(inputTag);
				});
				$('#themeModal').modal('show');
			}
			, error: function(){
				console.log("테마 리스트 로드 실패");
			}
		});
	});
	
	// 테마 선택 완료 시
	$('#themeModal').find('.btn').on('click', function(){
		console.log("선택 완료");
		var thmSelected = $("input[name='themeIdx']:checked");
		console.log(thmSelected);
	});
	
});
</script>

<h1>공연 등록 페이지</h1>
<hr>

<form action="/admin/pfm/registPfm" method="post">
공연 제목: <input type="text" name="name"/><br>
공연 분류:
<select name="genreIdx">
	<option value="-1" selected="selected">분류 선택</option>
	<c:forEach var="genre" items="${genreList }">
		<option value="${genre.genreIdx }">${genre.genre }</option>
	</c:forEach>
</select><br>
공연 테마: <button type="button" id="themeSelBtn">테마 선택</button><br>
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

<button>저장</button>

</form>



<hr>
