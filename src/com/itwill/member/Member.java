package com.itwill.member;

public class Member {
	private String memberName;
	private String memberId;
	private String memberPassword;
	private String memberAddress;
	private String memberPhone;
	private String memberEmail;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(String memberName, String memberId, String memberPassword, String memberAddress, String memberPhone, String memberEmail) {
		this.memberName=memberName;
		this.memberId=memberId;
		this.memberPassword=memberPassword;
		this.memberAddress=memberAddress;
		this.memberPhone=memberPhone;
		this.memberEmail=memberEmail;
	}
	
	public Member(String memberName, String memberPhone) {
		this.memberName=memberName;
		this.memberPhone=memberPhone;
		
	}
	
	public Member(String memberName, String memberPassword, String memberAddress, String memberPhone, String memberEmail) {
		this.memberName=memberName;
		this.memberPassword=memberPassword;
		this.memberAddress=memberAddress;
		this.memberPhone=memberPhone;
		this.memberEmail=memberEmail;
	}
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	/*
	 * 패스워드 일치여부 체크
	 */
	public boolean isMatchPassword(String memberPassword) {
		boolean isMatch=false;
		if(this.memberPassword.equals(memberPassword)) {
			isMatch=true;
		}
		return isMatch;
	}
	
	
	
}
