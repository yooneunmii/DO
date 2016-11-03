<%@page import="com.dev.doodle.dao.BookmarkDAO"%>
<%@page import="com.dev.doodle.vo.Bookmark"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String userNoStr =request.getParameter("userNo");
int userNo =Integer.parseInt(userNoStr);
String boardNoStr =request.getParameter("boardNo");
int boardNo =Integer.parseInt(boardNoStr);
Bookmark book =new Bookmark();
book.setUserNo(userNo);
book.setBoardNo(boardNo);

boolean result =BookmarkDAO.getDAO().delete(book);

%>
{"result":<%=result%>}