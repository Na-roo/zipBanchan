package com.itwill.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private DataSource ds;

	public MemberDAO() throws Exception {
		InitialContext ic = new InitialContext();
		ds = (DataSource) ic.lookup("java:/comp/env/jdbc/OracleDB");
	}

	/*
	 * create (회원가입)
	 */
	public boolean create(Member member) throws Exception {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("insert into member values(?,?,?,?,?,?)");
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getMemberId());
			pstmt.setString(3, member.getMemberPassword());
			pstmt.setString(4, member.getMemberAddress());
			pstmt.setString(5, member.getMemberPhone());
			pstmt.setString(6, member.getMemberEmail());
			int insertRowCount = pstmt.executeUpdate();
			if (insertRowCount == 1) {
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

	/*
	 * READ ALL
	 */
	public ArrayList<Member> readAll() throws Exception {
		ArrayList<Member> memberList = new ArrayList<Member>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from member");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberList.add(new Member(rs.getString("m_name"), rs.getString("m_Id"),
						rs.getString("m_Password"), rs.getString("m_Address"), rs.getString("m_Phone"),
						rs.getString("m_Email")));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return memberList;
	}

	/*
	 * READ ONE 
	 */
	public Member readOne(String memberId) throws Exception {
		Member member = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from member where m_id=?");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new Member(rs.getString("m_Name"), rs.getString("m_Id"),
						rs.getString("m_Password"), rs.getString("m_Address"), rs.getString("m_Phone"),
						rs.getString("m_Email"));
			}
		} finally {
			if (con != null)
				con.close();
		}
		return member;
	}

	/*
	 * READ ONE (ID)
	 */
	public String findMemberId(String memberName, String memberPhone) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String m_id=null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select m_id from member where m_name=? and m_phone=?");
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberPhone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 m_id = rs.getString("m_id");
			}
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}
		return m_id;
	}
	
	/*
	 * READ ONE (PASSWORD)
	 */
	public String findMemberPassword(String memberId, String memberPhone) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String m_password=null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select m_password from member where m_id=? and m_phone=?");
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPhone);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m_password = rs.getString("m_password");
			}
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		}
		return m_password;
	}
	
	/*
	 * UPDATE (회원 수정)
	 */
	public boolean update(Member member) throws Exception {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(
					"update member set m_name=?, m_password=?, m_address=?, m_phone=?, m_email=? where m_id=?");
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getMemberPassword());
			pstmt.setString(3, member.getMemberAddress());
			pstmt.setString(4, member.getMemberPhone());
			pstmt.setString(5, member.getMemberEmail());
			pstmt.setString(6, member.getMemberId());
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

	/*
	 * DELETE (회원 탈퇴)
	 */
	public boolean delete(String memberId) throws Exception {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("delete from member where m_id=?");
			pstmt.setString(1, memberId);
			int deleteRowCount = pstmt.executeUpdate();
			if (deleteRowCount == 1) {
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

	/*
	 * 인자로 전달되는 아이디를 사용자가 존재하는지 판별
	 */
	public boolean existedMember(String memberId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) cnt from member where m_id=?");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			int count = 0;
			if (rs.next()) {
				count = rs.getInt("cnt");
			}
			if (count == 1) {
				return true;
			} else {
				return false;
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}

}
