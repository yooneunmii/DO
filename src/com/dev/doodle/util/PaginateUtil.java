package com.dev.doodle.util;

public class PaginateUtil {

	public static String getPaginage(int now, int numPage, int numBlock,int total){
		StringBuilder page =new StringBuilder("<div class=\"paginate\">");
		
		int  totalPage =(int)Math.ceil((double)total/numPage);//전체페이지수
		int nowBlock=(int)Math.ceil((double)now/numBlock);//현재 블록
		int totalBlock =(int)Math.ceil((double)totalPage/numBlock);//전체 블록수
		String href="#";
		String param="#";
		
		//이전
		if(now==1){
			//비활성화
			page.append("<span title=\"이전페이지가없습니다\"><i class=\"fa fa-chevron-left\"></i></span>");
		}else{
			page.append("<a href='"+href+"?"+param+"="+(now-1)+"' title=\"이전페이지로\"><i class=\"fa fa-chevron-left\"></i></a>");
		}
		//기본페이지
		if(total>0){
		for(int i=0;i<numBlock;i++){
		
			int realPage=((nowBlock*numBlock)+i)-(numBlock-1);
			
			//현재 페이지
			if(now==realPage){
				page.append("<strong title='현재'"+realPage+"페이지>"+realPage+"</strong>");
			}else{
				page.append("<a href='"+href+"?"+param+"="+realPage+"'title='"+realPage+"'>"+realPage+"</a>");
			}
			//break;
			if(realPage==totalPage){
				break;
			}
		}//for end
		}//total이 0일경우이걸 돌릴일유가없다
		
		//다음페이지
		//현재페이지가 마지막페이지 일때
		if(now>=totalPage){
			//비활성화
			page.append("<span title=\"다음페이지가없습니다.\"><i class=\"fa fa-chevron-right\"></i></span>");
		}else{
			page.append("<a href='"+href+"?"+param+"="+(now+1)+"' title=\"다음페이지로\"><i class=\"fa fa-chevron-right\"></i></a></span>");
			//활성화
		}
		page.append("</div>");
		
		
		return page.toString();
	}
}
