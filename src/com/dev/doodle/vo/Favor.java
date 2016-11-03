package com.dev.doodle.vo;

public class Favor {

	private int no,categoryNo,userNo,kindNo,up,down;
	private String result, content;
	
	
	
	
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getKindNo() {
		return kindNo;
	}
	public void setKindNo(int kindNo) {
		this.kindNo = kindNo;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Favor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Favor(int categoryNo, int userNo, int kindNo, String result) {
		super();
		this.categoryNo = categoryNo;
		this.userNo = userNo;
		this.kindNo = kindNo;
		this.result = result;
	}
	
	
	
	
	
}
