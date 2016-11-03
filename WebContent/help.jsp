<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ID, 비밀번호 찾기</title>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/noto.sans.korea.css" />
<link rel="stylesheet" href="../css/font-awesome.min.css" />
<link rel="stylesheet" href="../css/header.css" />
<link rel="shortcut icon" href="img/favicon1.ico">
<style>
#help {
	margin: auto;
	width: 800px;
	padding-top: 81px;
}

#help>ul>li {
	width: 110px;
	height: 110px;
	background-color: #fff !important;
	list-style: none;
	display: block;
	border: 1px solid #fff;
	position: relative;
	border-right: none;
	opacity: .3;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=30);
}

#help>ul>li.idSearch {
	background: url(../img/home.png) no-repeat center center;
}

#help>ul>li.pwdSearch {
	background: url(../img/login.png) no-repeat center center;
}

#help>ul>li.selected {
	opacity: 1;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100);
	border: 1px solid #eee;
	border-right: none;
	z-index: 2;
	position: relative;
}

#help>ul {
	float: left;
	width: 110px;
	text-align: left;
	display: block;
	margin: auto 0;
	padding: 0;
	position: relative;
}

#help>div {
	margin-left: 110px;
	border: 1px solid #eee;
	min-height: 300px;
	padding: 12px;
	position: relative;
	z-index: 1;
	-moz-border-radius: 20px;
}

#help>div>h4 {
	color: #800;
	font-size: 1.2em;
	border-bottom: 1px dotted #800;
	padding: 10px;
}

#help div p {
	padding: 20px 10px;
}

.helpBtn button {
	width: 70px;
	height: 32px;
	font: 400 15px 'bon', sans-serif;
	border: none;
	line-height: 15px;
	margin: 0 5px 0 0;
	cursor: pointer;
	color: #fff;
	vertical-align: middle;
	background: #BDBDBD;
}

.helpBtn a {
	text-decoration: none;
	display: inline-block;
	text-align: center;
	font: 400 12px 'bon', sans-serif;
	width: 70px;
	height: 32px;
	border: none;
	line-height: 32px;
	cursor: pointer;
	color: #fff;
	background: #BDBDBD;
	position: absolute;;
	right: 0;
	top: 0;
}

.helpBtn span {
	position: absolute;
	top: 0;
	left: 0;
}

.helpBtn {
	width: 225px;
	height: 42px;
	position: absolute;
	right: 10px;
	bottom: 15px;
}

.helpCondition, .helpCondition1 {
	padding: 10px;
}

.helpCondition input {
	width: 200px;
	margin: 0 5px;
	font: 400 15px 'bon', sans-serif;
}

.helpCondition1 input {
	width: 80px;
	font: 400 15px 'bon', sans-serif;
}

#id, #nickname {
	width: 130px;
}

.popup {
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	background: rgba(0, 0, 0, .6);
	z-index: 100;
}

.msg {
	width: 500px;
	height: 200px;
	position: relative;
	top: 50%;
	left: 50%;
	margin: -110px 0 0 -250px;
	text-align: center;
	line-height: 200px;
	font-size: 25px;
	font-weight: 700;
	background: #fff;
	z-index: 101;
}

.popup button {
	width: 60px;
	height: 30px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: 50px 0 0 -30px;
	border: none;
	font: 400 20px 'bon', sans-serif;
	background: #fff;
	color: #333;
	z-index: 101;
	font: 400 20px 'bon', sans-serif;
}

input {
	border: 1px solid #eee;
}
</style>
</head>
<body>
	<%@include file="template/header.jsp"%>
	<div id="help">
		<ul>
			<li class="idSearch selected"></li>
			<li class="pwdSearch"></li>
		</ul>
		<div class="searchForm">
			<h4>아이디 찾기</h4>
			<form method="post" action="helpId.jsp">
				<fieldset>
					<legend class="screen_out">아이디찾기폼</legend>
					<p>아이디를 잊어버리셨나요? 아이디를 찾기 위해서는 닉네임과 핸드폰 번호가 필요합니다.</p>
					<div class="helpCondition">
						<label for="nickname">닉네임</label> <input type="text"
							name="nickname" id="nickname" />
					</div>
					<div class="helpCondition1">
						<label for="phone">핸드폰 번호</label> <input type="text" name="phone1">-<input
							type="text" name="phone2">-<input type="text"
							name="phone3">
					</div>
					<div class="helpBtn">
						<span><button id="submit" type="submit">찾 기</button>
							<button type="reset">취 소</button></span> <a href="indexMain.jsp">Main
							Page</a>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="searchForm">
			<h4>비밀번호 찾기</h4>
			<form method="post" action="helpPwd.jsp">
				<fieldset>
					<legend class="screen_out">비번찾기폼</legend>
					<p>비밀번호를 잊어버리셨나요? 비밀번호를 찾기 위해서는 이메일이나 핸드폰 번호가 필요합니다.</p>
					<div class="helpCondition">
						<label for="id">아이디</label> <input type="text" name="id" id="id"
							placeholder="id@email.com">
					</div>
					<div class="helpCondition">
						<label for="nickname">닉네임</label> <input type="text"
							name="nickname" id="nickname" />
					</div>
					<div class="helpCondition1">
						<label for="phone">핸드폰 번호</label> <input type="text" name="phone1">-<input
							type="text" name="phone2">-<input type="text"
							name="phone3">
					</div>
					<div class="helpBtn">
						<span><button id="submit" type="submit">찾 기</button>
							<button type="reset">취 소</button></span> <a href="indexMain.jsp">Main
							Page</a>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<!-- wrap end -->
	<%
	String userId = (String)session.getAttribute("userId");
	String userPwd = (String) session.getAttribute("userPwd");	
	
	if(userId!=null||userPwd!=null) {
	
	%>
		<div class="popup">
		<div class="msg">
			<%if ((userId!=null)&&(userPwd==null)) {
				%>당신의 아이디는
			<%=userId%>입니다.
			<%} else if (userPwd!= null) {
				%>당신의 비밀번호는
			<%=userPwd%>입니다.<%} %>
		</div>
		<!-- //msg -->
		<button>확인</button>
	</div>
	<!-- //popup -->
	<% 
	 }
	%>

	<script src="js/jquery.js"></script>
	<script src="js/header.js"></script>
	<script>

		$(function() {

			var $items = $('#help>ul>li');

			$items.mouseover(function() {

				$items.removeClass('selected');
				$(this).addClass('selected');

				var index = $items.index($(this));

				$('#help .searchForm').hide().eq(index).show();

			}).eq(1).mouseover();

		});

		$(".popup button").click(function() {
			$(".popup").hide();
			<%session.invalidate();%>
		});

	</script>
</body>
</html>