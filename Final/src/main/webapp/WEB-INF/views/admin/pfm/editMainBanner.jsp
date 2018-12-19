<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>배너관리 - 메인배너</h2>
<hr>

<h1>공연등록</h1>
<div>
	<form action="">
		공연 <input type="search" id="mbSearch" name="pfmSearch" /><br>  
		<div>
			
		</div>
		썸네일 이미지 <button>첨부파일</button>
		배너 이미지 <button>첨부파일</button>
	</form> 
</div>

<!-- The Modal -->
<div id="mbSearchModal" class="mbSearchModal">

  <!-- Modal content -->
  <div class="mbSearchModal-content">
    <span class="mbsClose">&times;</span>
    <hr>
  </div>

</div>
<script>
// Get the modal
var mbSearchModal = document.getElementById('mbSearchModal');

// Get the button that opens the modal
var mbSearch = document.getElementById("mbSearch");

// Get the <span> element that closes the modal
var mbsClose = document.getElementsByClassName("mbsClose")[0];

// When the user clicks the button, open the modal 
mbSearch.onclick = function() {
	mbSearchModal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
mbsClose.onclick = function() {
	mbSearchModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == mbSearchModal) {
	  mbSearchModal.style.display = "none";
  }
}     
</script>
</body>
</html>