package com.itwill.jumun.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.cart.Cart;
import com.itwill.cart.CartService;
import com.itwill.dispatcher.Controller;
import com.itwill.jumun.Jumun;
import com.itwill.jumun.JumunService;
import com.itwill.member.Member;
import com.itwill.member.MemberService;
import com.itwill.product.Product;
import com.itwill.product.ProductService;

public class JumunFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		
		
		
		/*
		if (request.getMethod().equalsIgnoreCase("GET")) {
			forwardPath = "redirect:/WEB-INF/view/main.jsp";// 메인으로 리디렉트
		} else {*/
			try {
				
				CartService cartService = new CartService();
				ProductService productService =  new ProductService();
				//String memberId = "abcd";//request.getParameter("memberId");
				HttpSession session = request.getSession();
				Member member = (Member)session.getAttribute("sMember");

				
				ArrayList<Cart> cartList = cartService.getCartList(member.getMemberId());
				ArrayList<Product> productList = new ArrayList<Product>();
				
				
				
				for (Cart c : cartList) {
					int p_no = c.getProductNo();
					Product p = productService.findByNo(p_no);
					productList.add(p); 					 					
					}
											
				request.setAttribute("productList", productList);				
				request.setAttribute("cartList",cartList);
				
				// *****총가격 추가함
				int totPrice = 0;												
			
				for (int i = 0; i < cartList.size(); i++) {
					totPrice += cartList.get(i).getCartProductQty() * productList.get(i).getProductPrice();
				}
				
				request.setAttribute("jumunPrice", totPrice);
				
				//**************
					
				forwardPath = "forward:/jumunForm.jsp";

			} catch (Exception e) {
				e.printStackTrace();
				forwardPath = "forward:/error.jsp";// 에러페이지로 포워드
			}
		//}
		return forwardPath;
	}

}
