package com.dev.doodle.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;
import com.dev.doodle.vo.Favor;
import com.dev.doodle.vo.Paragraph;


public class FavorDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private FavorDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static FavorDAO dao;
	
	public static FavorDAO getDAO() {
		
		if(dao==null){
			dao = new FavorDAO();
		}
		
		return dao;
	}

	public boolean insertAgo(Favor favor) {
		boolean result = false;
		SqlSession session = null;
		try {
			session = factory.openSession(true);
			int size = session.insert("favor.insertAgo",favor);
			if(size>=1) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}
	
	public int selectUnlike(int no) {
		int unlike=0;
		SqlSession session = null;
		
		try {
			
			session = factory.openSession();
			unlike = session.selectOne("favor.selectUnlike",no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return unlike;
	}	
	public int selectLike(int no) {
		int like=0;
		SqlSession session = null;
		
		try {
			
			session = factory.openSession();
			like = session.selectOne("favor.selectLike",no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return like;
	}
	

	public int selectSearchUnlike(int no) {
		int unlike=0;
		SqlSession session = null;
		
		try {
			
			session = factory.openSession();
			unlike = session.selectOne("favor.selectSearchUnlike",no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return unlike;
	}	
	public int selectSearchLike(int no) {
		int like=0;
		SqlSession session = null;
		
		try {
			
			session = factory.openSession();
			like = session.selectOne("favor.selectSearchLike",no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return like;
	}	
	
	
	
	public int selectoverlap(Favor favor) {
		int overlap=0;
		SqlSession session = null;
		
		try {
			
			session = factory.openSession();
			overlap = session.selectOne("favor.selectoverlap",favor);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return overlap;
	}
	
	public boolean updateFavor(Favor favor) {
		boolean result = false;
		SqlSession session = null;
		
		try {
			
			session = factory.openSession(true);
			int num = session.update("favor.updateFavor",favor);
			
			if(num>=1) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return result;
	}
	
	//소희 누나
	
	public List<Favor> selectBest() {
		
		List<Favor> bestList = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			bestList = session.selectList("favor.selectBest");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session!=null)session.close();
		}
		
		return bestList;
	}

	//은미
	
	public List<Favor> boardLike (Favor favor){
		List<Favor> like=null;
		SqlSession session =null;
		try {
			session=factory.openSession();
			like =session.selectList("favor.boardLike", favor);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
			
		}
		return like;
	}
	
	public boolean insert(Favor favor){
		boolean result =false;
		SqlSession session=null;
		try {
			session=factory.openSession(true);
			int num =session.insert("favor.insert",favor);
			if(num>0){
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
		}
		return result;
	}
	public boolean delete(Favor favor){
		boolean result =false;
		SqlSession session=null;
		try {
			session=factory.openSession(true);
			int num =session.delete("favor.delete",favor);
			if(num>0){
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
		}
		return result;
	}
	
	public int check(Favor favor){
		int no=0;
		SqlSession session=null;
		try {
			session=factory.openSession();
			no= session.selectOne("favor.check",favor);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
		}
		return no;
		}
	public int total(Favor favor){
		int no=0;
		SqlSession session=null;
		try {
			session=factory.openSession();
			no= session.selectOne("favor.total",favor);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
		}
		return no;
		}
		
}
