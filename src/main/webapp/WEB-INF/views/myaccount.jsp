<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.human1023.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myaccount</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/imageCropper/scripts/jquery.Jcrop.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/imageCropper/scripts/jquery.SimpleCropper.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/lib/imageCropper/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/lib/imageCropper/css/jquery.Jcrop.css" />
</head>
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
body {
	width: 100%;
	background-color: #f1f2f6;
	position: absolute;
}
#main {
	position: relative;
	top: 102px;
	padding-left: calc(100vw - 100%);
}
#bodywrapper {
	width: 975px;
	display: flex;
}
section {
	width: 100%;
	padding: 10px;
	display: flex;
}
#frofile-mod-from {
	width: 100%;
	position: relative;
	display: flex;
}
.profile-img-mod-wrapper {
	width: 25%;
	height: 480px;
}
.profile-img-wrapper {
	width: 90%;
	height:100%;
	display: block;
}
.profile-img {
	width: 200px;
	height: 200px;
	border: 2px solid #3d3d3d;
	border-radius: 50%;
	background-image: url(resources/upload/profile/${login.profilepic});
	background-size: 100%;
	overflow: hidden;
	position: relative;
	cursor: pointer;
}
.profile-img > div {
	width:100%;
	height: 20%;
	position: absolute;
	bottom: 0;
	text-align: center;
	background-color: rgba(236, 240, 241, 0.5);
	color: #000;
	line-height:2.5;
	vertical-align:middle;
	font-weight: bold;
}
.profile-img:hover > div {
	background-color: rgba(236, 240, 241, 0.8);
}
.profile-info-mod-wrapper {
	width: 75%;
	height: 480px;
}

.profile-info-mod-wrapper table{
	width: 90%;
}
.profile-info-mod-wrapper table tr>td {
	height: 30px;
	padding: 5px 0;
	border-bottom: 1px solid #000;
}
.profile-info-mod-wrapper table tr>td:first-child {
	width: 25%;
}
.profile-info-mod-wrapper table tr>td>input[type=submit],  input[type=button]{
	width: 100px;
	height: 30px;
	outline: none;
	margin-right: 15px;
	border-radius: 10px;
}
#mod-name {
	width: 280px;
	height: 25px;
	padding-left: 5px;
	outline: none;
}
.moddone {
	width: 100px;
	height: 25px;
	outline: none;
}
</style>
<script type="text/javascript">
$(document).on('submit', '#mod-info-form', function() {
	$.ajax({
		url: "modmember",
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify({
				name: $('#mod-name').val(),
				profilepic: $('.profile-img').children("img").attr("src")
			}),
		dataType: "text",
		success: function(result) {
			if(result==1){
				alert("수정 완료");
				location.reload();
			} else {
				alert("수정 실패");
				location.reload();
			}
		},
		error: function() {
			alert("전송 실패");
		}
	});
});

$(document).on("change", "#oldpwd", function() {
	var oldPwd = $(this).val();
	if(oldPwd == 0){
		return false;
	}
	$.ajax({
		url:'pwdchk',
		type: 'post',
		data: 'pwd='+oldPwd,
		contextType: 'text',
		success: function(result) {
			if(result==0){
				$('#pwdchk').css("color", "red");
				$('#pwdchk').text("비밀번호가 일치하지 않습니다");	
			} else {
				$('#pwdchk').css("color", "blue")
				$('#pwdchk').text("비밀번호가 일치합니다");
			}
		},
		error: function() {
			alert("ajax error")
		}
		
	});
})


$(document).ready(function(){
	$('.change-form').click(function() {
		if($('#mod-info-form').is(':visible')){
			$('#mod-info-form').hide(200);
			$('#mod-pwd-form').show(200);
		} else {
			$('#mod-pwd-form').hide(200);
			$('#mod-info-form').show(200);
		}
	});
});

function pwdchk() {
	if($('#newpwd').val()!=$('#newpwdchk').val()){
		alert("비밀번호를 서로 다르게 입력했습니다");
		return false;
	} else{
		return true;
	}
}
</script>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="main">
	<div id="bodywrapper">
		<section>
			<div class="profile-img-mod-wrapper">
				<div class="profile-img-wrapper">
					<div class="profile-img"><div>사진 변경</div></div>
					<script>$('.profile-img').simpleCropper();</script>
				</div>
			</div>
			<div class="profile-info-mod-wrapper">
				<form id="mod-info-form" onsubmit="return false;" method="post">
				<table class="modinfo">
					<tr>
						<td>회원번호</td>
						<td>${login.no }</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${login.id }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" id="mod-name" value="${login.name }" required="required"></td>
					</tr>
					<tr>
						<td>가입일자</td>
						<td>
							${login.regDate.substring(0, 4)}년&nbsp;
							${login.regDate.substring(4, 6)}월&nbsp;
							${login.regDate.substring(6, 8)}일&nbsp;
							${login.regDate.substring(8, 10)}시&nbsp;
							${login.regDate.substring(10, 12)}분&nbsp;
							${login.regDate.substring(12)}초
							<input type="hidden" value="${login.regDate }">
						</td>
					</tr>
					<tr style="text-align: center;">
						<td colspan="2">
							<input type="submit" value="수정 완료">
							<input type="button" class="change-form" value="비밀번호 변경">
						</td>
					</tr>
				</table>
				</form>
				<form id="mod-pwd-form"  action="modpwd" method="post" onsubmit="return pwdchk();" style="display:none;">
				<table class="modinfo">
					<tr>
						<td>현재 비밀번호</td>
						<td><input type="password" name="oldpwd" id="oldpwd"><span id="pwdchk"></span></td>
					</tr>
					<tr>
						<td>변경할 비밀번호</td>
						<td><input type="password" name="newpwd" id="newpwd"></td>
					</tr>
					<tr>
						<td>변경할 비밀번호 확인</td>
						<td><input type="password" name="newpwdchk" id="newpwdchk"></td>
					</tr>
					<tr style="text-align: center;">
						<td colspan="2">
							<input type="submit" value="수정 완료">
							<input type="button" class="change-form" value="정보 변경">
						</td>
					</tr>
				</table>
				</form>
			</div>
		</section>
	</div>
</div>
</body>
</html>