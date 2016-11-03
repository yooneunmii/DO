package com.dev.doodle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;

import oracle.net.aso.f;

public class GuestbookDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private GuestbookDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static GuestbookDAO dao;
	
	public static GuestbookDAO getDAO() {
		
		if(dao==null){
			dao = new GuestbookDAO();
		}
		
		return dao;
	}
		
}
