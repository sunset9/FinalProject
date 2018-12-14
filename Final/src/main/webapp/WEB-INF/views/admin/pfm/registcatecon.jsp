<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

</style>

<script>

var i=0; 
var cnt = ${cnt};
$(document).ready(function() {
$('.row').on('click', '#add_poster',function() {//포스터 추가하기 버튼 클릭시
		//console.log("떴다");
  		$('#myModal').modal('show'); //모달창 보여주기 
  		ajax(); //ajax로 모달창에 그려줌(포스터 리스트)
  		//console.log(cnt);
   });
$('ul.pagination').on('click','a',function(){
	console.log("눌렸습니다.");
	console.log($(this).attr('url'));
	ajax($(this).attr('url'));
});
function ajax(url){
	var paging=${paging};
	if(!url) url = "/pagingcatecon"
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
				var a = $('<a url="/pagingcatecon?curPage=' + (paging.curPage-1) + '" aria-label="Previous">');
				var span = $('<span aria-hidden="true">&laquo;</span>');
				pagination.append(prePage.append(a.append(span)));
				
				// 페이징 리스트
				for(var i=paging.startPage; i<=paging.endPage; i++){
					// 현재 보고 있는 페이지 번호만 강조하기
					var li = $('<li>');
					if(paging.curPage == i){
						li.addClass('active');
					}
					var a = $('<a url="/pagingcatecon?curPage='+i+'">'+i+'</a>');
					
					pagination.append(li.append(a));
				}
				
				// 다음 페이지
				var nextPage = $('<li>')
				if(paging.curPage == paging.totalPage) nextPage.addClass('disabled');
				var a = $('<a url="/pagingcatecon?curPage=' + (paging.curPage+1) + '" aria-label="Next">');
				var span = $('<span aria-hidden="true">&raquo;</span>');
				pagination.append(nextPage.append(a.append(span)));
					
			}
			, error: function(){
				console.log("검색 실패");
			}
		});
}
$('#searchbtn').click(function() {
	console.log($('#searchposter').val());
	$.ajax({
	type : "get",
	url : "/searchposter",
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
	$('ul.pagination').remove();
	});
	
	
}); // end ready
</script>
카테고리 콘서트 배너 관리
<hr>
<!-- 카테고리 부분 FORM 시작  -->

<form action="/admin/registcatecon" method="post">
<button>최종저장</button>
<div class="row">
<c:forEach var="item" items="${posterList }">
<div class="col-md-2">
	<div class="thumbnail">
		<div class="caption">
			<div class="pfmIdx" id="${item.pfmIdx }">
					<img src="/resources/image/${item.storedName }"> 
					<a href="<c:url value='/admin/deletecatecon/${ item.pfmIdx }' />" class="glyphicon glyphicon-remove">삭제</a>
								<h3>${item.name }</h3>
						</div>
			</div>
		</div>
	</div>
</c:forEach>
		<div class="col-md-2" id="draw">
			<div class="thumbnail" style=" width: 100%; height:220px; text-align: center;" id="thum">
				<div class="glyphicon glyphicon-plus-sign" id="add_poster"
				style="position:initial; left:50%; width:100px; height:100px; margin:96px 0 0 -50px;">
			</div>
		</div>
		</div>		
</div>

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

