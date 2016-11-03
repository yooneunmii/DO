<%@page import="com.dev.doodle.dao.ParagraphDAO"%>
<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

String content =request.getParameter("content");
String boardNoStr =request.getParameter("boardNo");
int boardNo =Integer.parseInt(boardNoStr);
int userNo =4;
String result ="F";
String lastLine="F";


Paragraph par =new Paragraph();
par.setBoardNo(boardNo);
par.setUserNo(userNo);
par.setContent(content);
par.setResult(result);
par.setLastLine(lastLine);
par.setImg(null);

boolean result2 = ParagraphDAO.getDAO().insert(par);

%>
{"result":<%=result2%>}