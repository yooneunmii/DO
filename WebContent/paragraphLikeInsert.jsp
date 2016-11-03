<%@page import="com.dev.doodle.dao.FavorDAO"%>
<%@page import="com.dev.doodle.vo.Favor"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

String userNoStr =request.getParameter("userNo");
int userNo =Integer.parseInt(userNoStr);

String kindNoStr =request.getParameter("no");
int kindNo =Integer.parseInt(kindNoStr);

Favor favor= new Favor();

favor.setCategoryNo(1);
favor.setKindNo(kindNo);
favor.setResult("T");
favor.setUserNo(userNo);

FavorDAO dao =FavorDAO.getDAO();
boolean result =false;
int no=dao.check(favor);
if(no==0){
	result=true;
	dao.insert(favor);
}
%>
{"result":<%=result%>}
