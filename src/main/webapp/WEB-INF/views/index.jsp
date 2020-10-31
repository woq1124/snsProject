<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Index</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
* {
	margin: 0 auto;
	padding: 0;
	list-style: none;
	font-family: 'Nanum Gothic', 'sans-serif';
}
a {
	color: inherit;
	text-decoration: none;
}
html, body {
	width: 100%;
	background-color: #f1f2f6;
	position: absolute;
}
#main {
	width: 100%;
	position: relative;
	top: 102px;
}
#sectionwrapper {
	max-width: 975px;
	text-align: center;
}
aside {
	display: inline-block;
}
#leftside {
	width: 59%;
	height: 500px;
	float: left;
	text-align: center;
}
#rightside {
	width: 40%;
	float: right;
	height: 500px;
	border-left: 1px solid #cccccc;
	border-right: 1px solid #cccccc;
	position: relative;
	overflow: hidden;
}
#joinform {
	width: 100%;
	position: absolute;
	left: 100%;
}
#joinspan {
	font-size : 20pt;
	line-height: 3;
}
#loginform {
	width: 100%;
	position: absolute;
	left: 0;
}
.input-field {
    width: 90%;
    padding: 10px 5px;
    margin: 5px 0;
    border: none;
    border-bottom: 1px solid #999;
    outline: none;
    background: transparent;
}
.inval-field {
	width: 90%;
    padding: 10px 5px;
    margin: 3.5px 0;
    border: 2px solid #e74c3c;
    border-radius: 2px;
    outline: none;
    background: transparent;
}
.val-field {
	width: 90%;
    padding: 10px 5px;
    margin: 3.5px 0;
    border: 2px solid #3498db;
    border-radius: 2px;
    outline: none;
    background: transparent;
}
.chkimg {
	margin-left: 10px;
	width: 25px;
	height: 25px;
	vertical-align: middle;
}
.btn {
	margin-top: 20px;
    width: 85%;
    padding: 10px 30px;
    cursor: pointer;
    display: block;
    color: #ffffff;
    background-color: #3498db;
    border: 0;
    outline: none;
    border-radius: 30px;
}
.changebtn {
    width: 65%;
    padding: 10px 30px;
    cursor: pointer;
    display: block;
    color: #ffffff;
    background-color: #3498db;
    border: 0;
    outline: none;
    border-radius: 30px;
}
footer {
	clear: both;
	width: 100%;
	height: 60px;
	border-top: 1px solid #999;
	border-bottom: 1px solid #999;
}
footer p {
	width: 975px;
	font-size: 15pt;
	text-align: center;
	line-height: 3;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	var rightPos = 1;
	function idChk(){
		var joinid = document.getElementById("joinid");
		var idRegex = /^[a-z0-9]{4,12}$/;
		if(!idRegex.test(joinid.value)) {
			joinid.className = "inval-field";
			joinid.placeholder = "영소문자, 숫자로 4글자에서 12글자까지만 가능합니다";
			joinid.value="";
			joinid.focus();
		} else {
			$.ajax({
				url: 'idDupChk',
				type: 'POST',
			    data: joinid. value,
			    contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
			    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
			    
			    success: function(data){
			         if(data == 0){
				         joinid.className = "val-field";
			         }else{
			         	joinid.className = "inval-field";
						joinid.placeholder = "사용중인 ID입니다";
						joinid.value="";
						joinid.focus();
			         }
			    },
			    error: function (){        
					alert("잠시 후 다시 시도해주세요");
			    }
			});
		}
	}
	
	function pwdChk() {
		var pwd = $('#joinpwd').val();
		$('#joinpwdconfirm').val('');
		if(pwd.length>12 || pwd.length<4){
			$('#joinpwd').attr('class','inval-field');
			$('#joinpwd').attr('placeholder','4자에서 12자로 가능합니다');
			$('#joinpwd').val('');
			$('#joinpwd').focus;
		} else {
			$('#joinpwd').attr('class','val-field');
		}
	}
	
	function pwdConfirmChk() {
		if($('#joinpwd').val() == $('#joinpwdconfirm').val()){
			$('#joinpwdconfirm').attr('class','val-field');
		} else {
			$('#joinpwdconfirm').attr('class','inval-field');
			$('#joinpwdconfirm').attr('placeholder','비밀번호가 일치하지 않습니다');
			$('#joinpwdconfirm').val('');
			$('#joinpwdconfirm').focus;
		}
	}
	
	function nameChk() {
		var idRegex = /^[a-zA-Z가-힣0-9ㄱ-ㅎㅏ-ㅣ]{1,10}$/;
		if(!idRegex.test($('#joinname').val())){
			$('#joinname').attr('class','inval-field');
			$('#joinname').attr('placeholder','특수문자를 포함하지 않고 10글자까지 가능합니다');
			$('#joinname').val('');
			$('#joinname').focus;
		} else {
			$('#joinname').attr('class','val-field');
		}
	}
	
	function joinChk() {
		if($('#joinid').attr('class') != 'val-field'){
			$('#joinid').attr('class','inval-field');
			$('#joinid').attr('placeholder','아이디를 확인해주세요');
			$('#joinid').focus;
		} else if($('#joinpwd').attr('class') != 'val-field'){
			$('#joinpwd').attr('class','inval-field');
			$('#joinpwd').attr('placeholder','비밀번호를 확인해주세요');
			$('#joinpwd').focus;
		} else if($('#joinpwdconfirm').attr('class') != 'val-field'){
			$('#joinpwdconfirm').attr('class','inval-field');
			$('#joinpwdconfirm').attr('placeholder','비밀번호 일치여부를 확인해주세요');
			$('#joinpwdconfirm').focus;
		} else if($('#joinname').attr('class') != 'val-field'){
			$('#joinname').attr('class','inval-field');
			$('#joinname').attr('placeholder','이름을 확인해주세요');
			$('#joinname').focus;
		} else {
			alert("회원가입이 완료되었습니다");
			$('#joinform').submit();
		}
	}
	
	function changeForm() {
		var joinForm = document.getElementById("joinform");
		var loginForm = document.getElementById("loginform");
		if(rightPos == 1) {
			loginForm.style.left = "-100%";
			joinForm.style.left = "0";
			rightPos = 2;
		} else if(rightPos == 2) {
			loginForm.style.left = "0";
			joinForm.style.left = "100%";
			rightPos = 1;
		}
	}
</script>

</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="main">
	<div id="sectionwrapper">
		<div id="leftside">
			<img src="resources/images/section/welcome.png" style="width: 480px; margin: 0 auto; margin-top: 40px;">
		</div>
		<div id="rightside">
			<form id="loginform" action="login" method="post" autocomplete="off">
				<p id = joinspan>LOGIN</p>
				<ul>
					<li>
						<input type="text" class="input-field" name="id" id="loginid" placeholder="User ID" required>
					</li>
					<li>
						<input type="password" class="input-field" name="pwd" id="loginpwd" placeholder="User Password" required>
					</li>
					<li>
						<input type="submit" class="btn" value="LOGIN">
					</li>
				</ul>
				<p Style="line-height: 2.5;">Or</p>
				<input type="button" class="changebtn" onclick="changeForm();" value="REGISTER">
			</form>
			<form id="joinform" action="join" method="post" autocomplete="off">
				<p id = joinspan>Come On, Join Us</p>
				<ul>
					<li>
						<input type="text" class="input-field" name = "id" id="joinid" placeholder="User ID" onchange="idChk();">
						<input type="hidden" name="idchk" value="no">
					</li>
					<li>
						<input type="password" class="input-field" name = "pwd" id="joinpwd" placeholder="User Password" onchange="pwdChk();">
						<input type="hidden" name="pwdchk" value="no">
					</li>
					<li>
						<input type="password" class="input-field" name = "pwdconfirm" id="joinpwdconfirm" placeholder="Password Confirm" onchange="pwdConfirmChk();">
						<input type="hidden" name="pwdrechk" value="no">
					</li>
					<li>
						<input type="text" class="input-field" name = "name" id="joinname" placeholder="User Name or Nickname" onchange="nameChk();">
						<input type="hidden" name="namechk" value="no">
					</li>
					<li>
						<input type="button" class="btn" onclick="joinChk();" value="REGISTER">
					</li>
				</ul>
				<p Style="line-height: 2.5;">Or</p>
				<input type="button" class="changebtn" onclick="changeForm();" value="LOGIN">
			</form>
		</div>
		<div style="clear:both;"></div>
	</div>
	<footer>
		<p>휴먼교육센터 : 이재빈 | 연락처 : 010.9261.4484 | E-mail : woqls4@gmail.com</p>
	</footer>
</div>
</body>
</html>
