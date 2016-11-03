<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.dao.BookmarkDAO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.dev.doodle.dao.BoardDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String genre = request.getParameter("genre");

	List<Board> boards = BoardDAO.getDAO().selectGenre(genre);
	
	//for문
	for(Board board : boards){
		
		BookmarkDAO daoBook = BookmarkDAO.getDAO();
		FavorDAO daoFavor = FavorDAO.getDAO();
		board.setBookmarkCount(daoBook.selectCount(board.getNo()));
		board.setLike(daoFavor.selectLike(board.getNo()));
		
	} //향상된 for end 
	
	
	ObjectMapper om = new ObjectMapper();
	
	String json = om.writeValueAsString(boards);
	
	out.print(json);
%>
