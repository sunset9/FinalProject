<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/menu.jsp" />

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
          <div class="ordering">
          	<p>최신순</p> <p>가나다순</p>
          </div>
          <c:forEach items="${NewPfmList }" var="np">
          	<div class="np">
			    <input type="radio" name="pfmCheck" onclick="clickPfm('${np}');">   
			    <div><img src="/resources/image/${np.storedName}" style="width: 140px; height: 198px;"></div>
			    <div>${np.name }</div>
			    <div><fmt:formatDate value="${np.pfmStart }" pattern="yyyy.MM.dd" />
			     ~ <fmt:formatDate value="${np.pfmEnd }" pattern="yyyy.MM.dd" /></div>
			    <div>${np.hallName }</div>
		    </div>
          </c:forEach>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<!-- Buttons -->
<button type="button" data-toggle="modal" data-target="#myModal">Open Modal</button><br>
 
<!-- Links -->
<a data-toggle="modal" href="#myModal">Open Modal</a>
 
<!-- Other elements -->
<p data-toggle="modal" data-target="#myModal">Open Modal</p>

<table>
	<tr>
		<td>공연</td>
		<td><input type="search"/></td>
	</tr>
	<tr>
		<td></td>
		<td>공연정보</td>
	</tr>
</table>
<table>
	<tr>
		<td>썸네일 이미지</td>
		<td><input type="file" /></td>
		<td>배너 이미지</td>
		<td><input type="file" /></td>
	</tr>
	<tr>
		<td>.</td>
		<td><img src="" /></td>
		<td>.</td>
		<td><img src="" /></td>
	</tr>
</table>


 

</div>
</body>
</html>