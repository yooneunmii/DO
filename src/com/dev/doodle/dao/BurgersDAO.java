package com.dev.doodle.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;
import com.dev.doodle.vo.Burger;

public class BurgersDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private BurgersDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static BurgersDAO dao;
	
	public static BurgersDAO getDAO() {
		
		if(dao==null){
			dao = new BurgersDAO();
		}
		
		return dao;
	}

	public List<Burger> selectList() {
		List<Burger> list = null;
		
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			
			list = session.selectList("burgers.bergerSelect");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return list;
	}
}
