package com.dev.doodle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;

import oracle.net.aso.f;

public class GenreDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private GenreDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static GenreDAO dao;
	
	public static GenreDAO getDAO() {
		
		if(dao==null){
			dao = new GenreDAO();
		}
		
		return dao;
	}
		
}
