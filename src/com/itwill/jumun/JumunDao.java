package com.itwill.jumun;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwill.cart.Cart;
import com.itwill.member.Member;
import com.itwill.product.Product;



public class JumunDao {

	private DataSource dataSource;
	
	
	public JumunDao() throws Exception {
		InitialContext ic = new InitialContext();
		dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/OracleDB");
	}
	
	
	//주문테이블에 주문생성
	
	public int create(Jumun jumun) throws Exception {
		
		Connection con = null;
		PreparedStatement pstmt = null;		
		
		String insertQuery = "insert into jumun values(jumun_no_seq.nextval,sysdate,?,?,?,?,?)";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(insertQuery);
						
			pstmt.setInt(1, jumun.getJumunGunsu());
			pstmt.setInt(2, jumun.getJumunPrice());
			pstmt.setString(3, jumun.getJumunReceiverName());
			pstmt.setString(4, jumun.getJumunReceiverAddress());
			pstmt.setString(5, jumun.getJumunMemberId());

			int rows = pstmt.executeUpdate();
			return rows;
			
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}
	
	
	//주문테이블수정

	public boolean update(Jumun jumun)  throws Exception{
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = "update jumun "
				+ "set J_QTY=?,J_PRICE=?,J_RECEIVER_NAME=?,"
				+ "J_RECEIVER_ADDRESS=? where J_NO = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(updateQuery);
				
			pstmt.setInt(1,jumun.getJumunGunsu());
			pstmt.setInt(2,jumun.getJumunPrice());
			pstmt.setString(3,jumun.getJumunReceiverName());
			pstmt.setString(4,jumun.getJumunReceiverAddress());
			pstmt.setInt(5,jumun.getJumunNo());
			
			int updateRowCount = pstmt.executeUpdate();
			if (updateRowCount == 1) {
				isSuccess = true;
			}
		} catch (Exception e) {
			isSuccess = false;
			e.printStackTrace();
		} finally {
			if (con != null)
				con.close();
		}
		return isSuccess;
	}
	
	//readOne
	
	public Jumun selectByNo(int jumunNo) throws Exception {
		Jumun jumun = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select * from jumun where J_No=?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setInt(1,jumunNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				jumun = new Jumun(rs.getInt("J_NO"),rs.getString("J_DATE"),rs.getInt("J_QTY")
						,rs.getInt("J_PRICE"), rs.getString("J_RECEIVER_NAME"),rs.getString("J_RECEIVER_ADDRESS")
						,rs.getString("M_ID"));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return jumun;
	}
	public int findByLastNo() throws Exception {
		int val = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "SELECT * FROM (SELECT ROWNUM AS NO, j_no FROM jumun ORDER BY j_no DESC) J WHERE j.no = 1";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				val = rs.getInt(2);
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return val;
	}
	//주문 리스트
	public  ArrayList<Jumun> getJumunList(String memberId) throws Exception{
		ArrayList<Jumun> jumunList= new ArrayList<Jumun>();		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	

		String selectQuery = "SELECT * FROM jumun WHERE m_id = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1,memberId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				jumunList.add(new Jumun(rs.getInt(1), rs.getString(2),rs.getInt(3) , rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7)));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return jumunList;
		
	}
}