package com.itwill.jumun;

public class JumunCompleteService {
	private JumunCompleteDao jumunCompleteDao;
	
	public JumunCompleteService() throws Exception {
		jumunCompleteDao = new JumunCompleteDao();
	}
	
	//주문읽어오기
	public Jumun selectByNo(int jumunNo) throws Exception {
		Jumun jumun = jumunCompleteDao.selectByNo(jumunNo);
		return jumun;
	}
	
}
