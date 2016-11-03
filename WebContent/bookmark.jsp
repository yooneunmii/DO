<%@page import="com.dev.doodle.dao.BookmarkDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.dev.doodle.vo.Bookmark"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">

<title>끄적끄적</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/noto.sans.korea.css" />
<link rel="stylesheet" href="css/dante-editor.css" />
<link rel="stylesheet" href="css/header.css" />
<link rel="shortcut icon" href="img/favicon1.ico">
<style>
#userPageWrap {
	width: 1250px;
	position: relative;
	top: 60px;
	margin: auto;
}

#userPage {
	width: 1000px;
	margin-top: 20px;
	height: 800px;
	padding-top: 50px;
	position: absolute;
	right: 0;
	top: 0;
}

#sideBar {
	width: 250px;
	height: 800px;
	position: absolute;
	top: 46px;
	left: -250px;
}

#sideBar #user {
	width: 240px;
	height: 300px;
	border: 5px dotted #E1E1E1;
	border-radius: 20px;
	text-align: center;
	margin-bottom: 15px;
}

#user img {
	width: 200px;
	height: 200px;
	border-radius: 100px;
	margin: 20px 0;
}

#user p {
	margin: 10px;
	font-size: 25px;
	font-weight: 700;
	color: #57AD68;
	transition: .2s ease;
	cursor: pointer;
}

#user p:hover {
	opacity: .6;
}

#sideBar #intro {
	width: 220px;
	height: 180px;
	border: 5px dotted #5BD974;
	padding: 10px;
	margin-bottom: 20px;
	position: relative;
}

#intro::before {
	content: "인사말";
	font-size: 15px;
	font-weight: 500;
	color: #424242;
	opacity: .7;
}

#sideBar #neighbor {
	width: 250px;
	height: 50px;
}

#neighbor select {
	width: 250px;
	height: 40px;
	font-family: bon, sans-serif;
	font-size: 20px;
	border: 5px solid #5BD974;
}

#neighbor select:active {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

#intro #introBtn {
	font-family: bon, sans-serif;
	width: 50px;
	height: 25px;
	background: #FFAB40;
	border: none;
	border-radius: 25px;
	text-align: center;
	line-height: 25px;
	position: absolute;
	bottom: 10px;
	right: 10px;
}

#userContent {
	border: 1px dotted #BDBDBD;
	width: 1000px;
	min-height: 600px;
}

#userContent #list {
	width: 350px;
	position: absolute;
	top: 0;
	right: 0;
}

#userContent #list a {
	text-decoration: none;
	display: inline-block;
	width: 100px;
	height: 50px;
	line-height: 50px;
	text-align: center;
	background: #FFAB40;
	border-radius: 25px 25px 0 0;
	font-size: 18px;
	color: white;
	transition: .2s ease;
	opacity: .2;
}

#userContent #list #check1 {
	opacity: 1;
	background: #FF5252;
}

#userContent #list #check2 {
	background: #FFC107;
}

#userContent #list #check2:hover, #userContent #list #check3:hover {
	opacity: 1;
}

#userContent #list #check3 {
	background: #3F51B5;
}

#userContent .writer {
	width: 700px;
	min-height: 50px;
	margin: 20px;
	position: relative;
	padding: 30px 15px;
	transition: .3s ease;
	box-shadow: inset 0 0 1em gray;
}

#userContent .writer:hover {
	box-shadow: inset 0 0 1.5em black;
}

#userContent .writer:active {
	transform: scale(1.1);
}

#userContent .date {
	position: absolute;
	min-width: 300px;
	height: 30px;
	line-height: 30px;
	font-size: 15px;
	background: white;
	text-align: center;
	top: -14px;
}

#userContent #writerList {
	width: 900px;
	margin: auto;
}

#bookmark {
	width: 900px;
	min-height:600px;
	margin: auto;
	position: relative;
	left: 0;
	top: 0;
}

#userContent .writer a {
	text-decoration: none;
	color: #333333;
	font-size: 15px;
}

#userContent .writer p {
	opacity: .7;
	transition: .4s ease;
}

#userContent .writer p:hover {
	opacity: 1;
}

#bookmark .markerList {
	width: 900px;
	height: 100px;
	margin: 20px auto;
	position: relative;
	border: 2px solid #eee;
}

#bookmark .markerList a {
	text-decoration: none;
	width: 900px;
	height: 100px;
	display: block;
}

#bookmark .markerTitle {
	font: 500 12px 'bon', sans-serif;
	color: #333;
	position: absolute;
	left: 10px;
	top: 10px;
}

#bookmark .markerList a span {
	width: 880px;
	height: 60px;
	text-align: justify;
	margin: auto;
	font: 300 18px 'bon', sans-serif;
	color: #9e9e9e;
	position: absolute;
	top: 30px;
	left: 10px;
}

#button {
	position: absolute;
	right: 10px;
	top: 5px;
	width: 70px;
	height: 27px;
}

#button .markerBtn {
	text-align: right;
	font-size: 21px;
	color: #333;
	border: none;
	cursor: pointer;
	background: none;
	padding: 0;
}

#noData {
	width:270px;
	height:40px;
	line-height:40px;
	margin : auto;
	padding-top:270px;
	font: 500 24px 'bon', sans-serif;
}
</style>
</head>

<body>
	<%@include file="template/header.jsp"%>
	<div id="userPageWrap">
		<div id="userPage">
			<div id="sideBar">
				<div id="user">
					<img src="img/20150223_003742_1218183869.gif">
					<p>
						hen7705 <i class="fa fa-plus" title="이웃으로추가"></i>
					</p>
				</div>
				<div id="intro">
					<pre>저의 페이지에 와주셔서
정말감사해용
디오부인은미가</pre>




					<button id="introBtn">수정</button>
				</div>
				<div id="neighbor">
					<select>
						<option>이웃보기</option>
						<option>김종인</option>
						<option>오세훈</option>
						<option>박찬열</option>
						<option>김준면</option>
						<option>변백현</option>
					</select>
				</div>
				<a href="#">개인정보수정</a>
			</div>
			<div id="userContent">
				<div id="list">
					<a href="userPage.jsp" id="check2">유저페이지</a>
					<!--
					-->
					<a href="myWritten.jsp" id="check3">내가쓴글</a>
					<!--
					-->
					<a href="bookmark.jsp" id="check1">북마크</a>
					<!--
					-->
				</div>
				<!--list-->
				<div id="bookmark"></div>
				<!-- bookmark end -->
			</div>
			<!-- userContent end -->
		</div>
		<!-- userPage end -->
	</div>
	<!-- userPageWrap end -->

	<script src="js/jquery.js"></script>
	<script src="js/underscore-min.js"></script>
	<script src="js/sanitize.js"></script>
	<script src="js/dante-editor.js"></script>
	<script src="js/header.js"></script>

	<script>
		_.templateSettings = {

			interpolate : /\<\@\=(.+?)\@\>/gim,

			evaluate : /\<\@(.+?)\@\>/gim,

			escape : /\<\@\-(.+?)\@\>/gim

		};

		$.ajax("getBookmark.jsp", {
			type : "post",
			dataType : "json",
			error : function(xhr, error, code) {
				alert("로그인해주세요~!!");
			},
			success : function(json) {
				//alert("성공");
				var tmp = _.template($("#markerDivList").html());

				$("#bookmark").html(tmp({
					markerList : json
				}));
			}
		});
	</script>
	<script type="text/template" id="markerDivList">
			<@ if(markerList.length==0) {@>
				<div id="noData">
						등록된 북마크가 없습니다.
					</div>
						<@ } @>
			<@ $(markerList).each(function(){@>
						<div class="markerList">
						<a href="#"><div class="markerTitle">「<@=this.title@>」, <@=this.regdate@>, 새 글
								등록</div><!-- markerTitle end -->
								<div id="button">
							<button id="up" class="markerBtn" title="목록 위로 이동">
								<i class="fa fa-arrow-circle-up"></i>
							</button>
							<button id="down" class="markerBtn" title="목록 아래로 이동">
								<i class="fa fa-arrow-circle-down"></i>
							</button>
							<button id="delete" class="markerBtn" data-no="<@=this.no@>" title="삭제">
								<i class="fa fa-minus-circle"></i>
							</button>
						</div>
						<!-- button end -->
						<span><@=this.content@></span></a>
					</div>
					<!-- markerList end -->
	<@ }) @>
	</script>
</body>
</html>
