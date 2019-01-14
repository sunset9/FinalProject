<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../layout/menu.jsp" />

<style>

#save {
    display: inline-block;
    position: absolute;
    top: 60px;
    right: 0px;
}
.img-thumbnail, .thumbnail {
    display: block;
    margin-left: 10px;
    text-align: center;
   	position: relative;
   	width: 208px; height: 328px;
}
.h3, h3 {
    font-size: 15px;
    text-align: center;
    display: block;
}
.glyphicon{
	display: block;
}
.cover {
	z-index: 10;
    background-color: #33333352;
    height:254px;
    width: 180px;
    right: 15px;
    position: absolute;
}
.cover2 {
	z-index: 10;
    background-color: #33333352;
    height:254px;
    width: 180px;
    right: 15px;
    position: absolute;
}
.removeBtn {
	margin-top: 95px;
}
.deleteBtn {
	margin-top: 95px;
}

.img {
	width: 180px;
	heigth: 254px;
}

.thumbnail {
    display: inline-block;
    margin-left: 10px;
    text-align: center;
   	position: relative;
}

.cateconImg {
	width: 180px;
	height: 254px;
	
}

.pfmIdx>img {
    width: 180px;
    height: 254px;
}

#thum.thumbnail {
	width: 180px;
    height: 254px;
}

.model-content {
    width: 700px;
}
</style>

<script>
var i=0; 
var cnt = ${cnt}; //DB에 저장된 포스터 갯수 (15개가 최대면 더이상 등록 안됨 )
$(document).ready(function() { // jquery 시작  
//저장된 포스터 삭제
$('div[class^=row]').on('click','div[id^=remove]',function(){ //삭제 버튼을  누를때 
	var parent=$(this).closest('div[id^=position]'); //해당 클릭된 포스터의 부모를 찾아서
	parent.remove(); //부모까지 삭제 
});

//추가된 포스터 삭제 
$('div[class^=row]').on('click','.removeBtn',function(){
	var parent=$(this).closest('div[id^=position]'); //해당 클릭된 포스터의 부모를 찾아서
	parent.remove(); //부모까지 삭제 
})
$('div[class^=row]').on('mouseover','div[id^=pfmIdx]',function(){
	var cover = $('<div class="cover2">'); // 이미지 위에 올릴 DIV 
	var delBtn = $('<button type="button" class="removeBtn">공연삭제</button>');
	cover.append(delBtn); 
	$(this).prepend(cover); // div 위에 삭제 div 를 올림
});

//추가된 포스터를 다시 지울때 이용 
$('div[class^=row]').on('mouseleave','div[id^=pfmIdx]',function(){
	$('div[class^=cover2]').remove();

});
$('.row').on('click', 'div[id^=add_poster]',function() {//포스터 추가하기 버튼 클릭시
		$('#myModal').modal('show'); //모달창 보여주기 
  		ajax(); //ajax로 모달창에 그려줌(포스터 리스트)
   });
$('ul.pagination').on('click','a',function(){
	
	console.log($(this).attr('url')); 
	ajax($(this).attr('url'));//해당 URL(해당 페이지)로 이동되면 다시 ajax로 호출되서 그려줌
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
				  	var input = $('<input type="radio" id='+item.pfmIdx+' name="radio_test"'+'value='+item.storedName +'>');
				    var div =  $('<div class="thumbnail" style="width: 180px; height: 254px;">');
				  	var img = $('<img src="/resources/image/'+item.storedName+'">');
				  	var h3 = $('<h3 style="text-align :center;">'+item.name+'</h3>');
				  	div.append(input);
				  	div.append(img);
				  	div.append(h3);	
			  	 	$('#resultposter').append(div);
			  	});
		  		
				
		  		// 페이징 처리
				var pagination = $('ul.pagination');
				pagination.html(''); // 해당 페이지 초기화 

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

$('input[type="text"]').keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    }                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
});

$('#searchbtn').click(function() { //검색버튼 클릭시
	var textLength= $('#searchposter').val().length;
	var byteCnt = 0;
	for (i = 0; i < textLength; i++) {
		   var charTemp = $('#searchposter').val().charAt(i);
		   if (escape(charTemp).length > 4) {
		    byteCnt += 2;
		  
		   } else {
		    byteCnt += 1;
		  
		   }
	}
	if(byteCnt<3){
		alert("최소 두글자 이상 검색해주세요");
		return;
	}
	$.ajax({
	type : "get",
	url : "/searchposter", 
	dataType : "json",
	data : {
	'searchPoster' : $('#searchposter').val() //검색값을 ajax로 넘겨주고 받음 
	},
	success : function(data) {
	$('#resultposter').html(''); //결과값 초기화 

	data.forEach(function(poster) { // 결과값 출력 
	var resDiv = $('<div style="width: fit-content; float:left">');
		resDiv.data('aIdx',poster.pfmIdx); // 커스텀 태그로 포스터 정보 삽입
		resDiv.data('aName',poster.name); // 커스텀 태그로 포스터 정보 삽입
		// 포스터 이미지 띄울 태그
	var img = $('<img>'); 
	var div=$('<div class="thumbnail" >') // 포스터 이미지 틀 
// 	console.log(poster.storedName);
	img.attr('src','/resources/image/'+ poster.storedName); //이미지 속성 
		///resources/image/${item.storedName}
		// 포스터 정보 띄울 태그 
		var name = $('<p>'); //포스터 이름 
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
	$('ul.pagination').html('');
	});

$('#myModal').find('.btn').on('click',function() {
	var check=0;
	var Selected = $('input:radio[name^="radio_test"]:checked').val();
	//선택된 값 받아오기 
// 		console.log(Selected);//선택된값 test 출력
	var start = $('div[id^="start"]');
	var labelName = Selected; // 선택된 값 (이미지 이름임 stored_Name)
	var selectedId = $('input[name^=radio_test]:checked').attr('id'); //pfmIdx가 ID로 설정되어있음 
	var name =$('input[name^=radio_test]:checked').siblings().text();
// 	console.log('selected:'+selectedId);
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

	var div1 = $('<div class="" style="height: 100%;" id ="position_'+selectedId+'">');
	var div2 = $('<div class="thumbnail" style="width: 208px; height: 328px;">');
	var div3 = $('<div class="caption" id="pfmIdx_"'+selectedId+'>');
	var div4 = $('<div class="pfmIdx" id='+selectedId+'>');
	var image =$('<img>');
	image.attr('src','/resources/image/'+ labelName);
	var atag = $('<a>');
	var htag= $('<h3>'+name+'</h3>');
	//htag.text(name);
	atag.attr('href','"/admin/deletecatecon/'+selectedId+'/>"');
	//삭제 버튼 (div5) 현재는 바뀐 removeBtn으로 쓰고 있어서 주석처리
// 	var div5 = $('<div class="glyphicon glyphicon-remove" id="remove_"'+selectedId+'">');
	var hideInput=$('<input type="hidden" name="pfmIdx" id ="pfmIdx" value='+ (selectedId)+ '>');
	
	div4.append(hideInput);
	div4.append(image);
	div4.append(atag);
	div4.append(htag);
// 	div4.append(div5);
	div3.append(div4);
	div2.append(div3);
	div1.append(div2);
	start.append(div1);
	//이전에 그렸던것들을 지움 
	$('div[id^=draw]').remove();
	var adddiv1=$('<div class="" style=" width:180px; height: 254px;" id="draw_'+selectedId+'">');
	//해당 이미지 
	var adddiv2=$('<div class="thumbnail"style=" text-align: center;" id="thum_'+selectedId+'">');
	//포스터 추가 버튼 (div형태 )
	var adddiv3=$('<div class="glyphicon glyphicon-plus-sign" id="add_poster_'+selectedId+'"style="position:initial; left:50%;  height:118px; margin:96px 0 0 0px;">')
	adddiv2.append(adddiv3);
	adddiv1.append(adddiv2);
	start.append(adddiv1);
	
});
// $('#btn').click(function() {
// 	//console.log("클릭됨?");
// 	var lengthValue = $("input[name='pfmIdx']").length;
//   	console.log(lengthValue);
//     var listData = new Array(lengthValue);
// 	for (var i = 0; i < lengthValue; i++) {
// 	listData[i] = $("input[name='pfmIdx']")[i].value;
// 	}
// //console.log(listData);
// 	jQuery.ajaxSettings.traditional = true;
// 	//form 데이터를 List로 보내기 위한 설정 
// 	$.ajax({
// 			type : "post",
// 			url : "/admin/registcatecon",
// 			dataType : "text",
// 			data : {
// 				'pfmIdx' : listData
// 					},
// 			success : function(data) {
// 				console.log(data);
// 			},
// 			error : function() {
// 			console.log("error");
// 			}
// 		}); //end of ajax 
		
// }); //endof function

$('.caption').on('mouseover','.pfmIdx',function(){ //이미지 위에 마우스를 가져다 놓을때
	var pfmIdx =$(this).attr('id'); // 해당 이미지의 (포스터) id 값 
	var cover = $('<div class="cover">'); // 이미지 위에 올릴 DIV 
	var delBtn = $('<button type="button" class="deleteBtn" onclick="location.href=\'/admin/deletecatecon?pfmIdx='+pfmIdx+'\'">공연 삭제</button>');
	cover.append(delBtn);	//해당 DIV 에 버튼을 추가 
	$(this).prepend(cover); // 마우스 올려둔 DIV 요소 앞에 cover div 추가 
	
});

// 마우스 leave시
$('.caption').on('mouseleave','.cover',function(){ 
 
		$('div[class^=cover]').remove(); //cover div 를 찾아서 삭제 
});
}); // end ready


</script>
<div style="position: absolute; float: left; left: 275px; width: 70%;">
<div>
<h1>
카테고리 콘서트 배너 관리
</h1>
</div>
<hr>

<!-- 카테고리 부분 FORM 시작  -->
<%-- <%= CountManager.getCount() %> --%>
<form action="/admin/registcatecon" method="post">
<button id="save">최종저장</button>
<div class="row" id ="start" style="display: flex; flex-wrap: wrap;">
<c:forEach var="item" items="${posterList }" varStatus="status">
<div class="" style=" height: 100%;">
	<div class="thumbnail" style="width: 208px; height: 328px;">
		<div class="caption">
			<div class="pfmIdx" id="${item.pfmIdx }">
				<div class="cateconStrImg">
					<img src="/resources/image/${item.storedName }" class="cateconImg">
				</div> 
				<div class="cateconName">${item.name }</div>
				<div class="cateconDate">
					<fmt:formatDate value="${item.pfmStart }" pattern="yyyy.MM.dd" />
					~ <fmt:formatDate value="${item.pfmEnd }" pattern="yyyy.MM.dd" />
				</div>
				<div class="categonHallName">${item.hallName}</div>
			</div>
		</div>
	</div>
</div>

</c:forEach>
		<div class="" id="draw" style="width:180px; height: 254px;">
			<div class="thumbnail" style=" text-align: center;" id="thum">
				<div class="glyphicon glyphicon-plus-sign" id="add_poster"
				style="position:initial; left:50%; height:118px; margin:96px 0 0 0px;">
			</div>
		</div>
		</div>		
</div>

<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 700px;">
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
					<div class="row" style="margin-left: 25px; margin-right: 25px;">
						<div id="resultposter" style="display: inline-flex;text-align: center;flex-flow: wrap;">
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