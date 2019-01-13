<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style type="text/css">

#preferTheme{

	background: #EEE;
	border: 1px solid #EEE;
	/*아티스트 리스트 뽑을 때 사용했던 float 해제  */
	clear: left;
}

.thumbnail{
	float: left;
}

#selectedArt {
	/*아티스트 리스트 뽑을 때 사용했던 float 해제  */
	clear: left;
	height: 200px;
	border: 1px solid #CCC;
	background: #EEE;
}
#searchArtist{
	display: none;
	border: 3px solid #CCC;
	
	position: absolute;
    top: 410px;
    right: 400px;
    
    background: white;
    border-radius: 10px;
}

.alist{
	display: inline-block;
	text-align: center;
	margin: 15px;
}
.heightFix{
	height: 400px;
	border: 1px solid #CCC;
	overflow-x:hidden;
	overflow-y:scroll;
}
.preferTitle{
	font-size: 2em;
	font-weight: bolder;
	margin: 20px;
}
#artist_text{
	border-bottom: 2px solid  #F2B134;
	border-left: none;
	border-right: none;
	border-top: none;
	font-size: 1.5em;
}
#btn_search{
	font-size: 1.5em;
	color: #F2B134;
}
.search_in{
	margin:10px;
}
.form{
	text-align: right;
}
.searchList{
	font-size: 1.5em;
	margin-right: 20px;
	vertical-align: middle;
	list-style: none;
	
}
.searchImg{
	width: 80px;
	height: 80px;
}

.listA{
	position: relative;
	display: block;
	text-decoration: none !important;
}
.listA:hover{
 	color: black; 
	text-decoration: none ;
	cursor: pointer;
}

.glyphicon-ok-circle{
	
	font-size : 3em;
	position: absolute;
 	right:2px; 
 	top:22px;
}
.searchArtistName{
	display: inline-block;
	width: 120px;
	height:30px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-left: 5px;
	
}
#preferChoice{
	width: 120px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    background: #F2B134;
    color: #fff;
    margin: 5px;
}
#cancelPrefer{
	width: 120px;
  	height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    background: #FFF;
    color:#AAA;
    margin: 5px;
}

#selecting{
	width: 80px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    background: #F2B134;
    color: #fff;
    margin: 5px;
}

.cancel{
	width: 80px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    background: #FFF;
    color:#AAA;
    margin: 5px;
}
.btnDiv{
	text-align: center;
	border-top: 1px solid #CCC;
	padding : 10px;
}

.resUnit{
	width:300px;
	height: 500px;
	overflow-x:hidden;
	overflow-y:scroll;
}
.searchLi{
	border-bottom: 1px solid #DDD;
	
}
li{
	list-style: none;
	margin-top:5px;
	margin-bottom: 5px;
}
.changeColor {
	color: #F2B134;
}

/* 선택한 아티스트 이름 나오는 부분 */
.selectedInner{
	display: inline;
	margin: 20px;
}

.selectedName{
	font-size: 1.2em;
}
.checkbox-inline{
/* 체크박스 위치 조정 */
	font-size: 1.2em;
	margin: 10px;

	
}

#themeSec{
	margin: 0 auto;
	width : 900px;
	
	
}
.newChoice{
	color: #F2B134;
	margin-right: 5px;
}
.artistImg{
	width: 120px;
	height: 120px;
}
.searchArtistImg{
	width: 60px;
	height: 60px;
	margin: 10px;
}
</style>


<script type="text/javascript">
$(document).ready(function(){

	// 최종 아티스트 정보 담을 배열 
	var artistIdx=[];
	var artistName =[];
	
	// 검색후 클릭 하면 표시해주기
	$('#searchArtist').on('click','.searchLi', function(){
		
		console.log("클릭함수 실행");
		if($(this).children($('.icon')).hasClass("changeColor") === true) {
			$(this).children($('.icon')).removeClass('changeColor');
			$('.listA:hover').css('color','#000');

		}else{
			
			$(this).children($('.icon')).addClass('changeColor');
			$('.listA:hover').css('color','#F2B134');
			
		}
	});//end on
	
	// 선택완료 누르면 최종 추가
		$('#searchArtist').on('click','#selecting', function(){
			console.log("완료버튼 누르으응" );
			
			var searchSelectList = $('#searchArtist').find('.changeColor');
			console.log("searchSelectList");
			console.log(searchSelectList);
			
			searchSelectList.each(function(i){
				var idx = $(this).parent().data('aIdx');
				var name = $(this).parent().data('aName');
				
				artistIdx.push(idx);
				artistName.push(name);
				
			}); // end each
			
			
			// 최종 결과 저장할 배열
			var lastIdx = [];
			var lastName =[];
			
			var selectedList = $('#selectedArt').find('div');
			
		for (var i =0; i<artistIdx.length; i ++){
			var cnt = 0;
			for (var j =0; j<selectedList.length; j ++){
				if($(selectedList[i]).data('paidx')==artistIdx[i]){
					
					isExist = true;
					cnt ++;
					break ; // each 문 종료

				}; // end if
			}; // end j
			if (cnt==0){
				lastIdx.push(artistIdx[i]);
				lastName.push(artistName[i]);
				console.log("name:"+artistName[i])
			}
		}; // end i
			
			// 선택한 결과 태그 추가하기
			for (var i =0; i<lastIdx.length; i ++) {
				var  selected = $("<div class='selectedInner'>");
				selected.data('paidx', lastIdx[i] );
				selected.data('artistName', lastName[i]);
				console.log("선택한 아티스트paidx:"+selected.data('paidx'));
				
				var aName =$('<span class="newChoice selectedName">');
				aName.text(lastName[i]);
				selected.append(aName);
				selected.append("<span class='glyphicon glyphicon-remove' ></span>")
				
				$('#selectedArt').append(selected);
			}; 
			
			// 창 닫기
			$('#searchArtist').hide();	

		});
	
	
	// 취소하면 창 닫기
		$('#searchArtist').on('click','#cancelSearch', function(){
			$('#searchArtist').hide();	
		});
	
	
	// 추가한 아티스트에서 X 클릭시 삭제하기
	$('#selectedArt').on('click', '.glyphicon-remove', function(){
		$(this).parent().remove();
	});

	// 설정 화면에서 취소 버튼 눌렀을 때 반응 할 메소드 
	$('#cancelPrefer').click(function() {
		if(confirm('변경한 정보를 저장되지 않습니다.')==true){
			location.href='/mypage/mychoice';
		} else{
			return ;
		}
	})
	
	// 취향설정 완료 버튼 눌렀을 때 
	$('#preferChoice').click(function() {
		
		// 테마에서 선택된 체크박스 값 담기
		 var checkboxes = [];
	    $("input[name='themeIdx']:checked").each(function(i) {
	    	checkboxes.push($(this).val());
	    });
		
	    console.log("체크된 값");
	    console.log(checkboxes);
		console.log(checkboxes.length);
		
		if (checkboxes.length < 1) {
			alert ("하나는 선택해야함");
			return;
		} 
		
		// 선택한 아티스트 값 처리하기
		var selectedList = $('#selectedArt').find('div');
		console.log("선택 리스트 길이 :"+$(selectedList).length);
		
		var artistList = [];
		
		// 선택된 아티스트 가져와서 배열에 저장하기
		selectedList.each(function(i) {
			// data-paidx 가져오기! data-* 의 반환타입이 JSON 이라서 이렇게 받음
			var p = $(this).data('paidx');
			console.log(p);

			artistList.push(p);
		}); // each end
		
		console.log("체크된 아티스트 값:"+artistList);
		
		
		$.ajax({
			type :"POST"
			, url :"/mypage/prefer"
			, data : {
				"themeIdx":checkboxes
				,"artistIdx" : artistList
			}
			, success:function(data) {
				console.log ("성공");
				location.href="/mypage/mychoice";
			}
		
		}); // ajax end
	}); // click end
	
	
	
	$('#btn_search').click(function() {
		
		console.log("검색 버튼 함수 실행");
		searchArtistAjax();
	});
	
	
	// 아티스트 검색을 위한 ajax 통신
	function searchArtistAjax(){
		$.ajax({
			url: "/mypage/searchArtist"
			, method : "POST"
			, data: {"name": $('#artist_text').val() }
			, dataType: "json"
			, success : function(d){
				console.log(d);
				console.log("ajax 통신 성공:" +d);
// 				var artists = d.artists;
				var artists = d;
				
				// 아티스트 검색 결과 띄워주기
				$('#searchArtist').show();
				$('#searchArtist').html('');
				
				if(artists.length == 0){
					$('#searchArtist').html('검색 결과가 없습니다.');
				}
				var unit = 1;
				var unitDiv = $('<div class="resUnit">'); 
				var ul = $('<ul>')
				
				artists.forEach(function(artist){
// 					console.log(artist)
				
					// 하나의 검색 결과 저장할 li
					var resLi = $('<li>');
					var resA = $('<a>');
					resA.addClass('listA');
					
					resLi.data('aIdx', artist.artistIdx); // 커스텀 태그로 artist 정보 삽입
					resLi.data('aName', artist.name); // 커스텀 태그로 artist 정보 삽입
					resLi.addClass('searchLi');
					
					// 아티스트 이미지 띄울 태그
					var img = $('<img>');
					img.attr('src', artist.imgUri);
					img.addClass('searchArtistImg');
					img.addClass('img-circle');
					img.addClass('searchImg');
					
					// 아티스트명 띄울 태그
					var name = $('<span>');
					name.text(artist.name);
					name.addClass('searchList');
					name.addClass('searchArtistName');

					resA.append(img);
					resA.append(name);

// 					resLi.append("<input type='button' class='addArtist' value='추가'>")
					resA.append("<span class='glyphicon glyphicon-ok-circle searchList icon'/>")
					
					// 모달의 검색 결과 창에 결과 태그들 추가
					$('#searchArtist').append(unitDiv.append(resLi.append(resA)));
				}); // foreach end
				var btnDiv = $('<div class="btnDiv">');
				
				btnDiv.append('<button id = "cancelSearch" class ="cancel">취소</button>');
				btnDiv.append('<button id = "selecting">선택완료</button>');
				$('#searchArtist').append(btnDiv);	
				
			} // success end
			, error: function(){
				console.log("아티스트 검색 실패");
			} // error end
			
		});// ajax end
		
	}// function  end
	
}); //ready end


// 아티스트 리스트에서 아티스트 선택 시 반응할 메소드
function artChoice(artistIdx, name){
	console.log("아티스트 인덱스:"+ artistIdx)
	// 추가하기 위해 눌렀을 때
	var isExist = false ;
	var selectedList = $('#selectedArt').find('div');
	selectedList.each(function(i) {
		if($(selectedList[i]).data('paidx')==artistIdx){
			isExist = true;
			
			// 중복되면 삭제하기!
			$(selectedList[i]).remove();
			return false ; // each 문 종료
		}
	});
	if(isExist){
		return; // 추가하는 메소드 종료
	}
	
	// 선택한 결과 태그 추가하기
	var  selected = $("<div class='selectedInner'>");
	selected.data('paidx', artistIdx );
	selected.data('artistName', name);
	console.log("선택한 아티스트paidx:"+selected.data('paidx'));
	
	var aName =$('<span class="newChoice selectedName">');
	aName.text(name);
	selected.append(aName);
	selected.append("<span class='glyphicon glyphicon-remove' ></span>")
	
	$('#selectedArt').append(selected);
	
}






</script>


<div class ="main_wrapper">    
<h1>나만의 공연취향을 설정해보세요</h1>
<span class="preferTitle">아티스트 선택</span>
<hr>


<div id ="preferArtist">


<div class="search_in">
	<div class="form">
       	<input type="text" name="artist_text" id="artist_text" class="inputType" placeholder="아티스트 검색">
		<span id="btn_search" class="glyphicon glyphicon-search"></span>
	</div>                                                          
</div>



<!-- 아티스트 검색결과 보여줄 Div -->
<div id="searchArtist">
	
	
</div>


<div class ="heightFix">
<c:forEach items="${list }" var="a">
		<li class ="alist" onclick ="artChoice('${a.artistIdx}','${a.name }');"><img src="${a.imgUri }"  class="img-circle artistImg"/><br>
			<span class="artistName">${a.name }</span>
		</li>	
</c:forEach>
</div>


<div id = "selectedArt">
	<h3 style="margin: 10px;">${loginUser.nick }님이 선택한 아티스트</h3>
	<c:forEach items="${paList }" var ="pa">
	<c:if test ="${! empty  pa}">
	<div class="selectedInner" data-paidx="${pa.artistIdx }">
		<span class="selectedName">${pa.artistName } </span>
		<span class='glyphicon glyphicon-remove' ></span>
	</div>
	</c:if>
	</c:forEach>
</div>

</div>

<span class="preferTitle">테마/장르 선택</span>
<div id ="preferTheme">

<div id="themeSec">
<c:forEach items="${tList }" var="t">
	<label class="checkbox-inline" style ="width:30%">
		<input type="checkbox" name ="themeIdx" value="${t.themeIdx}" <c:forEach items="${ptList }" var="p">
			<c:if test="${t.themeIdx eq p.themeIdx}">
			checked="checked"
			</c:if>
		 </c:forEach> /> ${t.themeName }
	</label>
</c:forEach>
</div>
</div>
<div style="text-align: center; margin: 20px;">
<button id="preferChoice" class="btn btn-default"> 취향 설정 완료 </button><button id="cancelPrefer" class="cancel btn btn-default"> 취소 </button>
</div>
</div>