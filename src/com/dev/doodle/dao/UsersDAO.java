package com.dev.doodle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;
import com.dev.doodle.vo.User;

public class UsersDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private UsersDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static UsersDAO dao;
	
	public static UsersDAO getDAO() {
		
		if(dao==null){
			dao = new UsersDAO();
		}
		
		return dao;
	}
//소희누나	
	public User selectLogin(User user) {
		User loginUser = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			loginUser = session.selectOne("users.selectLogin",user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session!=null)session.close();
		}
		return loginUser;
		
	}
	
	public String searchId(User user) {
		String userId = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			userId = session.selectOne("users.searchId", user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)session.close();
		}
		return userId;
		
	}
	
	public String searchPwd(User user) {
		String userPwd = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			userPwd = session.selectOne("users.searchPwd", user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)session.close();
		}
		return userPwd;
		
	}
	//홍수형
	
	public boolean update(User user) {
		
		boolean result = false;
		SqlSession session = null;
		
		try {
			session = factory.openSession(true);
			int size = session.update("users.update",user);
			
			if(size>0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}//update() end
	
	public List<User> selectSearch(String keyword) {
		
		List<User> user = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			user = session.selectList("users.selectSearch",keyword);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch end
		
		return user;
	}//selectSearch() end
	
	//은미
	
	public User selectOne (int no){
		User user=null;
		SqlSession session=null;
		try {
			session=factory.openSession();
			user=session.selectOne("users.selectOne", no);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null){session.close();}
			
			}
		return user;
		}
	
	
//민지
	
	public boolean insert(User user) {
		
		SqlSession session = null;
		
		try {
			session = factory.openSession(true); 
			
			int num=session.insert("users.insert",user);
			
			if(num>=1){
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return false;
		
	}
	
	public boolean selectOverlap(String id){
		
		SqlSession session = null;
		
		try { 
			session = factory.openSession();
			
			int result = session.selectOne("users.selectOverlap",id);
			
			if(result>=1) {
				return false;
			}
			
			//System.out.println(selectOverlap(id));
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null) session.close();
		}
		
		return true;
		
	}
}
