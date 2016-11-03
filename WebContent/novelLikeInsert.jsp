<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.vo.Favor"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
int categoryNo=2;
String userNoStr =request.getParameter("userNo");
int userNo =Integer.parseInt(userNoStr);

String  boardNo =request.getParameter("boardNo");
int kindNo =Integer.parseInt(boardNo);
String result1 ="T";

Favor favor =new Favor();
favor.setCategoryNo(categoryNo);
favor.setUserNo(userNo);
favor.setKindNo(kindNo);
favor.setResult(result1);

boolean result =FavorDAO.getDAO().insert(favor);


%>

{"result":<%=result%>}