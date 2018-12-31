<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../layout/menu.jsp" />

<style type="text/css">
.mainbannerRG {
	border: 1px solid #d4dae4;
	width: 1000px;
	display: table-cell;
	height: 400px;
}

/* #mbdiv {
	
} */
.mainBanModal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 50px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content */
.mainBanModalContent {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 650px;
}

/* The Close Button */
.mainBanModalClose {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.mainBanModalClose:hover, .mainBanModalClose:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.mainBanSearch {
	position: relative;
}

.sp1 {
	position: absolute;
	right: 70px;
}

.sp2 {
	position: absolute;
	right: 10px;
}

.newpfmListBox {
	display: grid;
	grid-template-columns: 33% 33% 33%;
}

.np {
	padding-top: 22px;
	padding-bottom: 15px;
	border: 1px solid #d4dae4;
	margin: 8px;
}

.np:hover {
	border: 2px solid #8da7d3;
}

.ordering {
	display: inline-block;
}

.newest {
	position: absolute;
	right: 90px;
	top: 77px;
}

.alphabet {
	position: absolute;
	right: 25px;
	top: 77px;
}

.modal-content {
	width: 800px;
}

.forEach {
	display: grid;
	grid-template-columns: 33% 33% 33%;
	text-align: -webkit-center;
}

.modal-footer {
	text-align: center;
}

#pfmName {
	font-size: 20px;
	font-weight: 800;
}

#hallName {
	font-size: 17px;
	font-weight: 700;
}

#mbPfmInfo {
	width: max-content;
	height: 100px;
}

.pfmtd {
	padding: 20px;
	padding-right: 80px;
	font-weight: 900;
	font-size: 20px;
}

.thumbtd {
	padding: 20px;
	padding-right: 35px;
	font-weight: 900;
	font-size: 20px;
}

.bannertd {
	padding: 20px;
	padding-right: 35px;
	font-weight: 900;
	font-size: 20px;
}

.pfminfotd, .bannerimgtd, .thumbimgtd {
	height: 100px;
}

.thumbinputtd {
	padding-right: 54px;
}

.mainbannerbtn {
	position: absolute;
	left: 600px;
	top: 580px;
}

.mainbannercancelbtn {
	position: absolute;
	left: 680px;
	top: 580px;
}

#nameDiv, #dateDiv, #hallNameDiv {
	font-size: 18px;
	font-weight: 900;
	width: max-content;
}

#mbThumbImg {
	height: 130px;
	width: 130px;
	padding: 5px;
	padding-bottom: 25px;
}

#mbBannerImg {
	height: 130px;
	width: 320px;
	padding: 5px;
	padding-bottom: 25px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	  $(document).on('click','.np', function(){
		  console.log('클릭되었습니다.');
		  var pfmIdx = $(this).attr('id');
		  
		  /* 이미 등록된 공연인지 중복 확인하기 */
		  $.ajax({
			  url: "/admin/checkpfmidxdup",
			  method: "GET",
			  data: {"pfmIdx" : pfmIdx},
			  success: function(e){
				  if(e == 0){
					  /* pfmIdx가 중복이 아닌 경우 */ 
					  append();
				  }else {
					  /* pfmIdx가 중복인 경우 */
					  alert("이미 등록된 공연입니다.");
					  return false;
				  }
			  }
		  });
		  
		  /* 이미 등록된 공연이 아닐경우 append해주기 */
		  function append(){
			  $.ajax({
				  url: "/admin/getpfmbypfmidx" 
				  , method: "GET"
				  , data: { "pfmIdx":pfmIdx }
				  , success: function(data) {
	 				  var pfmInfo = data;
					  var pfmIdx = pfmInfo['pfmIdx'];
					  var name = pfmInfo['name'];
					  var pfmStart = pfmInfo['pfmStart'];
					  var pfmEnd = pfmInfo['pfmEnd'];
					  var hallName = pfmInfo['hallName'];
					  
					  var div = $('#mbPfmInfo');  
					  var pfmIdxDiv = $('<input type="hidden" name="pfmIdx" id="hiddenPfmIdx" value="'+pfmIdx+'" />'); 
					  var nameDiv = $('<div id="nameDiv">'+name+'</div>');
					  var dateDiv = $('<div id="dateDiv">'+pfmStart+' ~ '+pfmEnd+'</div>');
					  var hallNameDiv = $('<div id="hallNameDiv">'+hallName+'</div>');
					  div.html(' '); 
					  div.append(pfmIdxDiv); 
					  div.append(nameDiv);
					  div.append(dateDiv);
					  div.append(hallNameDiv);		  
				  }
			  })
		  };
		  
	  });
	
	  // 썸네일 첨부파일 선택되면 선택된 이미지 append 해주기
	  $('#thumbinputtd').change(function(e){
		  var thumbFile = $('#thumbinputtd').val().replace(/.*(\/|\\)/, '');  
		  var thumbDiv = $('#mbThumbImg');
		  var thumbImg = $('<img src="/resources/image/'+thumbFile+'" style="width: 130px; height: 130px;"/>'); 
		  
		  thumbDiv.html(' ');
		  thumbDiv.append(thumbImg);  
	  });
	  
      // 배너 첨부파일 선택되면 선택된 이미지 append 해주기
	  $('#bannerFile').change(function(){
		  var bannerFile = $('#bannerFile').val().replace(/.*(\/|\\)/, '');
		  var bannerDiv = $('#mbBannerImg');
		  var bannerImg = $('<img src="/resources/image/'+bannerFile+'" style="width: 320px; height: 130px;"/>');
		  
		  bannerDiv.html(' '); 	
		  bannerDiv.append(bannerImg);
	  });
      
      /* 최신순(정렬버튼) 클릭됐을 경우 */
      $('.newest').on('click', function(){
    	  console.log('최신순 정렬!');
    	  $.ajax({
    		 url : "/admin/setOrder", 
    		 method : "GET", 
    		 data : {"order" : 0},
    		 success : function(list){
    			 $('.forEach').html(' ');
    			 list.forEach(function(pL){ 
    				  
    				 var divPfmIdx = $('<div id="'+pL.pfmIdx+'" class="np" data-dismiss="modal">');

    				 var divImg = $('<div>');
    				 divImg.append($('<img src="/resources/image/'+pL.storedName+'" style="width:140px; height: 198px;">'));
    				     
    				 var divName = $('<div>');
    				 divName.append(pL.name);
    				 
    				 var divDate = $('<div>');
    				 divDate.append(getDateSimpleString(pL.pfmStart)+' ~ '+getDateSimpleString(pL.pfmEnd));
    				   
    				 var divHallName = $('<div>');
    				 divHallName.append(pL.hallName); 
    				  
    				 divPfmIdx.append(divImg);
    				 divPfmIdx.append(divName);
    				 divPfmIdx.append(divDate);
    				 divPfmIdx.append(divHallName);
    				  
    				 
    				 $('.forEach').append(divPfmIdx);
    			 })
    		 }
    	  });
      });
      
      /* 가나다순(정렬버튼) 클릭됐을 경우 */
      $('.alphabet').on('click', function() {
    	  console.log('가나다순 정렬!');
    	  $.ajax({
     		 url : "/admin/setOrder", 
     		 method : "GET", 
     		 data : {"order" : 1},
     		 success : function(list){
     			$('.forEach').html(' ');     
     			list.forEach(function(pL){ 
  				 
  				 var divPfmIdx = $('<div id="'+pL.pfmIdx+'" class="np" data-dismiss="modal">');

   				 var divImg = $('<div>');
   				 divImg.append($('<img src="/resources/image/'+pL.storedName+'" style="width:140px; height: 198px;">'));
   				     
   				 var divName = $('<div>');
   				 divName.append(pL.name);
   				 
   				 var divDate = $('<div>');
   				 divDate.append(getDateSimpleString(pL.pfmStart)+' ~ '+getDateSimpleString(pL.pfmEnd));
   				   
   				 var divHallName = $('<div>');
   				 divHallName.append(pL.hallName); 
   				  
   				 divPfmIdx.append(divImg);
   				 divPfmIdx.append(divName);
   				 divPfmIdx.append(divDate);
   				 divPfmIdx.append(divHallName);
   				 
   				 
   				 $('.forEach').append(divPfmIdx);
   			 })
     		 }
     	  });
      });  
      
      //Date -> String: YYYY.MM.DD 형태로 반환
      function getDateSimpleString(date){
    		var date = new Date(date);
    		var month = date.getMonth() + 1;
    		var day = date.getDate();
    		return date.getFullYear() + "."
    			+ ((month < 10)? '0' + month : month) + "."
    			+ ((day < 10) ? '0' + day : day);
    	}
      
});

</script>
<body>

	<h3>배너관리 - 메인배너</h3>
	<hr>

	<h2>배너등록</h2>

	<form action="/admin/registMainbanner" method="POST"
		name="registMBForm" enctype="multipart/form-data" id="registMbForm">
		<div class="mainbannerRG">
			<table>
				<tr>
					<td class="pfmtd">공연검색</td>
					<td><a data-toggle="modal" href="#myModal"><input
							type="search" id="mainBanModalBtn" style="width: 180px;" /></a></td>
				</tr>
				<tr>
					<td></td>
					<td class="pfminfotd">
						<div id="mbPfmInfo"></div>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="thumbtd">썸네일 이미지</td>
					<td><input type="file" name="thumbFile" class="thumbinputtd"
						id="thumbinputtd" /></td>
					<td class="bannertd">배너 이미지</td>
					<td><input type="file" name="bannerFile" class="bannerinputtd"
						id="bannerFile" /></td>
				</tr>
				<tr>
					<td></td>
					<td class="thumbimgtd">
						<div id="mbThumbImg"></div>
					</td>
					<td></td>
					<td class="bannerimgtd">
						<div id="mbBannerImg"></div>
					</td>
				</tr>
			</table>
			<input type="button" onclick="checkDuplicate();" value="등록"
				class="mainbannerbtn" /> <input type="button" value="취소"
				class="mainbannercancelbtn">
		</div>
	</form>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">메인 배너 공연 검색</h4>
				</div>
				<div class="modal-body">
					<div>
						<input type="search" />
					</div>
					<hr>
					<div class="ordering">
						<p class="newest">최신순</p>
						<p class="alphabet">가나다순</p>
					</div>
					<div class="forEach">
						<c:forEach items="${orderList }" var="newPl" varStatus="status">
							<div id="${newPl.pfmIdx }" class="np" data-dismiss="modal">
								<input type="hidden" id="pfmIdx${status.index }"
									value="${newpl.pfmIdx }" class="currpfmidx">
								<div>
									<img src="/resources/image/${newPl.storedName}"
										style="width: 140px; height: 198px;">
								</div>
								<div class="npname">${newPl.name }</div>
								<div>
									<fmt:formatDate value="${newPl.pfmStart }" pattern="yyyy.MM.dd" />
									~
									<fmt:formatDate value="${newPl.pfmEnd }" pattern="yyyy.MM.dd" />
								</div>
								<div>${newPl.hallName }</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

	</div>
</body>
</html>