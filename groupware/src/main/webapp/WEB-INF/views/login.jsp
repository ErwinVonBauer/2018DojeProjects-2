<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인</h1><br>
<h2>아이디</h2><br>
<input type="text" id="id" name="id"><br>
<h2>비밀번호</h2><br>
<input type="password" id="pw" name="pw"><br><br>
<input type="button" value="로그인" id="loginbtn" name="loginbtn" onclick="userlogincheck()">
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

//각각의 기능을 함수로 빼놓자.
//1. 예외처리
//2. 로그인 성공 여부
//3. 에러메세지
function userlogincheck() {
	var userid = document.getElementById("id").value;
	var userpw = document.getElementById("pw").value;
	var logininfo = new Object();
	var alertMsg = "";

	logininfo.user_id = userid;
	logininfo.user_pw = userpw;

	if(userid!=""&&userpw!=""){
		$.ajax({
			url : '/userlogincheck.ajax',
			data : logininfo,
			type : 'post',
			async: false,
			success:function(data){
				if(data=="1"){
					alertMsg = "로그인에 성공하였습니다!";
					linktest();
				}else{
					alertMsg = "잘못된 아이디 또는 비밀번호입니다!";
				}
				alert(alertMsg);
			}
		});
	}else if(userid==""){
		alert("아이디를 입력해주세요!");
		document.getElementById("id").focus();
	}else if(userpw==""){
		alert("비밀번호를 입력해주세요!");
		document.getElementById("pw").focus();
	}
}

function linktest(){
	window.location.href = "index";
}


function settingElementArray(){

	var elementArray = new Array();

	elementArray.push($('#user_id'));
	elementArray.push($('#user_pw'));

	return elementArray;
}
</script>
</html>