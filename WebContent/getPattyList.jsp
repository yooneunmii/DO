<%@page import="com.dev.doodle.dao.PattyDAO"%>
<%@page import="com.dev.doodle.vo.Patty"%>
<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.dao.OldContentDAO"%>
<%@page import="com.dev.doodle.vo.OldContent"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");


	String noStr =request.getParameter("volume");
	int volume= Integer.parseInt(noStr);


	List<Patty> list =PattyDAO.getDAO().selectList(volume);


	ObjectMapper om = new ObjectMapper();
	
	String json= om.writeValueAsString(list);

	//List의 toString()이 배열형태로 출력할 수 있게 오버라이딩 되어있어서
	out.print(json);
%>