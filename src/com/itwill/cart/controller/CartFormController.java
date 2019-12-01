package com.itwill.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.cart.Cart;
import com.itwill.cart.CartService;
import com.itwill.dispatcher.Controller;
import com.itwill.member.Member;
import com.itwill.product.Product;
import com.itwill.product.ProductService;

public class CartFormController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String forwardPath = "";		

		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("sMember");
		

//		if (request.getMethod().equalsIgnoreCase("GET")) {
//			forwardPath = "redirect:/memberLoginForm.do";
//		} else {
			try {
				CartService cartService = new CartService();
				ProductService productService =  new ProductService();
				//String memberId = "abcd";//request.getParameter("memberId");
								
				ArrayList<Cart> cartList = cartService.getCartList(member.getMemberId());
				ArrayList<Product> productList = new ArrayList<>();
				
				for (Cart c : cartList) {
					int p_no = c.getProductNo();
					Product p = productService.findByNo(p_no);
					productList.add(p);
//					System.out.println(p);
				}
				request.setAttribute("productList", productList);
				
				request.setAttribute("cartList",cartList);
				forwardPath="forward:/cartForm.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				forwardPath="forward:/error.jsp";
			}
//		}

		return forwardPath;
	}
}
