<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
  User user = (User)session.getAttribute("loginUser");
  
  
  
  %>
<!DOCTYPE html>
<html lang="ko">
	<head>

		<meta charset="utf-8">

		<title>끄적끄적</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/dante-editor.css"/>
		<link rel="stylesheet" href="css/header.css"/>
		<style>
			html {
				width: 100%;
				height: 100%;
				overflow-y:scroll;
			}
			body {
				width: 100%;
				height: 100%;
				font-family: bon, sans-serif;
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
#userPageWrap {
	width: 1250px;
	position: relative;
	top: 60px;
	margin: auto;
}
			#userPage #sideBar {

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
				box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
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
				width: 300px;
				position: absolute;
				top: 0px;
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
				transition:.3s ease;
				border:1px dotted #BDBDBD;
			}
				#userContent .writer:hover {
		
				
				box-shadow: 0 0 0.3em black ;
			}
			#userContent .writer:active{
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
			#userContent #writerList{
				
				width:800px;
				margin:auto;
			}
			#userContent .writer a{
				text-decoration: none;
				color:#333333;
				font-size:15px;
					
			}
			#userContent .writer p{
				opacity: .7;
				transition: .4s ease;
			}
			#userContent .writer p:hover{
				opacity: 1;
			}
	

		</style>
	</head>

	<body>
	<%@ include file="template/header.jsp" %>
	<div id="userPageWrap">
		<div id="userPage">
			<div id="sideBar">
				<div id="user">
					<img src="img/<%=user.getProfile()%>">
					<p>
						<%=user.getNickname()%>
						<i class="fa fa-plus" title="이웃으로추가"></i>
					</p>
				</div>
				<div id="intro">
					<p><%=user.getIntro()%></p>

					<button id="introBtn">
						수정
					</button>
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
					<a href="userPage.html" id="check2">유저페이지</a><!--
					--><a href="#"id="check1">내가쓴글</a><!--
					--><a href="#"id="check3">북마크</a><!--
					-->
				</div><!--list-->
				<div id ="writerList">
			
				
				
				</div><!--writerList-->
			</div>
		</div>
		</div>
		<script type="text/template" id="divTmp">
			<@ $(written).each(function() {@>
				<div class="writer">
					<div class="date">
						<@=this.regdate @> 「<@=this.title @>」,추천수 33
					</div>
					<a href="novelcont.jsp?no="<@=this.no @>>
					<p></p><@=this.content @></a>
				</div>
			<@ }) @>
		</script>
		<script src="js/jquery.js"></script>
		<script src="js/underscore-min.js"></script>
		<script src="js/sanitize.js"></script>
		<script src="js/dante-editor.js"></script>
		<script src="js/header.js"></script>
		<script>
		
				_.templateSettings = {
				   interpolate: /\<\@\=(.+?)\@\>/gim,
				   evaluate: /\<\@(.+?)\@\>/gim,
				   escape: /\<\@\-(.+?)\@\>/gim
				};
				
				var userNo=<%=user.getNo() %>;
		//내가 쓴 글을 갱신하는 함수
		function displayMyWrittenList() {
		
			$.ajax("getMyWritten.jsp",{
				type:"get",
				dataType:"json",
				data:{
					//로그인된 유저의 userNo(session) 사용하여 구현
					userNo:userNo
				},
				error:function(xhr,error,code){
					alert(code);
				},
				success:function(json){
					
					//alert(json);
			
					var templateCode = $("#divTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ written:json });
					
					$("#writerList").html(markup);
				
				}//success:function(json) end
			});//.ajax() end
		}//displayMyWrittenList() end
		
		//함수 호출
		displayMyWrittenList();
		
		
		</script>
	</body>

</html>
