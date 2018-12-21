<%@page import="ticket.utils.CountManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/menu.jsp" />

<style>

#save {
    display: inline-block;
    position: absolute;
    top: 166px;
    right: 10px;
}
.img-thumbnail, .thumbnail {
    display: inline-block;
    margin-left: 10px;
}
.h3, h3 {
    font-size: 15px;
    text-align: center;
}
</style>

<script>
var i=0; 
var cnt = ${cnt};
$(document).ready(function() {
$('div[class^=row]').on('click','div[id^=remove]',function(){
	//$('div[id^=position]').remove();
	var parent=$(this).closest('div[id^=position]');
	parent.remove();
	//position_36
	//console.log(this);
});
$('.row').on('click', 'div[id^=add_poster]',function() {//포스터 추가하기 버튼 클릭시
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
				  	var h3 = $('<h3 style="text-align :center;">'+item.name+'</h3>');
				  	
				  	//$('#resultposter').append(input);
				  	div.append(input);
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
	var div=$('<div class="thumbnail">')
	console.log(poster.storedName);
	img.attr('src','/resources/image/'+ poster.storedName);
		///resources/image/${item.storedName}
		// 포스터 정보 띄울 태그 
		var name = $('<p>');
		name.text(poster.name);
		resDiv.append(div);
		div.append(img);
		div.append(name);
		div.append("<input type='radio' id="
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

$('#myModal').find('.btn').on('click',function() {
	var check=0;
	var Selected = $('input:radio[name^="radio_test"]:checked').val();
	//선택된 값 받아오기 
		console.log(Selected);//선택된값 test 출력
	var start = $('div[id^="start"]');
	var labelName = Selected; // 선택된 값 (이미지 이름임 stored_Name)
	var selectedId = $('input[name^=radio_test]:checked').attr('id'); //pfmIdx가 ID로 설정되어있음 
	console.log('selected:'+selectedId);
	var list = ($('div[class^=pfmId]').attr('id') );
	$(('div[class^=pfmId]')).each(function(){
// 		console.log($(this).attr('id'));
		if(	$(this).attr('id')==selectedId )
		{
			alert('이미 선택한 포스터 입니다.');
			check=1;
			return;
		}
			
	});
	if(check==1){ //같은 공연을 선택해서 추가 했을 경우 
		return; // alert 창과 함께 종료됨 
	}
	if(cnt>15){ //최대 등록개수가 넘었을 경우 
		alert("포스터 최대 등록 개수는 15개입니다.");
		return;
	}
	//console.log("찍히나/");
	var div1 = $('<div class="col-md-2" id ="position_'+selectedId+'">');
	var div2 = $('<div class="thumbnail">');
	var div3 = $('<div class="caption">');
	var div4 = $('<div class="pfmIdx" id='+selectedId+'>');
	var image =$('<img>');
	image.attr('src','/resources/image/'+ labelName);
	var atag = $('<a>');
	atag.attr('href','"/admin/deletecatecon/'+selectedId+'/>"');
	var div5 = $('<div class="glyphicon glyphicon-remove" id="remove_"'+selectedId+'">');
	var hideInput=$('<input type="hidden" name="pfmIdx" id ="pfmIdx" value='+ (selectedId)+ '>');
	div4.append(hideInput);
	div4.append(image);
	div4.append(atag);
	div4.append(div5);
	div3.append(div4);
	div2.append(div3);
	div1.append(div2);
	start.append(div1);
	
	$('div[id^=draw]').remove();
	//'div[class^=pfmIdx]'
	var adddiv1=$('<div class="col-md-2" id="draw_'+selectedId+'">');
	var adddiv2=$('<div class="thumbnail" style=" width: 100%; height:220px; text-align: center;" id="thum_'+selectedId+'">');
	var adddiv3=$('<div class="glyphicon glyphicon-plus-sign" id="add_poster_'+selectedId+'"style="position:initial; left:50%; width:100px; height:100px; margin:96px 0 0 -30px;">')
	adddiv2.append(adddiv3);
	adddiv1.append(adddiv2);
	start.append(adddiv1);
	
});
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
			url : "/admin/registcatecon",
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
}); // end ready
</script>

카테고리 콘서트 배너 관리
<hr>
<!-- 카테고리 부분 FORM 시작  -->
<%-- <%= CountManager.getCount() %> --%>
<form action="/admin/registcatecon" method="post">
<input type="button" id="save" value="최종저장">
<div class="row" id ="start">
<c:forEach var="item" items="${posterList }">
<div class="col-md-2">
	<div class="thumbnail">
		<div class="caption">
			<div class="pfmIdx" id="${item.pfmIdx }">
					<img src="/resources/image/${item.storedName }"> 
					<a href="<c:url value='/admin/deletecatecon/${ item.pfmIdx }' />" class="glyphicon glyphicon-remove">삭제</a>
								<h3>${item.name }, ${item.pfmIdx }</h3>
						</div>
			</div>
		</div>
	</div>
</c:forEach>
		<div class="col-md-2" id="draw">
			<div class="thumbnail" style=" width: 100%; height:220px; text-align: center;" id="thum">
				<div class="glyphicon glyphicon-plus-sign" id="add_poster"
				style="position:initial; left:50%; width:100px; height:100px; margin:96px 0 0 -30px;">
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
					<h4 class="modal-title" id="myModalLabel" style="text-align: center">공연검색</h4>
				</div>
				<div class="modal-body">
					<div id="searchdiv" style="margin-bottom: 16px; margin-left: 160px;">
					<input type="text" name="searchposter" id="searchposter" />
					<button type="button" id="searchbtn">검색하기</button>
					</div>
					<div class="row">
						<div id="resultposter" style="text-align: center;">
						</div>
						<div class="text-center">
							<ul class="pagination">
			 				</ul>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">저장</button>
				</div>
			</div>
		</div>
	</div>
</form>


</div>
</body>
</html>