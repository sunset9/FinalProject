<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/menu.jsp" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<h2>배너관리 - 메인배너</h2>
<hr>

<p>최대 5개 까지만 등록이 가능합니다.</p>
<button>최종저장</button><br>

<%-- <ul id="mainBannerList">
<c:forEach var="mb" items="${mBannerList }" varStatus="i">
	<li class="mainBanner">
	<c:choose>
		<c:when test="${pfm.posterName eq '' || pfm.posterName eq null }">
				<a href="/admin/editpfm?pfmIdx=${pfm.pfmIdx }">
					<span class="thumb">
						<img src="/resources/image/poster_empty.png">
					</span>
					<strong>${pfm.name }</strong>
				</a>
		</c:when>
		<c:when test="${pfm.posterName ne ''  || pfm.posterName ne null }">
				<a href="/admin/editpfm?pfmIdx=${pfm.pfmIdx }">
					<span class="thumb">
						<img src="/resources/image/${pfm.posterName }">
					</span>
					<strong>${pfm.name }</strong>
				</a>
		</c:when>
	</c:choose>
	</li>
</c:forEach>
</ul> --%>

</div>
</body>
</html>