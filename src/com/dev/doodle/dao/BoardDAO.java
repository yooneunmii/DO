package com.dev.doodle.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dev.doodle.util.FactoryUtil;
import com.dev.doodle.vo.Board;


public class BoardDAO {

	//SqlSessionFactory
	private SqlSessionFactory factory;
	
	private BoardDAO() {
		factory = FactoryUtil.getFactory();
	}
	
	//dao의 레퍼런스를 계속 가지고 있으려면 
	private static BoardDAO dao;
	
	public static BoardDAO getDAO() {
		
		if(dao==null){
			dao = new BoardDAO();
		}
		
		return dao;
		
		
	}
public List<Board> selectMyWritten(int userNo){
		
		List<Board> board = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			
			board = session.selectList("board.selectMyWritten",userNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch end
		
		return board;
		
	}//selectMyWritten() end
	public List<Board> selectSearch(String keyword){
		
		List<Board> board = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			board = session.selectList("board.selectSearch",keyword);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch end
		
		return board;
	}//selectSearch end		
	
	public List<Board> selectGenre(String genre){
		
		List<Board> board = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			
			if(genre.equals("전체")){
				board = session.selectList("board.selectAllGenre");
			} else {
				board = session.selectList("board.selectGenre",genre);
			}//if genre end
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch end
		
		return board;
		
	}//selectGenre() end
	
	public List<Board> selectGenreBest(String genre){
		
		List<Board> board = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
				
				if(genre.equals("전체")){
					board = session.selectList("board.selectAllGenre");
				} else {
					board = session.selectList("board.selectGenreBest",genre);
				}//if genre end
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch end
		
		return board;
		
	}//selectGenreBest() end
	
	public List<Board> selectGenreRegdate(String genre){
		
		List<Board> board = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			board = session.selectList("board.selectGenreRegdate",genre);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch end
		
		return board;
		
	}//selectGenreRegdate() end
	
	public List<Board> selectGenreHit(String genre){
		
		List<Board> board = null;
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			board = session.selectList("board.selectGenreHit",genre);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//try~catch end
		
		return board;
		
	}//selectGenreHit() end
	
	//은미
	
	public Board selectOne(int no){
		Board board =null;
		SqlSession session=null;
		try {
			session=factory.openSession();
			board =session.selectOne("board.selectOne",no);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null){ session.close();}
		}
		return board;
	}
	public List<Board> selectBungi(Board par){
		List<Board> para=null;
		SqlSession session=null;
		try {
			session =factory.openSession();
			para=session.selectList("board.selectBungi",par);
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}finally{
			if(session!=null){session.close();}
		}
		return para;
	}
	
	
	public boolean insert(Board board){
		boolean result=false;
		SqlSession session=null;
		try {
			session=factory.openSession(true);
			int num =session.insert("board.insert",board);
			if(num>0){
				result=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			if(session!=null)session.close();
		}
		return result;
	}
	
	
	public int boardNo(Board board){
		int boardNo =0;
		SqlSession session=null;
		try {
			session =factory.openSession();
			boardNo=session.selectOne("board.boardNo",board);
		} catch (Exception e) {
			e.printStackTrace();
			
			// TODO: handle exception
		}finally{
			if(session!=null){session.close();}
		}
		return boardNo;
		
		
	}
	
}
