<%@page import="com.dev.doodle.dao.UsersDAO"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%
    String noStr =request.getParameter("userNo");
    int no = Integer.parseInt(noStr);
    User user=UsersDAO.getDAO().selectOne(no);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>porfile</title>
			<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<style>
			body{
				font-family: bon,sans-serif;
			}
			.pr {
				width: 200px;
				height: 200px;
				text-align: center;
				padding: 20px;
			}
			#prfileBox {

				width: 150px;
				height:150px;
				margin: 0px;
				margin-top: 5px;
				text-align: center;
	
				border-radius: 100px;
			}
			.pr i{
				margin:10px;
				font-size:15px;
				font-weight: 700;
				transition: .2s ease;
				cursor: pointer;
			}
			.pr i:hover{
				opacity: .6;
			}
			.pr h3{
				margin:10px;
				font-size:30px;
				
			}
		</style>
	</head>

	<body>
		</div>
		<div class="pr">
			<a href="userPage.jsp?userNo=<%=user.getNo() %>" target="_blank" title="유저페이지바로가기"><img src="img/<%=user.getProfile() %>" id="prfileBox" alt="프로필사진"/></a>
			<h3><%=user.getNickname() %></h3>
			<i class="fa fa-plus" title="이웃으로추가">이웃추가</i>
		</div>

	</body>
</html>