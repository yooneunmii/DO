<%@page import="com.dev.doodle.vo.Bookmark"%>

<%@page import="com.dev.doodle.dao.BookmarkDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

String userNoStr =request.getParameter("userNo");
int userNo =Integer.parseInt(userNoStr);
String boardStr =request.getParameter("boardNo");
int boardNo =Integer.parseInt(boardStr);
Bookmark book =new Bookmark();
book.setBoardNo(boardNo);
book.setUserNo(userNo);
int no =BookmarkDAO.getDAO().check(book);

boolean result =false;

if(no>0){
	result =true;//북마크가 되어있어서 별표시가 노랑색으로 색칠되어야한당!
}
%>

{"result":<%=result%>}
