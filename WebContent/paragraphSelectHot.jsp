<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.dao.ParagraphDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@ page language="java" contentType="application/json; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

Paragraph par =new Paragraph();

par.setBoardNo(7);
par.setCategoryNo(1);
par.setResult("T");

List<Paragraph> para=ParagraphDAO.getDAO().selectHot(par);

ObjectMapper om =new ObjectMapper();
String json =om.writeValueAsString(para);

out.print(json);
%>