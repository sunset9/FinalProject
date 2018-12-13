<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript">
$(document).ready(function(){
	
});


// 아티스트 리스트에서 아티스트 선택 시 반응할 메소드
function artChoice(artistIdx, name){
	
	// 추가하기 위해 눌렀을 때
	var isExist = false ;
	var selectedList = $('#selectedArt').find('div');
	selectedList.each(function(i) {
		if($(selectedList[i]).data('paIdx')==artistIdx){
			isExist = true;
			return false ; // each 문 종료
		}
	});
	if(isExist){
		return; // 추가하는 메소드 종료
	}
	
	// 선택한 결과 태그 추가하기
	var  selected = $("<div>");
	selected.data('paIdx',artistIdx );
	selected.data('name', name);
	
	var aName =$('<span>');
	aName.text(name);
	selected.append(aName);
	selected.append("<span class='glyphicon glyphicon-remove' ></span>")
	
	$('#selectedArt').append(selected);
	
}
	



</script>

<style type="text/css">
#userinfo{
	background-color: #CCC;
}

#userProfile{
	width: 150px;

	
}
#userNick{
	font-weight: bolder;
	font-size: 2em;
}

#preferTheme{

	border: 1px solid #CCC;
	
	/*아티스트 리스트 뽑을 때 사용했던 float 해제  */
	clear: left;
}

.thumbnail{
	float: left;
}
</style>
    
<h1>마이페이지 선호 찜</h1>
<hr>
<div id = "userinfo">
	<div class = "form-inline">
	
		<img id = "userProfile" src="${loginUser.profile }"  class="img-circle"/>
		<span id="userNick">${loginUser.nick }</span> <small>님 안녕하세요</small>
		<button id="userInfoChange" class="btn btn-default">정보 변경</button>
		<span>입금 대기</span><span>예매 완료</span><span>취소 현황</span>
	</div>
	
	
</div>

<hr>
<h3>선호 아티스트 선택</h3>
<div id ="preferArtist">

<c:forEach items="${aList }" var="a">
    <div class="thumbnail" style="width: 15%;" onclick ="artChoice(${a.artistIdx},${a.name });">
      <img style = "width: 80px;" src="${a.imgUri }" class="img-circle" >
      <div class="caption">
        <p style="text-align: center;">${a.name }</p>
    </div>
  </div>
	
</c:forEach>

<div id = "selectedArt">
	<c:forEach items="${paList }" var ="pa">
	<div paIdx="${pa.preArtistIdx }">
		<span>${pa.name }</span>
		<span class='glyphicon glyphicon-remove' ></span>
	</div>
	</c:forEach>
</div>
</div>

<div id ="preferTheme">
<hr>
<h3>선호 테마 선택</h3>

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

<button> 변경하기 </button>