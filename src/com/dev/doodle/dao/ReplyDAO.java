package com.dev.doodle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;
import com.dev.doodle.vo.PagingVO;
import com.dev.doodle.vo.Reply;

import oracle.net.aso.f;

public class ReplyDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private ReplyDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static ReplyDAO dao;
	
	public static ReplyDAO getDAO() {
		
		if(dao==null){
			dao = new ReplyDAO();
		}
		
		return dao;
	}
	
	//홍수형
	
	
	public List<Reply> selectSearch(String keyword){
		
		List<Reply> reply = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			reply = session.selectList("reply.selectSearch",keyword);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(session!=null) session.close();
		}//try~catch end
		
		return reply;
	}//selectSearch() end
	
	//은미
	
	public boolean insert(Reply reply){
		boolean result =false;
		SqlSession session=null;
		try {
			session =factory.openSession(true);
			int num =session.insert("reply.insert",reply);
			if(num>0){
				result =true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
		}
		return result;
	}
	
	public List<Reply> select (PagingVO pagin){
		List<Reply> reply =null;
		SqlSession session=null;
		try {
			session =factory.openSession();
			reply=session.selectList("reply.select",pagin);
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}finally{
			if(session!=null){session.close();}
		}
		return reply;
	}
	public int total (int no){
		int total =0;
		
		SqlSession session=null;
		try {
			session =factory.openSession();
			total=session.selectOne("reply.totle",no);
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}finally{
			if(session!=null){session.close();}
		}
		return total;
	}
}
