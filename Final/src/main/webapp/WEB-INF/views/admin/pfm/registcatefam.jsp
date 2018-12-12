<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<script>
$(document).ready(function() {
	var cnt = ${cnt};
	$('#add_poster').click(function() {
		//console.log("떴다");
  		//console.log('${list}');
  		$('#myModal').modal('show'); //모달창 보여주기 
  		ajax();
  		
   });
	$('ul.pagination').on('click','a',function(){
		console.log("눌렸습니다.");
		console.log($(this).attr('url'));
		ajax($(this).attr('url'));
	});
	function ajax(url){
		var paging=${paging};
		if(!url) url = "/pagingcatemu"
			$.ajax({
				url: url
				, method : "GET"
				, dataType: "json"
				, data: {"curPage":paging.curPage  }
				, success : function(d){
					var list = d.list;
					var paging = d.paging;
					
					$('#resultposter').html('');
			  		list.forEach(function(item){
			  			//console.log(item);
					  	var input = $('<input type="radio" id='+item.pfmIdx+' name="radio_test"'+'value='+item.storedName +'>');
					    var div =  $('<div class="thumbnail">');
					  	var img = $('<img src="/resources/image/'+item.storedName+'">');
					  	var h3 = $('<h3>'+item.name+'</h3>');
					  	
					  	$('#resultposter').append(input);
					  	div.append(img);
					  	div.append(h3);
				  	 	$('#resultposter').append(div);
				  	 	
				  	});
			  		
					
			  		// 페이징 처리
					var pagination = $('ul.pagination');
					pagination.html('');

					// 이전 페이지
					var prePage = $('<li>');
					if(paging.curPage == 1) prePage.addClass('disabled');
					var a = $('<a url="/pagingcatemu?curPage=' + (paging.curPage-1) + '" aria-label="Previous">');
					var span = $('<span aria-hidden="true">&laquo;</span>');
					pagination.append(prePage.append(a.append(span)));
					
					// 페이징 리스트
					for(var i=paging.startPage; i<=paging.endPage; i++){
						// 현재 보고 있는 페이지 번호만 강조하기
						var li = $('<li>');
						if(paging.curPage == i){
							li.addClass('active');
						}
						var a = $('<a url="/pagingcatemu?curPage='+i+'">'+i+'</a>');
						
						pagination.append(li.append(a));
					}
					
					// 다음 페이지
					var nextPage = $('<li>')
					if(paging.curPage == paging.totalPage) nextPage.addClass('disabled');
					var a = $('<a url="/pagingcatemu?curPage=' + (paging.curPage+1) + '" aria-label="Next">');
					var span = $('<span aria-hidden="true">&raquo;</span>');
					pagination.append(nextPage.append(a.append(span)));
						
			  		
				}
				, error: function(){
					console.log("검색 실패");
				}
			});
	}
	
	$('#myModal').find('.btn').on('click',function() {
		//모달 안에 btn (저장 버튼 클릭 시)
	var Selected = $('input:radio[name^="radio_test"]:checked').val();
	//선택된 값 받아오기 
// 		console.log(Selected);//선택된값 test 출력
	var posterList = $('#add_poster').next(); // div 태그 다음것 변수로 담기
	posterList.show(); //숨겨진것 보이기 
	var labelName = Selected; // 선택된 값 (이미지 이름임 stored_Name)
	var selectedId = $('input[name^=radio_test]:checked').attr('id'); //pfmIdx가 ID로 설정되어있음 
// 	console.log(labelName);
// 	console.log(selectedId);
	if ($('div[class^=pfmIdx]').attr('id') == selectedId) { // 이미 포스터가 등록되어있을경우
	 			alert("이미 존재합니다.");
				return;		//종료
		}
	if(cnt>15){
		alert("최대 등록개수는 15개 입니다.");
		return;
	}else{
		console.log(cnt); //나중에 지워야 하는 코드 
	}
		posterList.append('<img src=/resources/image/'+labelName+'>'); //아니면 이미지 추가 후 
		$('#hide').append('<input type="hidden" name="pfmIdx" id ="pfmIdx" value='+ (selectedId)+ '>');
		}); //hidden 값을 통해 controller로 전송함 
		$('#btn').click(function() {
		var lengthValue = $("input[name='pfmIdx']").length;
	  	console.log(lengthValue);
	    var listData = new Array(lengthValue);
		for (var i = 0; i < lengthValue; i++) {
		listData[i] = $("input[name='pfmIdx']")[i].value;
		}
//console.log(listData);
		jQuery.ajaxSettings.traditional = true;
		//form 데이터를 List로 보내기 위한 설정 
		$.ajax({
				type : "post",
				url : "/admin/registcatemu",
				dataType : "text",
				data : {
					'pfmIdx' : listData
						},
				success : function(data) {
					console.log(data);
				},
				error : function() {
				console.log("error");
				}
			}); //end of ajax 
			
}); //endof function 
	$('button[id^="btndelete"]').click(function() {
	//console.log("test");
	var name = $(this).attr('name');
	//console.log(name);
		$.ajax({
		type : "post",
		url : "/admin/deletecatemu",
		dataType : "text",
		data : {
		'pfmIdx' : name
		},
		success : function(data) {
		},
		error : function() {
		console.log("error");
		}
	});
});

		$('#searchbtn').click(function() {
			console.log($('#searchposter').val());
			$.ajax({
			type : "get",
			url : "/searchpostermu",
			dataType : "json",
			data : {
			'searchPoster' : $('#searchposter').val()
			},
			success : function(data) {
			$('#resultposter').html('');
			data.forEach(function(poster) {
			var resDiv = $('<div style="width: fit-content; float:left">');
				resDiv.data('aIdx',poster.pfmIdx); // 커스텀 태그로 포스터 정보 삽입
				resDiv.data('aName',poster.name); // 커스텀 태그로 포스터 정보 삽입
				// 포스터 이미지 띄울 태그
			var img = $('<img>');
			console.log(poster.storedName);
			img.attr('src','/resources/image/'+ poster.storedName);
				///resources/image/${item.storedName}
				// 포스터 정보 띄울 태그 
				var name = $('<p>');
				name.text(poster.name);
				resDiv.append(img);
				resDiv.append(name);
				resDiv.append("<input type='radio' id="
								+ poster.pfmIdx
								+ " name='radio_test' value="
								+ poster.storedName+">");
																	
																		// 모달의 검색 결과 창에 결과 태그들 추가
								$('#resultposter').append(resDiv);

								});
			},
			error : function() {
					console.log("error");
					}
				});
			});

}); // end ready
</script>
카테고리 뮤지컬 배너 관리
<hr>
<form action="/admin/registcatefam" method="post">
<button>최종저장</button>
	<div id="hide"></div>
	<div class="row">
		<c:forEach var="item" items="${posterList }">
			<div class="col-md-4">
				<div class="thumbnail">

					<div class="caption">
						<div class="pfmIdx" id="${item.pfmIdx }">
							<img src="/resources/image/${item.storedName }"> <a
								href="<c:url value='/admin/deletecatefam/${ item.pfmIdx }' />"
								
								class="btn btn-lg btn-danger">삭제</a>
								<h3>${item.name }</h3>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
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
					<h4 class="modal-title" id="myModalLabel">공연검색</h4>
				</div>
				<div class="modal-body">
					<input type="text" name="searchposter" id="searchposter" />
					<button type="button" id="searchbtn">검색하기</button>

					<div class="row">
						<div id="resultposter">
						</div>
						<div class="text-center">
							<ul class="pagination">
			 				</ul>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>
</form>