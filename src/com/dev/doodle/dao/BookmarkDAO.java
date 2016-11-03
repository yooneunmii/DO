package com.dev.doodle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.dev.doodle.util.FactoryUtil;
import com.dev.doodle.vo.Bookmark;


public class BookmarkDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private BookmarkDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static BookmarkDAO dao;
	
	public static BookmarkDAO getDAO() {
		
		if(dao==null){
			dao = new BookmarkDAO();
		}
		
		return dao;
	}
	
	public List<Bookmark> selectBookmark(int userNo) {
		
		List<Bookmark> list = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			list = session.selectList("bookmark.selectBookmark",userNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)session.close();
		}
		
		return list;
	}
	
public List<Bookmark> selectBookmarkMain(int userNo) {
		
		List<Bookmark> listMain = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			listMain = session.selectList("bookmark.selectBookmarkMain",userNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)session.close();
		}
		
		return listMain;
	}
	
	public int checkTurn(Bookmark bookmark) {
		int count = 0;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			count = session.selectOne("bookmark.checkTurn", bookmark);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (session!=null)session.close();
		}		
		return count;
	}
	
	
	
	public boolean updateTurnUp(Bookmark bookmark) {
		boolean result = false;
		SqlSession session = null;
		
		try {
			
			session = factory.openSession(true);
			int num = session.update("bookmark.updateTurnUp",bookmark);
			
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
	
	public boolean updateTurnDown(Bookmark bookmark) {
		boolean result = false;
		SqlSession session = null;
		
		try {
			
			session = factory.openSession(true);
			int num = session.update("bookmark.updateTurnDown",bookmark);
			
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
	
	//홍수형
	
	
	public int selectCount(int boardNo){
		
		int count = 0;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			Integer tmp  = session.selectOne("bookmark.selectCount",boardNo);
			
			if(tmp!=null) {
				count = tmp;
			}//if end
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch end
		
		return count;
		
	}//selectCount() end
	
		

	
	//은미
	
	public boolean insert (Bookmark book){
		boolean result =false;
		SqlSession session =null;
		try {
			session =factory.openSession(true);
			int num =session.insert("bookmark.insert",book);
			if(num>0){
				result =true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null) session.close();
		}
		return result;
	}
	
	public boolean delete (Bookmark book){
		boolean result =false;
		SqlSession session =null;
		try {
			session =factory.openSession(true);
			int num =session.delete("bookmark.delete",book);
			if(num>0){
				result =true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null) session.close();
		}
		return result;
	}
	
	public int check (Bookmark book){
		int check =0;
		SqlSession session =null;
		try {
			session =factory.openSession(true);
			check =session.selectOne("bookmark.check",book);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null) session.close();
		}
		return check;
	}
	public int userBookmark (int userNo){
		int check =0;
		SqlSession session =null;
		try {
			session =factory.openSession(true);
			check =session.selectOne("bookmark.userBookmark",userNo);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null) session.close();
		}
		return check;
	}
		
}
