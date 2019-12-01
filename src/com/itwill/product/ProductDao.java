
package com.itwill.product;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;





public class ProductDao{
	private DataSource ds;

	public ProductDao() throws Exception {
		InitialContext ic = new InitialContext();
		ds = (DataSource) ic.lookup("java:/comp/env/jdbc/OracleDB");
	}
  


    //상품 추가
    public boolean create(Product product) throws Exception {
    Connection con = null;
    PreparedStatement pstmt = null;
    String insertSql
    ="insert into product values(p_seq.nextval,?,?,?,?,?)";
    boolean isSuccess = false;
    try{
    con = ds.getConnection();
    pstmt = con.prepareStatement(insertSql);
   
    pstmt.setString(1, product.getProductName());
    pstmt.setInt(2, product.getProductPrice());
    pstmt.setInt(3, product.getProductQty());
    pstmt.setInt(4, product.getCategoryNo());
    pstmt.setString(5, product.getProductImg());
 
    pstmt.executeUpdate();
    isSuccess = true;
    }finally{
    if(con!=null) con.close();
    }
   
    return isSuccess;
    }

   // 상품이름으로 찾기
   public Product findByName(String productName) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String selectSql = "select * from product where p_name=?";
      Product product = null;
      try {
         con = ds.getConnection();
         pstmt = con.prepareStatement(selectSql);
         pstmt.setString(1,"p_name");
         rs = pstmt.executeQuery();
         if (rs.next()) {
            product = new Product(rs.getInt("p_no"),
            					 rs.getString("p_name"),
            					 rs.getInt("p_price"),
            					 rs.getInt("p_limitqty"),
            					 rs.getInt("categoryno"),
            					 rs.getString("categoryimage"));
         
        	
         }

      } finally {
         if (con != null)
           con.close();;
      }

      return product;
   }
   //상품 번호로 찾기
   public Product findByNo(int productNo) throws Exception {
	   Connection con = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   String selectSql = "select * from product where p_no=?";
	   Product product = null;
	   try {
		   con = ds.getConnection();
		   pstmt = con.prepareStatement(selectSql);
		   pstmt.setInt(1,productNo);
		   rs = pstmt.executeQuery();
		   if (rs.next()) {
			   product = new Product(rs.getInt("p_no"),
					   rs.getString("p_name"),
					   rs.getInt("p_limitqty"),
					   rs.getInt("p_price"),
					   rs.getInt("categoryno"),
					   rs.getString("productimage"));
			   
			   
		   }
		   
	   } finally {
		   if (con != null)
			   con.close();;
	   }
	   
	   return product;
   }

   // 상품전체 찾기
   public ArrayList<Product> findList() throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String selectAllSql = "select * from product ";
      ArrayList<Product> productList = null;
      try {
         con = ds.getConnection();
         pstmt = con.prepareStatement(selectAllSql);
         rs = pstmt.executeQuery();
         productList = new ArrayList<Product>();
         while (rs.next()) {
            productList.add(new Product(
            	rs.getInt("p_no"),
                  rs.getString("p_name"),
                  rs.getInt("p_price"),
                  rs.getInt("p_limitqty"),
                  rs.getInt("categoryno"),
            	  rs.getString("productimage")));


         }

      } finally {
         if (con != null)
           con.close();
      }

      return productList;
   }
   // 상품카테고리로  찾기
   public ArrayList<Product> findCateList(int categoryNo) throws Exception {
	   Connection con = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   String selectCateSql = "select * from product where categoryno=?";
	   ArrayList<Product> productList = null;
	   try {
		   con = ds.getConnection();
		   pstmt = con.prepareStatement(selectCateSql);
		   pstmt.setInt(1,categoryNo);
		   rs = pstmt.executeQuery();
		   productList = new ArrayList<Product>();
		   while (rs.next()) {
			   productList.add(new Product(
					   rs.getInt("p_no"),
					   rs.getString("p_name"),
					   rs.getInt("p_price"),
					   rs.getInt("p_limitqty"),
					   rs.getInt("categoryno"),
					   rs.getString("productimage")));
			   
		   }
		   
	   } finally {
		   if (con != null)
			   con.close();
	   }
	   
	   return productList;
   }

   // 상품삭제
   public boolean remove(int productNo) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      String removeSql = "delete from product where p_no=?";
      boolean isSuccess = false;
      try {
         con = ds.getConnection();
         pstmt = con.prepareStatement(removeSql);
         pstmt.setInt(1, productNo);
         pstmt.executeUpdate();
         isSuccess = true;
      } finally {
         if (con != null)
            con.close();
      }
      return isSuccess;
   }

   // 상품정보수정
   public boolean update(Product product) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      String updateSql = "update product set p_name=?,p_price=?,p_limitqty=?,productimage=? where p_no=?";
      boolean isSuccess = false;
      try {
         con = ds.getConnection();
         pstmt = con.prepareStatement(updateSql);
         pstmt.setString(1, product.getProductName());
         pstmt.setInt(2, product.getProductPrice());
         pstmt.setInt(3, product.getProductQty());
         pstmt.setString(4, product.getProductImg());
         pstmt.setInt(5, product.getProductNo());

         pstmt.executeUpdate();
         isSuccess = true;
      } finally {
         if (con != null)
            con.close();
      }
      return isSuccess;
   }

   // 상품 주문시 재고 -1
   public boolean updateByNoInvenDown(int productNo, int tempno) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = "update product set p_limitqty=p_limitqty-"+ tempno+" where p_no=?";
      boolean isSuccess = false;
      try {
         con = ds.getConnection();
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, productNo);
         pstmt.executeUpdate();
         isSuccess = true;
      } finally {
         if (con != null)
            con.close();
      }
      return isSuccess;
   }
   
   
   //정렬
   public ArrayList<Product> sort(int categoryNo, String columnName, String sortorder) throws Exception{
	   Connection con = null;
	   PreparedStatement pstmt = null;
	   String sql = "select * from product where categoryno=? order by "+columnName+ " "+sortorder;
	   ResultSet rs = null;
	   ArrayList<Product> productList = null;
	   
	   try {
		   con = ds.getConnection();
		   pstmt = con.prepareStatement(sql);
		   pstmt.setInt(1, categoryNo);
		   rs = pstmt.executeQuery();
		   
		   productList = new ArrayList<Product>();
		   
		   while (rs.next()) {
			   productList.add(new Product(
					   rs.getInt("p_no"),
					   rs.getString("p_name"),
					   rs.getInt("p_price"),
					   rs.getInt("p_limitqty"),
					   rs.getInt("categoryno"),
					   rs.getString("productimage")));
		   }
		   
	   } finally {
		   if (con != null)
	           con.close();
	   }
	   return productList; 
   }
   
//   
//   //카테고리 이름 출력
//   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   public Product findCaName  (int categoryNo) throws Exception {
//	      Connection con = null;
//	      PreparedStatement pstmt = null;
//	      ResultSet rs = null;
//	      String selectSql = "select categoryname from productCategory where categoryNo=?";
//	      Product product = null;
//	      try {
//	         con = ds.getConnection();
//	         pstmt = con.prepareStatement(selectSql);
//	         pstmt.setString(1,"catrgortNo");
//	         rs = pstmt.executeQuery();
//	         if (rs.next()) {
//	            product = new Product(rs.getInt(categoryNo));
//	         
//	        	
//	         }
//
//	      } finally {
//	         if (con != null)
//	           con.close();;
//	      }
//
//	      return product;
//	   }
//   
   /*
    * 내림차순정렬
    
   public ArrayList<Product> sortByDesc(int categoryNo, String columnName) throws Exception{
	   Connection con = null;
	   PreparedStatement pstmt = null;
	   String sql = "select * from product where categoryno=? order by "+columnName+" desc";
	   ResultSet rs = null;
	   ArrayList<Product> productList = null;
	   
	   try {
		   con = ds.getConnection();
		   pstmt = con.prepareStatement(sql);
		   pstmt.setInt(1, categoryNo);
		   rs = pstmt.executeQuery();
		   productList = new ArrayList<Product>();
		   while (rs.next()) {
			   productList.add(new Product(
					   rs.getInt("p_no"),
					   rs.getString("p_name"),
					   rs.getInt("p_price"),
					   rs.getInt("p_limitqty"),
					   rs.getInt("categoryno"),
					   rs.getString("productimage")));
		   }
		   
	   } finally {
		   if (con != null)
	           con.close();
	   }
	   return productList; 
   }
   */
   

}