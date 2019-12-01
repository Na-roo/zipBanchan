package com.itwill.jumun;

public class JumunComplete {
	
	private int jumunNo;
	private String jumunMemberName;
	private String jumunDate;
	private int jumunPrice;
	
	public JumunComplete() {
		
	}
	
	public JumunComplete(int jumunNo, String jumunMemberName, String jumunDate, int jumunPrice) {
		this.jumunNo = jumunNo;
		this.jumunMemberName = jumunMemberName;
		this.jumunDate = jumunDate;
		this.jumunPrice = jumunPrice;
	}

	public int getJumunNo() {
		return jumunNo;
	}

	public void setJumunNo(int jumunNo) {
		this.jumunNo = jumunNo;
	}

	public String getJumunMemberName() {
		return jumunMemberName;
	}

	public void setJumunMemberName(String jumunMemberName) {
		this.jumunMemberName = jumunMemberName;
	}

	public String getJumunDate() {
		return jumunDate;
	}

	public void setJumunDate(String jumunDate) {
		this.jumunDate = jumunDate;
	}

	public int getJumunPrice() {
		return jumunPrice;
	}

	public void setJumunPrice(int jumunPrice) {
		this.jumunPrice = jumunPrice;
	}

	@Override
	public String toString() {
		return "JumunComplete [jumunNo=" + jumunNo + ", jumunMemberName=" + jumunMemberName + ", jumunDate=" + jumunDate
				+ ", jumunPrice=" + jumunPrice + "]";
	}
	
	
	
	
	

}
