<%@page import="com.dev.doodle.dao.UsersDAO"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
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
			<h1>"������" �� �Ҿ�Ʈ�� �׷��ּ���.</h1>
			<div id="FanArt">
				<a href="noverContent.html" id="check">��ǰ</a>
				<a href="#" id="noCheck">�Ҿ�Ʈ</a>
				
				<div id="uploadImgBox">
				<form action="#" method="post" id="send" enctype="multipart/form-data">
					<fieldset>
						<legend class="screen_out">���ε���</legend>
					<ul>
						
					</ul>
					<label id="uploadLbl"><i class="fa fa-plus"></i><input type="file" name="upload1" /></label>
				</fieldset>
				<button  id="FanBtn">������</button>
				</form>
			</div>
				<ul id="fanArtList">
					<li class="Art">
						<img src="img/2845788b56824b45939f2bc0d7d867fd.gif" class="fanArtImg"title="ũ�Ժ���">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">����</a>
								<a href="#">����</a>
							</div>
						</div>

					</li>
					<li class="Art">
						<img src="img/20150223_003742_1218183869.gif" class="fanArtImg"title="ũ�Ժ���">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">����</a>
								<a href="#">����</a>
							</div>
						</div>

					</li>
					<li class="Art">
						<img src="img/0B9c6V2jlGZIReGZDSy12dFpWVTQ.jpg	" class="fanArtImg"title="ũ�Ժ���">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">����</a>
								<a href="#">����</a>
							</div>
						</div>

					</li>
					<li class="Art">
						<img src="img/20150223_003742_1218183869.gif" class="fanArtImg"title="ũ�Ժ���">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">����</a>
								<a href="#">����</a>
							</div>
						</div>

					</li>
					<li class="Art">
						<img src="img/20150410_223220.png" class="fanArtImg"title="ũ�Ժ���">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">����</a>
								<a href="#">����</a>
							</div>
						</div>

					</li>
					<li class="Art">
						<img src="img/20150123_235703_-814277120.gif" class="fanArtImg"title="ũ�Ժ���">
						<div class="fro">
							<img class="frofileImg"src="img/muji2.png">
							<span class="id" >hen7705</span>
							<div class="tool">
								<a href="#">����</a>
								<a href="#">����</a>
							</div>
						</div>

					</li>
			
					
			
				</ul>
				<div id="page"> ����¡</div>
			</div>
			
		 <div id="popup" style="display: block">
				<div id="full">
					<div id="fullImg" style="background-image: url(img/20150123_235703_-814277120.gif)"></div>
					<i class="fa fa-chevron-circle-left" 
					title="������������"
					id="leftBtn"></i>
					<i class="fa fa-chevron-circle-right" 
					title="������������"
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
						else{alert("�ȵ�"); index=0;}
					});
				
		
			$fullImg.click(function(){
				$popup.fadeOut();
			});
			
						//���ε�� �����̸��� index
				var idx = 1;
				
				//���ε�� ��(+)
				var $uploadLbl = $("#uploadLbl");
				
				//������ �о���̴� ����(HTML5 API)
				var reader = new FileReader();
				
				//���ε�� �̹������� list
				var $ul = $("#uploadImgBox ul");
				
				
				//�̹����� �о���̴� ���� ������ �δ�
				var $loader = $(".loader");
				
				$ul.on("click",".btn_delete",function() {
					
					//btn_delete�� ������ �� �θ�(li)�� �����.
					$(this).parent().remove();
					
				});
				
				
				//(+)�� ������ �� ���� input type=file�� ���� ����Ǹ�
				$uploadLbl.on("change","input",function() {
					
					//input type=file���� ���� ������ �޾ƿ´�.(HTML5 API)
					var file = this.files[0];
					
					//�� input���
					var $this = $(this);
					
					
					//������ �� ������ �̹������� Ȯ���Ѵ�.
					//(zip���ϵ� �ٸ� �����̸� ���� �Ұ�)
					if(!file.type.match('image.*')) {
						alert("�̹����� �������ּ���~");
						
						$this.val("");
						
						return;
					}
					
					//�켱 �δ��� �����ش�.
					$loader.show();
					
					//������ �̿��� �б⸦ �õ��Ѵ�.
					reader.readAsDataURL(file);
					
					
					//�� �о����� ȣ��Ǵ� �ݹ��Լ�
					reader.onload = function() {
						//���� �� ���(�̰� ���� �̹���)
						var result = reader.result;
						
						//ul�� ���� ���� li�� �����.
						var $li =  $("<li>");
						
						//�������� ������ img���
						var $img = $("<img>").attr("src",result);
						
						//���� ��ư
						var $button = $("<button type='button' title='����' class='btn_delete'><i class='fa fa-close'></i></button>");
						
						//li�� img,input,button�� ����
						$li.append($img,$this,$button);
						
						//ul�� li�� ����					
						$ul.append($li);
						
						//������ input��Ҵ� li��ҿ� �ٿ��� ������ �� ���ο�
						//input��Ҹ� ���� label�� �ٿ��� �Ѵ�.
						$("<input type='file'>").attr("name","upload"+ ++idx)
						                        .appendTo($uploadLbl);
						                        
						
						//�δ��� �����.                        
                        $loader.fadeOut(100);
						
					};
					
				});
				
				
			
			
			
		</script>
	</body>

</html>