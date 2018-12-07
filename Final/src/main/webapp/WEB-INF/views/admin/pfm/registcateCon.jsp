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
		$('#myModal').find('.btn').on('click', function(){
			var Selected = $("input[name^='check_test']:checked");
			console.log(Selected);
			});
		
	}); // end ready
</script>
카테고리 배너 관리
<hr>
<form action="/admin/registcateCon" method="post">
	<button>최종저장</button>
	<br> <span class="glyphicon glyphicon-plus-sign" id="add_poster"></span>

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
						<input type="checkbox" id="check_test" name="check_test"
							style="display: none;">
						<label id="check_test" style="width: 150px; height: 220px;"><div
								class="chk_img"
								style="height: 220px; background:url('/resources/image/${item.storedName}');">체크</div></label>
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

