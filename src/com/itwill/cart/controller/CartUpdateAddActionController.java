package com.itwill.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.cart.CartService;
import com.itwill.dispatcher.Controller;
import com.itwill.member.Member;

public class CartUpdateAddActionController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";

//		if (request.getMethod().equalsIgnoreCase("GET")) {
//			forwardPath = "redirect:zipbanchan.main.do";
//		} else {
			try {
//				String memberId = request.getParameter("memberId");
//				String memberId = "abcd";
				HttpSession session = request.getSession();
				Member member = (Member)session.getAttribute("sMember");
				String productNo = request.getParameter("productNo");
				//String cartProductQty = request.getParameter("ea[0]");
				CartService cartService = new CartService();
				int addOK = cartService.add(member.getMemberId(), Integer.parseInt(productNo), 1);
				if (addOK == 1) {
					
					forwardPath = "redirect:/productDetailView.do?productNo=" + productNo;
					
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
