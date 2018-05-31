<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
href="${pageContext.request.contextPath}/resources/style
/overallstyle.css" media="screen"/>
<link type="text/css" rel="stylesheet" 
href="${pageContext.request.contextPath}/resources/style
/docboxstyle.css" media="screen"/>
<title>문서함</title>
</head>
<body>
	<%@include file="/WEB-INF/importviews/header.jsp"%>
	<%@include file="/WEB-INF/importviews/aside.jsp"%>
	<%@include file="/WEB-INF/importviews/nav.jsp"%>
	<section>
		<div id="maincontent">
			<div id="sortmenu">
			<ul class="menu">
				<li>임시저장문서</li>
				<li>즐겨찾기</li>
				<li>기본양식</li>
				<li>중요문서</li>
			</ul>
			</div>
			<div id="editmenu">
				<div id="doclist">
					
				</div>
				<div id="preview">
					
				</div>
				<div id="buttons">
					<input type="button" class="editbtns" id="edit" value="편집하기"/>
					<input type="button" class="editbtns" id="delete" value="삭제하기"/>
				</div>
			</div>
		</div>
	</section>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
</script>
</html>