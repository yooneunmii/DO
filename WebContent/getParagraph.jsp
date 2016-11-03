<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.dao.ParagraphDAO"%>
<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<Paragraph> list = ParagraphDAO.getDAO().selectAll();
ObjectMapper om = new ObjectMapper();

String json = om.writeValueAsString(list);
out.print(json);

%>