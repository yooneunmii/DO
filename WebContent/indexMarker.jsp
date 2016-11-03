<%@page import="com.dev.doodle.dao.ParagraphDAO"%>
<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.vo.Favor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% List<Favor> bestList = FavorDAO.getDAO().selectBest();

	//List얻어오기-_-l p h
	Paragraph paragraph1 = new Paragraph(1,5);
	Paragraph paragraph2 = new Paragraph(6,10);
	
	List<Paragraph> hotList1 = ParagraphDAO.getDAO().selectRealTime(paragraph1);
	List<Paragraph> hotList2 = ParagraphDAO.getDAO().selectRealTime(paragraph2);
	
%>
<%
	User login = (User) session.getAttribute("loginUser");
	if (login!=null) {
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>index</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/noto.sans.korea.css" />
<link rel="stylesheet" href="css/header.css" />
<link rel="shortcut icon" href="img/favicon1.ico">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
/*font-family: 'Nanum Myeongjo', serif;*/
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
/*font-family: 'Nanum Pen Script', cursive;*/
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
/*font-family: 'Jeju Gothic', sans-serif;*/

/*풋터 시작*/
#footer {
	width: 100%;
	height: 50px;
	font: 400 15px 'bon', sans-serif;
	color: #333;
	background: #fff;
	text-align: center;
	border-top: 1px solid #eee;
	position: fixed;
	bottom: 0;
	z-index: 99;
}

#footer li {
	line-height: 50px;
	margin-right: 10px;
	display: inline-block;
}

#footer li:last-child {
	margin-right: 0;
}

#footer li a {
	text-decoration: none;
	color: #333;
}
/*여기까지 헤더랑 풋터 끝*/

#index {
	width: 1000px;
	min-height: 400px;
	margin: auto;
	padding-top: 81px;
	position: relative;
}

#realTimeHot {
	padding: 0;
	width: 800px;
	height: 385px;
	position: relative;
	top: 0;
}

#realTimeHot li {
	margin-bottom: 5px;
	width:798px;
	height: 70px;
	border: 1px solid #eee;
	background: #fff;
	animation: move 20s ease infinite;
}

#realTimeHot li a {
	width:780px;
	height: 50px;
	padding:10px;
	display: block;
	font: 300 24px 'Nanum Pen Script', cursive;
}

@keyframes move { 0%{transform: rotateX(0deg)}
				 98.99999999999999999%{transform:rotateX(0deg)}
				 100%{transform:rotateX(720deg)}}
				 
#realTimeHot ol li:last-child {
	margin-bottom: 0;
}

#index a {
	text-decoration: none;
	color: #333;
}

#best {
	width: 800px;
	height: 120px;
	margin: auto;
	position: absolute;
	left: 100px;
	top: 500px;
	text-align: center;
	font: 500 22px 'Nanum Myeongjo', serif;
	z-index: 2;
	overflow: hidden;
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
}

.best {
	width: 760px;
	height: 120px;
	/*제목이 길때 (...이 나타남)*/
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	line-height: 1.2em;
	margin:auto;
	line-height: 120px;
	z-index: 1;
	opacity: 0;
	position: absolute;
	left: 20px;
	top: 0;
}

.best.top {
	z-index: 2;
	opacity: 1;
	transition: 6s ease 2s;
}

.best.top.move {
	left: 500px;
	transition: opacity .8s ease, left 1.4s
		cubic-bezier(.08, -0.2, .83, .67);
	opacity: 0;
}
.best.top {
	z-index: 2;
	opacity: 1;
	transition: 6s ease 1s;
}

.best.top.move {
	left: 500px;
	transition: opacity .8s ease, left 1.4s
		cubic-bezier(.08, -0.2, .83, .67);
	opacity: 0;
}

#bestBackground {
	width: 800px;
	height: 120px;
	position: absolute;
	left: 100px;
	top: 500px;
	z-index: 1;
	background-image: url(img/4.jpg);
	opacity: 0.2;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.hide {
	display: none;
}

#pageBtn {
	position: absolute;
	right: 0;
	bottom: -20px;
	font-size: 10px;
}

#page1 a, #page2 a {
	width: auto;
	height: 50px;
	display: block;
}

#page1 li:hover, #page2 li:hover {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

#markerWrap {
	width: 800px;
	height: 395px;
	position: relative;
	margin: auto;
}

#markerWrap #title span {
	font: 500 12px 'bon', sans-serif;
	text-align: right;
	line-height: 30px;
	color: #424242;
	position: absolute;
	display: block;
	padding: 5px;
	width: 90px;
	height: 30px;
	background-image: url(img/3.PNG);
	background-size: contain;
	box-shadow: 1px 1px 1px 0 rgba(0, 0, 0, 0.2), -5px 5px 20px 0
		rgba(0, 0, 0, 0.19);
	cursor: pointer;
}

#bookmark .markerList {
	width: 798px;
	height: 70px;
	position: relative;
	margin-bottom: 5px;
	border: 1px solid #eee;
	overflow: hidden;
	font-family: 'bon', sans-serif;
}

#bookmark .markerList:last-child {
	margin-bottom: 0;
}

#bookmark .markerList a {
	text-decoration: none;
	display:block;
	width: 800px;
	height: 70px;
}

#bookmark .markerList .markerTitle {
	width:778px;
	height:18px;
	padding : 10px 10px 3px 10px;
	text-align:right;
	font-weight : 500;
	font-size : 12px;
	color: #333;
}

#markerWrap #bookmark .markerList .markerContents {
	width:778px;
	height : 27px;
	padding : 0 10px 10px 10px;
	font: 300 14px 'Jeju Gothic', sans-serif;
	color: #9e9e9e;
	text-align:justify;
}

#markerWrap #marker {
	left: -100px;
	top: 0;
}

#markerWrap #main {
	/* opacity: .4; */
	left: -100px;
	top: 50px;
}

#markerWrap .noCheck {
	opacity: .4;
}

#plus {
	font: 500 15px 'bon', sans-serif;
	position: absolute;
	right: 0;
	bottom: -5px;
}

#newCandidate {
	width: 900px;
	position: absolute;
	left: 50px;
	top: 650px;
}

#newCandidate li {
	width: 900px;
	height: 140px;
	position: relative;
}

#newCandidate .sentenceWrap {
	border-bottom: 1px solid #eee;
}

#newCandidate .profileBox {
	width: 165px;
	height: 140px;
}

#newCandidate .profileBox .profileImage img {
	width: 80px;
	height: 80px;
	position: absolute;
	top: 30px;
	left: 0;
}

#newCandidate .profileBox .nickName {
	width: 80px;
	margin-left: 5px;
	font: 300 10px 'bon', sans-serif;
	color: #333;
	text-align: center;
	position: absolute;
	left: 85px;
	top: 0;
	line-height: 140px;
}

#newCandidate .sentenceBox {
	width: 650px;
	height: 80px;
	padding-top: 20px;
	margin: 0 10px;
	position: absolute;
	top: 0;
	left: 165px;
	font: 300 12px 'bon', sans-serif;
	color: #333;
}

#newCandidate .timeBox {
	position: absolute;
	width: 65px;
	top: 0;
	right: 0;
	font: 300 12px 'bon', sans-serif;
	color: #333;
	text-align: center;
	line-height: 140px;
}

#newCandidate .sentenceTitleBox {
	position: absolute;
	padding-bottom: 20px;
	bottom: 0;
	right: 80px;
	font: 300 12px 'bon', sans-serif;
}

#bookmark #noData {
	width: 798px;
	height: 378px;
	border:1px solid #eee;
	text-align:center;
	font: 500 24px 'bon', sans-serif;
	line-height: 380px;
}
</style>
</head>
<body>
	<%@include file="template/header.jsp"%>
	<div id="index">
		<div id="markerWrap">
			<div id="title">
				<span id="marker">Bookmark</span> <span id="main" class="noCheck">Main
					Page</span>
			</div>
			<!-- title end -->
			<div id="bookmark">
				
				
				
			</div>
			<!-- bookmark end -->
			<a href="bookmark.jsp" id="plus"><i class="fa fa-plus"></i> 북마크
					더보기</a>

			<div id="realTimeHot" class="hide">
				<ol id="page1">
				<% for(Paragraph paragraph : hotList1) { %>
				<li><a href="novelcont.jsp?no=<%=paragraph.getNo() %>"><%=paragraph.getContent() %></a></li>
				<% } %>
				</ol>
				<ol id="page2" class="hide">
				<% for(Paragraph paragraph : hotList2) { %>
				<li><a href="novelcont.jsp?no=<%=paragraph.getNo() %>"><%=paragraph.getContent() %></a></li>
				<% } %>	
				</ol>
				<div id="pageBtn">
					<button id="firstPage" class="btn">
						<i class="fa fa-square"></i>
					</button>
					<button id="secondPage" class="btn">
						<i class="fa fa-square-o"></i>
					</button>
				</div>
				<!-- pageBtn end -->
			</div>
			<!-- realTimeHot end -->
		</div>
		<!--markerWrap end -->

		<!--순서있는 리스트니까 ol로 썼음 / 아래 페이징 표시! -->

		<div id="best">
		<% for(Favor favor : bestList) { %>
			<div class="best"><%=favor.getContent() %></div>
		<% } %>	
		</div>
		<div id="bestBackground"></div>
		<div id="newCandidate">
			<ul>

			</ul>
		</div>
		<!--newCandidate end-->
	</div>
	<!--index end-->
	<%@include file="template/footer.jsp"%>
	<script src="js/jquery.js"></script>
	<script src="js/header.js"></script>
	<script src="js/underscore-min.js"></script>
	<script>
		_.templateSettings = {

			interpolate : /\<\@\=(.+?)\@\>/gim,

			evaluate : /\<\@(.+?)\@\>/gim,

			escape : /\<\@\-(.+?)\@\>/gim

		};

		$.ajax("getParagraph.jsp", {
			type : "post",
			dataType : "json",
			error : function(xhr, error, code) {
				alert("에러다");
			},
			success : function(json) {
			//alert("성공");
				var tmp = _.template($("#sentenceUpdate").html());

				$("#newCandidate ul").html(tmp({
					list : json
				}));
			}
		});
		
		$.ajax("getBookmarkMain.jsp", {
			type : "post",
			dataType : "json",
			error : function(xhr, error, code) {
				alert("에러");
			},
			success : function(json) {
				//alert("성공");
				var tmp = _.template($("#bookmarkList").html());

				$("#bookmark").html(tmp({
					listMain : json
				}));
			}
		});
		
		setInterval(function() {
			$("#page1").toggleClass("hide");
			$("#page2").toggleClass("hide");
			if ($("#page2").hasClass("hide")) {
				changeIClass(1);
			} else {
				changeIClass(2);
			}
		}, 20000);

		$("#firstPage").on("click", function() {
			$("#page1").removeClass("hide");
			$("#page2").addClass("hide");
			changeIClass(1);
		});

		$("#secondPage").on("click", function() {
			$("#page1").addClass("hide");
			$("#page2").removeClass("hide");
			changeIClass(2);
		});

		function changeIClass(test) {
			if (test == 1) {
				$("#firstPage i").attr("class", "fa fa-square");
				$("#secondPage i").attr("class", "fa fa-square-o");
			}
			if (test == 2) {
				$("#firstPage i").attr("class", "fa fa-square-o");
				$("#secondPage i").attr("class", "fa fa-square");
			}
		}

		$(window).scroll(function() {
			var height = $(window).scrollTop();

			if (height > 400) {
				$("#footer").removeClass("hide");
			}
			if (height < 400) {
				$("#footer").addClass("hide");
			}
		});

		var idx = 0;

		showBest();

		$(".best").on("transitionend", function(e) {

			var evt = e.originalEvent;

			var pName = evt.propertyName;

			var $this = $(this);

			if (pName == "opacity" && $this.hasClass("top")) {

				$(".best").eq(idx % 2).addClass("top");

				$(this).addClass("move");

			} else if (pName == "left") {

				$(this).attr("class", "best");

			}

		});

		function showBest() {

			$(".best").eq(idx++ % 2).addClass("top");

			setTimeout(showBest, 10000);

		}

		$(".profileBox").click(function() {
			window.open('porfile.jsp', 'user', 'scrollbars=yes,toolbar=no,resizable=yes,width=250,height=300,left=0,top=0');
		});

		
		
		
		$("#main").on("click", function() {
			$(this).removeClass("noCheck");
			$("#realTimeHot").removeClass("hide");
			$("#bookmark").addClass("hide");
			$("#plus").addClass("hide");
			$("#marker").addClass("noCheck");
		});

		$("#marker").on("click", function() {
			$(this).removeClass("noCheck");
			$("#bookmark").removeClass("hide");
			$("#plus").removeClass("hide");
			$("#realTimeHot").addClass("hide");
			$("#main").addClass("noCheck");
		});
		
		
		</script>

	<script type="text/template" id="sentenceUpdate">
			<@ $(list).each(function(){@>
				<li>
					<div class="sentenceWrap">
						<div class="profileBox">
							<a href="userpage.jsp" class="profileImage"><img
								src="profile/<@=this.profile@>" alt="프로필사진">
							</a> <a href="userpage.jsp" class="nickName"><@=this.nickName@></a>
						</div>
						<!--profileBox end -->
						<div class="sentenceTitleBox">
							<a href="" class="sentenceTitle">- <@=this.title@> 中에서</a> 
						</div>
						<!--sentenceTitleBox end -->
						<div class="sentenceBox">
							<a href=""><@=this.content@></a>
						</div>
						<!--sentenceBox end -->
						<div class="timeBox"><@=this.dateRegdate@></div>
						<!--timeBox end -->
					</div> <!--sentenceWrap end -->
				</li>
			<@ }) @>
	</script><!-- #newCandidate ul -->
	
	<script type="text/template" id="bookmarkList">
	<@ if(listMain.length==0) {@>
				<div id="noData">
						등록된 북마크가 없습니다.
					</div>
						<@ } else{@>
			<@ var i=0;   @>
		
	<@ $(listMain).each(function(){@>
<@if(i<5){ @>
	<div class="markerList">
					<a href="#"><div class="markerTitle">「<@=this.title@>」,  <@=this.regdate@>,  새 글 등록</div> <!-- markerTitle end --> <div
						class="markerContents"><@=this.content@></div>
					<!-- markerContents end -->
					</a>
				</div>
				<!-- markerList end -->
	<@ i++;}})} @>
	</script><!-- #boomark -->
	
</body>
</html>
<%
	} else {
		response.sendRedirect("indexMain.jsp");
	}
%>