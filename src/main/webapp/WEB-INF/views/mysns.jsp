<%@ page import="com.human1023.vo.Member" %>
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
	max-width: 975px;
	display: flex;
}
section {
	margin: 0;
	width: 75%;
	position: relative;
	display: inline-block;
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
	height: 90%;
	overflow: hidden;
	border: 2px solid #95a5a6;
	border-radius: 50%;
}
#profilespan {
	width: 90%;
	font-size: 20pt;
	line-height: 1.5;
}
.menu {
	width: 90%;
}
.menu li {
	font-size: 18px;
	padding-left: 30px;
	padding-top: 3px;
	text-align: left;
	height: 30px;
	cursor: pointer;
}
.menu li:first-child {
	font-size: 25px;
	padding-left: 10px;
	padding-top: 5px;
	padding-bottom : 5px;
	margin-bottom: 2px;
	border-top: 1px solid #95a5a6;
	border-bottom: 1px solid #95a5a6;
	cursor: default;
}
article {
	width: 95%;
	border-width: 2.5px;
	border-style: solid;
	border-radius: 10px;
	background-color: #ffffff;
	margin-top: 10px;
}
.post-border0 {
	border-color: #546de5;
}
.post-border1 {
	border-color: #f8a5c2;
}
.post-border2 {
	border-color: #00cec9;
}
.post-border3 {
	border-color: #1e272e;
}
.profile-border0 {
	border-color: #546de5;
}
.profile-border1 {
	border-color: #f8a5c2;
}
.profile-border2 {
	border-color: #00cec9;
}
.profile-border3 {
	border-color: #1e272e;
}
.writer {
	width: 95%;
	height: 50px;
	border-bottom: 1px solid #bdc3c7;
}
.postname {
	vertical-align: super;
 	padding-left: 10px;
 	font-size: 20px;
}
.postname:hover{
	font-weight: bolder;
}
.postdate {
	padding-top: 15px;
	font-size: 12px;
	float: right;
	line-height: 1.2;
	text-align: right;
}
.title {
	width: 95%;
	height: 30px;
	cursor: pointer;
}
.title>span{
	text-align: left;
	line-height: 1.8;
}
.view-icon{
	float: right;
}
.post-body {
	width: 95%;
	display: none;
	border-top: 2px solid #4b7bec;
}
.contents {
	padding: 20px 10px;
}
.like {
	border-top: 1px solid #bdc3c7;
	padding: 5px;
}
.like>input[type=button] {
	width: 80px;
	height: 25px;
	color: #ffffff;
	font-weight: bold;
	outline: none;
	border: none;
}
.like-cnt {
	width: 40px;
	height: 25px;
	border: 2px solid rgba(99, 110, 114, 0.8);
	font-size: 14px;
	color: #000000;
	font-weight: bold;
	box-sizing: border-box;
	text-align: center;
	line-height: 1.5;
}
.mod-btn, .del-btn {
	float: right;
}
.mod-btn {
	background-color: rgba(108, 92, 231, 0.8);
}
.mod-btn:hover {
	background-color: rgba(108, 92, 231, 1.0);
}
.del-btn {
	background-color: rgba(32, 191, 107,0.8);
}
.del-btn:hover {
	background-color: rgba(32, 191, 107,1.0);
}
.like-btn, .like-cnt {
	float: left;
}
.like-btn {
	background-color: rgba(99, 110, 114, 0.8);
}
.like-btn:hover {
	background-color: rgba(99, 110, 114, 1.0);
}

.in-like {
	background-color: rgba(248,165,194, 0.8);
}
.in-like:hover {
	background-color: rgba(248,165,194, 1.0);
}
.cnt-in-like {
	border: 2px solid rgba(248,165,194, 1.0);
}
#newpost {
	min-width: 450px;
	height: 600px;
	position: fixed;
	top: 150px;
	left: 35%;
	display: none;
	background-color: #ffffff;
	border: 2px solid #95a5a6;
	border-radius: 10px;
	box-shadow: 0px 1px 20px #333;
	padding: 10px;
	z-index: 100;
}
#newpostback {
	width: 100%;
	height: 100%;
	position: fixed;
	left:0;
	top:0;
	display: none;
	background-color: #000;
	display: none;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	z-index: 99;
}
#newpostform td {
	padding: 5px;
}
#newpostform td input {
	padding: 5px;
	outline: none;
}
#newpostform td textarea {
	padding: 5px;
	outline: none;
}
.post-regist-btn {
	margin: 0 auto;
	width: 60%;
	height: 30px;
	background-color: #4b6584;
	color: #fff;
	outline: none;
	border: none;
	border-radius: 10px;
}
.text-deco-toggle {
	text-decoration:line-through;
}
.reply {
	border-top: 2px solid #4b7bec;
	padding: 5px 0;
}
.reply * {
	font-size: 14px;
}
.reply-head {
	height: 20px;
	padding: 5px 0;
}
.reply-head>input[type=button] {
	padding: 0 10px;
	float: right;
	background-color: white;
	border: none;
	outline: none;
	cursor: pointer;
}
.reply-cnt {
	color: #fc5c65;
}
.reply-unit-wrapper:first-child{
	border-top: 1px solid #4b7bec;
}
.reply-unit-wrapper {
	width: 100%;
	display: flex;
	border-bottom: 1px solid #4b7bec;
	box-sizing: border-box;
}
.reply-unit-wrapper>div {
	padding: 5px;
}
.reply-writer {
	width: 15%;
	text-align: center;
	border-right: 1px  solid #4b7bec;
	overflow: hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
}
.reply-comment{
	width: 65%;
}
.reply-date {
	width: 20%;
	text-align: right;
	font-size: 10px;
}
.delete-reply {
	 width:16px;
	 border:none;
	 outline: none;
	 background-color: rgba(149, 165, 166, 0.8);
}
.delete-reply:hover {
	 background-color: rgba(149, 165, 166, 0.5);
}
.reply-fotter {
	margin-top:10px;
	border-top: 2px solid #4b7bec;
	border-bottom: 2px solid #4b7bec;
	min-height: 50px;
	display: flex;
}
.reply-comment-input-area {
	width: 80%;
	padding: 5px;
	padding-bottom: 0;
	border: none;
	outline: none;
	resize: none;
	overflow-y: hidden; 
}
.reply-comment-input-btn {
	width: 20%;
	border: none;
	outline: none;
	background-color: #4b7bec;
	color: #fff;
	font-size: 13pt;
	font-weight: bold;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
<%
	Member login = (Member) session.getAttribute("login");
%>
var loginNo = <%= login.getNo()%>;
var modArticle;

$(document).on("click", ".writer-filter", function() {
	$('.type-filter').each(function(){
		if($(this).hasClass('text-deco-toggle')){
			$(this).removeClass('text-deco-toggle');
			$('.post-'+$(this).attr('id')).show(100);
		}
	});
	if($(this).hasClass('text-deco-toggle')) {
		$('.profile-'+$(this).attr('id')).parent().parent().parent().parent().show(100);
		
	} else {
		$('.profile-'+$(this).attr('id')).parent().parent().parent().parent().hide(100);
	}
	$(this).toggleClass('text-deco-toggle');

	return false;
});
$(document).on("click", ".type-filter", function() {
	$('.writer-filter').each(function(){
		if($(this).hasClass('text-deco-toggle')){
			$(this).removeClass('text-deco-toggle');
			$('.profile-'+$(this).attr('id')).parent().parent().parent().show(100);	
		}
	});
	if($(this).hasClass('text-deco-toggle')) {
		$('.post-'+$(this).attr('id')).show(100);
	} else {
		$('.post-'+$(this).attr('id')).hide(100);
	}
	$(this).toggleClass('text-deco-toggle');
	
	return false;
});

$(document).on('change', '#page', function(){
	alert($('#page').position().top);
	return false;
});

$(document).ready(function() {
	$('.newpostbtn').click(function() {
		$('#post-no').val("0");
		$('#newpostform')[0].reset();
		$('#newpost, #newpostback').show();
		return false;
	});
	
	$(document).mouseup(function (e){
	    if(e.target.id == "newpostback"){
	    	$('#newpost, #newpostback').fadeOut(200);
	    }
	    return false;
	});
	
	$(window).scroll(function () {
		var page = $('#page').val();
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			if(page==0){
				return;
			}
			$.ajax({
				url: 'myMoreList',
				type: 'POST',
				contentType : 'text/plain; charset=utf-8;',
				data: $('#page').val(),
				dataType: 'json',				
				success: function(data) {
					if(data.length>0){
						for(var i = 0 ; i < data.length ; i++){
							$('section').append(dataToHtml(data[i]));
						}
						
						$('#page').val(++page);
					} else {
						alert('더 이상 불러올 포스트가 없습니다');
						$('#page').val(0);
					}
				},
				error: function() {
					alert('오류가 발생했습니다. 잠시 후 다시 시도해주세요');	
				}
			});
			
	    }
		return false;
	});
})
function dataToHtml(data){
	var html = '';
	html += '<article class="post-border'+data.openType+'">'; 
	html += '<div class=post-head data-postno="'+ data.no +'">'; 
	html += '<div class="writer">';
	html += '<a href="#">';
	html += '<img class = "profilepic profile-border'+data.followType+'" src="resources/upload/profile/' + data.profilepic + '">';
	html += '<span class="postname">' + data.name+ '</span>';
	html += '</a>';
	html += '<span class="postdate">';
	html += data.postDate.substring(0, 4)+'년'+data.postDate.substring(4, 6)+'월'+data.postDate.substring(6, 8)+'일<br>';
	html += data.postDate.substring(8, 10)+'시'+data.postDate.substring(10, 12)+'분';
	html += '</span>';
	html += '</div>';
	html += '<div class="title">';
	html += '<span>'+data.title+'</span><span class="view-icon">▼</span>';
	html += '</div>';
	html += '</div>';
	html += '<div class="post-body">';
	html += '<div class="contents">';
	html += '<pre>' + data.content +'</pre>';
	html += '</div>';
	html += '<div class="like">';
	html += '<span class="like-cnt"></span>';
	html += '<input type="button" class="like-btn" value="좋아요">';
	if(data.memberNo == loginNo) {
		html += '<input type="button" class="mod-btn" value="수정">';	
		html += '<input type="button" class="del-btn" value="삭제">';
	}
	html += '<div style="clear: both;"></div>';
	html += '</div>';
	html += '<div class="reply">';
	html += '<div class="reply-head">';
	html += '<span>전체 댓글</span><span class="reply-cnt"></span>';
	html += '<input type="button" class="refresh-reply" value="새로고침">';
	html += '<input type="button" class="reply-display" value="댓글 닫기▲" style="border-right: 1px solid #95a5a6;" >';
	html += '</div>';
	html += '<div class="reply-body">';
	html += '</div>';
	html += '<form class="replyform">';
	html += '<div class="reply-fotter">';
	html += '<textarea class="reply-comment-input-area" name="replycomment" placeholder="다른 사람에게 불쾌감을 주는 내용은 삭제될 수 있습니다" required></textarea>';
	html += '<input class="reply-comment-input-btn" type="button" value="등록">';
	html += '</div></form>';
	html += '</div></div>';
	return html;
}

$(document).on("click", ".title", function() {
	var error = 1;
	var postNo = $(this).parent().data("postno");
	var title = $(this);
	if(title.data("readalreay")!=1){
		$.ajax({
			url: "detailpost",
			data: "postNo=" + postNo,
			type: "POST",
			dataType: "JSON",
			
			success: function(result) {
				// 좋아요 개수 표시
				title.parent().next().children(".like").children(".like-cnt").text(result.likeCnt);
				// 좋아요 된 상태인지 아닌지 표시
				if(result.isLike){
					title.parent().next().children(".like").children(".like-cnt").addClass("cnt-in-like");
					title.parent().next().children(".like").children(".like-btn").val("좋아요 취소");
					title.parent().next().children(".like").children(".like-btn").addClass("in-like");
				}
				var reply = result.replyList;
				// 댓글 갯수 출력
				title.parent().next().children(".reply").children(".reply-head").children(".reply-cnt").text(reply.length+"개")
				// 댓글 출력
				title.parent().next().children(".reply").children(".reply-body").html("");
				for(var i = 0 ; i < reply.length ; i++){
					title.parent().next().children(".reply").children(".reply-body").append(appendReply(reply[i]));
				}
				title.attr("data-readalreay", "1");
			}, error: function() {
				alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요");
			}
		})
	}
	if(error){
		$(this).parent().next().slideToggle({
		       direction: "down"
		   }, 100);
		$(this).children('.view-icon').text($(this).children('.view-icon').text()=="▼"?"▲":"▼");
	}
})

function appendReply(reply) {
	var html = "";
	html += '<div class="reply-unit-wrapper">';
	html += '<div class="reply-writer" data-memberno="'+ reply.memberNo +'">'+ reply.memberName +'</div>';
	html += '<div class="reply-comment"><pre>' + reply.comments + '</pre></div>';
	html += '<div class="reply-date">';
	if(reply.memberNo == loginNo){
		html += '<button class="delete-reply" data-replyno="' + reply.replyNo +'">';
		html += '<span style="font-size: 4px;line-height: 1.5;vertical-align: top;">x</span>';
		html += '</button>&nbsp;&nbsp;';
	}
	html += '<span>' + reply.regDate.substring(2, 4)+'-'+reply.regDate.substring(4, 6)+'-'+reply.regDate.substring(6, 8);
	html += '&nbsp;' + reply.regDate.substring(8, 10)+':'+reply.regDate.substring(10, 12)+'</span>';
	html += '</div>';
	html += '</div>';
	return html;	
}

$(document).on("click", ".like-btn", function() {
	var error = 1;
	var postNo = $(this).parent().parent().prev().data("postno");
	var likeBtn = $(this);
	$.ajax({
		url: "postlike",
		data: "postNo=" + postNo,
		dataType : "text",
		success: function(result) {
			likeBtn.prev().text(result);
		},
		error: function() {
			alert("error");
			error = 0;
		}
	});
	if(error){
		$(this).toggleClass("in-like");
		$(this).prev().toggleClass("cnt-in-like");
		$(this).val($(this).val()=="좋아요"?"좋아요 취소":"좋아요");
	}
	return false;
})
$(document).on("click", ".reply-display", function() {
	$(this).parent().next().slideToggle({
	       direction: "down"
	   }, 100);
	$(this).val($(this).val()=="댓글 닫기▲"?"댓글 보기▼":"댓글 닫기▲");
})
$(document).on("click", ".refresh-reply", function() {
	var postNo = $(this).parent().parent().parent().prev().data("postno");
	var refreshBtn = $(this);
	$.ajax({
		url: "detailpost",
		data: "postNo=" + postNo,
		type: "POST",
		dataType: "JSON",
		
		success: function(result) {
			// 좋아요 개수 표시
			refreshBtn.parent().parent().prev().children(".like-cnt").text(result.likeCnt);
			var reply = result.replyList;
			// 댓글 갯수 출력
			refreshBtn.prev().html("&nbsp;&nbsp;"+reply.length+"개")
			// 댓글 출력
			refreshBtn.parent().next().html("");
			for(var i = 0 ; i < reply.length ; i++){
				refreshBtn.parent().next().append(appendReply(reply[i]));
			}
		}, error: function() {
			alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요");
		}
	})
})

$(document).on("click", ".delete-reply", function() {
	var title = $(this).parent().parent().parent().parent().parent().prev();
	var postNo = title.data("postno");
	var replyNo = $(this).data("replyno");
	var deleteBtn = $(this);
	var replyBody = $(this).parent().parent().parent();
	$.ajax({
		url: "deletereply",
		data: "postNo=" + postNo + "&replyNo=" + replyNo,
		type: "POST",
		dataType: "JSON",
		success: function(result) {
			replyBody.prev().children(".reply-cnt").text(result.length + "개");
			// 댓글 출력
			replyBody.html("");
			for(var i = 0 ; i < result.length ; i++){
				replyBody.append(appendReply(result[i]));
			}
		}, error: function() {
			alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요");
		}
	});
	return false;
})

$(document).on("submit", ".replyform", function() {
	var postNo = $(this).parent().parent().prev().data("postno");
	var comments = $(this).children('.reply-fotter').children('.reply-comment-input-area');
	
	var form = $(this);
	$.ajax({
		url: "newreply",
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify({
			postNo: postNo,
			comments: comments.val()
		}),
		dataType: "JSON",
		success: function(result) {
			form.prev().prev().children(".reply-cnt").text(result.length+"개");
			if(result){
				form.prev().html("");
				for(var i = 0 ; i < result.length ; i++){
					form.prev().append(appendReply(result[i]));
				}
			}
		}, error: function() {
			alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요");
		}
	});
	comments.val("");
})

$(document).on("click", ".mod-btn", function() {
	modArticle = $(this).parent().parent().parent();
	var postNo = $(this).parent().parent().prev().data("postno");
	$.ajax({
		url: "getpost",
		type: "post",
		data: "postNo=" + postNo,
		dataType: "json",
		
		success: function(result) {
			$("#post-no").val(result.no);
			$("#post-title").val(result.title);
			$("#post-openType-"+result.openType).prop("checked", true)
			$("#post-content").val(result.content);
			$('#newpost, #newpostback').show();
		},
		error: function() {
			alert("error");
		}
	})
	
})

$(document).on("keyup", ".reply-comment-input-area", function() {
	$(this).css('height', 'auto' );
    $(this).height( this.scrollHeight );
})

function newPostChk() {
	var postNo = $("#post-no").val();
	if(postNo==0){
		$("#newpostform").submit();
		return true;
	} else {
		modPost();
		return false;
	}
}

function modPost(){
	var formData = $("#newpostform").serialize();
	$.ajax({
		url: "modpost",
		post: "post",
		data: formData,
		dataType: 'json',
		
		success: function(result) {
			modArticle.children('.post-head').children('.title').children(':first').text(result.title);
			modArticle.children('.post-body').children('.contents').children('pre').text(result.content);
			modArticle.attr('class','post-border'+result.openType);
			$('#newpost, #newpostback').fadeOut(200);
		},
		error: function() {
			alert("error");
		}
	});
	return false;
}

$(document).on("click", ".del-btn", function() {
	var delArticle = $(this).parent().parent().parent();
	var postNo = $(this).parent().parent().prev().data("postno") 
	$.ajax({
		url: "delpost",
		type: "post",
		data: "postNo="+postNo,
		dataType: "text",
		
		success: function() {
			delArticle.slideUp("normal", function() { delArticle.remove(); });
		},
		error: function() {
			alert("error");
		}
	});
})

</script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="main">
		<div id="bodywrapper">
			<section>
			<c:forEach var="post" items="${initialList }">
				<article class="post-border${post.openType}">
					<div class="post-head" data-postno="${post.no }">
						<div class="writer">
							<a href="#">
								<img class="profilepic profile-border${post.followType }" src="resources/upload/profile/${post.profilepic}">
								<span class="postname">${post.name }</span>
							</a>
							<span class="postdate">
								${post.postDate.substring(0, 4)}년 ${post.postDate.substring(4, 6)}월 ${post.postDate.substring(6, 8)}일<br>
								${post.postDate.substring(8, 10)}시 ${post.postDate.substring(10, 12)}분
							</span>
						</div>
						<div class="title">
							<span>${post.title }</span><span class="view-icon">▼</span>
						</div>
					</div>
					<div class="post-body">
						<div class="contents">
							<pre>${post.content }</pre>
						</div>
						<div class="like">
							<span class="like-cnt">10</span>
							<input type="button" class="like-btn" value="좋아요">
							<c:if test="${post.memberNo==login.no}">
							<input type="button" class="mod-btn" value="수정">
							<input type="button" class="del-btn" value="삭제">
							</c:if>
							<div style="clear: both;"></div>
						</div>
						<div class="reply">
							<div class="reply-head">
								<span>전체 댓글&nbsp;&nbsp;</span><span class="reply-cnt"></span>
								<input type="button" class="refresh-reply" value="새로고침">
								<input type="button" class="reply-display" value="댓글 닫기▲" style="border-right: 1px solid #95a5a6;" >
								
							</div>
							<div class="reply-body">
							</div>
							<form class="replyform" onsubmit="return false;">
							<div class="reply-fotter">
								<textarea class="reply-comment-input-area" name="replycomment" placeholder="다른 사람에게 불쾌감을 주는 내용은 삭제될 수 있습니다" required></textarea>
								<input class="reply-comment-input-btn" type="submit" value="등록">
							</div>
							</form>
						</div>
					</div>
				</article>
			</c:forEach>
			<input type="hidden" id="page" name="page" value="1">
			</section>

			<aside>
				<div id="profile">
					<img id="asideprofilepic" src="resources/upload/profile/${login.profilepic}">
					<span id="profilespan">${login.name }</span>
				</div>
				<ul class="menu">
					<li>Post</li>
					<li class="newpostbtn">새 포스트</li>
					<li class="writer-filter" id="border0" style="color: #546de5;">내 포스트</li>
					<li class="writer-filter" id="border1" style="color: #f8a5c2;">맞팔의 포스트</li>
					<li class="writer-filter" id="border2" style="color: #00cec9;">팔로잉의 포스트</li>
				</ul>
				<ul class="menu">
					<li>OpenType</li>
					<li class="type-filter" id="border0" style="color: #546de5;">내 페이지 공개 포스트</li>
					<li class="type-filter" id="border1" style="color: #f8a5c2;">맞팔 공개 포스트</li>
					<li class="type-filter" id="border2" style="color: #00cec9;">팔로워 공개 포스트</li>
					<li class="type-filter" id="border3" style="color: #1e272e;">전체 공개 포스트</li>
				</ul>
			</aside>
		</div>
	</div>
	<div id="newpostback"></div>
	<div id="newpost">
		<form id="newpostform" action="newpost" method="post" autocomplete="off">
			<input type="hidden" id="post-no" name="no" value="0">
			<input type="hidden" id="member-no"  name="memberNo" value="${login.no}">
			<table>
				<tr>
					<td style="text-align: center;">제목</td>
					<td><input type="text" id="post-title" name="title" required size="40"></td>
				</tr>
				<tr>
					<td style="text-align: center;">공개범위</td>
					<td>
						<input type="radio" id="post-openType-0" name="openType" value="0" required> 내 페이지에서만 공개<br>
						<input type="radio" id="post-openType-1" name="openType" value="1" required> 서로 팔로우에게 공개<br>
						<input type="radio" id="post-openType-2" name="openType" value="2" required> 팔로워에게 공개<br>
						<input type="radio" id="post-openType-3" name="openType" value="3" required> 전체 공개
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<pre><textarea id="post-content" name="content" rows="20" cols="60" required></textarea></pre>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input class="post-regist-btn" type="button" onclick="newPostChk();" value="등록">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>