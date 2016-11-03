<%@page import="com.dev.doodle.dao.ReplyDAO"%>
<%@page import="com.dev.doodle.util.PaginateUtil"%>
<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.vo.Favor"%>
<%@page import="java.util.List"%>
<%@page import="com.dev.doodle.vo.Board"%>
<%@page import="com.dev.doodle.dao.BoardDAO"%>
<%@page import="com.dev.doodle.dao.ParagraphDAO"%>

<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int userNo =4;//session 받고 객체 login.no
	Paragraph par =new Paragraph();
    par.setBoardNo(7); //파라미터로 받아서 보더 no 넣어주기
    par.setResult("T");
   	List<Paragraph> para =ParagraphDAO.getDAO().selectAllT(par);
    Board board =BoardDAO.getDAO().selectOne(7);
    
    Favor favor=new Favor();
    favor.setResult("T");//보드 번호가들어다.
    favor.setKindNo(7);
    favor.setCategoryNo(2);
  
 


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>끄적끄적</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/noto.sans.korea.css" />
<link rel="stylesheet" href="css/dante-editor.css" />
<style>
body {
	font-family: bon, sans-serif;
}
		#content{
			width:800px;
			padding:30px 100px;
			min-height: 400px;
			border-bottom: 1px solid #DFE7FF;
			border-top: 1px solid #DFE7FF;
			background: #F6F6F6;
		}
		
		
		#content {
			width: 900px;
			min-height: 400px;
			padding: 20px 100px;
			position: relative;
		}
		

		
		#content h2 {
			font-size: 32px;
			color: #4DD0E1;
			margin-bottom: 20px;
			font-weight: bold;
			text-align: center;
			margin-top:20px;
		}
		

		
		#btnBox {
			padding: 10px 0;
			text-align: right;
		}
		
		

				
				#content h2{
					font-size:30px;
					font-weight:300;
				}
				
		
		.btn {
					background: #c5ff9e;
					padding: 8px 10px;
					color: #424242;
					text-decoration:none;
					display: inline-block;
					font: 500 15px bon,sans-serif;
					cursor: pointer;
				}
				
			.box_btn {
					text-decoration: none;
			}
		
		.btn:hover{
			background: #00A178;
			color:#fff;
			box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		}
#novelContent {
	margin: auto;
	width: 1000px;
	padding-top: 20px;
	height: 800px;
}

#content {
	width: 1000px;
	min-height: 400px;
	border: 1px dotted #BDBDBD;
	margin-bottom: 10px;
	padding: 0;
	position: relative;
	cursor: default;
}

#paragraphForm {
	width: 1000px;
	top: 0;
}

#paragraphInsert {
	position: relative;
	padding-left: 80px;
	height: 100px;
}

#editor {
	position: absolute;
	margin-bottom: 10px;
	width: 820px;
	height: 80px;
	padding-left: 2;
	font-family: bon, sans-serif;
	border: none;
	border-top: 5px solid #795548;
	border-bottom: 5px solid #795548;
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	overflow-y: auto;
}

#paragraphInsert::before {
	width: 0;
	height: 0;
	border-bottom: 40px solid transparent;
	border-right: 80px solid #ffab40;
	border-top: 40px solid transparent;
	content: "";
	position: absolute;
	top: 0px;
	left: 0px;
}

#paragraphInsert::after {
	width: 0;
	height: 0;
	border-bottom: 12.5px solid transparent;
	border-right: 25px solid #000;
	border-top: 12.5px solid transparent;
	content: "";
	position: absolute;
	top: 27px;
	left: 0px;
}

#paragraphList {
	width: 1000px;
	border: 1px dotted #BDBDBD;
	min-height: 400px;
	padding-top: 20px;
	position: relative;
}

#paragraphList #newest {
	display: none;
}

#paragraphList #check, #paragraphList #noCheck {
	position: absolute;
	display: block;
	padding: 5px;
	width: 70px;
	height: 20px;
	text-decoration: none;
	text-align: right;
	color: #424242;
	background-image: url(img/2.PNG);
	background-size: contain;
	cursor: pointer;
}

#paragraphList #check {
	top: 0;
	left: -80px;
	box-shadow: 1px 1px 1px 0 rgba(0, 0, 0, 0.2), -5px 5px 20px 0
		rgba(0, 0, 0, 0.19);
}

#paragraphList #noCheck {
	opacity: .4;
	top: 40px;
	left: -80px;
	box-shadow: 1px 1px 1px 0 rgba(0, 0, 0, 0.2), -5px 5px 20px 0
		rgba(0, 0, 0, 0.19);
}

.kind {
	margin: 10px;
	font-size: 20px;
}

.kind span {
	font-size: 25px;
	weight: 700;
	color: #424242;
	text-shadow: 1px rgba(0, 0, 0, 0.2);
}

.paragraph {
	position: relative;
	min-height: 50px;
	cursor: default;
}

.paragraph .fro {
	padding: 0px;
	display: inline-block;
	position: absolute;
	top: -5px;
}

.paragraph .novcon {
	padding-top: 15px;
	padding-left: 10px;
	width: 800px;
	display: inline-block;
	position: relative;
	left: 100px;
	top: 0;
}

.paragraph .favor {
	border: 1px dotted #E1E1E1;
	width: 50px;

	position: absolute;
	top: 15px;
	right: 20px;
	text-align: center;
	padding:5px;
	color:#424242;
	
}
.paragraph .favor i {
	font-size:20px;
	color:#424242;
	cursor: pointer;
	transition:.5s ease;
	margin-right:8px;
	
}
.paragraph .favor i:hover{
	color:#9FA8DA;
	text-shadow:0 0 0.7 solid #424242;
}

#paragraphInsert  #writerBtn {
	font-family: bon, sans-serif;
	width: 100px;
	height: 80px;
	margin-left: -3.5px;
	background: #f06292;
	border: none;
	border-left: 20px solid #bdbdbd;
	color: #fff;
	font-size: 20px;
	border-radius: 0 20px 20px 0;
	position: absolute;
	right: 0;
}

#content #check, #content #noCheck {
	position: absolute;
	display: block;
	padding: 5px;
	width: 90px;
	height: 30px;
	text-decoration: none;
	text-align: right;
	line-height: 30px;
	color: #424242;
	background-image: url(img/1.PNG);
	background-size: contain;
	box-shadow: 1px 1px 1px 0 rgba(0, 0, 0, 0.2), -5px 5px 20px 0
		rgba(0, 0, 0, 0.19);
}

#content #check {
	left: -100px;
	top: 0;
}

#content #noCheck {
	opacity: .4;
	left: -100px;
	top: 50px;
}

#novelContent .frofileImg {
	background: white;
	margin: 5px;
	width: 40px;
	height: 40px;
	border: 1px solid #424242;
	border-radius: 51px;
	cursor: pointer;
}

.winPar {
	position: relative;
	min-height: 50px;
	cursor: default;
	clear: both;
}

#novelContent .id {
	font-size: 10px;
	position: relative;
	top: -15px;
	color: gray;
}

.bungi {
	width: 30px;
	height: 30px;
	border: none;
	background: transparent;
	background-image: url(img/books8.png);
	background-size: cover;
	cursor: pointer;
	position: absolute;
	right: 20px;
	top: 25px;
	margin-top: -15px;
}

.winPar .fa-plus {
	top: 25px;
	margin-top: -10px;
	right: 80px;
	cursor: pointer;
	position: absolute;
}

.novcon {
	padding-top: 15px;
	padding-left: 10px;
	width: 800px;
	display: inline-block;
	position: relative;
	left: 100px;
}

.winPar .fro {
	padding: 0px;
	display: inline-block;
	position: absolute;
	top: -5px;
}

#genre {
	position: absolute;
	top: 0px;
	right: -180px;
	width: 150px;
}

#genre #genroNumber1 {
	font-size: 30px;
	font-weight: 500;
}

.winPar .reple {
	min-height: 250px;
	padding-top: 25px;
	margin-bottom: 5px;
	border-bottom: 1px dotted #424242;
	display: none;
}

.commentList {
	padding: 10px 40px;
}

.commentList .comment {
	position: relative;
	min-height: 50px;
	padding-top: 10px;
	cursor: default;
	clear: both;
}

.comment .fro {
	padding: 0px;
	display: inline-block;
	position: absolute;
	top: -5px;
}

.reple .con {
	font-family: bon, sans-serif;
	width: 800px;
	height: 40px;
	line-height: 40px;
	text-indent: 10px;
	border: none;
	border-bottom: 3px solid #BDBDBD;
}

.reple form {
	text-align: center;
}

.reple .repleBtn {
	font-family: bon, sans-serif;
	padding: 5px 10px;
	height: 40px;
	background: #5BD974;
	border: none;
	border-radius: 10px;
}

.comment {
	position: relative;
}

.comment .novcon {
	text-align: left;
	padding-top: 15px;
	padding-left: 10px;
	width: 700px;
	display: inline-block;
	position: relative;
	left: 120px;
}

#title {
	
}

#title #contentIcon {
	position: absolute;
	top: 30px;
	right: 20px;
}

#contentIcon i {
	font-size: 30px;
}

.winPar .bungiList {
	width: 300px;
	min-height: 40px;
	overflow-y: auto;
	border-radius: 25px;
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
	position: absolute;
	top: 40px;
	right: -310px;
	background: white;
	padding: 5px;
	text-indent: 5px;
	display: none;
}

.bungiList a {
	text-decoration: none;
	color: #424242;
	opacity: .7;
}

.bungiList a:hover {
	text-decoration: underline;
	opacity: 1;
	font-weight: 900;
}

.fa-hand-o-right {
	font-size: 25px;
	color: #55B6B3;
	margin-right: 10px;
}
#bookup{
color: #FFC107;
transition:.5s ease;
}
#bookdown{
transition:.5s ease;
color:gray;
}
#unlike{
color:gray;
transition:.5s ease;
}
#like{
color:#E91E63;
transition:.5s ease;
}
</style>
</head>

<body>
	<div id="novelContent">
		<h1><%=board.getTime()%>시에 업데이트됩니다.
		</h1>
		<ul id="content">
			<li id="title"><a href="noverContent.html" id="check">작품</a> <a
				href="novelFanArt.jsp" id="noCheck">팬아트</a>
				<h2><%=board.getTitle()%></h2>
				<div id="contentIcon">
					<i id="unlike" class="fa fa-pencil"><span id="likeSize"></span></i> &nbsp;&nbsp; 
				

		<i id="bookdown"class="fa fa-star"></i>
				</div>
				<div id="genre">
					조회수:<%=board.getHit()%>
					<hr noshade />
					<form>
						<p>
							<input type="radio" name="genre" id="fa" value="판타지"> <label
								for="fa">판타지</label>
						</p>
						<p id="genroNumber1">
							<input type="radio" name="genre" id="ro" value="로맨스"> <label
								for="ro">로맨스</label>
						</p>
						<p>
							<input type="radio" name="genre" id="me" value="멜로"> <label
								for="me">멜로</label>
						</p>
						<button>투표</button>
					</form>
				</div></li>

			<%
				for(Paragraph parag:para){
			%>
	
			<li class="winPar" data-no="<%=parag.getNo()%>">
				<div class="fro">
					<img class="frofileImg" src="img/<%=parag.getProfile()%>"
						data-name="<%=parag.getUserNo()%>"> <span class="id"><%=parag.getNickname()%></span>
				</div> <span class="novcon"><%=parag.getContent()%> </span> <i
				class="fa fa-plus" title="댓글달기"></i>
				<button class="bungi" title="분기글 보러가기"></button>
				<div class="reple">
					<form class="replyForm">
						<input class="con" placeholder="댓글을입력하여주세요">
						<button class="repleBtn">등록</button>


					</form>

					<div class="commentList"></div>
					<!--commentList-->
					<div class="replayBox"></div>
					
				</div>

				<ul class="bungiList">
					<li><i class="fa fa-hand-o-right"></i><i
				class="fa fa-quote-left"></i>분기글이 없습니다.
            <i class="fa fa-quote-right"></i>
				</ul>

 

			</li>
			<!--winpar-->
			<%
				}
			%>
		</ul>

		<div id="paragraphInsert">
			<form id="paraForm">
				<div id="editor">글을 입력하여주세요</div>
				<button id="writerBtn">작성</button>
			</form>
		</div>

		<div id="paragraphList">

			<div id="check">인기순</div>
			<div id="noCheck">최신순</div>


			<div id="editorCho"></div>
			<div id="newest">
				<h2 class="kind">
					<span>최신순</span>
				</h2>
			</div>

		</div>
		

		<script type="text/template" id="bungiTmp">
	
		
		<@ $(bungis).each(function(){ @>

			<li><i class="fa fa-hand-o-right"></i><i
			class="fa fa-quote-left"></i> <a href="novlecont.jsp?no=<@=this.no@>"><@=this.content@></a> 
            <i class="fa fa-quote-right"></i>
			</li>
				
		<@});@>
	</script>

		<script type="text/template" id="repleTmp">
	
		<@ $(com).each(function(){ @>

			<div class="comment">
			<div class="fro">
			<img class="frofileImg" src="img/<@=this.profile@>"> <span class="id"><@=this.nickname@></span>
			</div>
			<span class="novcon"><@=this.content@></span>
		
			</div>
				
		<@}) @>
	</script>

			<script type="text/template" id="paragraphTmp">
	
		<@ $(para).each(function(){ @>
		<div class="paragraph">
					<div class="fro">
						<img class="frofileImg" src="img/<@=this.profile@>"> <span
							class="id"><@=this.nickname@></span>
					</div>
					<span class="novcon"><@=this.content@></span>
					<div class="favor">
						<i class="fa fa-thumbs-o-up"  data-no="<@=this.no@>"></i>
						<@=this.up@>  

					</div>

				</div>
		<@}) @>
	</script>
	
		<script type="text/template" id="paragraphTmp2">
	
		<@ $(para).each(function(){ @>
		<div class="paragraph">
					<div class="fro">
						<img class="frofileImg" src="img/<@=this.profile@>"> <span
							class="id"><@=this.nickname@></span>
					</div>
					<span class="novcon"><@=this.content@></span>
					<div class="favor">
						<i class="fa fa-thumbs-o-up"  data-no="<@=this.no@>"></i>
					</div>

				</div>
		<@}) @>
	</script>



		<script src="js/jquery.js"></script>

		<script src="js/underscore-min.js"></script>
		<script src="js/sanitize.js"></script>
		<script src="js/dante-editor.js"></script>
		<script>
			_.templateSettings = {

				interpolate : /\<\@\=(.+?)\@\>/gim,

				evaluate : /\<\@(.+?)\@\>/gim,

				escape : /\<\@\-(.+?)\@\>/gim

			};
			editor = new Dante.Editor({

				el : "#editor"

			});

			editor.start();
			$(".frofileImg").click(
			function() {
				var userNo = $(this).attr("data-name");
								alert(userNo);
								window.open('porfile.jsp?userNo=' + userNo,'user','scrollbars=yes,toolbar=no,resizable=yes,width=220,height=250,left=0,top=0');
								//		form.action = "www.ohmynews.com"; // 팝업화면을 호출할 페이지 또는 파일명 
								//	form.seq.value = seq;                      // form에서 넘겨주는 seq값 
								// form.name.value = name;                // form에서 넘겨주는 name값 
								//form.target = "target_name";             // window.open 에서 선언한 target name 
								//	form.submit(); 

							});
			var $reple = $(".reple"), $bungiList = $(".bungiList");

			
			$(".fa-plus").click(function() {
				
				var $li = $(this).parents("li");
				
				var no = $li.attr('data-no');
				
				 $li.find(".reple").fadeToggle(500);
				 var pageNo=1;
				 var $commentList = $li.find(".commentList");
				 var $replayBox =$li.find(".replayBox");
				 getCommentList(no,$commentList,pageNo,$replayBox);
				
			});
			
		
			$("li").on("click","a",function(){

				var $li = $(this).parents("li");
				var $commentList = $li.find(".commentList");
				var pageNo = $(this).text();
				var $replayBox =$li.find(".replayBox");
				var no = $li.attr('data-no');

				 $commentList.empty;
				
				 getCommentList(no,$commentList,pageNo,$replayBox);
				
			});
			
			
			function getCommentList(no,$commentList,pageNo,$replayBox) {
				
				pageNo = pageNo || 1;	//pageNo 가 값이 없을시에는 자동으로 1 을 넣어준다. 
				$.ajax("replySelect.jsp",{
					type : "get",
					dataType : "json",
					data:{no:no,
						page:pageNo
					},
					error : function(xhr, error, code) {
						alert(code);
					},
					success:function(json){
						var templateCode = $("#repleTmp").html();
						var tmp = _.template(templateCode);
						var markup = tmp({com:json.list});
						$commentList.html(markup);
						
						$replayBox.html(json.paginate);
					}
				})
				
				
				
			}
			function getbungiList(no,$bungiList){
				
				$.ajax("bungiSelect.jsp",{
					type : "get",
					dataType : "json",
					data:{no:no,
						para:"<%=par.getBoardNo()%>"},
					error : function(xhr, error, code) {
						alert(code);
					},
					success:function(json){
						if(json.length>0){
							$bungiList.empty();
						var templateCode = $("#bungiTmp").html();
						var tmp = _.template(templateCode);
						var markup = tmp({bungis:json});
					
							$bungiList.html(markup);
						}
					}
				});
			}
			$(".bungi").click(function() {
				var $li = $(this).parents("li");
				
				var no = $li.attr('data-no');
				
				 $li.find(".bungiList").fadeToggle(300);
				 var $bungiList = $li.find(".bungiList");
				 
					getbungiList(no,$bungiList);
			
			});

			var $paraForm = $("#paraForm"), $editor = $("#editor"),$replyForm=$(".replyForm");
			$paraForm.submit(function(e) {
				e.preventDefault();
				var content = $editor.text();
		
				var result = confirm("글을 등록하시겠습니까?");

				if (result) {
					$.ajax("paragraphInsert.jsp", {
						type : "post",
						dataType :"json",
						data : {
							content : content,
							boardNo :<%=board.getNo()%>
						},
						error : function(xhr, error, code) {
							alert(code);
						},
						success : function(json) {
							alert(json.result);
							$editor.text("글을 입력항주세요");
							list();
						}

					});//ajax

				}
			});//paraForm submit
			
			$replyForm.submit(function(e){
			e.preventDefault();
			var $li = $(this).parents("li"),
			content= $li.find(".con").val();
			var no = $li.attr('data-no');
			alert("test");
		
			var result = confirm("글을 등록하시겠습니까?");
			if (result) {
				
				var $commentList = $li.find(".commentList");
				$.ajax("replyInsert.jsp", {
					type : "post",
					dataType :"json",
					data : {
						content : content,
						no:no
					},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
						getCommentList(no,$commentList);
					}

					});//ajax

				}
			});//replyForm submit();
			list();
			function list() {
				$.ajax("paragraphSelete.jsp", {
					type : "get",
					dataType : "json",
					data : {
						boardNo :<%=board.getNo()%>},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
						var templateCode = $("#paragraphTmp2").html();
						var tmp = _.template(templateCode);
						var markup = tmp({
							para : json
					
				
						});
						$("#newest").html(markup);

					}

				});
				
				$.ajax("paragraphSelectHot.jsp", {
					type : "get",
					dataType : "json",
					data : {
						boardNo :<%=board.getNo()%>},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
						
					
						var templateCode = $("#paragraphTmp").html();
						var tmp = _.template(templateCode);
						var markup = tmp({
							para : json
					
				
						});
						$("#editorCho").html(markup);

					}

				});
				$.ajax("noveBookmarkSelect.jsp", {
					type : "get",
					dataType : "json",
					data : {
						boardNo :<%=board.getNo()%>,
						userNo :<%=userNo%>},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
				
						if(json.result){
							$("#bookdown").attr("id","bookup");
						}
			

					}

				});
				$.ajax("novelLikeSelect.jsp", {
					type : "get",
					dataType : "json",
					data : {
						boardNo :<%=board.getNo()%>,
						userNo :<%=userNo%>},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
				
						if(json.result){
							$("#unlike").attr("id","like");
							
						}
						$("#likeSize").text(json.size);

					}

				});
			}
			
			$("#paragraphList #noCheck").click(function(){
				
				$("#paragraphList #noCheck").css("opacity",1);
				$("#paragraphList #check").css("opacity",0.4);
				$("#editorCho").hide();
				$("#newest").show();
				
			});
			$("#paragraphList #check").click(function(){
				
				$("#paragraphList #noCheck").css("opacity",0.4);
				$("#paragraphList #check").css("opacity",1);
				$("#newest").hide();
				$("#editorCho").show();
				
				
			});
			
			//좋아요 북마크
			
			$("#contentIcon").on("click","#like",function(){//delete
				$.ajax("novelLikeDelete.jsp", {
					type : "post",
					dataType :"json",
					data : {
						boardNo :<%=board.getNo()%>,
					userNo :<%=userNo%>
					},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
						alert(json.result);
						if(json.result){
							
							$("#like").attr("id","unlike");
							list();
							alert("추천을 취소하셨습니다.");
						}
					
					}

				});//ajax

				
			});
			
			
			$("#contentIcon").on("click","#unlike",function(){
				$.ajax("novelLikeInsert.jsp", {
					type : "post",
					dataType :"json",
					data : {
						boardNo :<%=board.getNo()%>,
					userNo :<%=userNo%>
					},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
						alert(json.result);
						if(json.result){
							
							$("#unlike").attr("id","like");
							list();
							alert("추천 하셨습니다.");
						}
					
					}

				});//ajax
		
			});
			$("#contentIcon").on("click","#bookup",function(){//delete
				$.ajax("noverBookmarkDelete.jsp", {
					type : "post",
					dataType :"json",
					data : {
						boardNo :<%=board.getNo()%>,
					userNo :<%=userNo%>
					},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
						alert(json.result);
						if(json.result){
							$("#bookup").attr("id","bookdown");
							list();
							alert("북마크에서 지워졌습니다.");
						}
			
					}

				});//ajax
		
	
	
			});
			$("#contentIcon").on("click","#bookdown",function(){//insert

				$.ajax("novelBookmarkInsert.jsp", {
					type : "post",
					dataType :"json",
					data : {
						boardNo :<%=board.getNo()%>,
					userNo :<%=userNo%>
					},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
						alert(json.result);
						if(json.result){
							
							$("#bookdown").attr("id","bookup");
							list();
							alert("북마크 되었습니다.");
						}
					
					}

				});//ajax
		
			});
			//좋아요!
			
			$("#newest").on("click",".fa-thumbs-o-up",function(){
				
				var $this =$(this),
				    no=$this.attr("data-no");
	
				$.ajax("paragraphLikeInsert.jsp", {
					type : "post",
					dataType :"json",
					data : {
						no :no,
						userNo :<%=userNo%>
						
					},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
					
						if(json.result){
							list();
							alert("추천되었습니다.");
						}else{
							alert("이미 추천하셨습니다.");
						}
					
					}

				});//ajax
				
			});
			
			$("#editorCho").on("click",".fa-thumbs-o-up",function(){
				
				var $this =$(this),
				    no=$this.attr("data-no");
			
				$.ajax("paragraphLikeInsert.jsp", {
					type : "post",
					dataType :"json",
					data : {
						no :no,
						userNo :<%=userNo%>
						
					},
					error : function(xhr, error, code) {
						alert(code);
					},
					success : function(json) {
						
						if(json.result){
							list();
							alert("추천되었습니다.");
						}else{
							alert("이미 추천하셨습니다.");
						}
					
					}

				});//ajax
				
			});

		</script>
</body>

</html>