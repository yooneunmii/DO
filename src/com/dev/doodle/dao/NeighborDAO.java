package com.dev.doodle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;

import oracle.net.aso.f;

public class NeighborDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private NeighborDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static NeighborDAO dao;
	
	public static NeighborDAO getDAO() {
		
		if(dao==null){
			dao = new NeighborDAO();
		}
		
		return dao;
	}
	
	public int selectFollowerCount(int count){
		int follower = 0;
		SqlSession session = null;
		try {
			session = factory.openSession();
			
			if(count==0){
				return follower;
			} else {
				follower = session.selectOne("neighbor.selectFollowerCount", count);
			}//if genre end
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return follower;
	}
		
}
