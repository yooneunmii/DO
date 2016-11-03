package com.dev.doodle.vo;

public class Genre {

	//멤버필드
	private int boardNo, userNo;
	private String genre;
	
	//기본생성자
	public Genre(){
		
	}
	public Genre(int boardNo, int userNo, String genre) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.genre = genre;
	}	
	//getter.setter
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}
	
}
