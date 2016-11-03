<%@page import="com.dev.doodle.dao.ParagraphDAO"%>
<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@page import="java.util.Random"%>
<%@page import="com.dev.doodle.dao.OldDAO"%>
<%@page import="com.dev.doodle.vo.Old"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! Random random= new Random(); %>    
<% 

	User loginMember = (User)session.getAttribute("loginUser");

	if(loginMember==null){
		response.sendRedirect("indexMain.jsp");
	}else{

	List<Old> oldList = OldDAO.getDAO().selectList();
	
	int ranNum=random.nextInt(10);
	
	int ranSize=random.nextInt(450)+51;
	
	Old old=oldList.get(ranNum);
	
	Paragraph ranparagraph= ParagraphDAO.getDAO().ranSelect();

%>



<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>AllRandomGame</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/dante-editor.css" />
		<link rel="stylesheet" href="css/header.css" />
		<style>

			#allRandomGame {
				width: 1000px;
				position: absolute;
				left: 50%;
				margin: 61px 0 0 -500px;
				font: 300 16px 'bon',sans-serif;
			}
			h3{
				text-align: center;
				font-size:30px;
				margin-top:50px;
				text-shadow: #929292 5px 5px 5px;
			}
			#titleBox {
				text-align: center;
			}
			#titleBox h2 {
				font-size: 70px;
				color: #FF5722;
				text-shadow: #929292 5px 5px 5px;
			}
			#titleBox p {
				font-size: 18px;
			}
			#sentenceWrap,#editorBox {
				width: 1000px;
				position: relative;
				display: inline-block;
			}

			#changeBtn {
				font-family: bon, sans-serif;
				height: 20px;
				cursor: pointer;
				border: none;
				position: absolute;
				top: -21px;
				background: #03C39C;
				box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
				color: #fff;
				transition: .2s ease;
			}
			#changeBtn:hover {
				background: #33f3bC;
			}
			#changeBtn:active {
				box-shadow: none;
				transform: scale(0.9);
			}
			#profileBox {
				width: 200px;
				min-height: 100px;
				text-align: center;
				display: inline-block;
				position: absolute;
				bottom: 50%;
				margin: 0 0 -50px 0;
			}
			#profileBox #profileImage {
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
			#profileImage img {
				width: 80px;
				height: 78px;
			}
			#profileBox #nickName {
				line-height: 100px;
				position: absolute;
				right: 5px;
				display: inline-block;
				font-size: 12px;
				text-decoration: none;
				color: #9E9E9E;
			}

			#sentenceTitleBox {
				width: 1000px;
				text-align: right;
				font-size: 12px;
				text-decoration: none;
				color: #9E9E9E;
				position: relative;
				top: 0;
			}
			#sentenceTitleBox #sentenceTitle {
				font-size: 12px;
				text-decoration: none;
				color: #9E9E9E;
			}

			#ransentenceBox {
				width: 625px;
				display: inline-block;
				position: relative;
				left: 205px;
				padding: 30px 10px;
				white-space: pre-line;
			}
			#timeBox,#buttonBox {
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
			#timeBox time {
				display: inline;
				margin-top: -6px;
				position: absolute;
				top: 50%;
				font-size: 12px;
				color: #9E9E9E;
			}
			
			#selectBox{
				position: relative;
			}
			#topicBox{
				width: 250px;
				height: 250px;
				border: 1px solid #333;
				margin: 50px 50px;
				position: relative;
				text-align: center;
				box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
				display: inline-block;
				overflow: hidden;
				cursor: pointer;
				
			}
			.door{
				width: 125px;
				height: 250px;
				position: absolute;
				transform:rotate(0deg);
				transition: .6s cubic-bezier(0,1.01,1,.11) .1s;
				line-height: 250px;
				font-size: 30px;
				color: #FF5722;
				text-shadow: #FF5722 5px 5px 10px;
				
			}
			.open #left{
				/*transform:perspective(1900px) rotateY(-150deg);*/
				left: -100px;
			}
			.open #right{
				/*transform:perspective(1000px) rotateY(150deg);*/
				right: -100px;
			}
			#left{
				background-image: url("img/문좌.PNG");
				background-size: cover;
				background-repeat: no-repeat;
				background-position: center;
				left: 0;
				transform-origin: 0% 50%;
			}
			#right{
				background-image: url("img/문우.PNG");
				background-size: cover;
				background-repeat: no-repeat;
				background-position: center;
				right: 0;
				transform-origin: 100% 50%;
			}
			
			#topicBox img{
				width: 200px;
				height: 230px;
			}
			#topicBox p{
				font-size: 10px;
			}
			#CounterBox{
				width: 250px;
				height: 250px;
				border: 1px solid #333;
				position: absolute;
				top:50px;
				right: 50px;
				text-align: center;
				box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
				display: inline-block;
				line-height: 250px;
				font-size: 22px;
				color: #4CAF50;
				text-shadow: #4CAF50 5px 5px 10px;
				overflow: hidden;
				cursor: pointer;
				
			}
			#inputBox{
				width: 1000px;
				min-height: 300px;
				text-align: center;
				margin-top: 50px;
				position: relative;
			}
			
			#editor{
				font: 300 16px 'bon',sans-serif;
			}
			#editor b{
				font-weight: 900;
			}
			#editor i{
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
						  
			.postArticle .layoutSingleColumn{
				width: 625px;
			}
			
			
			.graf--p {
				margin-bottom: 0 !important;
			}
			
			#buttonBox{
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
			
			
			
			
		</style>
	</head>

	<body>
	<%@include file="template/header.jsp"%>
	
		<div id="allRandomGame">
			<div id="titleBox">
				<h2>All RandomGame</h2>
				<p>
					다음의 랜덤한 문장을 이어주는 놀이입니다.
				</p>
			</div><!--titleBox end -->


			
		<div id="selectBox">
		<div id="topicBox" class="doorBox">
			<div id="left" class="door">주</div>
			<div id="right" class="door">제</div>
			<img src="img/<%=old.getImg() %>" alt="<%=old.getName()%>">
			<p><%=old.getName()%></p> 
		</div><!--topicBox end -->
		
		<div id="CounterBox" class="doorBox">
			<div id="left" class="door">글</div>
			<div id="right" class="door">수</div>
			<p>공백포함 <%=ranSize %>자 이하</p>
		</div><!--CounterBox end -->

		</div><!--selectBox end -->

			<div id="sentenceWrap">
				<button id="changeBtn">
					<i class="fa fa-refresh"></i>문장 바꾸기
				</button>
				<div id="profileBox">
					<a href="userpage.jsp" id="profileImage"  class="profile"> 
						<img src="img/muji.png" alt="프로필사진"> 
						</a>
					<a href="userpage.jsp" id="nickName"  class="profile"><%=ranparagraph.getNickname() %></a>
				</div><!--profileBox end -->
				
				<div id="sentenceTitleBox">
					<a href="noverContent.html?no=<%=ranparagraph.getBoardNo() %>" id="sentenceTitle"><%=ranparagraph.getTitle() %></a> 中에서
				</div><!--sentenceTitleBox end -->
				<div id="ransentenceBox">
				<%=ranparagraph.getContent() %>
				</div><!--ransentenceBox end -->
				<div id="timeBox">
					<time>
						<%=ranparagraph.getRegdate() %>
					</time>
				</div><!--timeBox end -->
			</div><!--sentenceWrap end -->		
			
			<hr>
			<div id="editorBox">
				<div id="profileBox">
					<a href="userpage.jsp" id="profileImage"  class="profile"> 
						<img src="img/<%=loginUser.getProfile() %>" alt="본인프로필사진"> 
						</a>
					<a href="userpage.jsp" id="nickName"  class="profile"><%=loginUser.getNickname() %></a>
				</div><!--profileBox end -->
				<div id="editor">
				</div><!--ransentenceBox end -->
				<div id="buttonBox">
					<form action="rangameWrite.jsp" method="post">
						<input type="hidden" name="no" value="<%=ranparagraph.getBoardNo() %>" />
							<button id="writeBtn">쓰 기</button>
						</form>
				</div><!--timeBox end -->
			</div><!--editorBox end -->		





		</div><!--allRandomGame end -->

		<script src="js/jquery.js"></script>
		<script src="js/underscore-min.js"></script>
		<script src="js/sanitize.js"></script>
		<script src="js/dante-editor.js"></script>
		<script src="js/header.js"></script>
		<script>
			
		
		
			var topicOn=false;
			var sizeOn=false;
			
			$profile = $(".profile");
			$profile.click(function(e) {
				e.preventDefault();
			});
			
			
			$(".doorBox").click(function() {
			  var $this=$(this);
			  $this.toggleClass("open");
			  
			  if($this.attr("class").search("open")!=-1){
				  if($this.index()==0){
					  sentenceOn=true;
				  }else{
					  sizeOn=true;
				  }
			  }else{
				  if($this.index()==0){
					  sentenceOn=false;
				  }else{
					  sizeOn=false;
				  }
				 
			  }
			});

			
			
			
			editor = new Dante.Editor({
				el:"#editor",
	  	        upload_url: "upload.jsp", //it expect an url string in response like /your/server/image.jpg or http://app.com/images/image.jpg
	  	        upload_callback :function(json) {
	  	        	$(".graf-image:last").attr("src",json.src);
	  	        },
	  	        disable_title :true,
	  	        store_url:"save.jsp",
	  	        default_loading_placeholder:"img/ajax-loader.gif",
	  	        store_interval:2000,
	  	        body_placeholder:"글을 잘 적어주세요",
	  	        base_widgets:['uploader']
				});
			editor.start();
			
			$("#changeBtn").click(function(e){
				location.reload(true);
				
			});
			
			$("#writeBtn").click(function(e){
				
				var text=$(".layoutSingleColumn").text();
				
				var result=text.search("<%=old.getName()%>");
				
				var length=text.length;
				
				if(topicOn==true&&sizeOn==true){

					if(result==-1||length>=<%=ranSize %>){
						alert("주제가 없거나 글자수를 넘었습니다");
						e.preventDefault();
					}
					
				}else if(topicOn==true&&sizeOn==false){
					if(result==-1){
						alert("주제가 없습니다");
						e.preventDefault();
					}

				}else if(topicOn==false&&sizeOn==true){
					if(length>=<%=ranSize %>){
						alert("글자수를 넘었습니다");
						e.preventDefault();
					}
					
				}
				
			});
			
		</script>
	</body>

</html>
<%}%>