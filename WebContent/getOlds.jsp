<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.vo.Old"%>
<%@page import="java.util.Random"%>
<%@page import="com.dev.doodle.dao.OldDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%! int i = 0;
	List<Old> oldList = OldDAO.getDAO().selectRanList();%>
<%

	//post방식의 한글처리
	request.setCharacterEncoding("UTF-8");

	//파라미터 name,debutDate
	String write =request.getParameter("write");
	
	if(i>=oldList.size()){
		oldList = OldDAO.getDAO().selectRanList();
		i=0;
	}
	
	Old old=oldList.get(i);
	if(write.equals("T")){
	i++;
	}
	ObjectMapper om = new ObjectMapper();
	
	String json= om.writeValueAsString(old);

	//List의 toString()이 배열형태로 출력할 수 있게 오버라이딩 되어있어서
	out.print(json);	
	
%>