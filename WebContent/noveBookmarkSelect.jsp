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
	result =true;//�ϸ�ũ�� �Ǿ��־ ��ǥ�ð� ��������� ��ĥ�Ǿ���Ѵ�!
}
%>

{"result":<%=result%>}
