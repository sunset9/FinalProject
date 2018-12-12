<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

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
<form action="/admin/registhall" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>공연장이름</th>
			<td><input type="text" name="hallName" id="hallName" /></td>
		</tr>
		<tr>
			<th>공연장 전화번호</th>
			<td><input type="text" name="hallPhone" id="hallPhone" /></td>
		</tr>
		<tr>
			<th>공연장사진</th>
			<td><input type="file" name="file" id="file" accept="image/*"
				onchange="fileInfo(this)" /> <div id="img_box">
				<img src="/resources/image/poster_empty.png" width="143" height="201">
				</div></td>
		</tr>
		<tr>
			<th>공연장주소</th>
			<td><input type="text" name="hallLoc" id="hallLoc" /></td>
			<td><button type="button" style="width:60px; height:32px;" onclick="openZipSearch()">검색</button><br>
			</td>
		</tr>
	</table>
	<button>전송</button>
</form>