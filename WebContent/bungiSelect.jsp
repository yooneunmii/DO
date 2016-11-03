<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.dao.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.dev.doodle.vo.Board"%>
<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@ page language="java" contentType="application/json; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

String noStr =request.getParameter("no");
String paraStr =request.getParameter("para");

int no=Integer.parseInt(noStr);
int para=Integer.parseInt(paraStr);

Board par =new Board();
par.setParents(para);
par.setParentLine(no);

List<Board> bungis=BoardDAO.getDAO().selectBungi(par);
ObjectMapper om =new ObjectMapper();
String json =om.writeValueAsString(bungis);



out.print(json);

%>
