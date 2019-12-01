package com.itwill.board;

import java.util.ArrayList;

public class BoardService {

	private BoardDao dao = null;
	private static BoardService instance = null;
	
	private BoardService() {
		this.dao = new BoardDao();
	}
	
	public static BoardService instance() {
		if (instance == null) {
			instance = new BoardService();
		}
		
		return instance;
	}
	
	public ArrayList<Board> select() throws Exception {
		return this.dao.select();
	}
	
	public ArrayList<Board> selectAsBoardWriteByMemberId(String memberId) throws Exception {
		return this.dao.selectAsBoardWriteByMemberId(memberId);
	}
	
	public ArrayList<Board> selectAsBoardWriteByTitle(String title) throws Exception {
		return this.dao.selectAsBoardWriteByTitle(title);
	}
	
	public Board select(int boardNo) throws Exception {
		return this.dao.select(boardNo);
	}
	
	public int selectTotalCount() throws Exception {
		return this.dao.selectTotalCount();
	}
	
	public ArrayList<Board> selectAsPaging(int startPage, int endPage) throws Exception {
		return this.dao.selectAsPaging(startPage, endPage);
	}
	
	public int insert(Board board) throws Exception {
		return this.dao.insert(board);
	}
	
	public int update(Board board) throws Exception { 
		return this.dao.update(board);
	}
	
	public int delete(int boardNo) throws Exception {
		return this.dao.delete(boardNo);
	}
}
