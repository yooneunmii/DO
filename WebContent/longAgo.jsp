<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.vo.OldContent"%>
<%@page import="com.dev.doodle.dao.OldContentDAO"%>
<%@page import="java.util.Random"%>
<%@page import="com.dev.doodle.dao.OldDAO"%>
<%@page import="com.dev.doodle.vo.Old"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
User loginMember = (User)session.getAttribute("loginUser");

if(loginMember==null){
	response.sendRedirect("indexMain.jsp");
}else{
	
	OldContent oldContent= OldContentDAO.getDAO().bestSelect();
	if(oldContent!=null){
	FavorDAO dao=FavorDAO.getDAO();
	oldContent.setLike(dao.selectLike(oldContent.getNo()));
	oldContent.setUnlike(dao.selectUnlike(oldContent.getNo()));	
	}
	%>

 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>longAgo</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/noto.sans.korea.css" />
<link rel="stylesheet" href="css/dante-editor.css" />
<link rel="stylesheet" href="css/header.css" />
<style>
#loader {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .2);
	position: fixed;
	left: 0;
	top: 0;
	background-image: url("img/loader2.gif");
	background-repeat: no-repeat;
	background-position: center;
	display: none;
}




#longAgoWrap {
	width: 1000px;
	position: absolute;
	left: 50%;
	margin: 0 0 0 -500px;
	font: 300 16px 'bon', sans-serif;
}

#agoTitleBox {
	width: 100%;
	height: 500px;
	text-align: center;
	margin-bottom: 50px;
	
}

#agoTitleBg {
	position: absolute;
	top: 0;
	background-image: url("img/1624467.jpg");
	background-size: 100% 100%;
	background-repeat: no-repeat;
	background-position: center;
	height: 500px;
	width: 100%;
	position: absolute;
	opacity: .6;
	z-index: -1;
}

#agoTitleBox h2 {
	font: 300 16px 'bon', sans-serif;
	line-height: 500px;
	font-size: 70px;
	font-weight: 900;
	margin-top: -50px;
}

#longAgoWrap h3 {
	font-size: 30px;
	font-weight: 700;
	margin-top: 50px;
	text-align: center;
}

.sentenceWrap {
	width: 1000px;
	position: relative;
	display: inline-block;
	padding: 50px 0;
}

#bestSentenceWrap {
	border: 3px solid #ffea00;
	border-radius: 30px;
	margin-bottom: 50px;
}

.topicBox {
	width: 200px;
	height: 200px;
	position: absolute;
	top: 50%;
	right: -210px;
	margin-top: -100px;
	text-align: center;
	overflow: hidden;
	display: inline-block;
	transition: .6s ease;
	opacity: 0;
}

.topicBox.show {
	opacity: 1;
}

.topicBox img {
	width: 200px;
	height: 180px;
}

.topicBox p {
	font-size: 10px;
}

.profileBox {
	width: 200px;
	min-height: 100px;
	text-align: center;
	display: inline-block;
	position: absolute;
	bottom: 50%;
	margin: 0 0 -50px 0;
}

.profileBox .profile {
	display: inline-block;
	width: 80px;
	height: 78px;
	border: 1px solid #929292;
	border-radius: 50px;
	margin-left: 10px;
	position: absolute;
	left: 10px;
	bottom: 50%;
	margin: 0 0 -40px 0;
}

.profile img {
	width: 80px;
	height: 78px;
	border-radius: 50px;
}

.profileBox .nickName {
	line-height: 100px;
	position: absolute;
	right: 5px;
	display: inline-block;
	font-size: 12px;
	text-decoration: none;
	color: #9E9E9E;
}

.sentenceBox {
	width: 625px;
	display: inline-block;
	position: relative;
	left: 205px;
	padding: 30px 10px;
	white-space: pre-line;
}

.sentenceBox h4 {
	font-size: 20px;
	font-weight: 500;
	text-align: center;
}

.timeBox, #buttonBox {
	display: inline-block;
	position: absolute;
	right: 0px;
	width: 150px;
	height: 100%;
	text-align: center;
}

#buttonBox {
	width: 100px;
	text-align: center;
}

.timeBox time {
	display: inline;
	margin-top: -6px;
	position: absolute;
	top: 50%;
	font-size: 12px;
	color: #9E9E9E;
}



.favorBox {
	text-align: right;
	position: absolute;
	top: 50px;
	right: 0;
	z-index: 2;
}

.favorBox a {
	background: none;
	border: none;
	text-decoration: none;
	margin-left:10px;
}

.favorBox .like {
	color: #039BE5;
}

.favorBox .report {
	color: #F44336;
}

#writeBox {
	width: 1000px;
	position: relative;
	display: inline-block;
	margin-bottom:200px;
}

#editor {
	font: 300 16px 'bon', sans-serif;
}

#editor b {
	font-weight: 900;
}

#editor i {
	text-decoration: underline;
}

.postArticle {
	width: 625px;
	min-height: 200px;
	display: inline-block;
	position: relative;
	left: 250px;
	padding: 30px 10px;
	white-space: pre-line;
}

.postArticle .layoutSingleColumn {
	width: 625px;
}

.graf--p {
	margin-bottom: 0 !important;
}

.timeBox, #buttonBox {
	display: inline-block;
	position: absolute;
	right: 0px;
	width: 150px;
	height: 100%;
	text-align: center;
}

#buttonBox {
	width: 100px;
	text-align: center;
}

#buttonBox {
	height: 100%;
}

			#buttonBox form{
				position: relative;
				top:50%;
				margin-top: -50px;
			}
			#buttonBox button{
				border: none;
				border-radius:10px;
				background:#03C39C;
				color:#fff;
				padding: 10px 30px;
				cursor: pointer;
			}
			
.unlike{
	opacity:1;
	background-image: url("img/blind.png");
	background-size: 100% 100%;
	background-repeat: no-repeat;
	background-position: center;
	
}
.unlike:active{
	opacity:1;
	background:none;
	
}

</style>
</head>

<body>
	<%@include file="template/header.jsp"%>
	<div id="agoTitleBox">
		<div id="agoTitleBg"></div>
		<h2>옛날 옛적에</h2>
	</div>
	<div id="longAgoWrap">
	<%	if(oldContent!=null){ %>
		<h3>
			<i class="fa fa-hand-o-right"></i>과거 급제<i class="fa fa-hand-o-left"></i>
		</h3>
		<div id="bestSentenceWrap" class="sentenceWrap">
			<div class="topicBox">
				<img src="img/<%=oldContent.getImg() %>" alt="<%=oldContent.getOldName() %>">
				<p><%=oldContent.getOldName() %></p>
			</div>
			<div class="profileBox">
				<a href="userpage.jsp" class="profile"> <img
					src="img/<%=oldContent.getProfile() %>" alt="프로필사진">
				</a> <a href="userpage.jsp"class="nickName"><%=oldContent.getNickname() %></a>
			</div>
			<!--profileBox end -->
			<div class="favorBox">
				<p>
					<a href="insertFavorAgo.jsp?oldNo=<%=oldContent.getLike() %>&result=L" class="like">
						<i class="fa fa-thumbs-o-up"></i><%=oldContent.getLike() %>
					</a>
					<a href="insertFavorAgo.jsp?oldNo=<%=oldContent.getUnlike() %>&result=U" class="report">
						<i class="fa fa-exclamation-triangle"><%=oldContent.getUnlike() %></i>
					</a>
				</p>
			</div>
			<div class="sentenceBox">
				<%=oldContent.getContent() %>
			</div>
			<!--sentenceBox end -->
			<div class="timeBox">
				<time> <%=oldContent.getRegdate() %> </time>
			</div>
			<!--timeBox end -->
		</div>
		<!--sentenceWrap end -->
<%} %>


		<div id="longAgoContent">
			<ul>
			</ul>
			<script type="text/template" id="oldListTmp">
				<@$(oldContents).each(function() {@>
				<li>
					<div class="sentenceWrap"> 
						<div class="topicBox">
							<img src="img/<@=this.img@>" alt=<@=this.oldName@>>
							<p><@=this.oldName@></p>
						</div>

						<div class="profileBox">
							<a href="userpage.jsp"  class="profile"> <img
								src="img/<@=this.profile@>" alt="프로필사진">
							</a> <a href="userpage.jsp" class="nickName" class="profile"><@=this.nickname@></a>
						</div>
						<!--profileBox end -->
						<div class="favorBox">
							<p>
								<a href="insertFavorAgo.jsp?oldNo=<@=this.no@>&result=L" class="like">
									<i class="fa fa-thumbs-o-up"></i><@=this.like@>
								</a>
								<a href="insertFavorAgo.jsp?oldNo=<@=this.no@>&result=U" class="report">
									<i class="fa fa-exclamation-triangle"><@=this.unlike@></i>
								</a>
							</p>
						</div>
						<@if((this.unlike>=3&&this.like<3)||(this.like>=3&&this.like<this.unlike)){@>
							<div class="sentenceBox unlike">
						<@}else{@>
							<div class="sentenceBox">
						<@}@>
							<@=this.content@>
						</div>
						<!--sentenceBox end -->
						<div class="timeBox">
							<time><@=this.regdate@></time>
						</div>
						<!--timeBox end -->
					</div> <!--sentenceWrap end -->
				</li>

				<@});@>
			</script>
		</div>
		<!-- longAgoContent end-->

		<hr>

		<div id="writeBox">
			<div class="topicBox">
			</div>




			<div class="profileBox">
				<a href="userpage.jsp" class="profile"> <img
					src="img/<%=loginMember.getProfile() %>" alt="프로필사진">
				</a> <a href="userpage.jsp" class="nickName"><%=loginMember.getNickname()%></a>
			</div>
			<!--profileBox end -->
			<div id="editor">
			</div>
			<!--ransentenceBox end -->
			<div id="buttonBox">
					<form action="agoWrite.jsp" method="post">
							<button id="writeBtn">쓰 기</button>
						</form>
			</div>
			<!--timeBox end -->
		</div>
		
	<script type="text/template" id="topicTmp">
			<img src="img/<@=old.img@>" alt=<@=old.name@>>
			<p><@=old.name@></p>
	</script>
		
		
		
	</div>

	<div id="loader"></div>
	<!-- //loader -->

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
		var $loader = $("#loader");
		var name;
		var oldNo;
		var $longAgoContent= $("#longAgoContent ul");
		
		setInterval(function() {

			displayTopic("F");
			

			},500);
		
		
		var $window = $(window);

		var $topicBox = $(".topicBox");

		var sHeight = $window.height() / 2;

		$window.scroll(function() {

			var sTop = $window.scrollTop();

			$(".topicBox").each(function() {
				var temp = $(this).offset().top;

				var start = temp - sHeight;

				var end = temp;

				console.log(temp + ":" + start + ":" + end + ":" + sTop);

				if (sTop >= start && sTop < end) {
					$(this).addClass("show");
				} else {
					$(this).removeClass("show");
				}
			});

		});
		
		$("#writeBtn").click(function(e){
			
			var text=$(".layoutSingleColumn").text();
			
			var result=text.search(name);
				if(result==-1){
					alert("주제가 없습니다");
					e.preventDefault();
				}else{
					e.preventDefault();
					displayTopic("T");
					insertOldContent();
				}
			
		});
		
		
		

		editor = new Dante.Editor({
			el : "#editor",
			upload_url : "upload.jsp", //it expect an url string in response like /your/server/image.jpg or http://app.com/images/image.jpg
			upload_callback : function(json) {
				$(".graf-image:last").attr("src", json.src);
			},
			disable_title : true,
			store_url : "save.jsp",
			default_loading_placeholder : "img/ajax-loader.gif",
			store_interval : 2000,
			body_placeholder : "글을 잘 적어주세요",
			base_widgets : [ 'uploader' ]
		});
		editor.start();
		

		
		
		
		function insertOldContent(){
			$loader.show();

			$.ajax("insertOldContent.jsp", {
				type : "post",
				dataType : "json",
				data : {
					oldNo : oldNo
				},
				error : function(xhr, error, code) {
					alert(code);
				},
				success : function(json) {
					if (json.result) {
						displayoldContents();
					}
				}

			})
			$loader.fadeOut();
		}
		
	
		

		function displayTopic(write) {
			
			$loader.show();

			$.ajax("getOlds.jsp", {
				type : "post",
				dataType : "json",
				data : {
					write : write
				},
				error : function(xhr, error, code) {
					alert(code);
				},
				success : function(json) {
					var tmp = _.template($("#topicTmp").html());
					$("#writeBox .topicBox").html(tmp({
						old : json
					}));
					name=json.name;
					
					
					if(oldNo!=json.no){
						displayoldContents();
					}
					oldNo=json.no;
				}
			});
			$loader.hide();
		}	
		
		
		
		function displayoldContents() {
			
			$loader.show();

			$.ajax("getOldContents.jsp", {
				type : "post",
				dataType : "json",
				error : function(xhr, error, code) {
					alert(code);
				},
				success : function(json) {
					
					var tmp = _.template($("#oldListTmp").html());
					$longAgoContent.html(tmp({
						oldContents : json
					}));
				}
			});
			$loader.hide();
		}	
		
	</script>
</body>

</html>

<%}%>