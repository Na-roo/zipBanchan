package com.itwill.cart;

import java.util.ArrayList;

import com.itwill.product.Product;
import com.itwill.product.ProductDao;
import com.itwill.product.ProductService;



public class CartService {
	private CartDao cartDao;
	private ProductService productService;
	
	public CartService() throws Exception{
		cartDao = new CartDao();
		productService = new ProductService();
	}
	
	public int add(String memberId,int productNo, int cartProductQty) throws Exception{
		Product product=productService.findByNo(productNo);
		if(cartDao.isProductExist(memberId, productNo)) {
			return cartDao.update(memberId, product, cartProductQty);
		}else {
			return cartDao.add(memberId,product, cartProductQty);
		}
	}
	public int minus(String memberId,int productNo, int cartProductQty) throws Exception{
		Product product=productService.findByNo(productNo);		
		return cartDao.updateMinus(memberId, product, cartProductQty);		
	}
//	public int update(String memberId,int productNo,int cartProductQty) throws Exception{
//		Product product=productService.findByNo(productNo);
//		if(cartDao.isProductExist(memberId, productNo)) {
//			return cartDao.update(memberId, product, cartProductQty);
//		}
//		return 0;
//	}
	
	public ArrayList<Cart> getCartList(String memberId) throws Exception{
		return cartDao.getCartList(memberId);
	}
	public  int deleteCartProduct(int productNo,String memberId)  throws Exception{
		return cartDao.deleteCartProduct(productNo,memberId);
	}

	public int deleteCart(String memberId)  throws Exception{
		return cartDao.deleteCart(memberId);
	}
	
	
	
	
}
