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

book.setRecomCotent("추천내용을 등록하지 않았습니다.");
book.setOpen("F");
book.setUserNo(userNo);
book.setBoardNo(boardNo);
BookmarkDAO dao= BookmarkDAO.getDAO();
int turn =dao.userBookmark(4)+1;
book.setTurn(turn);

boolean result =dao.insert(book);




%>
{"result":<%=result%>}