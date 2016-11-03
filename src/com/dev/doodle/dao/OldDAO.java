package com.dev.doodle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;
import com.dev.doodle.vo.Old;

public class OldDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private OldDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static OldDAO dao;
	
	public static OldDAO getDAO() {
		
		if(dao==null){
			dao = new OldDAO();
		}
		
		return dao;
	}
	
	public List<Old> selectList() {
		List<Old> list = null;
		
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			
			list = session.selectList("old.selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}
		
	public List<Old> selectRanList() {
		List<Old> list = null;
		
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			
			list = session.selectList("old.selectRanList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}
}
