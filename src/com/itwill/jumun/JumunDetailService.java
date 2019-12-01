package com.itwill.jumun;

import java.util.ArrayList;

public class JumunDetailService {
	
	private JumunDetailDao jumunDetailDao;
	
	public JumunDetailService() throws Exception{
		jumunDetailDao = new JumunDetailDao();
	}
	
	public ArrayList<JumunDetail> jumunList(int jumunNo) throws Exception{
		return jumunDetailDao.JumunList(jumunNo);
	}
	
	public int insertJumunDetail(JumunDetail jumunDetail) throws Exception{
		return jumunDetailDao.insertJumunDetail(jumunDetail);
	}
	
	
	
}
