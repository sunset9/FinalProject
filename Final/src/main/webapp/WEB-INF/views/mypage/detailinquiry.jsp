<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Froara Editor 관련 -->
<!-- Include external CSS. -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<!-- Include Editor style. -->
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/css/froala_style.min.css" rel="stylesheet" type="text/css" />
<!-- Include external JS libs. -->
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
<!-- Include Editor JS files. -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@2.9.1/js/froala_editor.pkgd.min.js"></script>


<style>
#detailTable{
	width: 80%;
	margin: 0 auto;
	height: 400px;
}

.waiting {
	color:red;
}

#inqContents td{
    padding: 15px;
}
.inqInfo{
	font-weight: bolder;
	background: #f2b1349c;
/* 	color : #FFF; */
}
.previous{
	width: 140px;
    height: 40px;
    border-radius: 10px;
/*     border: 2px solid #F2B134; */
	border: none;
    color:#fff;
    font-weight: bold;
}
.cancel{
	width: 140px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #F2B134;
    color:#fff;
    background: #F2B134;
    font-weight: bold;
}
.inqWrap{
	text-align: center;
	margin: 20px;
}
.btnDiv{
	margin: 20px auto;
	text-align: center;
}
.infoTr{
	height: 7%;
}
</style>
<div class="main_wrapper">

<div class="contents-wrapper">
<h1 style="text-align: center"> 1:1 문의 상세보기</h1>

<div class = "inqWrap">
<table id="detailTable" class="table table-bordered" >
<tr class="infoTr">
	<th class ="inqInfo" style="border-top-left-radius:5px; ">제목</th>
	<td>${inq.title }</td>
	<th class ="inqInfo">답변 상태</th>
	<c:if test="${inq.replyStatus eq 0}"><td class="waiting">답변 대기</td></c:if>
	<c:if test="${inq.replyStatus eq 1}"><td style="border-top-right-radius:5px; ">답변 완료</td></c:if>
</tr>
<tr class="infoTr">
	<th class ="inqInfo">작성자</th>
	<td>${inq.userName }</td>
	<th class ="inqInfo">작성일</th>
	<td>
	<fmt:formatDate value="${inq.createDate }" pattern="yyyy-MM-dd HH:mm"/>
	</td>
</tr>
<tr id="inqContents" style="border-bottom-radius:5px; ">
	<td colspan=4><div class="fr-view">${inq.contents }</div></td>
</tr>

</table>


	<div class="btnDiv">
	<button class ="previous"onclick="location.href='/mypage/viewinquiry'">목록</button>
	<button class ="cancel"onclick="location.href='/mypage/deleteInquiry?inqIdx=${inq.inqIdx }'">삭제</button>
	</div>
</div>
</div>
</div>