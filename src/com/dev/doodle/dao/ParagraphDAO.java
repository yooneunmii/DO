package com.dev.doodle.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;
import com.dev.doodle.vo.Paragraph;


public class ParagraphDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private ParagraphDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static ParagraphDAO dao;
	
	public static ParagraphDAO getDAO() {
		
		if(dao==null){
			dao = new ParagraphDAO();
		}
		
		return dao;
	}
	
	public boolean ranInsert(Paragraph paragraph) {
		boolean result = false;
		SqlSession session = null;
		try {
			session = factory.openSession(true);
			int size = session.insert("paragraph.ranInsert",paragraph);
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
	
	public Paragraph ranSelect(){
		Paragraph paragraph=null;
		SqlSession session=null;
		try {
			session = factory.openSession();
			paragraph =session.selectOne("paragraph.ranSelect");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		
		return paragraph;
	}
	
	//소희 누나
	
	public List<Paragraph> selectAll() {
		
		List<Paragraph> list = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			list = session.selectList("paragraph.selectAll");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)session.close();
		}
		return list;
	}
	
	
	public List<Paragraph> selectRealTime(Paragraph paragraph) {
		
		List<Paragraph> hotList = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			hotList = session.selectList("paragraph.selectRealTime",paragraph);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)session.close();
		}
		return hotList;
	}
	
	//홍수형
	
	
public boolean insertFirstLine(Paragraph paragraph){
		
		SqlSession session = null;
		
		try {
			
			session = factory.openSession(true);
			int size = session.insert("paragraph.insertFirstLine",paragraph);
			
			if(size>=1) return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch end
		
		return false;
		
	}//insertFirstLine() end
	
	public int selectWrittenCount(int userNo){
		int written = 0;
		SqlSession session = null;
		try {
			session = factory.openSession();
			
			if(userNo==0){
				return written;
			} else {
				written = session.selectOne("paragraph.selectWrittenCount", userNo);
			}//if genre end
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return written;
	}
	
	//은미
	
	public List<Paragraph> selectAllT(Paragraph par){
		List<Paragraph> para=null;
		SqlSession session=null;
		try {
			session =factory.openSession();
			para=session.selectList("paragraph.selectAllT",par);
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}finally{
			if(session!=null){session.close();}
		}
		return para;
		
	}//선정된애들
	public List<Paragraph> selectFTime(Paragraph par){
		List<Paragraph> para=null;
		SqlSession session=null;
		try {
			session =factory.openSession();
			para=session.selectList("paragraph.selectFTime",par);
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}finally{
			if(session!=null){session.close();}
		}
		return para;
		
	}//후보들 시간순으로 최근이 위로나오게해주는고

	public boolean insert(Paragraph par){
		boolean result =false;
		SqlSession session=null;
		try {
			session=factory.openSession(true);
			int num=session.insert("paragraph.insert",par);
			if(num>0){
				result =true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null){session.close();}
		}
		return result;
	}
	
	public List<Paragraph> selectHot(Paragraph par){
		List<Paragraph> para=null;
		SqlSession session=null;
		try {
			session =factory.openSession();
			para=session.selectList("paragraph.selectHot",par);
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}finally{
			if(session!=null){session.close();}
		}
		return para;
	}
}
