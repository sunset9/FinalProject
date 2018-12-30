<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/menu.jsp" />

<style type="text/css">
.mainbannerRG {
	border: 1px solid lightgray;
}

#mbdiv {
	width: 
}

.mainBanModal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 50px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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

.mainBanModalClose:hover,
.mainBanModalClose:focus {
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
	width: 700px;
}

.forEach {
    display: grid;
    grid-template-columns: 33% 33% 33%;
    text-align: -webkit-center; 
}
 
.modal-footer{
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

#mbdiv mbPfmInfo {
	width: 100px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	  $('div.np').on('click', function(){
		  console.log('클릭되었습니다.');
		  var pfmIdx = $(this).attr('id');
		  $.ajax({
			  url: "/admin/getpfmbypfmidx" 
			  , method: "GET"
			  , data: { "pfmIdx":pfmIdx }
			  , success: function(data) {
				  console.log(data); 
				  
			  }
		  })
	  });
	
});
	/* function clickedPfm(pfmIdx, name, pfmStart, pfmEnd, hallName) {
		var div = document.getElementById('pfmName');
		var pfmName = document.createTextNode(name); 
		div.style.fontsize = '20px';
		div.style.fontweight = '800';
		div.appendChild(pfmName);  
    		 
		var div2 = document.getElementById('hallName');
		var hallName = document.createTextNode(hallName);
		div2.appendChild(hallName); 
		
		document.getElementById('pfmIdx').value = pfmIdx;
		console.log(document.getElementById('pfmIdx').value );
	}; */ 
	
	/* 이미 등록된 공연인지 확인 */
	/* function checkDuplicate() {
		var pfmIdx = document.getElementById('pfmIdx').value;
		$.ajax({
			url: "/admin/checkpfmidxdup"
			, method : "GET"
			, data : {"pfmIdx" : pfmIdx}
			, success : function(res) {
				if(res == 0){
					console.log('서브밋');
					document.getElementById('registMbForm').submit();
				}else{
					alert("이미 등록된 공연입니다.");
					window.location.reload();
				}
				
			}
		});
	}; */
	
	
</script>
<body>

<h3>배너관리 - 메인배너</h3>
<hr>

<h2>배너등록</h2>

	<form action="/admin/registMainbanner" method="POST" name="registMBForm" enctype="multipart/form-data" id="registMbForm"> 
	<div class="mainbannerRG">
		<div>
			공연 <a data-toggle="modal" href="#myModal"><input type="search" id="mainBanModalBtn"></a>
			<div id="mbdiv mbPfmInfo">
			dkdkdk
				<input type="hidden" name="pfmIdx" id="pfmIdx"> 
				<p id="pfmName"></p>
				<p id="hallName"></p>
			</div>
		</div>
		<div>
			썸네일 이미지 <input type="file" name="thumbFile"/>
			<div id="mbdiv mbThumbImg">
			</div>
		</div>
		<div>
			배너 이미지 <input type="file" name="bannerFile">  
			<div id="mbdiv mbBannerImg">  
			</div>
		</div>
		<input type="button" onclick="checkDuplicate();" value="등록" /> <input type="button" value="취소"> 
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
          	<p class="newest">최신순</p> <p class="alphabet">가나다순</p>
          </div>
          <div class="forEach"> 
          <c:forEach items="${NewPfmList }" var="newPl" varStatus="status">
          	<div id="${newPl.pfmIdx }" class="np" data-dismiss="modal" >
          		<input type="hidden" id="pfmIdx${status.index }" value="${newpl.pfmIdx }" class="currpfmidx"> 
			    <div><img src="/resources/image/${newPl.storedName}" style="width: 140px; height: 198px;"></div>
			    <div class="npname">${newPl.name }</div>
			    <div><fmt:formatDate value="${newPl.pfmStart }" pattern="yyyy.MM.dd" />
			     ~ <fmt:formatDate value="${newPl.pfmEnd }" pattern="yyyy.MM.dd" /></div>
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