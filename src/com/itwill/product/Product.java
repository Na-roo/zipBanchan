
package com.itwill.product;


public class Product {
	   private int productNo;
	   private String productName;
	   private int productQty;
	   private int productPrice;
	   private int categoryNo;
	   private String productImg;
	   
	   public Product() {
	
	}
	   public Product(int productNo,String productName, int productQty,
	         int productPrice,  int categoryNo,String productImg) {
	      super();
	      this.productNo = productNo;
	      this.productName =productName;
	      this.productQty =productQty;
	      this.productPrice =productPrice;
	      this.categoryNo=categoryNo;
	      this.productImg =productImg;
	   }
	   
	  
	   public Product(int categoryNo) {
		   super();
		   this.categoryNo=categoryNo;
	   }
	  

	   
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductQty() {
		return productQty;
	}
	public void setProductQty(int productQty) {
		this.productQty = productQty;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	@Override
	public String toString() {
		return productNo+" "+productName+"  "+productPrice+" "+productQty+" "+categoryNo+" "+productImg ;
		
	}
	}
