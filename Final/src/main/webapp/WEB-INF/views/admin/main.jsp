<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../admin/layout/menu.jsp" />
<div>
<h1>관리자 홈</h1>
<hr>

오늘의 예매수 : ${todayBook}건 <br>
오늘의 예매취소수 : ${todayCancel}건 <br><br>
오늘 등록된 공연수 : ${todayAllPfm}건<br>
오늘 등록된 콘서트 : ${todayConcert}건<br>
오늘 등록된 뮤지컬&연극 : ${todayMusical}건<br>
오늘 등록된 가족&아동 : ${todayFamily}건<br><br>

현재 접속자 : ${countConnector}명<br>
1:1 문의 미답변 : ${unansweredInq}건<br>


</div>

</div>
</body>
</html>