package com.itwill.jumun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JumunCompleteDao {


		private DataSource dataSource;

		public JumunCompleteDao() throws Exception {
			InitialContext ic = new InitialContext();
			dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/OracleDB");
		}

		// readOne

		public Jumun selectByNo(int jumunNo) throws Exception {
			Jumun jumun = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String selectQuery = "select * from jumun where J_No=?";
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(selectQuery);
				pstmt.setInt(1, jumunNo);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					jumun = new Jumun(rs.getInt("J_NO"), rs.getString("J_DATE"), rs.getInt("J_QTY"),
							rs.getInt("J_PRICE"), rs.getString("J_RECEIVER_NAME"), rs.getString("J_RECEIVER_ADDRESS"),
							rs.getString("M_ID"));
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
	}

