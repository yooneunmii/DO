<%@page import="com.dev.doodle.dao.BookmarkDAO"%>
<%@page import="com.dev.doodle.dao.BoardDAO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.vo.Reply"%>
<%@page import="java.util.List"%>
<%@page import="com.dev.doodle.dao.ReplyDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//검색어에 입력된 값을 받아옵니다
	String keyword = request.getParameter("keyword");
	
	if(keyword!=""){

		ReplyDAO dao = ReplyDAO.getDAO();

		List<Reply> replies = dao.selectSearch(keyword);
		
		//for문
		for(Reply reply : replies){
			
			BookmarkDAO daoBook = BookmarkDAO.getDAO();
			//board.setBookmarkCount(daoBook.selectCount(board.getNo()));
			
			
			
		} //향상된 for end 
		
		
		ObjectMapper om = new ObjectMapper();

		String json = om.writeValueAsString(replies);

		out.print(json);
	}
%>

