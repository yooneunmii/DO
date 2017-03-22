<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%int userNo =4; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>writeForm</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/dante-editor.css"/>
		<link rel="stylesheet" href="css/main.css"/>
		<style>
			html {
				width: 100%;
				height: 100%;
			}
			body {
				width: 100%;
				height: 100%;
				background-size:cover;
				background-repeat: no-repeat;
				background-position:center;
				font-family: bon, sans-serif;
			}
			
			#write {

				margin: auto;
				width: 1000px;
				height: 350px;
				margin-top: 100px;
				
			}
	
			.postArticle .layoutSingleColumn{
			width: 950px;
		
			}
			#writes{
				width:1000px;
				padding:30px 0;
				box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 
							0 6px 20px 0 rgba(0, 0, 0, 0.19);


				position: relative;
			}
			#writes #tool{
		
				width:100px;
				height:200px;
				
				text-align:center;
				position: absolute;
				right:-103px;
				top:52px;
			
			}
			#writes input{
				width:999px;
				border-radius:25px 25px 0 0;
				background:white;
				height:100px;
				font-size:50px;
				text-indent:20px;
				font-family: bon, sans-serif;
				border:none;
			}
			#writes #text {
				font-family: bon, sans-serif;
				text-indent:20px;
				font-weight: 200;
				width: 996px;
				font-size:15px;
				height: 350px;
				border:none;
				border-top:5px solid #BDBDBD;
				background:white;
				border-radius:0 0 25px 25px;
					overflow-y:auto;
			}
			#tool #backgroundImg{
				
				cursor:pointer;
				width:80px;
				height:80px;
				
			}
		
			#terms,#genre{
				margin-left:10px;
				width:80px;
				height:80px;
				overflow: hidden;
				cursor: pointer;
				transition: .5s ease;
				border-radius: 20px;
				margin-bottom: 5px;
			}
	
			#terms li,#genre li{
				width:80px;
				height:80px;
				background:#E0E0E0;
				line-height: 80px;
				font-size:25px;
				text-align: center;
			}
			
			#terms li:hover,#genre li:hover {
				background:#BDBDBD;
				color:#fff;
			}
			
			#writes #point{
				position: absolute;
				bottom:30px;
				right:30px;
			}
			#writes button{
				width:80px;
				height:50px;
				line-height:50px;
				border:none;
				border-radius:20px;
				background:#808080;
				opacity:0.7;
				font-size:20px;
				text-align: center;
				font-family: bon,sans-serif;
				
			}
			#writes button:hover{
				opacity: 1;
			}
			#writes #btn{
				position: absolute;
				right:0;
				bottom:-55px;
			}
			#popup{
				position:fixed;
				display: none;
				
			}
			
			#popup #imgList{
				width:600px;
				height:350px;
	
				background:white;
				box-shadow:inset 0 12px 15px 0 rgba(0, 0, 0, 0.1), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
				border-radius:25px;
				position: fixed;
				top:50%;
				left:50%;
			 	margin-top:-175px;
			 	margin-left:-300px;
			}

					
			#wrap {
				width:600px;
				margin:auto;
				padding:20px;
				font:200 16px bon,sans-serif;
				box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
			}
			
			#wrap h1{
				font-size:40px;
				font-weight:500;
			}
			
			#uploadImgBox {
				width:800px;
			
				position: relative;
			}
			#uploadImgBox #times{
				position: absolute;
				cursor:pointer;
				backgrund:red;
				top:0px;
				right:0px;
				font-size:20px;
				opacity: .6;
			}
			#uploadImgBox #times:hover{
				opacity: 1;
				transform: scale(1.2);
			}
			
			#uploadImgBox ul {
				width:600px;
				display: inline-block;
				padding-top:30px;
				padding-left:40px;
			
				
			}
			
			
			#uploadImgBox li {
				float:left;	
				margin:20px 0px;
				margin-right:40px;
				width:100px;
				height:100px;
				 box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
				vertical-align:middle; 
				position: relative;
				
				
			}
			#uploadImgBox li:nth-child(5){
				min-width:500px;
				min-height:150px;

				box-shadow:none;		

			}
			#uploadImgBox li:nth-child(6){
				width:500px;
				height:150px;
				box-shadow:none;
				padding-left:200px;
			}
			#uploadImgBox li:nth-child(6) img{
				
				min-width:100px;
				min-height:150px;
				
	
				
				
			}
			
			#uploadImgBox li img {
				width:100px;
				height:100px;
			}
			
			#uploadImgBox li .btn_delete {
				width:20px;
				height:20px;
				background:transparent;
				border-radius:20px;
				color:#858585;
				position: absolute;
				left:300px;
				top:0;
				border:none;
				font-size:50px;
				line-height:20px;	
				text-align: center;
				padding: 0;
				cursor: pointer;
			}
			
			
			#uploadImgBox label {
			
				width:100px;
				height:100px;
				display: inline-block;
				font-size:100px;
				margin-left:200px;
				text-align: center;
				color:#858585;
				line-height: 100px;
				vertical-align:middle; 
			
			
			}
			
			
			#uploadImgBox input[type=file] {
				width:100px;
				height:100px;
				opacity: 0;
				cursor: pointer;
				position: absolute;
		
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
		</style>
	</head>

	<body>
		<div id="write">
			<div id="writes">
			<form action="boardInsert.jsp" method="post" enctype="multipart/form-data">
			<input placeholder="������ �Է����ּ���" name="title">
			<input type="hidden" name="userNo" value="<%=userNo %>"/>
			<textarea id="text" name="content" placeholder="�������Է��Ͽ��ּ���"></textarea>
            <input plaecholder ="���̺�- ��ģ�Ŵ�"/>
			<div id="btn">
			<button type="reset">���</button>
			<button>���</button>
			</div>
			<div id="point">(0/<size>50</size>)</div>
			<div id="tool">
				<img id="backgroundImg"src="img/photos13(1).png">
		
				<ul id="terms">
					
					<li>���ڼ�</li>
					<li data-size="50">50��</li>
					<li data-size="150">150��</li>
					<li data-size="300">300��</li>
					<li data-size="500">500��</li>
				</ul>
				<ul id="genre">
					
					<li>�帣</li>
					<li >�θǽ�</li>
					<li >������</li>
					<li >�׼�</li>
					<li >��Ÿ��</li>
				</ul>
				<input type="hidden" name="genre" />
			</div>
			
		</div><!--writes-->
		
		</div>
		<div id="popup">
			<div id="imgList">
			<div id="uploadImgBox">
				<div id="times" title="�ݱ�"><i class="fa fa-times"></i></div>
				
						
					<ul id="upload">
						<li><img src="img/0B9c6V2jlGZIReGZDSy12dFpWVTQ.jpg"></li>
						<li><img src="img/4z3J8rA.jpg"></li>
						<li><img src="img/Ax6ucK0h.jpeg"></li>
						<li><img src="img/20150123_235703_-814277120.gif"></li>
						<li><label id="uploadLbl"><i class="fa fa-plus"></i><input type="file" name="upload1" /></label></li>
					</ul>

				
				</form>
			</div>
			
		</div>
		<script src="js/jquery.js"></script>
		<script src="js/underscore-min.js"></script>
		<script src="js/sanitize.js"></script>
		<script src="js/dante-editor.js"></script>
		<script>
		
		alert("Test");
			
			
			$("#terms").click(function(){
				terms();

				
			});
			
			$("li").click(function(){
				var $this =$(this),
					index =$this.index(),
					size= $this.attr("data-size"),
					sizetext=$("size").text();
					
					
					if(index==0){
						
					}else{
				
						$("size").text(size);
					}
					
					
			});
		
			$("#genre").click(function(){
				genre();
				
			});
			
			function genre(){
					var height=$("#genre").css("height");
				
				if(height=="400px"){	
					$("#genre").css("height","80px");
					
				}else{
					$("#genre").css("height","400px");
					
				}
			}
			
			var $genre = $("#genre");
			
			$("#terms").on("transitionend",function(){
				
				if($genre.css('display') == 'none') {
					$genre.show();
				}else {
					$genre.hide();
				}
				
				
			});
			
			function terms(){
				var height=$("#terms").css("height");
				
				if(height=="400px"){	
					$("#terms").css("height","80px");
					
				}else{
					$("#terms").css("height","400px");
					
				}
			}
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
					
					$("#uploadLbl").parent().show();
					
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
						                        
						$uploadLbl.parent().hide();
						//�δ��� �����.                        
                        $loader.fadeOut(100);
						
					};
					
				});
				
				
				$("#upload").on("click","li img",function(){
					var $this =$(this).parent(),
					    index =$this.index(),
					    src=$(this).attr("src");
					  // alert(src);
					   $("body").css("background-image","url("+src+")");
				});
				$("#times").click(function(){
					$("#popup").fadeOut();
				});
				$("#backgroundImg").click(function(){
					$("#popup").show();
				});
		</script>
	</body>

</html>