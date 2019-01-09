<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11b0d7e1cbaf8eb3510561bbddb85ae9&libraries=services"></script>
				
<script type="text/javascript">
$(document).ready(function() {
	
	
	// 해당공연이 찜이 되어있는지 확인
		var userIdx = '${loginUser.userIdx }';
		console.log("loginUserIdx : " + userIdx);
		
		var pfmIdx = '${pfmInfoList.pfmIdx}';
		console.log("실행pfmIdx : " + pfmIdx);
		
	$.ajax({
		url:"/mychoice/check"
		, method:"POST"
		, data : {
			"userIdx" : userIdx
			, "pfmIdx": pfmIdx
		}
		, dataType :"json"
		, success: function(data){
			console.log("check 성공");
			if(parseInt(data)=="1"){
				$('#choiceBtn').html('<button class="btn btn-default" id="cancelBtn" >담기 취소</button>')
			}
		}
		, error: function(e){
			console.log(e);
		}
		
		
	}); // end ajax
	
	
	// 공연플래너 담기 버튼
	$('#mychoicebtn').click(function() {
		var userIdx = '${loginUser.userIdx }';
		console.log("loginUserIdx : " + userIdx);
		
		var pfmIdx = '${pfmInfoList.pfmIdx}';
		console.log("pfmIdx : " + pfmIdx);
	
		if(userIdx != '') {
		$.ajax({
			url: '/ticket/opendetail'
			, method: 'POST'
			, data: {
				"userIdx" : userIdx
				, "pfmIdx": pfmIdx
			}
			, dataType: 'json'
			, success: function(choice) {
				console.log('성공');
				
				if(choice)
					alert('공연플래너 담기가 완료되었습니다.');
					$('#choiceBtn').html('<button  class="btn btn-default" id="cancelBtn" >담기 취소</button>')
			}
			, error: function(e) {
				console.log('실패');
			}
		}); // end ajax
		} else {
			
			if(confirm('해당 기능은 로그인 후 이용가능합니다.\n로그인 후 이용해주세요.')==true){
				location.href='user/login';
			}else {
				return ;
			} // confirm if end
			
// 			alert('해당 기능은 로그인 후 이용가능합니다.\n로그인 후 이용해주세요.');
		} // userIdx if end
	}); // end click
	
	
	// 공연플래너 취소 버튼
	$('#choiceBtn').on('click','#cancelBtn',function(){
// 		$('#cancelBtn').click(function() {
	
			var userIdx = '${loginUser.userIdx }';
			console.log("loginUserIdx : " + userIdx);
			
			var pfmIdx = '${pfmInfoList.pfmIdx}';
			console.log("pfmIdx : " + pfmIdx);
		
		
			$.ajax({
				url: '/mychoice/cancel'
				, method: 'POST'
				, data: {
					"userIdx" : userIdx
					, "pfmIdx": pfmIdx
				}
				, dataType: 'json'
				, success: function(data) {
					console.log('성공');
					
					if(data)
						alert('찜 한 공연이 취소되었습니다.');
						$('#choiceBtn').html('<button  class="btn btn-warning" id="mychoicebtn">공연 담기</button>')
					
				}
				, error: function(e) {
					console.log('실패');
				}
			}); // end ajax 
				
// 		}); // end click

	}); // end on
	
// 	$('#pfmDetailbtn').click(function() {
// 		$(location).attr("href", "");
// 	});
	
});

</script>

<style>

/* #mychoicebtn{ */
/* 	width: 77px; */
/*     height: 34px; */
/*     border-radius: 5px; */
/* /*     border: 2px solid #F2B134; */ */
/*     background: #F2B134; */
/*     color: #fff; */
/*     font-weight: 200; */
/* } */

/* #cancelBtn{ */
/* 	width: 77px; */
/*     height: 34px; */
/*     border-radius: 5px; */
/*     border: 2px solid #F2B134; */
/*     background: #FFF; */
/*     color:#AAA; */
/* } */
.container {
	margin: 0 5% 10px 5%;
}

.erImgDiv {
	float: left;
/* 	margin: 10px 0 10px 0; */
}

.choicePosterImg {
	width: 250px;
	height: 300px;
}

.posterImgDiv {
	width: 400px;
	float: left;
	text-align: center;
}

.posterInfoDiv {
	float: left;
	margin-left: 20px;
	height: auto;
/* 	margin: 10px 0 10px 20px; */
}

/* 하단 탭 */
.bottomDiv{
	width: 800px;
	margin: 20px auto 10px auto;
}

ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}
 
ul.tabs li.current{
	background: #ededed;
	color: #222;
}
 
.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}
 
.tab-content.current{
	display: inherit;
	width: 100%;
}

.ddiv, .pfmInfo {
	display: inline-block;
	width: 100%;
	margin: 10px;
}

#castimg{
	width: 100px;
	height: 100px;
	text-align: center;
	margin: 5px;
}

.castInfo {
	margin-bottom: 20px;
}

.pfmInfo {
	margin: 20px 0px 10px 0px;
/* 	padding: 10px; */
}

#openticketText {
	font-size: 30px;
	display: inline-block;
	width: 100%;
	margin: 30px 5px 0px 5px;
}

.imgli {
	float: left;
}

.castUl {
	text-align: center;
}

.topDiv {
	border: 1px solid #666;
	height: 320px;
	padding: 10px;
}

#pfmMyChoice {
	border: 1px solid #666;
	padding: 20px;
	font-size: 20px;
	margin-bottom: 30px;
	display: flex;
}

#pfmTitle {
	padding: 10px;
}
#choiceBtn{
	display: inline;
}
</style>

<div class="main_wrapper">
	<div class="ddiv">
		<div class="topDiv">
		<div class="posterImgDiv">
			<img class="choicePosterImg" src="/resources/image/${posterList.storedName}" />
		</div>
		
		<div id="pfmTitle">
			<strong style="font-size: 30px;">${pfmInfoList.name } 티켓 오픈 안내</strong><br>
			<small>등록일 : <fmt:formatDate value="${pfmInfoList.createDate }" pattern="yyyy.MM.dd"/></small><br><br>
			<small style="font-size: 15px;">안녕하세요. 바나나티켓입니다.<br>${pfmInfoList.name } 티켓 오픈 안내입니다.</small>
		</div>
		</div>
		
		<strong id="openticketText">티켓 오픈 일정</strong>
		<div id="pfmMyChoice">
		<div style="width: 580px;">
			<strong>${pfmInfoList.name }</strong><br>
			티켓 오픈일 : <fmt:formatDate value="${pfmInfoList.ticketStart }" pattern="yyyy.MM.dd"/>
		</div>
		<div style="width: 580px; text-align: center; margin-top: 10px;">
			<div id="choiceBtn">
				<button class="btn btn-warning" id="mychoicebtn"  class="btn btn-success">공연 담기</button>
			</div>
			<a href="/ticket/pfmdetail?pfmIdx=${pfmInfoList.pfmIdx}">
				<button id="pfmDetailbtn" class="btn btn-success">상세보기</button>
			</a>
		</div>
		</div>
		<div class="bottomDiv ddiv">
			
			<div id="tab-1" class="tab-content current">
				<strong style="float: left; font-size: 20px;">출연진</strong><br>
				<div class="castInfo tabarray">
				<ul class="castUl">
				<c:forEach items="${castList }" var="list">
					<li class="imgli">
						<img id="castimg" class="img-circle" src="<c:url value="${list.imgUri}"/>"/><br>
						${list.name }
					</li>
				</c:forEach>
				</ul>
				</div>
				
				<div class="pfmInfo tabarray"style="display: inline-block;">
					<strong style="float: left; font-size: 20px;">공연 정보</strong><br>
					${detailList.contents }
				</div>
			</div>
		</div>
	</div>	
</div>