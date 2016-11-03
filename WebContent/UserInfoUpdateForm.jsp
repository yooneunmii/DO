<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User loginUser = (User)session.getAttribute("loginUser");

	if(loginUser==null) {
		response.sendRedirect("main.jsp");
	} else {
	
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>UserInfoUpdateForm</title>
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/min.css" />
		
<style>
	html {
				overflow-y:scroll;
	}

	body, div, h1,h2, form, fieldset, input, textarea, footer,p {
		margin: 0; padding: 0; border: 0; outline: none;
	}

	body {color: #000; font-family: 'bon';}
	p {text-shadow:0 1px 0 #fff; font-size:24px;}
	
	#wrap {width:530px; margin:20px auto 0; height:1000px;}
	
	h1 {margin-bottom:20px; text-align:center;font-size:48px; text-shadow:0 1px 0 #ede8d9; }

	#form_wrap { overflow:hidden; height:446px; position:relative; top:0px;
		-webkit-transition: all 1s ease-in-out .3s;
		-moz-transition: all 1s ease-in-out .3s;
		-o-transition: all 1s ease-in-out .3s;
		transition: all 1s ease-in-out .3s;}
	
	#form_wrap:before {content:"";
		position:absolute;
		bottom:128px;left:0px;
		background:url('img/before.png');
		width:530px;height: 316px;}
	
	#form_wrap:after {content:"";position:absolute;
		bottom:0px;left:0;
		background:url('img/after.png');
		width:530px;height: 260px; }

	#form_wrap.hide:after, #form_wrap.hide:before {display:none; }
	
	/* mouse:hover 시 편지지 크기 증가 */
	#form_wrap:hover {height:1100px;top:-200px;}

	form {background:#f7f2ec url('img/letter_bg.png'); 
		position:relative; top:200px;
		height:1000px; width:400px; margin:0px auto; padding:20px; 
		border: 1px solid #fff;
		border-radius: 3px; 
		-moz-border-radius: 3px; -webkit-border-radius: 3px;
		box-shadow: 0px 0px 3px #9d9d9d, inset 0px 0px 27px #fff;
		-moz-box-shadow: 0px 0px 3px #9d9d9d, inset 0px 0px 14px #fff;
		-webkit-box-shadow: 0px 0px 3px #9d9d9d, inset 0px 0px 27px #fff;
		-webkit-transition: all 1s ease-in-out .3s;
		-moz-transition: all 1s ease-in-out .3s;
		-o-transition: all 1s ease-in-out .3s;
		transition: all 1s ease-in-out .3s;}

		#form_wrap:hover form {height:1800px;}
		
		button {
			width:62px;
			height:32px;
			font-family: 'bon', sans-serif;
			border:none;
			padding:0;
			line-height:15px;
			margin:0 6px;
			cursor: pointer;
			color:#fff;
			vertical-align: middle;
			font-size:13px;
			background: #000;
		}

		label {
			margin: 11px 20px 0 0; 
			font-size: 16px; color: #424242;
			text-transform: uppercase; 
			text-shadow: 0px 1px 0px #fff;
		}

		input[type=text], input[type=password], textarea {
			font: 14px normal normal uppercase helvetica, arial, serif;
			color: #7c7873; background:none;
			width: 100px; height: 30px; padding: 0px 10px; margin: 0 0 10px 0;
			border:1px solid #f8f5f1;
			-moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
			-moz-box-shadow: inset 0px 0px 1px #726959;
			-webkit-box-shadow:  inset 0px 0px 1px #b3a895; 
			box-shadow:  inset 0px 0px 1px #b3a895;	
		}	

		textarea { height: 80px; padding-top:14px;}

		textarea:focus,, input[type=password]:focus, input[type=text]:focus {background:rgba(255,255,255,.35);}

		#form_wrap input[type=submit] {
			position:relative;font-family: 'bon'; 
			font-size:24px; color: #7c7873;text-shadow:0 1px 0 #fff;
			width:100%; text-align:center;opacity:0;
			background:none;
			cursor: pointer;
			-moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius: 3px; 
			-webkit-transition: opacity .6s ease-in-out 0s;
			-moz-transition: opacity .6s ease-in-out 0s;
			-o-transition: opacity .6s ease-in-out 0s;
			transition: opacity .6s ease-in-out 0s;
		}
		
		#form_wrap:hover input[type=submit] {z-index:1;opacity:1;
			-webkit-transition: opacity .5s ease-in-out 1.3s;
			-moz-transition: opacity .5s ease-in-out 1.3s;
			-o-transition: opacity .5s ease-in-out 1.3s;
			transition: opacity .5s ease-in-out 1.3s;}
			
		#intro {
			width:370px;
			height:70px;
		}
		
		

</style>
</head>

<body>

	<div id="wrap">
		<h1>개인정보 수정<i class="fa fa-pencil"></i></h1>
		<div id="form_wrap">
			<form action="UserInfoUpdate.jsp" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="no" value="1" />
				<fieldset>
					<p>profile</p>
					<img src="C:\mcs\apache-tomcat-8.0.24\wtpwebapps\doodle\profile<%= loginUser.getProfile() %>" width="100px" height="100px" id="profileImg" /><br />
					<label for="addFile">파일 첨부</label>
					<input type="file" name="addFile" id="addFile" /><br />
					<br />
					<label for="password">비밀번호</label>
					<input type="password" name="password" id="password"> <br />
					<label for="checkPassword">비밀번호 확인</label>
					<input type="password" name="checkPassword" id="checkPassword"> <br />
					<label for="name">이 름</label>
					<input type="text" name="name" id="name" value="<%= loginUser.getName() %>" /> <br />
					<label for="nickname">닉네임</label>
					<input type="text" name="nickname" id="nickname" value="<%= loginUser.getNickname() %>"> <br />
					<label for="phone1">핸드폰 번호</label><br />
					<span id="phone">
						<input type="text" name="phone1" value="" pattern="[0-9]{3,4}" size="3" maxlength="3" />
						-
						<input type="text" name="phone2" value="" pattern="[0-9]{4}" size="4" maxlength="4"/>
						-
						<input type="text" name="phone3" value="" pattern="[0-9]{4}" size="4" maxlength="4"/> 
					</span>
					<label for="intro">자기소개</label><br />
						<textarea type="text" name="intro" id="intro"><%= loginUser.getIntro() %></textarea>
						<br />
						<br />
					<button type="reset">취소</button>
					<button type="submit">수정</button>
				</fieldset>
			</form>
		</div><!-- //form_wrap -->
	</div><!-- //wrap -->
	<script src="js/jquery.js"></script>
	<script>
				
				//파일을 읽어들이는 리더(HTML5 API)
				var reader = new FileReader();
				
				
				//'파일추가' 버튼을 눌러서 그 안의 input type=file의 값이 변경되면
				$("#addFile").on("change",function() {
					
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
					
					
					//리더를 이용해 읽기를 시도한다.
					reader.readAsDataURL(file);
					
					
					//다 읽었으면 호출되는 콜백함수
					reader.onload = function() {
						//읽은 그 결과(이게 실제 이미지)
						var result = reader.result;
						
						$("#profileImg").attr('src',result);
						
					};
					
				});
			
		</script>
</body>
</html>
<% } %>

