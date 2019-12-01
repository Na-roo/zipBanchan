package com.itwill.jumun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwill.product.Product;

public class JumunDetailDao {

	private DataSource dataSource;

	public JumunDetailDao() throws Exception{
		InitialContext ic = new InitialContext();
		dataSource = (DataSource)ic.lookup("java:/comp/env/jdbc/OracleDB");
	}
	
	public int insertJumunDetail(JumunDetail jumunDetail) throws Exception {
		
		Connection con = null;
		PreparedStatement pstmt = null;		
		
		String insertQuery = "insert into jumundetail values(?,?,?)";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(insertQuery);
			
			pstmt.setInt(1, jumunDetail.getJumunNo());
			pstmt.setInt(2, jumunDetail.getProductNo());
			pstmt.setInt(3, jumunDetail.getJumunDetailQty());

			int rows = pstmt.executeUpdate();
			return rows;
			
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}
	
	public ArrayList<JumunDetail> JumunList(int jumunNo) throws Exception {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<JumunDetail> jumunList = new ArrayList<JumunDetail>();
		
		String selectQuery = "select * from jumundetail jd join jumun j on jd.j_no = j.j_no join product p on jd.p_no = p.p_no where jd.j_no = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setInt(1, jumunNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				jumunList.add(new JumunDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
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
