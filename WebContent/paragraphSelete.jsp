<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.dao.ParagraphDAO"%>
<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="application/json; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
Paragraph par =new Paragraph();
String boardNoStr=request.getParameter("boardNo");
int boardNo =Integer.parseInt(boardNoStr);
String result="F";
par.setResult(result);
par.setBoardNo(boardNo);
List<Paragraph> pars =ParagraphDAO.getDAO().selectFTime(par);

ObjectMapper om =new ObjectMapper();
String json =om.writeValueAsString(pars);

out.print(json);

%>