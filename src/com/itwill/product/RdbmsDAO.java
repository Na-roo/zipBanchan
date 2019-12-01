package com.itwill.product;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public abstract class RdbmsDAO<DTO> {
	
	InitialContext ic;
	DataSource ds;
	Connection con;
		
	public Connection getConnection(){
		try{
			ic=new InitialContext();
			ds=(DataSource)ic.lookup("java:/comp/env/jdbc/OracleDB");
			con=ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public void releaseConnection(Connection con){
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public abstract boolean create(DTO dto) throws Exception ;
	public abstract ArrayList<DTO> findList() throws Exception;
	public abstract DTO findByNo(int no) throws Exception ;
	public abstract boolean update(DTO dto) throws Exception ;
	public abstract boolean remove(int no) throws Exception ;
	
	

}
