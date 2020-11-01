<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
header {
	display: block;
	width: 100vw;
	background-color: #ffffff;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 10;
}
#headerwrapper {
	display: block;
	position: relative;
	max-width: 975px;
	text-align: center;
}
#logo {
	height: 50px;
	float: left;
}
#search {
	display: inline-block;
	height: 50px;
	text-align: center;
}
#searchbar {
	margin-top: 12px;
	padding-left: 10pt;
	border: 1px solid #cccccc;
	width: 200px;
	height: 24px;
	text-align: center;
	background-color: #eeeeee;
}
#searchbar:focus {
	width: 300px;
	text-align: left;
	outline: none;
}
#acount {
	width: 200px;
	background-color: #ffffff;
	height: 50px;
	float: right;
	cursor: pointer;
	border: none;
	outline: none;
	vertical-align: top;
	text-align: right;
}
#acountspan {
	font-size: 15pt;
	line-height: 1.5;
	position: relative;
    top: -15px;
    right: 10px;
}
.profilepic {
	margin-top: 5px;
	width: 40px;
	border-width: 2px;
	border-style: solid;
	border-radius: 25px;
}
nav {
	max-width: 975px;
}
#nav li {
	display: inline-block;
	float: left;
	box-sizing:border-box;
	width: 25%;
	height: 50px;
	text-align: center;
	border-left: 1px solid #cccccc;
	padding: 5px 0px;
}
#nav li:last-child {
	border-right: 1px solid #cccccc;
}
.icon {
	width: 40px;
	height: 40px;
}
.navspan {
	margin-left: 10px;
	font-size: 16pt;
	vertical-align: top;
	line-height: 1.8;
}
#acountbar {
	width: 200px;
	display: none;
	position:absolute;
	top: 50px;
	right:0;
	border-radius: 5px;
	background-color: #95a5a6;
	opacity: 0.9;
	color: #ecf0f1;
}

#acountbar li {
	padding: 3px 0px;
	font-weight: bold;
}

</style>
<script type="text/javascript">
function acount() {
	if($('#acountbar').css("display")=="none"){
		$('#acountbar').css("display", "inline-block");
	} else {
		$('#acountbar').css("display", "none");
	}
}
$(document).ready(function() {
	$('img').on("error", function() {
		$(this).attr("src", "resources/upload/profile/NotFound.gif");
	});	
})
	
</script>
<header>
	<div id="headerwrapper">
		<a href="<%=request.getContextPath()%>">
			<img id="logo"src="resources/images/header/logo.png">
		</a>
		<c:choose>
		<c:when test="${login!=null}">
			<button id="acount" onclick="acount();"><span id="acountspan">${login.name }</span>
			<img class="profilepic" style="border-color: #95a5a6;" src="resources/upload/profile/${login.profilepic}"></button>
		</c:when>
		<c:otherwise>
			<button id="acount" onclick="location.href='<%=request.getContextPath()%>'"><span id="acountspan">로그인해주세요</span>
			<img class="profilepic" src="resources/upload/profile/default.png"></button>
		</c:otherwise>
		</c:choose>
		<div id="acountbar">
			<ul>
				<li><a href="myaccount">내 계정</a></li>
				<li><a href="notice">공지사항</a></li>
				<li><a href="logout">로그아웃</a></li>
			</ul>
		</div>
		
	</div>
	<div style="border-bottom: 1px #bbbbbb solid; clear: both;"></div>
	<nav>
		<ul id="nav">
			<li><a href="<%=request.getContextPath()%>">
				<img class="icon" src="resources/images/nav/sns.png">
				<span class="navspan">SNS</span>
			</a></li>
			<li><a href="follow">
				<img class="icon" src="resources/images/nav/follow.png">
				<span class="navspan">Follow</span>
			</a></li>
			<li><a href="#">
				<span class="navspan">#</span>
			</a></li>
			<li><a href="#">
				<span class="navspan">#</span>
			</a></li>
		</ul>
	</nav>
	<div style="border-bottom: 1px #bbbbbb solid; clear: both;"></div>
	
</header>