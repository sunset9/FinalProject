<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(document).ready(function() {
		$('#modal').click(function() {
			console.log("떴다");
			$('#myModal').modal('show');
		});
	}); // end ready
</script>
카테고리 배너 관리 
<hr>
<form action="/admin/registcateCon" method="post">
	<button>최종저장</button>
	<br> <span class="glyphicon glyphicon-plus-sign" id="modal"></span>

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
					<c:forEach var="item" items="${test }">
						<input type="select">${item }
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

