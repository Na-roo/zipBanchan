package com.itwill.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDao {
	
	private DataSource ds;
	
	public BoardDao() {
		InitialContext ic;
		try {
			ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:/comp/env/jdbc/OracleDB");		
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public synchronized ArrayList<Board> select() throws Exception {
		
		ArrayList<Board> retVal = new ArrayList<>();
		
		try (Connection conn = ds.getConnection();
			PreparedStatement pStmt = conn.prepareStatement(BoardQuerySet.BOARD_ALL_SELECT);
			ResultSet rs = pStmt.executeQuery();) {
			
			while(rs.next()) {
				retVal.add(new Board(
								rs.getInt(1), 
								rs.getString(2), 
								rs.getDate(3), 
								rs.getInt(4), 
								rs.getString(5), 
								rs.getString(6), 
								rs.getInt(7)));
			}
		} 
		
		return retVal;
	}
	
	public synchronized Board select(int no) throws Exception {
		Board retVal = null;
		
		try (Connection conn = ds.getConnection();
				PreparedStatement pStmt = conn.prepareStatement(BoardQuerySet.BOARD_SELECT_AS_BOARD_NO);) {
	
			pStmt.setInt(1, no);
			ResultSet rs = pStmt.executeQuery();
				
			while(rs.next()) {
				retVal = new Board(
							rs.getInt(1), 
							rs.getString(2), 
							rs.getDate(3), 
							rs.getInt(4), 
							rs.getString(5), 
							rs.getString(6), 
							rs.getInt(7));
			}
		} 
	
		return retVal;
	}
	
	public synchronized int selectTotalCount() throws Exception {
		int retVal = -1;
		
		try (Connection conn = ds.getConnection();
				PreparedStatement pStmt = conn.prepareStatement(BoardQuerySet.BOARD_COUNT);
				ResultSet rs = pStmt.executeQuery();) {
				
			if (rs.next()) {
				retVal = rs.getInt(1);
			}
		} 
	
		return retVal;
	}
	
	public synchronized ArrayList<Board> selectAsPaging(int startPage, int endPage) throws Exception {
		
		ArrayList<Board> retVal = new ArrayList<>();
		
		try (Connection conn = ds.getConnection();
			PreparedStatement pStmt = conn.prepareStatement(BoardQuerySet.BOARD_SELECT_AS_PAGING);) {
				
			pStmt.setInt(1, startPage);
			pStmt.setInt(2, endPage);
			ResultSet rs = pStmt.executeQuery();
			
			while(rs.next()) {
				retVal.add(new Board(
								rs.getInt(1), 
								rs.getString(2), 
								rs.getDate(3), 
								rs.getInt(4), 
								rs.getString(5), 
								rs.getString(6), 
								rs.getInt(7)));
			}
		} 
		
		return retVal;
	}
	
	public synchronized ArrayList<Board> selectAsBoardWriteByMemberId(String memberId) throws Exception {
		
		ArrayList<Board> retVal = new ArrayList<>();
		
		try (Connection conn = ds.getConnection();
			PreparedStatement pStmt = conn.prepareStatement(BoardQuerySet.BOARD_SELECT_AS_MEMBER_ID);) {
				
			pStmt.setString(1, memberId);
			ResultSet rs = pStmt.executeQuery();
			
			while(rs.next()) {
				retVal.add(new Board(
								rs.getInt(1), 
								rs.getString(2), 
								rs.getDate(3), 
								rs.getInt(4), 
								rs.getString(5), 
								rs.getString(6), 
								rs.getInt(7)));
			}
		} 
		
		return retVal;
	}
	
	public synchronized ArrayList<Board> selectAsBoardWriteByTitle(String title) throws Exception {
		
		ArrayList<Board> retVal = new ArrayList<>();
		
		try (Connection conn = ds.getConnection();
			PreparedStatement pStmt = conn.prepareStatement(BoardQuerySet.BOARD_SELECT_AS_BOARD_TITLE);) {
				
			pStmt.setString(1, "%"+title+"%");
			ResultSet rs = pStmt.executeQuery();
			
			while(rs.next()) {
				retVal.add(new Board(
								rs.getInt(1), 
								rs.getString(2), 
								rs.getDate(3), 
								rs.getInt(4), 
								rs.getString(5), 
								rs.getString(6), 
								rs.getInt(7)));
			}
		} 
		
		return retVal;
	}
	
	public synchronized int insert(Board board) throws Exception {
		int retVal = -1;
		try (Connection conn = ds.getConnection();
				PreparedStatement pStmt = conn.prepareStatement(BoardQuerySet.BOARD_INSERT);) {

			// 제목(title), 평점(evalPoint), 내용(b_content), 사용자 아이디(m_id), 상품 번호(p_no)
			pStmt.setString(1, board.title);
			pStmt.setInt(2, board.evalPoint);
			pStmt.setString(3, board.content);
			pStmt.setString(4, board.memberId);
			pStmt.setInt(5, board.productNo);
			retVal = pStmt.executeUpdate();

		}

		return retVal;
	}
	
	public synchronized int update(Board board) throws Exception {
		int retVal = -1;
		try (Connection conn = ds.getConnection();
				PreparedStatement pStmt = conn.prepareStatement(BoardQuerySet.BOARD_UPDATE);) {

			// 게시판 제목(title), 평점(evalPoint), 내용(b_content), 게시판 번호(b_no)
			pStmt.setString(1, board.title);
			pStmt.setInt(2, board.evalPoint);
			pStmt.setString(3, board.content);
			pStmt.setInt(4, board.boardNo);
			retVal = pStmt.executeUpdate();

		}

		return retVal;
	}
	
	public synchronized int delete(int boardNo) throws Exception {
		int retVal = -1;
		try (Connection conn = ds.getConnection();
				PreparedStatement pStmt = conn.prepareStatement(BoardQuerySet.BOARD_DELETE);) {

			// 게시판 제목(title), 평점(evalPoint), 내용(b_content), 게시판 번호(b_no)
			pStmt.setInt(1, boardNo);
			retVal = pStmt.executeUpdate();
		}

		return retVal;
	}
}
