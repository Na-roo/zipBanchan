package com.itwill.jumun;

import java.util.Date;

import com.itwill.product.Product;

public class Jumun {

	private int jumunNo;
	private String jumunDate;
	private int jumunGunsu;
	private int jumunPrice;
	private String jumunReceiverName;
	private String jumunReceiverAddress;
	private String jumunMemberId;

	public Jumun() {
	}
	
	public Jumun(int jumunNo, String jumunDate, int jumunGunsu, 
			int jumunPrice, String jumunReceiverName, String jumunReceiverAddress,String jumunMemberId) {
		this.jumunNo = jumunNo;
		this.jumunDate = jumunDate;
		this.jumunGunsu = jumunGunsu;
		this.jumunPrice = jumunPrice;
		this.jumunReceiverName = jumunReceiverName;
		this.jumunReceiverAddress = jumunReceiverAddress;
		this.jumunMemberId = jumunMemberId;	
	}
	public Jumun(int jumunGunsu, int jumunPrice, String jumunMemberId) {

		this.jumunGunsu = jumunGunsu;
		this.jumunPrice = jumunPrice;
		this.jumunMemberId = jumunMemberId;	
	}
	
	public Jumun(int jumunGunsu, 
			int jumunPrice, String jumunReceiverName, String jumunReceiverAddress,String jumunMemberId) {
		
		this.jumunGunsu = jumunGunsu;
		this.jumunPrice = jumunPrice;
		this.jumunReceiverName = jumunReceiverName;
		this.jumunReceiverAddress = jumunReceiverAddress;
		this.jumunMemberId = jumunMemberId;	
	}
	
	public Jumun(int jumunGunsu, 
			int jumunPrice, String jumunReceiverName, String jumunReceiverAddress,int jumunNo) {
		
		this.jumunGunsu = jumunGunsu;
		this.jumunPrice = jumunPrice;
		this.jumunReceiverName = jumunReceiverName;
		this.jumunReceiverAddress = jumunReceiverAddress;
		this.jumunNo = jumunNo;	
	}
	

	public int getJumunNo() {
		return jumunNo;
	}

	public void setJumunNo(int jumunNo) {
		this.jumunNo = jumunNo;
	}

	public String getJumunDate() {
		return jumunDate;
	}

	public void setJumunDate(String jumunDate) {
		this.jumunDate = jumunDate;
	}

	public int getJumunGunsu() {
		return jumunGunsu;
	}

	public void setJumunGunsu(int jumunGunsu) {
		this.jumunGunsu = jumunGunsu;
	}

	public int getJumunPrice() {
		return jumunPrice;
	}

	public void setJumunPrice(int jumunPrice) {
		this.jumunPrice = jumunPrice;
	}

	public String getJumunReceiverName() {
		return jumunReceiverName;
	}

	public void setJumunReceiverName(String jumunReceiverName) {
		this.jumunReceiverName = jumunReceiverName;
	}

	public String getJumunReceiverAddress() {
		return jumunReceiverAddress;
	}

	public void setJumunReceiverAddress(String jumunReceiverAddress) {
		this.jumunReceiverAddress = jumunReceiverAddress;
	}

	public String getJumunMemberId() {
		return jumunMemberId;
	}

	public void setJumunMemberId(String jumunMemberId) {
		this.jumunMemberId = jumunMemberId;
	}

	@Override
	public String toString() {
		return "Jumun [jumunNo=" + jumunNo + ", jumunDate=" + jumunDate + ", jumunGunsu=" + jumunGunsu + ", jumunPrice="
				+ jumunPrice + ", jumunReceiverName=" + jumunReceiverName + ", jumunReceiverAddress="
				+ jumunReceiverAddress + ", jumunReceiverPhone=" + ", jumunMemberId="
				+ jumunMemberId + "]";
	}



}