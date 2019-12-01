package com.itwill.jumun;

import java.util.ArrayList;

import com.itwill.cart.Cart;

public class JumunService {

	private JumunDao jumunDao;
	
	public JumunService( ) throws Exception{
		jumunDao = new JumunDao();
	}
	//주문생성
	public int create(Jumun jumun) throws Exception {
		return jumunDao.create(jumun);
	}
	
	//주문수정
	public boolean update(Jumun jumun) throws Exception {
		return jumunDao.update(jumun);
	}
	
//	//주문삭제
//	public int delete(int jumunNo) throws Exception {
//		return jumunDao.delete(jumunNo);
//	}
	
	//주문읽어오기
	public Jumun selectByNo(int jumunNo) throws Exception {
		Jumun jumun = jumunDao.selectByNo(jumunNo);
		return jumun;
	}
	
	public int findByLastNo() throws Exception {
		return jumunDao.findByLastNo();
		
	}
	
	//주문리스트 읽어오기
	public ArrayList<Jumun> getJumunList(String memberId) throws Exception{
		return jumunDao.getJumunList(memberId);
	}
}
