package com.dev.doodle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;
import com.dev.doodle.vo.Burger;
import com.dev.doodle.vo.Paragraph;
import com.dev.doodle.vo.Patty;

import oracle.net.aso.f;

public class PattyDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private PattyDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static PattyDAO dao;
	
	public static PattyDAO getDAO() {
		
		if(dao==null){
			dao = new PattyDAO();
		}
		
		return dao;
	}
	

	public boolean insertPatty(Patty patty) {
		boolean result = false;
		SqlSession session = null;
		try {
			session = factory.openSession(true);
			int size = session.insert("patty.insertPatty",patty);
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
	
	
	
	
	
	public Patty selectOne(int no){
		Patty patty=null;
		SqlSession session=null;
		try {
			session = factory.openSession();
			patty =session.selectOne("patty.selectOne",no);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		
		return patty;
	}	

	
	public Patty bestSelect(int no){
		Patty patty=null;
		SqlSession session=null;
		try {
			session = factory.openSession();
			patty =session.selectOne("patty.bestSelect",no);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		
		return patty;
	}
	
	public List<Patty> selectList(int no) {
		List<Patty> list = null;
		
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			
			list = session.selectList("patty.selectList",no);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}
		
}
