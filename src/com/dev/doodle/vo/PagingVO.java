package com.dev.doodle.vo;

public class PagingVO {
	
	//페이징 처리용 VO 시작수, 끝수
	private int start, end,no;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public PagingVO() {
		
	}
	
	public PagingVO(int pageNo, int numPerPage) {
		
		//page 1 / 페이지당 갯수 7
		
		//페이지당 갯수 10
		//     		start 	end         
		//page1		  1		10
		//page2		  11	20
		//page3		  21	30
		//page4		  31	40
		this.end = pageNo * numPerPage;
		this.start = end-(numPerPage-1);
		
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
	
}
