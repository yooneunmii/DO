<%@page import="com.dev.doodle.dao.PattyDAO"%>
<%@page import="com.dev.doodle.vo.Patty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! int up=0,down=0; %>  
 
<%
//post방식의 한글처리
request.setCharacterEncoding("UTF-8");

//파라미터 name,debutDate
String noStr =request.getParameter("no");	
int no= Integer.parseInt(noStr);

Patty patty= PattyDAO.getDAO().selectOne(no);






%>    
    
    
 
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>burgerView</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/dante-editor.css" />
		<link rel="stylesheet" href="css/header.css" />
		<style>
			html {
				overflow-y: scroll;
			}
			#burgerWrite {
				top:81px;
				width: 1000px;
				position: absolute;
				left: 50%;
				margin: 0 0 0 -500px;
				font: 300 16px 'bon', sans-serif;
			}
			#titleBox {
				text-align: center;
			}
			#titleBox h2 {
				font-size: 70px;
				color: #03C39C;
				text-shadow: #929292 5px 5px 5px;
			}
			#titleBox p {
				font-size: 18px;
			}
			


			#frontSentenceWrap,#pattySentenceWrap,#backSentenceWrap {
				width: 1000px;
				position: relative;
				display: inline-block;
				
			}

			#frontSentenceBground,#backSentenceBground{
				background-image: url("img/burgerFront.png");
				background-size: 100% 100%;
				background-repeat: no-repeat;
				background-position: center;
				height: 100%;
				width:1000px;
				position: absolute;
				opacity: 0.6;
				border-radius: 300px 300px 0 0;
			}
			#backSentenceBground{
				transform: rotateZ(180deg);
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

			#frontSentenceBox,#backSentenceBox,#pattySentenceBox{
				width: 625px;
				display: inline-block;
				position: relative;
				left: 205px;
				padding: 30px 10px;
				white-space: pre-line;
			}
			
			#pattyBground{
				background-image: url("img/patty.png");
				background-size: 100% 100%;
				background-repeat: no-repeat;
				background-position: center;
				height: 100%;
				width:1000px;
				position: absolute;
				opacity: 0.6;		
				
			}
			
			#timeBox {
				display: inline-block;
				position: absolute;
				right: 0px;
				width: 150px;
				height: 100%;
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

			
			#buttonBox{
				height: 100%;
			}
			
			#buttonBox a{
				border: none;
				border-radius:10px;
				background:#795548;
				color:#fff;
				padding: 10px 30px;
				position: relative;
				top:50%;
				margin-top: -50px;
			}			
			
			#bergerState{
				text-align: right;
				margin-bottom: 50px;
				
			}
			#bergerState a{
				background: none;
				border: none;
				cursor: pointer;
				text-decoration: none;
				
			}
			#bergerState .like{
				color: #039BE5;
			}
			#bergerState .report{
				color: #F44336;
			}
			
			#nevBox{
				text-align: center;
				margin-top: 20px;
				
			}
			
			#nevBox a{
				border: none;
				border-radius:10px;
				background:#FF5722;
				color:#fff;
				padding: 10px 30px;
				text-decoration: none;
			}
			#nevBox #list{
				position: relative;
				top: 10px;
			}
			#nevBox #prev{
				position: absolute;
				left: 50px;
			}
			#nevBox #next{
				position: absolute;
				right: 50px;
			}
			
		</style>
	</head>

	<body>
	<%@include file="template/header.jsp"%>
		<div id="burgerWrite">
			<div id="titleBox">
				<h2>버거 맛보기</h2>
			</div><!--titleBox end -->
			<div id="bergerState">
					<a href="burgerView.jsp?no=<%=no %>&result=L" class="like">
						<i class="fa fa-thumbs-o-up"></i><%=up %>
					</a>
					<a href="burgerView.jsp?no=<%=no %>&result=U" class="report">
						<i class="fa fa-exclamation-triangle"><%=down %></i>
					</a>
			</div> 
			
			<div id="frontSentenceWrap">
				<div id="frontSentenceBground"></div>


				<div id="frontSentenceBox">
					<%=patty.getStartSentence() %>
				</div><!--ransentenceBox end -->

			</div><!--sentenceWrap end -->	
			
			
			
			
			
			<div id="pattySentenceWrap">
				<div id="pattyBground"></div>
				<div id="pattySentenceBox">
					<%=patty.getContent() %>
				</div>

			</div><!--sentenceWrap end -->	
			
			
			
			
			
				<div id="backSentenceWrap">
				<div id="backSentenceBground"></div>

				

				<div id="backSentenceBox">
					<%=patty.getEndSentence() %>
				</div><!--ransentenceBox end -->

			</div><!--sentenceWrap end -->	
			
			
			<div id="nevBox">
				<a href="bergerList.jsp" id="list"><i class="fa fa-list"></i> 목록으로</a>
			</div>
			
			
			
			
			
		</div><!--burgerWrite end -->



		<script src="js/jquery.js"></script>
		<script src="js/underscore-min.js"></script>
		<script src="js/sanitize.js"></script>
		<script src="js/dante-editor.js"></script>
		<script src="js/header.js"></script>
		<script>
		
			$profile = $(".profile");
			$profile.click(function(e) {
				e.preventDefault();
			});
			
			editor = new Dante.Editor({
				el:"#editor"
				});
			editor.start();
		</script>
	</body>
	</body>
</html>
