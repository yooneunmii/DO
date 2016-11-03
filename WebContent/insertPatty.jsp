<%@page import="com.dev.doodle.dao.PattyDAO"%>
<%@page import="com.dev.doodle.vo.Patty"%>
<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.vo.Favor"%>
<%@page import="com.dev.doodle.dao.OldContentDAO"%>
<%@page import="com.dev.doodle.vo.OldContent"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post방식의 한글처리
	request.setCharacterEncoding("UTF-8");

	

	User loginUser = (User)session.getAttribute("loginUser");
	
	String noStr =request.getParameter("burgerNo");
	int burgerNo= Integer.parseInt(noStr);
	
	int userNo= loginUser.getNo();

	String content = (String) session.getAttribute("body");
	session.removeAttribute("body");	
	
	
	Patty patty = new Patty(userNo,burgerNo,content);
	
	
	
	//GroupDAO의 insert호출
		boolean result= PattyDAO.getDAO().insertPatty(patty);
	
	//결과값을 json으로 리턴

%>
{"result":<%=result%>}
