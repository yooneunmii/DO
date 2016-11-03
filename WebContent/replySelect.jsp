<%@page import="com.dev.doodle.util.PaginateUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.dev.doodle.vo.PagingVO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.dev.doodle.dao.ReplyDAO"%>
<%@page import="com.dev.doodle.vo.Reply"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	String noStr =request.getParameter("no");
	String pageStr =request.getParameter("page");

int now=Integer.parseInt(pageStr);
		 int pa=Integer.parseInt(pageStr);
		
	
	int end =pa*5;
	 pa=(5*pa)-4;
	int no =Integer.parseInt(noStr);
	PagingVO pagin =new PagingVO();
	
	pagin.setNo(no);
	pagin.setStart(pa);
	pagin.setEnd(end);
	
	ReplyDAO dao = ReplyDAO.getDAO();

	List<Reply> reply=dao.select(pagin);
	
	Map<String,Object> map = new HashMap();
	map.put("list",reply);
	
	int total =dao.total(no);
	
	String paginate = PaginateUtil.getPaginage(now, 5, 5, total);
	
	map.put("paginate",paginate);

ObjectMapper om =new ObjectMapper();
String json =om.writeValueAsString(map);

out.print(json);
%>