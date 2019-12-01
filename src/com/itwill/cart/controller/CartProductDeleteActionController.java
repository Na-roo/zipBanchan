package com.itwill.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.cart.CartService;
import com.itwill.dispatcher.Controller;
import com.itwill.member.Member;

public class CartProductDeleteActionController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";

//		if (request.getMethod().equalsIgnoreCase("GET")) {
//			forwardPath = "redirect:zipbanchan.main.do";
//		} else {
			try {
				HttpSession session = request.getSession();				
//				String memberId = "abcd";
				Member member = (Member)session.getAttribute("sMember");				
				String productNo = request.getParameter("productNo");
				CartService cartService = new CartService();
				int deleteOK = cartService.deleteCartProduct(Integer.parseInt(productNo),member.getMemberId());
				if (deleteOK == 1) {
					forwardPath = "redirect:/cartForm.do";
				} else {
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
