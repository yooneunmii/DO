
<%@page import="com.dev.doodle.dao.PattyDAO"%>
<%@page import="com.dev.doodle.vo.Patty"%>
<%@page import="com.dev.doodle.vo.Burger"%>
<%@page import="com.dev.doodle.dao.BurgersDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	List<Burger> burgers= BurgersDAO.getDAO().selectList();


	Burger today=burgers.get(0),
			king=burgers.get(1);
	
	Patty kingPatty= PattyDAO.getDAO().bestSelect(king.getNo());
	

%>
    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		
		
		<title>novelBoard</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/dante-editor.css" />
		<link rel="stylesheet" href="css/header.css" />
		<style>
			#bergerlist {
			
				width: 1000px;
				margin: auto;
				margin-top:81px;
				font-family: bon, sans-serif;
			}

			h3{
				font-size:30px;
				font-weight: 700;
				margin: 30px 0;
			}
			
			h3 i{
				color:#FFEB3B;
			}
			#todayBurgerWrap {
				min-height: 200px;
			}
			#todayBurgerBox, #burgerKingWrap {
				margin: 0;
				width: 500px;
				height: 100%;
				display: inline-block;
				text-align: center;
			}






			h2 {
				margin: 20px;
			}

			hr {
				width: 1000px;
				margin: 30px auto;
			}

			#orderby {
				width: 1000px;
				position: relative;
			}
			#orderby ul{
				text-align: right;
				margin-bottom: 50px;
			}
			

			#orderby li {
				display: inline-block;
				margin: 0 5px;
			}

			#orderby li a {
				text-align: center;
				border-radius:10px;
				background:#03C39C;
				color:#fff;
				padding: 10px 30px;
				position: relative;
				top:50%;
				margin-top: -50px;
				text-decoration: none;
			}

			#orderby li a:hover {
				background: #33f3bC;
			}
			#orderby li a:active {
				box-shadow: none;
				transform: scale(0.9);
			}			
			
			.ex {
				width: 900px;
			}

			.paginate {
				margin-top: 50px;
				text-align: center;
			}

			.paginate a, .paginate span, .paginate strong {
				display: inline-block;
				padding: 8px 12px;
				font-size: 21px;
				background: siver;
				color: #00CDAE;
				text-decoration: none;
				font-weight: 500;
				vertical-align: middle;
				margin: 0 2px;
			}

			.paginate span {
				color: #80E8AE;
				cursor: not-allowed;
			}

			.paginate strong {
				font-size: 19px;
				background: #00CDAE;
				color: #fff;
				box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
				cursor: not-allowed;
			}

			.paginate a:hover {
				text-decoration: underline;
				background: #0DDB70;
				color: #fff;
				box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0rgba(0, 0, 0, 0.19);
			}

			.frontSentenceWrap, .pattySentenceWrap, .backSentenceWrap {
				width: 500px;
				position: relative;
				display: inline-block;
				font-size: 18px;
			}
			.pattySentenceWrap{
				min-height: 200px;
			}

			.frontSentenceBground, .backSentenceBground{
				background-image: url("img/burgerFront.png");
				background-size: 100% 100%;
				background-repeat: no-repeat;
				background-position: center;
				height: 100%;
				width: 500px;
				position: absolute;
				opacity: 0.5;
				border-radius: 150px 150px 0 0;
			}
			.backSentenceBground {
				transform: rotateZ(180deg);
			}
			.pattyBground{
				background-image: url("img/patty.png");
				background-size: 100% 100%;
				background-repeat: no-repeat;
				background-position: center;
				height: 100%;
				width:500px;
				position: absolute;
				opacity: 0.4;				
				z-index: -1;
			}



			.frontSentenceBox, .backSentenceBox ,.pattySentenceBox{
				width: 400px;
				display: inline-block;
				position: relative;
				padding: 15px 5px;
				white-space: pre-line;
			}
			#todaySentenceBox{
			left:-50px;
			
			}
			.sentenceWrap{
				width: 1000px;
				position: relative;
				display: inline-block;
				margin-bottom:50px;
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
			.profileBox .profileImage {
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
				overflow: hidden;
			}
			.profileImage img {
				width: 70px;
				height: 68px;
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

			.sentenceTitleBox {
				width: 500px;
				font-size: 12px;
				text-decoration: none;
				text-align:right;
				color: #9E9E9E;
				position: relative;
				top: 0;
			}
			.sentenceTitleBox .sentenceTitle {
				font-size: 12px;
				text-decoration: none;
				color: #9E9E9E;
			}
			
			.sentenceTitleBox .sentenceTitle:hover {
				text-decoration: underline;
			}
			.sentenceBox {
				width: 625px;
				display: inline-block;
				position: relative;
				left: 205px;
				padding: 30px 10px;
				white-space: pre-line;
			}
			.sentenceBox a{
				text-decoration: none;
				color: #000;
				
			}
			
			.sentenceBox a:hover{
			
				text-decoration: underline;	
			}
			.timeBox {
				display: inline-block;
				position: absolute;
				right: 0px;
				width: 150px;
				height: 100%;
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

			#burgerKingBox,#burgerCreateBox{
				height: 100px;
				line-height: 100px;
			}
			#burgerCreate,#burgerKing {
				position:relative;
				margin-bottom: -20px;
				border: 1px solid #999;
				border-radius: 10px;
				background: #795548;
				color: #fff;
				padding: 10px 100px;
				text-decoration: none;
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
				width: 325px;
				min-height: 180px;
				display: inline-block;
				position: relative;
				padding: 30px 10px;
				white-space: pre-line;
			}
						  
			.postArticle .layoutSingleColumn{
				width: 325px;
			}
			
			
			.graf--p {
				margin-bottom: 0 !important;
			}
		</style>
	</head>
	<body>
	<%@include file="template/header.jsp"%>
		<div id="bergerlist">
			<div id="todayBurgerWrap">
				<div id="todayBurgerBox">
					<h3><i class="fa fa-star"></i>오늘의 버거<i class="fa fa-star"></i></h3>
					<div class="frontSentenceWrap">
						<div class="frontSentenceBground"></div>
						<div class="sentenceTitleBox">
							<a href="bergerBiew.jsp?no=2" class="sentenceTitle">분홍신</a> 中에서
						</div><!--sentenceTitleBox end -->
						<div class="frontSentenceBox">
							<%=today.getStartSentence() %>
						</div><!--sentenceBox end -->
					</div><!--sentenceWrap end -->

			<div class="pattySentenceWrap">
				<div class="pattyBground"></div>
				<div id="editor" id="todaySentenceBox">

				</div>
			</div><!--sentenceWrap end -->	


					<div class="backSentenceWrap">
						<div class="backSentenceBground"></div>
						<div class="sentenceTitleBox">
							<a href="bergerBiew.jsp?no=2" class="sentenceTitle">기억상실</a> 中에서
						</div><!--sentenceTitleBox end -->
						<div class="backSentenceBox">
							<%=today.getEndSentence() %>
						</div><!--sentenceBox end -->
					</div><!--sentenceWrap end -->
					<div id="burgerCreateBox">
					<a href="#" id="burgerCreate">
						버거 만들기
					</a>
					</div>
				</div><!--
				--><div id="burgerKingWrap">
					<h3><i class="fa fa-trophy"></i>버거킹<i class="fa fa-trophy"></i></h3>
					<div class="frontSentenceWrap">
						<div class="frontSentenceBground"></div>
						<div class="sentenceTitleBox">
							<a href="bergerBiew.jsp?no=2" class="sentenceTitle">혜성</a> 中에서
						</div><!--sentenceTitleBox end -->
						<div class="frontSentenceBox">
							<%=king.getStartSentence() %>
						</div><!--sentenceBox end -->
					</div><!--sentenceWrap end -->


			<div class="pattySentenceWrap">
				<div class="pattyBground"></div>
				<div class="pattySentenceBox">
				<%=kingPatty.getContent() %>
				</div>
			</div><!--sentenceWrap end -->	



					<div class="backSentenceWrap">
						<div class="backSentenceBground"></div>
						<div class="sentenceTitleBox">
							<a href="" class="sentenceTitle">분홍신</a> 中에서
						</div><!--sentenceTitleBox end -->
						<div class="backSentenceBox">
							<%=king.getEndSentence() %>
						</div><!--sentenceBox end -->
						
					</div><!--sentenceWrap end -->					
					<div id="burgerKingBox">
						<a href="burgerView.jsp?no=<%=kingPatty.getNo() %>" id="burgerKing">버거킹 맛보기</a>
					</div>
				</div>

			</div>
			<hr />


			<div id="pattyListBox">
				<ul>
				</ul>
				
			<script type="text/template" id="pattyListTmp">
				<@$(pattys).each(function() {@>
				<li>
					<div class="sentenceWrap"> 
						<div class="profileBox">
							<a href="userpage.jsp"  class="profileImage"> <img
								src="img/<@=this.profile@>" alt="프로필사진">
							</a> <a href="userpage.jsp" class="nickName" class="profile"><@=this.nickname@></a>
						</div>
						<!--profileBox end -->
							<div class="sentenceBox">
								<a href="burgerView.jsp?no=<@=this.no@>">
									<@=this.content@>
								</a>
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
				
				
				
		</div><!-- //novelBoard -->
		</div>
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
		
			var $window = $(window),
	   		    $document = $(document);
			
			var volume=1;
			
			var $this = $(this);
			var $link = $('#category a');
			var burgerNo=<%=today.getNo() %>
			
			var $pattyListBox =$("#pattyListBox ul");
			
			
			$link.on("click", function() {

				var href = $this.val("href");

				alert(href);

			});
			
			
			
			$window.scroll(function(){
				
				//브라우저의 높이			
				var wHeight = $window.height();
				//문서의 높이
				var dHeight = $document.height();
				//스크롤탑
				var sTop = $window.scrollTop();
				
				console.log(sTop+":"+wHeight+":"+dHeight);
				
				//브라우저높이+스크롤탑 = 문서높이와
				//같다면 스크롤이 가장 아래로 내려간 거
				
				if(dHeight==sTop+wHeight) {
					//alert("제일 아래!");
						volume++;
						
						setTimeout(function() {

							displayPatty();

							},500);
						
					
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
	  	        body_placeholder:"당신의 아이디어로 두개의 빵을 이어주는 패티를 만들어주세요",
	  	        base_widgets:['uploader']
				});
			editor.start();
			
			
			displayPatty();
			$("#burgerCreate").click(function(e){
				
				insertPatty();
			});
			
			
			function displayPatty() {
				
				$.ajax("getPattyList.jsp", {
					type : "post",
					dataType : "json",
					error : function(xhr, error, code) {
						alert(code);
					},
					data : {
						volume : volume
					},
					success : function(json) {
						var tmp = _.template($("#pattyListTmp").html());
						$pattyListBox.html(tmp({
							pattys : json
						}));
					}
				});
			}

			
			function insertPatty(){

				$.ajax("insertPatty.jsp", {
					type : "post",
					dataType : "json",
					data : {
						burgerNo : burgerNo
					},
					error : function(xhr, error, code) {
						alert(xhr.responseText);
					},
					success : function(json) {
						if (json.result) {
							displayPatty();
						}
					}

				})
			}
		</script>
	</body>
</html>

