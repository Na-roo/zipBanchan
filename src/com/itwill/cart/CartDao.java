package com.itwill.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwill.product.Product;



public class CartDao {
private DataSource dataSource;
	
	public CartDao() throws Exception{
		InitialContext ic = new InitialContext();
		dataSource = (DataSource)ic.lookup("java:/comp/env/jdbc/OracleDB");
	}
	public boolean isProductExist(String memberId,int productNo) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isExist=false;
		String selectQuery = "select count(*) as p_count from cart c join member m on c.m_id = m.m_id join product p on c.p_no=p.p_no where m.m_id=? and c.p_no=?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1,memberId);
			pstmt.setInt(2,productNo);
			rs = pstmt.executeQuery();
			int count=0;
			if (rs.next()) {
				count=rs.getInt(1);
			}
			if(count==0) {
				isExist=false;
			}else {
				isExist=true;
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return isExist;
	}
	public  int add(String memberId,Product product,int cartProductQty) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			String insertQuery = "insert into cart values(cart_cart_p_no_SEQ.nextval,?,?,?)";
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(insertQuery);
				pstmt.setInt(1, cartProductQty);
				pstmt.setInt(2, product.getProductNo());
				pstmt.setString(3, memberId);
				int rows = pstmt.executeUpdate();
				return rows;
			} finally {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			}
	}
	public  int update(String memberId,Product product,int cartProductQty) throws Exception {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = "update cart set cart_p_qty=cart_p_qty + ? where m_id=? and p_no=?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(updateQuery);
			pstmt.setInt(1, cartProductQty);
			pstmt.setString(2, memberId);
			pstmt.setInt(3, product.getProductNo());
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}
//	public  int updatePlus(String memberId,Product product,int cartProductQty) throws Exception {
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String updateQuery = "update cart set cart_p_qty=cart_p_qty + ? where m_id=? and p_no=?";
//		try {
//			con = dataSource.getConnection();
//			pstmt = con.prepareStatement(updateQuery);
//			pstmt.setInt(1, cartProductQty);
//			pstmt.setString(2, memberId);
//			pstmt.setInt(3, product.getProductno());
//			int rows = pstmt.executeUpdate();
//			return rows;
//		} finally {
//			if (pstmt != null)
//				pstmt.close();
//			if (con != null)
//				con.close();
//		}
//	}
	public  int updateMinus(String memberId,Product product,int cartProductQty) throws Exception {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = "update cart set cart_p_qty=cart_p_qty - ? where m_id=? and p_no=?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(updateQuery);
			pstmt.setInt(1, cartProductQty);
			pstmt.setString(2, memberId);
			pstmt.setInt(3, product.getProductNo());
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}
	
	public  ArrayList<Cart> getCartList(String memberId) throws Exception{
		ArrayList<Cart> cartList= new ArrayList<Cart>();		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
//		String selectQuery = "select c.cart_p_no,c.p_no,c.cart_p_qty,p.p_name,p.p_price from "
//				+ "cart c join member m on c.m_id = m.m_id join product p on c.p_no=p.p_no where m.m_id=?";
		String selectQuery = "SELECT * FROM cart WHERE m_id = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1,memberId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cartList.add(new Cart(rs.getInt(1),rs.getInt(2),rs.getInt(3),memberId));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return cartList;
		
	}
	
	
	public  int deleteCartProduct(int productNo,String memberId)  throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String removeQuery = "delete from cart where p_no = ? and m_id = ?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(removeQuery);
			pstmt.setInt(1, productNo);
			pstmt.setString(2, memberId);
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}

	public  int deleteCart(String memberId)  throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		String removeQuery = "delete from cart where m_id=?";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(removeQuery);
			pstmt.setString(1, memberId);
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}
}
