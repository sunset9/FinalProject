<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(document).ready(function() {
		$('#add_poster').click(function() {
			console.log("떴다");
			$('#myModal').modal('show');
		});
		// 테마 선택 완료 시
		$('#myModal').find('.btn').on('click', function() {
			var Selected = $('input:radio[name^="radio_test"]:checked').val();
			console.log(Selected);
			var themeTextList = $('#add_poster').next();
			themeTextList.show();
			// 선택한 테마 목록들 보여주기
			var labelName = Selected;
			var selectedId = $('input[name^=radio_test]:checked').attr('id');
			console.log(labelName);
			console.log(selectedId);

			themeTextList.append('<img src=/resources/image/'+labelName+'>');

		});

	}); // end ready
</script>
카테고리 배너 관리
<hr>
<form action="/admin/registcateCon" method="post">
	<input type="hidden" value="" name="pfmIdx" id="pfmIdx">
	<button>최종저장</button>
	<c:forEach var="item" items="${posterList }">
		<img src="/resources/image/${item.storedName }">
	</c:forEach>
	<br> <span class="glyphicon glyphicon-plus-sign" id="add_poster"></span>
	<p style="display: none;"></p>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					내용
					<c:forEach var="item" items="${list }">
						<input type="radio" id="${item.pfmIdx }" name="radio_test"
							value="${item.storedName}">
						<label id="radio_test${item.pfmIdx }"
							style="width: 150px; height: 220px;"><div
								class="radio_img"
								style="height: 220px; background:url('/resources/image/${item.storedName}');">${item.pfmIdx }</div></label>
					</c:forEach>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>

</form>

