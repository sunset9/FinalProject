<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/menu.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<style>
td{
padding: 5px;
}
/* button div */
#buttons {
  padding-top: 50px;
  text-align: center;
}

/* start da css for da buttons */
.btn {
  border-radius: 5px;
  padding: 0px 13px;
  font-size: 18px;
  text-decoration: none;
  margin: 20px;
  color: #fff;
  position: relative;
  display: inline-block;
}

.btn:active {
  transform: translate(0px, 5px);
  -webkit-transform: translate(0px, 5px);
  box-shadow: 0px 1px 0px 0px;
}
.yellow {
  background-color: #f1c40f;
  box-shadow: 0px 5px 0px 0px #D8AB00;
}

.yellow:hover {
  background-color: #FFDE29;
}
</style>

<script>
function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=hallLoc]').val(data.address+data.buildingName);
		}
	}).open();
}
      function fileInfo(f) {
        var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음
         var reader = new FileReader(); // FileReader 객체 사용
            reader.onload = function(rst) { // 이미지를 선택후 로딩이 완료되면 실행될 부분
            	var postImg = $('#img_box').find('img');
                postImg.attr('src', rst.target.result);
             // 이미지는 base64 문자열로 추가
            // 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
           }
       reader.readAsDataURL(file[0]); // 파일을 읽는다, 배열이기 때문에 0 으로 접근
     }
</script>
<div>
	<h1>공연장등록</h1>
	<hr>
</div>
<div style="border: 1px solid black; display: inline-block; width:700px;">
<form action="/admin/registhall" method="post" enctype="multipart/form-data">
	<table style="margin: 30px;">
		<tr>
			<th style="width: 10%;"><label>공연장이름</label></th>
			<td><input style="width: 57%;" class="form-control" type="text" name="hallName" id="hallName" /></td>
		</tr>
		<tr>
			<th style="width: 10%;"><label>공연장 전화번호</label></th>
			<td><input style="width: 57%;" class="form-control" type="text" name="hallPhone" id="hallPhone" /></td>
		</tr>
		<tr>
			<th style="width: 20%;"><label for="InputFile">공연장사진</label></th>
			<td><input style="width: 70%;" class="form-control" type="file" name="file" id="file" accept="image/*"
				onchange="fileInfo(this)" /> <div id="img_box">
				<img src="/resources/image/poster_empty.png" width="200px" height="101px">
				</div></td>
		</tr>
		<tr>
			<th style="width: 30%;"><label>공연장주소</label></th>
			<td><input style="width: 90%;" class="form-control" type="text" name="hallLoc" id="hallLoc" />
			<div style="text-align:center; display:inline-block; width:60px; height:32px;" onclick="openZipSearch()"><span class="glyphicon glyphicon-search"></span></div>
			</td>
		</tr>
	</table>
	<button class="buttons btn yellow" style="margin-left: 500px; margin-bottom: 30px;">공연장등록</button>
</form>
</div>