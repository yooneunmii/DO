<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="com.dev.doodle.util.CustomMultipartRequest"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//파일시스템에서 upload폴더 경로를 얻어와야 합니다.

	//기본 서버의 경로
	String path = application.getRealPath("");

	//파일업로드할 경로
	String uploadPath = path+"photo";
	
	/*
	cos 라이브러리의 
	 MultipartRequest
	 인자 5개짜리 생성자
	new MultipartRequest(리퀘스트,
			             파일경로,
			             최대파일업로드사이즈,
			             파일인코딩방식,
			             파일중복시이름규칙객체)
	
	DefaultFileRenamePolicy는 중복시 숫자1~9999까지 붙임
	
	*/
	MultipartRequest mr = 
	new MultipartRequest(request,
			             uploadPath,
			             1024*1024*50,
			             "UTF-8",
			             new DefaultFileRenamePolicy());
	
	
	
	//중복시 이름이 변경되기 때문에 
	//실제 저장된 파일이름을 얻어와야 합니다.
	String profile = mr.getFilesystemName("file");
	
	session.setAttribute("img",profile);
	
%>
{"src":"photo/<%=profile%>"}


