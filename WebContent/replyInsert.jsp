<%@page import="com.dev.doodle.dao.ReplyDAO"%>
<%@page import="com.dev.doodle.vo.Reply"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
Reply reply =new Reply();

String paragraphNoStr =request.getParameter("no");
String content=request.getParameter("content");
int paragraphNo =Integer.parseInt(paragraphNoStr);
int userNo =4;


reply.setContent(content);
reply.setImg("");
reply.setUserNo(userNo);
reply.setParagraphNo(paragraphNo);
boolean result =ReplyDAO.getDAO().insert(reply);
%>
{"result":<%=result%>}