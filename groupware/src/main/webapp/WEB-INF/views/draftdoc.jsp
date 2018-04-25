<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
href="${pageContext.request.contextPath}/resources/style
/overallstyle.css" media="screen"/>
<link type="text/css" rel="stylesheet" 
href="${pageContext.request.contextPath}/resources/style
/draftdocstyle.css" media="screen"/>
<title>종합기안문서</title>
</head>
<body>
<%@include file="/WEB-INF/importviews/header.jsp"%>
<%@include file="/WEB-INF/importviews/aside.jsp"%>
<%@include file="/WEB-INF/importviews/nav.jsp"%>
<section>
<div id="maincontent">
	<form id="frm" action="/gochangedoc" method="post">
	<input type="hidden" id="draft_ai" name="draft_ai" value="">
	</form>
	<div id="doclist">
	 <c:forEach items="${docmap}" var="i">
	 	 <c:set var="title" value="${i.key}"/>
	 	 <c:set var="pk" value="${i.value}"/>
         <a id="${pk}" onclick="showpreview('${pk}')">
         <c:out value = '${title}'/>
         </a>
         <br><br>
     </c:forEach>
	</div>
	<ul id="sortmenu">
	<li>분류기준</li>
	<li>문서명</li>
	<li>수정일자</li>
	<li>작성자</li>
	</ul>
	<div id="docpreview">
	미리보기
	</div>
</div>
</section>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var docs = new Array();
	var ai = 0; //기안문서의 PrimaryKey
	var doccount = ${doccount};
	
	$(document).ready(function() {
		if(doccount!=0){
			yesdoc();
		}else{
			nodoc();
		}
	});
	
	function gowritedoc(){
		window.location.href = "writedoc";
	}
	
	function yesdoc(){
		$("#doclist").append
		('<input type="button" id="editbtn"'+
		'value="수정/편집하기" style="margin-top:50px"'+
		'onclick="linkchangedoc()"/>');
		$("#doclist").append
		('<input type="button" id="createbtn"'+
		'onclick="gowritedoc()" value="문서생성하기"'+
		'style="margin-top:0px"/>');
	}
	
	function nodoc(){
		$("#doclist").append("<p>추가된 문서가 없습니다!</p>");
		$("#doclist").append
		('<input type="button" id="createbtn"'+
		'onclick="gowritedoc()" value="문서생성하기"/>');
	}
	
	function showpreview(pk){
		ai = pk;
		$.ajax({
			url: "/loadpreview.ajax?ai="+ai,
			type: "get",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			async: false,
			success:function(data){
				$("#docpreview").empty();
				$("#docpreview").append(data);
			}
		});
	}
	
	function linkchangedoc(){
		$('#draft_ai').val(ai);
		$('#frm').submit();
	}
	
</script>
</html>	