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

	String noStr =request.getParameter("oldNo");
	int oldNo= Integer.parseInt(noStr);
	
	String content = (String) session.getAttribute("body");
	session.removeAttribute("body");	
	
	int userNo= loginUser.getNo();
	
	OldContent oldContent= new OldContent(userNo,oldNo,content);
	
	
	
	//GroupDAO의 insert호출
		boolean result= OldContentDAO.getDAO().insertOldContent(oldContent);
	
	//결과값을 json으로 리턴

%>
{"result":<%=result%>}