<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
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
html, body {
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
	margin: 0;
	width: 75%;
	position: relative;
	display:inline-block;
}
.member-list-box {
	width: 95%;
	border-width: 2.5px;
	border-style: solid;
	border-radius: 10px;
	border-color: #95a5a6;
	background-color: #ffffff;
	margin-top: 1vh;
}
.member-list-box > p {
	width: 95%;
	padding: 1vh 0;
	border-bottom: 1px solid #95a5a6;
	font-weight: bold;
}
.user-search {
	width: 95%;
	padding: 1vh 0;
	border-bottom: 1px solid #95a5a6;
	font-weight: bold;
}
.member-list-box > div {
	padding: 0 1vw;
}
.find-name {
	width: 10vw;
	padding-left: 0.5vw;
	height: 2.1vh;
	outline: none;
	border: 2px solid #6c5ce7;
}
.find-btn {
	width: 3vw;
	height: 2.5vh;
	border: 2px solid #6c5ce7;
	background-color: #ffffff;
	outline: none;
}
.find-btn:hover {
	background-color: rgba(0, 0, 0, 0.2);
}
.more {
	float: right;
	font-size: 0.8em;
	vertical-align: bottom;
	cursor: pointer;
}
.result-wrapper {
	display: block;
}
.over-hidden {
	overflow: hidden;
	height: 170px;
}
.member-info {
	width: 19%;
	display: inline-block;
}
.member-info>div {
	padding-top: 3px;
}
.member-info>p {
	text-align: center;
	padding-bottom: 3px;
}
.member-propic {
	width: 90%;
	border-width: 2px;
	border-style: solid;
	border-radius: 50%;
}
.member-name {
	text-align: center;
}
.nolist {
	 font-size:2em;
	 line-height: 2;
	 padding-left: 0.5em;
}
.follow-btn {
	width: 80%;
	height: 2vh;
	border: none;
	border-radius: 1vh;
	color: #fff;
	font-weight: bold;
	outline: none;
}
.follow-btn:hover {
	opacity: 0.8;
}
#f_type1 input[type="button"] {
	background-color: #f8a5c2;
}
#f_type2 input[type="button"] {
	background-color: #00cec9;
}
#f_type3 input[type="button"] {
	background-color: #786fa6;
}
#f_type4 input[type="button"] {
	background-color: #1e272e;
}
aside {
	width: 25%;
	height: 1px;
	position: sticky;
	display: inline-block;
	top: 102px;
	text-align: center;
}
#profile {
	margin-top: 10px;
	margin-bottom: 10px;
}
#asideprofilepic {
	width: 90%;
	border: 2px solid #95a5a6;
	border-radius: 50%;
}
#profilespan {
	width: 90%;
	font-size: 20pt;
	line-height: 1.5;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/script/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).on("click", ".more", function(){
	$(this).parent().next().toggleClass('over-hidden');
	$(this).text($(this).text() == '펼치기'?'접기':'펼치기');
});
$(document).on("submit", ".user-search", function(){
	$.ajax({
		url: "searchuser",
		type: 'POST',
		contentType: "application/json",
		data: JSON.stringify({
			keyword: $('.find-name').val()
		}),
		dataType: 'json',
		success: function(data) {
			$('#f_type4').prev().children('span').text("");
			$('#f_type4').prev().next().html("");
			if(data.length>0){
				$('#f_type4').addClass('over-hidden');
				for(var i = 0 ; i < data.length ; i++){
					var html = "";
					html += '<div class="member-info">';
					html += '<div>';
					html += '<img class="member-propic" src="resources/upload/profile/'+data[i].profilePic+'">';
					html += '</div>';
					html += '<p class="member-name">';
					html += data[i].name;
					html += '</p>';
					html += '<p>';
					html += '<input type="button" class="follow-btn" value="팔로우" data-memberno="'+data[i].no+'">';
					html += '</p>';
					html += '</div>';
					$('#f_type4').append(html);
				}
				$('#f_type4').prev().attr("data-listsize", data.length);
				if(data.length>5){
					$('#f_type4').prev().children('span').text("펼치기");
				}
			} else {
				$('#f_type4').removeClass('over-hidden');
				$('#f_type4').append('<p class="nolist">검색 결과가 없어요</p>');
			}
		},
		error: function() {
			alert('오류가 발생했습니다. 잠시 후 다시 시도해주세요');	
		}
	});
	return false;
});

$(document).on("click", ".follow-btn", function(){
	$(this).val($(this).val() == '팔로우'?'팔로우 중':'팔로우');
	var member = $(this).parent().parent();
	var memberNo = $(this).data("memberno");
	var nowStatus = member.parent().attr("id").substring(6);
	var toUrl = nowStatus>2?'following':'unfollowing';
	
	member.detach();
	var beforeSize = $('#f_type'+nowStatus).prev().attr("data-listsize");
	$('#f_type'+nowStatus).prev().attr("data-listsize", --beforeSize);
	
	if(beforeSize==5){
		$('#f_type'+nowStatus).prev().children('span').text("");
		$('#f_type'+nowStatus).addClass('over-hidden');
	} else if (beforeSize==0) {
		$('#f_type'+nowStatus).removeClass('over-hidden');
	}
	$.ajax({
		url: toUrl,
		type: 'POST',
		data: 'memberNo='+memberNo,
		dataType: 'text',
		success:function(data){
			if(nowStatus==1){
				member.prependTo('#f_type3');
				var afterSize = $('#f_type3').prev().attr("data-listsize");
				$('#f_type3').prev().attr("data-listsize", ++afterSize);
				if(afterSize==6){
					$('#f_type3').prev().children('span').text("펼치기");
					$('#f_type3').addClass('over-hidden');
				} else if(afterSize==0){
					$('#f_type3').removeClass('over-hidden');
				}
			} else if(nowStatus==2){
				member.remove();
			} else if(nowStatus==3){
				member.prependTo('#f_type1');
				var afterSize = $('#f_type1').prev().attr("data-listsize");
				$('#f_type1').prev().attr("data-listsize", ++afterSize);
				if(afterSize==6){
					$('#f_type1').prev().children('span').text("펼치기");
					$('#f_type1').addClass('over-hidden');
				} else if(afterSize==0){
					$('#f_type1').removeClass('over-hidden');
				}
			} else if(nowStatus==4){
				member.prependTo('#f_type2');
				var afterSize = $('#f_type2').prev().attr("data-listsize");
				$('#f_type2').prev().attr("data-listsize", ++afterSize);
				if(afterSize==6){
					$('#f_type2').prev().children('span').text("펼치기");
					$('#f_type2').addClass('over-hidden');
				} else if(afterSize==0){
					$('#f_type2').removeClass('over-hidden');
				}
			}
		},
		error:function(){
			alert("실패");
		}
	});
	return false;
});


</script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="main">
		<div id="bodywrapper">
			<section>
				<div class="member-list-box">
					<form method="post" class="user-search" data-listsize="0">
						유저 검색&nbsp;&nbsp;&nbsp;
						<input type="text" class="find-name" name="find-name" required="required">
						<input type="submit" class="find-btn" value="검색">
						<span class="more"></span>
					</form>
					<div class="result-wrapper" id="f_type4">
					
					</div>
				</div>
				<div class="member-list-box">
					<p data-listsize="${bothFollow.size()}">서로 팔로우 중<span class="more"><c:if test="${bothFollow.size()>5 }">펼치기</c:if></span></p>
					<div class="result-wrapper <c:if test="${bothFollow.size()>5 }">over-hidden</c:if>" id="f_type1">
					<c:forEach var="follow" items="${bothFollow }">
						<div class="member-info">
							<div>
								<img class="member-propic" src="resources/upload/profile/${follow.profilePic}">
							</div>
							<p class="member-name">
								${follow.name}
							</p>
							<p>
								<input type="button" class="follow-btn " value="팔로우 중"  data-memberno="${follow.no }">
							</p>
						</div>
					</c:forEach>
					</div>
				</div>
				<div class="member-list-box">
					<p data-listsize="${following.size()}">팔로우 중<span class="more"><c:if test="${following.size()>5 }">펼치기</c:if></span></p>
					<div class="result-wrapper <c:if test="${following.size()>5 }">over-hidden</c:if>" id="f_type2">
					<c:forEach var="follow" items="${following }">
						<div class="member-info">
							<div>
								<img class="member-propic" src="resources/upload/profile/${follow.profilePic}">
							</div>
							<p class="member-name">
								${follow.name}
							</p>
							<p>
								<input type="button" class="follow-btn " value="팔로우 중" data-memberno="${follow.no }">
							</p>
						</div>
					</c:forEach>
					</div>
				</div>
				<div class="member-list-box">
					<p data-listsize="${followed.size()}">팔로우 됨<span class="more"><c:if test="${followed.size()>5 }">펼치기</c:if></span></p>
					<div class="result-wrapper <c:if test="${followed.size()>5 }">over-hidden</c:if>" id="f_type3">
					<c:forEach var="follow" items="${followed }">
						<div class="member-info">
							<div>
								<img class="member-propic" src="resources/upload/profile/${follow.profilePic}">
							</div>
							<p class="member-name">
								${follow.name}
							</p>
							<p>
								<input type="button" class="follow-btn " value="팔로우" data-memberno="${follow.no }">
							</p>
						</div>
					</c:forEach>
					</div>
				</div>
			</section>
			<aside>
				<div id="profile">
					<img id="asideprofilepic" src="resources/upload/profile/${login.profilepic}">
					<span id="profilespan">${login.name }</span>
				</div>
			</aside>
		</div>
	</div>
</body>
</html>