<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/menu.jsp"/>
 
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style>

    *{padding:0;margin: 0;}
    ul li{list-style: none;}
    .clearfix:after{content: "";display: block;clear: both;}
    h1{text-align: center;padding: 20px 0;}
    .f_question1>ul>li,.f_answer1>ul>li{float: left;}
    .fnq{width: 70%;line-height:300%;margin: 0 auto;}
    .f_question1{position: relative}
    .f_answer1{background: #eee;display: none;}
    .f_answer1.on{display: block;}
    .f_question1>ul>li:nth-child(1){width: 7%;text-align: center;}
    .f_answer1>ul>li:nth-child(1){width: 7%;text-align: center;}
    .f_question1>ul>li:nth-child(2){width: 13%;text-align: center;}
    .f_question1>ul>li:nth-child(3){width:75%; }
    .f_question1>ul>li:nth-child(4){width:5%; }
    .f_q_link{width: 100%;height: 100%;position:absolute;top: 0;left: 0;}
    
    .con {
    	display:inline-block;
    	width:80%;
    }
    
</style>


<body>

<h1> FAQ </h1>

<div class="con">


<div class="form-inline">
	<select id="searchTypeSel" name="searchType">
		<option value="">검색조건</option>
		<option value="all"><c:out value="${map.searchOption == 'all'?'selected':'' }"/> 제목+내용 </option>		
		<option value="title"><c:out value="${map.searchOption == 'title'?'selected':'' }"/>제목</option>
		<option value="content"><c:out value="${map.searchOption == 'content'?'selected':'' }"/>내용</option>
	</select>

	<input class="form-control" type="text" id="keyword" name="keyword"
		value="${cri.keyword }" placeholder="검색어를 입력하세요"/>
		
	<button id="searchBtn" class="btn btn-primary">Search</button>

	</div>


<div class="faqCotent">
  
	<c:forEach items="${faqlist }" var="flist">
	
	    <ul class="fnq">
        <li class="f_question1">
            <ul class="clearfix">
                <li>${flist.faqIdx }</li>
                <li>${flist.FTypeIdx }</li>
                <li>${flist.faqQuestion }</li>
                <li><i class="fa fa-angle-double-up"></i></li>
            </ul>
            
            <a href="#" class="f_q_link"></a>
        </li>
        <li class="f_answer1">
            <ul class="clearfix">
                <li>번호 : 20 </li>
                <li>${flist.faqAnswer }</li>             
            </ul>
			<button class="btnUpdate" data-idx='${flist.faqIdx }'>수정</button>
			<button class="btnDelete" data-idx='${flist.faqIdx }'>삭제</button>
        </li>
    </ul>
	</c:forEach>


</div>

</div>
<a href="/admin/faqwrite"><button> 글쓰기 </button></a>

<jsp:include page="../../utils/faqpaging.jsp"/>


<script type="text/javascript">

// 아코디언 시작
$(function(){
	  var className =""  //변수를 선언한다.
	     
	   $('.f_q_link').on({    //버튼을
	 
	       click: function(){  //클릭했을때 
	 
	            className=$(this).parent().next().attr('class').slice(-2); 
	            //보여줄 li의 class이름을 뒤에서 두자리(on)를 변수에 담는다.
	 
	           if(className=='on'){  //만약 클래스명이 'on'이면
	 
	               $(this).parent().next().removeClass('on'); //class'on' 삭제
	          
	           }
	           else if(className!='on'){  //만약 클래스명이 'on'이 아니면
	               $(this).parent().next().addClass('on');  //class'on' 추가
          
	           }	             
	        }        
	    });	// 아코디언 끝
	  
		$(".btnUpdate").click(function(){
			$(location).attr("href", "/admin/faqupdate?faqIdx="+$(this).attr("data-idx"));
		});
		$(".btnDelete").click(function(){
			$(location).attr("href", "/admin/faqdelete?faqIdx="+$(this).attr("data-idx"));
		});
		
	     
	});

</script>


</body>