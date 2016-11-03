package com.dev.doodle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;
import com.dev.doodle.vo.OldContent;
import com.dev.doodle.vo.Paragraph;


public class OldContentDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private OldContentDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static OldContentDAO dao;
	
	public static OldContentDAO getDAO() {
		
		if(dao==null){
			dao = new OldContentDAO();
		}
		
		return dao;
	}
	
	public boolean insertOldContent(OldContent oldContent) {
		boolean result = false;
		SqlSession session = null;
		try {
			session = factory.openSession(true);
			int size = session.insert("oldContent.insertOldContent",oldContent);
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
	
	public List<OldContent> selectList() {
		List<OldContent> list = null;
		
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			
			list = session.selectList("oldContent.selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}
	

	
	public OldContent bestSelect() {
		OldContent oldContent = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			
			oldContent = session.selectOne("oldContent.bestSelect");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return oldContent;
	}	
}
