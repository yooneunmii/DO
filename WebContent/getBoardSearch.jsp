<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.dao.BookmarkDAO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.dev.doodle.dao.BoardDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//검색어에 입력된 값을 받아옵니다
	String keyword = request.getParameter("keyword");
	
	if(keyword!=""){
	
	BoardDAO dao = BoardDAO.getDAO();
	
	List<Board> boards = dao.selectSearch(keyword);	
	
	//for문
		for(Board board : boards){
				
			BookmarkDAO daoBook = BookmarkDAO.getDAO();
			FavorDAO daoFavor = FavorDAO.getDAO();
			board.setBookmarkCount(daoBook.selectCount(board.getNo()));
			board.setLike(daoFavor.selectSearchLike(board.getNo()));
				
		} //향상된 for end 

	ObjectMapper om = new ObjectMapper();

	String json = om.writeValueAsString(boards);

	out.print(json);
	
	}
%>