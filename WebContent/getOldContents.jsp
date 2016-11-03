<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.dao.OldContentDAO"%>
<%@page import="com.dev.doodle.vo.OldContent"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<OldContent> oldContents =OldContentDAO.getDAO().selectList();

	for(OldContent oldContent: oldContents){
		FavorDAO dao=FavorDAO.getDAO();
		oldContent.setLike(dao.selectLike(oldContent.getNo()));
		oldContent.setUnlike(dao.selectUnlike(oldContent.getNo()));
	}

	ObjectMapper om = new ObjectMapper();
	
	String json= om.writeValueAsString(oldContents);

	//List의 toString()이 배열형태로 출력할 수 있게 오버라이딩 되어있어서
	out.print(json);
%>