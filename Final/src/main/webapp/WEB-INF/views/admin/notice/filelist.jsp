<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>

<tr><th>파일</th></tr>

<c:forEach items="${filelist }" var="file">
<tr>
	
	<td><a href="/admin/noticefiledownload?notiFileIdx=${file.notiFileIdx }"> ${file.originName }</a></td>
</tr>


</c:forEach>
</table>

</body>
</html>