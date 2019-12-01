package com.itwill.cart;

public class Cart {
	
	private int cartProductNo;
	private int cartProductQty;
	private String memberId;
	private int productNo;
	
	public Cart() {
		
	}
	
	public Cart(int cartProductNo, int cartProductQty, int productNo, String memberId ) {
		this.cartProductNo = cartProductNo;
		this.cartProductQty = cartProductQty;		
		this.memberId = memberId;
		this.productNo = productNo;
	}

	public int getCartProductNo() {
		return cartProductNo;
	}

	public void setCartProductNo(int cartProductNo) {
		this.cartProductNo = cartProductNo;
	}

	public int getCartProductQty() {
		return cartProductQty;
	}

	public void setCartProductQty(int cartProductQty) {
		this.cartProductQty = cartProductQty;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "Cart [cartProductNo=" + cartProductNo + ", cartProductQty=" + cartProductQty + ", memberId=" + memberId
				+ ", productNo=" + productNo + "]";
	}
	
	
}
