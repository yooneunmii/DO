<%@page import="com.dev.doodle.vo.Paragraph"%>
<%@page import="com.dev.doodle.dao.ParagraphDAO"%>
<%@page import="com.dev.doodle.dao.BoardDAO"%>
<%@page import="com.dev.doodle.vo.Board"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

	request.setCharacterEncoding("EUC-KR");

	String path=application.getRealPath("");
	
	String uploadPath=path+"upload";
	
	MultipartRequest mr=new MultipartRequest(request,uploadPath,1024*1024*50,"EUC-KR",new DefaultFileRenamePolicy());
	

	String file2=mr.getParameter("upload1");
	String file=mr.getFilesystemName("upload");
	String content=mr.getParameter("content");
	String title =mr.getParameter("title");
	String userNoStr =mr.getParameter("userNo");
	int userNo =Integer.parseInt(userNoStr);
	String genre ="·Î¸Ç½º";
	int hit=0;
	String profile="djqtdj.jsp";
	int pareantLine=0,parents=0;
	String time="18";
	
	Board board =new Board();
	board.setUserNo(userNo);
	board.setContent(content);
	board.setGenre(genre);
	board.setTime(time);
	board.setTitle(title);
	board.setHit(hit);
	board.setParentLine(pareantLine);
	board.setParents(parents);
	board.setProfile(profile);
	
	BoardDAO dao =BoardDAO.getDAO();
	
	boolean result =dao.insert(board);
	
	int boardNo=dao.boardNo(board);
	Paragraph par =new Paragraph();
	par.setUserNo(userNo);
	par.setBoardNo(boardNo);
	par.setContent(content);
	par.setResult("T");
	par.setLastLine("T");
	boolean result2= ParagraphDAO.getDAO().insert(par);
	
	if(result&&result2){
		response.sendRedirect("novelBoard.jsp");
		}
	
%>
