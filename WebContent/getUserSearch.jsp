<%@page import="com.dev.doodle.dao.NeighborDAO"%>
<%@page import="com.dev.doodle.dao.ParagraphDAO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.dev.doodle.dao.UsersDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//검색어에 입력된 값을 받아옵니다
	String keyword = request.getParameter("keyword");

	if(keyword!=""){
	
		UsersDAO dao = UsersDAO.getDAO();
	
		List<User> users = dao.selectSearch(keyword); 
		
		//for문
		for(User user : users){
			
			ParagraphDAO daoParagraph = ParagraphDAO.getDAO();
			NeighborDAO daoNeighbor = NeighborDAO.getDAO();
			user.setWrittenCount(daoParagraph.selectWrittenCount(user.getNo()));
			user.setFollowerCount(daoNeighbor.selectFollowerCount(user.getNo()));			
		} //향상된 for end 
		
		ObjectMapper om = new ObjectMapper();

		String json = om.writeValueAsString(users);

		out.print(json);
	}
%>