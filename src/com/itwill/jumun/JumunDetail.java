package com.itwill.jumun;

public class JumunDetail {
	private int jumunNo;
	private int jumunDetailQty;
	private int productNo;
	
	public JumunDetail() {
		
	}
	
	public JumunDetail(int jumunNo,int jumunDetailQty,int productNo) {
		this.jumunNo = jumunNo;
		this.jumunDetailQty = jumunDetailQty;
		this.productNo = productNo;
	}

	public int getJumunNo() {
		return jumunNo;
	}

	public void setJumunNo(int jumunNo) {
		this.jumunNo = jumunNo;
	}

	public int getJumunDetailQty() {
		return jumunDetailQty;
	}

	public void setJumunDetailQty(int jumunDetailQty) {
		this.jumunDetailQty = jumunDetailQty;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "JumunDetail [jumunNo=" + jumunNo + ", jumunDetailQty=" + jumunDetailQty + ", productNo=" + productNo
				+ "]";
	}


	
}
