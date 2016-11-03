<%@page import="com.dev.doodle.dao.UsersDAO"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>끄적끄적</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/dante-editor.css"/>
		<link rel="stylesheet" href="css/main.css"/>
		<style>
			html{
				width:100%;
				height:100%;
			}
			body {
				width:100%;
				height:100%;
				font-family: bon, sans-serif;
			}
			#novelFanArt {
				margin: auto;
				width: 1000px;
				height: 800px;
			}

			#FanArt {
				position: relative;
				height: 800px;
				padding:10px;
				border: 1px dotted #E1E1E1;
			}
			#FanArt #check, #FanArt #noCheck {
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
				box-shadow: 1px 1px 1px 0 rgba(0, 0, 0, 0.2), -5px 5px 20px 0 rgba(0, 0, 0, 0.19);
			}

			#FanArt #check {

				left: -100px;
				top: 0;
				opacity: .4;
			}

			#FanArt #noCheck {

				left: -100px;
				top: 50px;
			}
			#FanArt #send{
				position: absolute;
				top: 5px;
				right: 5px;

			}
			#send input{
				font-family: bon,sans-serif;
			
				height:40px;
				width:200px;
				line-height: 40px;
				
			}
			#FanArt #FanBtn {
				font-family: bon, sans-serif;
				padding: 5px;
				font-size: 15px;
				border: none;
				border-radius: 20px;
				position:absolute;
				top:20px;
				right:-5px;
				color: white;
				opacity:.8;
				transition:.2s ease;
				cursor: pointer;
			}

			#FanBtn:hover {
					opacity: 1;
					background:#424242;
			}

			.fanArtImg:hover {
				opacity: .7;
			}
			.Art {
				width: 240px;
				height: 300px;
	
				position: relative;
				float: left;
				margin-right:70px;
				margin-bottom: 35px;
			}
			.Art .fanArtImg {
				width: 240px;
				height: 250px;
				overflow: hidden;
			}
			.Art .fro {
				height: 50px;
				padding: 0px;
				width:240px;
				display: inline-block;
				position: absolute;
				bottom: 0;
			
			}
			.fro .id {
				position: absolute;
				top: 15px;
				left: 60px;
			}
			.frofileImg {
				background: white;
				margin: 5px;
				width: 40px;
				height: 40px;
				border: 1px solid #424242;
				border-radius: 51px;
				cursor: pointer;
			}
			#fanArtList {
				width:861px;
				margin:auto;
				margin-top: 100px;
				height:635px;
			}
			.fro .tool{
				position: absolute;
				top:20px;
				right:5px;
				
				
			}
			.tool a{
				text-decoration: none;
				display:inline-block;
				margin:5px;
				color:#463A84;
				font-size:15px;
				opacity: .6;
				transition: .2s ease;
			}
			.tool a:hover{
				opacity: 1;
				font-weight: 700;
			}
			.Art:nth-child(3){
				margin-right:0;
			}
			.Art:nth-child(6){
				margin-right:0;
			}
			#page{
				width:400px;
				margin:auto;
				text-align: center;
			}
			#popup{
				width:100%;
				height: 100%;
				position: fixed;
				top:0;
				left: 0;
				background:rgba(0,0,0,.6);
				display: none;
			}
		
			#popup #full,#popup #fullImg{
				width:1000px;
				height:700px;
				cursor:pointer;
				position: fixed;
				top:50%;
				left:50%;
				margin:-350px 0 0 -500px;
				background-size: contain;
				background-repeat: no-repeat;	
				background-position:center; 			
			}
			#full #rightBtn,#full #leftBtn{
				position: absolute;
				width:100px;
				height:700px;
				top:0px;
				line-height:700px;
				font-size:100px;
				opacity: .3;
				cursor: pointer;
				transition: .2s ease;
			}
			#full #leftBtn{
				text-align:right;
				left:-100px;
			}
			#full #rightBtn{
		
				text-align:left;
				right:-100px;
		
			}
			#full #rightBtn:hover,#full #leftBtn:hover{
				opacity: 1;
			}
						#uploadImgBox {
				width:600px;
				position: relative;
			}
			
			#uploadImgBox ul {
				display: inline-block;
			}
			
			#uploadImgBox li {
				display: inline-block;
				width:50px;
				height:50px;
				border:1px solid #424242;
				vertical-align:middle; 
				position: relative;
				margin:0 5px;
				
			}
			
			#uploadImgBox li img {
				width:50px;
				height:50px;
			}
			
			#uploadImgBox li .btn_delete {
				width:20px;
				height:20px;
				background:transparent;
				border-radius:20px;
				color:#2196F3;
				position: absolute;
				right:0;
				top:0;
				border:none;
				font-size:20px;
				line-height:20px;	
				text-align: center;
				padding: 0;
				cursor: pointer;
			}
			
			
			#uploadImgBox label {
				width:50px;
				height:50px;
				display: inline-block;
				font-size:50px;
				position: relative;
				text-align: center;
				margin-right:50px;
				cursor:pointer;
				color:#2196F3;
				line-height: 50px;
				vertical-align:middle; 
			}
			
			
			#uploadImgBox input[type=file] {
				width:40px;
				height:40px;
				opacity: 0;
				cursor: pointer;
				position: absolute;
				left:0;
				top:0;
			}
			
			.loader {
				width:100%;
				height:100%;
				position: absolute;
				background:rgba(0,0,0,.7);
				background-image:url(img/ajax-loader.gif);
				background-repeat:no-repeat;
				background-position:center;
				left:0;
				top:0;
				display: none;
			}
			#FanArt #uploadImgBox{
			position: absolute;
			min-width:300px;
			height:100px;
			top:0;
			right:0;
			}

		</style>
	</head>

	<body>
		<div id="novelFanArt">
			<h1>"으르렁" 의 팬아트를 그려주세요.</h1>
			<div id="FanArt">
				<a href="noverContent.html" id="check">작품</a>
				<a href="#" id="noCheck">팬아트</a>
				
				<div id="uploadImgBox">
				<form action="#" method="post" id="send" enctype="multipart/form-data">
					<fieldset>
						<legend class="screen_out">업로드폼</legend>
					<ul>
						
					</ul>
					<label id="uploadLbl"><i class="fa fa-plus"></i><input type="file" name="upload1" /></label>
				</fieldset>
				<button  id="FanBtn">보내기</button>
				</form>
			</div>
				<ul id="fanArtList">
					<li class="Art">
						<img src="img/2845788b56824b45939f2bc0d7d867fd.gif" class="fanArtImg"title="크게보기">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">수정</a>
								<a href="#">삭제</a>
							</div>
						</div>

					</li>
					<li class="Art">
						<img src="img/20150223_003742_1218183869.gif" class="fanArtImg"title="크게보기">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">수정</a>
								<a href="#">삭제</a>
							</div>
						</div>

					</li>
					<li class="Art">
						<img src="img/0B9c6V2jlGZIReGZDSy12dFpWVTQ.jpg	" class="fanArtImg"title="크게보기">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">수정</a>
								<a href="#">삭제</a>
							</div>
						</div>

					</li>
					<li class="Art">
						<img src="img/20150223_003742_1218183869.gif" class="fanArtImg"title="크게보기">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">수정</a>
								<a href="#">삭제</a>
							</div>
						</div>

					</li>
					<li class="Art">
						<img src="img/20150410_223220.png" class="fanArtImg"title="크게보기">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">수정</a>
								<a href="#">삭제</a>
							</div>
						</div>

					</li>
					<li class="Art">
						<img src="img/20150123_235703_-814277120.gif" class="fanArtImg"title="크게보기">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">수정</a>
								<a href="#">삭제</a>
							</div>
						</div>

					</li>
			
					
			
				</ul>
				<div id="page"> 페이징</div>
			</div>
			
		 <div id="popup" style="display: block">
				<div id="full">
					<div id="fullImg" style="background-image: url(img/20150123_235703_-814277120.gif)"></div>
					<i class="fa fa-chevron-circle-left" 
					title="이전사진보기"
					id="leftBtn"></i>
					<i class="fa fa-chevron-circle-right" 
					title="다음사진보기"
					id="rightBtn"></i>
				</div>
			</div>

		<script src="js/jquery.js"></script>
		<script src="js/underscore-min.js"></script>
		<script src="js/sanitize.js"></script>
		<script src="js/dante-editor.js"></script>
		<script>
			var $fanArtImg=$(".fanArtImg"),$popup=$("#popup"),
				$fullImg=$("#fullImg"),$rightBtn=$("#rightBtn"),
				$leftBtn=$("#leftBtn"),index=0;;
			
			$fanArtImg.click(function(){
				var $this = $(this),
					    src = $this.attr("src");
					    index=$this.parent().index();
					    $popup.fadeToggle(300); 	
					     $fullImg.css("background-image","url("+src+")");
			});
		
		
				
					$("#rightBtn").click(function(){
						index+=1;	
						if(0<=index&&index<6){
						
						src = $fanArtImg.eq(index).attr("src");
						$fullImg.css("background-image","url("+src+")");
						}else if(index>=6){index=0;location.href="novelFanArt.html?index="+index;}
					});
					$("#leftBtn").click(function(){
						index-=1;
						if(0<=index&&index<6){
					
						src = $fanArtImg.eq(index).attr("src");
						$fullImg.css("background-image","url("+src+")");
						}
						else{alert("안돼"); index=0;}
					});
				
		
			$fullImg.click(function(){
				$popup.fadeOut();
			});
			
						//업로드될 파일이름의 index
				var idx = 1;
				
				//업로드용 라벨(+)
				var $uploadLbl = $("#uploadLbl");
				
				//파일을 읽어들이는 리더(HTML5 API)
				var reader = new FileReader();
				
				//업로드될 이미지들의 list
				var $ul = $("#uploadImgBox ul");
				
				
				//이미지를 읽어들이는 동안 보여줄 로더
				var $loader = $(".loader");
				
				$ul.on("click",".btn_delete",function() {
					
					//btn_delete를 누르면 그 부모(li)를 지운다.
					$(this).parent().remove();
					
				});
				
				
				//(+)를 눌러서 그 안의 input type=file의 값이 변경되면
				$uploadLbl.on("change","input",function() {
					
					//input type=file안의 실제 파일을 받아온다.(HTML5 API)
					var file = this.files[0];
					
					//그 input요소
					var $this = $(this);
					
					
					//선택한 그 파일이 이미지인지 확인한다.
					//(zip파일등 다른 파일이면 선택 불가)
					if(!file.type.match('image.*')) {
						alert("이미지를 선택해주세요~");
						
						$this.val("");
						
						return;
					}
					
					//우선 로더를 보여준다.
					$loader.show();
					
					//리더를 이용해 읽기를 시도한다.
					reader.readAsDataURL(file);
					
					
					//다 읽었으면 호출되는 콜백함수
					reader.onload = function() {
						//읽은 그 결과(이게 실제 이미지)
						var result = reader.result;
						
						//ul에 새로 붙일 li를 만든다.
						var $li =  $("<li>");
						
						//유저에게 보여질 img요소
						var $img = $("<img>").attr("src",result);
						
						//삭제 버튼
						var $button = $("<button type='button' title='삭제' class='btn_delete'><i class='fa fa-close'></i></button>");
						
						//li에 img,input,button을 붙임
						$li.append($img,$this,$button);
						
						//ul에 li를 붙임					
						$ul.append($li);
						
						//기존의 input요소는 li요소에 붙였기 때문에 또 새로운
						//input요소를 만들어서 label에 붙여야 한다.
						$("<input type='file'>").attr("name","upload"+ ++idx)
						                        .appendTo($uploadLbl);
						                        
						
						//로더를 숨긴다.                        
                        $loader.fadeOut(100);
						
					};
					
				});
				
				
			
			
			
		</script>
	</body>

</html>