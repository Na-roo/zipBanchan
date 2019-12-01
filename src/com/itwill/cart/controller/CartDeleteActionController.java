package com.itwill.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.cart.CartService;
import com.itwill.dispatcher.Controller;

public class CartDeleteActionController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String forwardPath = "";
		
//		if(request.getMethod().equalsIgnoreCase("GET")){
//			forwardPath="redirect:zipbanchan.main.do";
//		}else {
			String memberId = request.getParameter("memberId");
			try {
				CartService cartService = new CartService();
				int deleteOK = cartService.deleteCart(memberId);
				if(deleteOK == 1) {
					forwardPath = "forward:/cartForm.jsp";
				}else {
					forwardPath = "forward:/error.jsp";
				}
			} catch (Exception e) {
				e.printStackTrace();
				forwardPath = "forward:/error.jsp";
			}
		
//		}
		
		return forwardPath;
	}
}
