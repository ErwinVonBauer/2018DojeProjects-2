<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1><br>
<h2>아이디</h2><br>
<form action="/userjoin" id="formid">
	<input type="text" id="user_id" name="user_id"><br>
	<h2>비밀번호</h2><br>
	<input type="password" id="user_pw" name="user_pw"><br>
	<h2>이름</h2><br>
	<input type="text" id="user_name" name="user_name"><br><br>
	<input type="button" value="회원가입" id="joinbtn" onclick="joinconfirm()">
</form>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var flags = new Array(); //폼 전송 이전 확인하는 flag
var user_id = $('#user_id').val();
var user_pw = $('#user_pw').val();
var user_name = $('#user_name').val();
var user_name = $('#user_name').val()

//l.폼 최종전송
function joinconfirm(){
	var formflag = true;

	korcheck(user_id,user_pw);
	blankcheck(user_id,user_pw,user_name);

 	for(var i=0;i<flags.length;i++){
 		if(flags[i]!=false){
			alert("확인완료");
		}else{
 			formflag = false;
 			break;
 		}
	}
 	
	$('#formid').submit();
}

//2.빈칸확인
function blankcheck(id,pw,name){
	var array = new Array();
	var flag = false;

	array.push(id);
	array.push(pw);
	array.push(name);

	for(var i=0;i<array.length;i++){
		if(array[i]!=""){
			flag = true;
		}else{
			alert("빈칸이 있습니다!");
			break;
		}
	}
	flags.push(flag);
}



function checkElementEmpty(element){
	var val = element.val();
	var flag = true;

	if(val ==""){
		flag = false;
	}
	return flag;
}

function checkElementAlert(){
	var elementArray = settingElementArray();
	var flag = true;
	var korea = "";
	var alertMsg ="";

	$.each(elementArray, function(index,item){
		flag = checkElementEmpty(item);
		if(flag == false){
			korea = item.data("korea");
			alert(korea+"확인 해 주세여");
			return false;
			break;
		}
	});
	return flag;
}

function settingElementArray(){

	var elementArray = new Array();

	elementArray.push($('#user_id'));
	elementArray.push($('#user_pw'));
	elementArray.push($('#user_name'));

	return elementArray;
}


//3.아이디와 비밀번호 한글 체크
function korcheck(id,pw){
	var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글요소를 찾아내는데 필요한 정규식
	var array = new Array();
	var flag = false;

	array.push(id);
	array.push(pw);

	for(var i=0;i<array.length;i++){
		if(check.test(array[i])){
			alert(array[i]);
			alert("한글이 있습니다!");
			break;
		}else{
			flag = true;
		}
	}
	flags.push(flag);
}

</script>
</html>