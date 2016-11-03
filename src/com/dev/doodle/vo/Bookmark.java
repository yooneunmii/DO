package com.dev.doodle.vo;

import java.sql.Date;

public class Bookmark {
	
	private int no,userNo,boardNo,turn;
	private String recomContent,recomCotent,open;
	private Date regdate;
	private String title, content;
	
	public String getRecomCotent() {
		return recomCotent;
	}
	public void setRecomCotent(String recomCotent) {
		this.recomCotent = recomCotent;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getTurn() {
		return turn;
	}
	public void setTurn(int turn) {
		this.turn = turn;
	}
	public String getRecomContent() {
		return recomContent;
	}
	public void setRecomContent(String recomContent) {
		this.recomContent = recomContent;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}

	public Bookmark() {
		// TODO Auto-generated constructor stub
	}
	public Bookmark(int userNo) {
		super();
		this.userNo = userNo;
	}
	
	
}
