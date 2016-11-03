<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.dev.doodle.dao.BoardDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userNoStr = request.getParameter("userNo");
	int userNo = Integer.parseInt(userNoStr);

	BoardDAO dao = BoardDAO.getDAO();
	
	List<Board> boards = dao.selectMyWritten(userNo);
	
	ObjectMapper om = new ObjectMapper();
	
	String json = om.writeValueAsString(boards);
	
	out.print(json);
%>
