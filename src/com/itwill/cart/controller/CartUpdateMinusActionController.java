package com.itwill.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.cart.CartService;
import com.itwill.dispatcher.Controller;

public class CartUpdateMinusActionController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";

		if (request.getMethod().equalsIgnoreCase("GET")) {
			forwardPath = "redirect:zipbanchan.main.do";
		} else {
			try {
				String memberId = request.getParameter("memberId");
				String productNo = request.getParameter("productNo");
				String cartProductQty = request.getParameter("cartProductQty");
				CartService cartService = new CartService();
				int minusOK = cartService.minus(memberId, Integer.parseInt(productNo), Integer.parseInt(cartProductQty));
				if (minusOK == 1) {
					forwardPath = "forward:/cartForm.jsp";
					
				} else {
					forwardPath = "forward:/error.jsp";
				}
			} catch (Exception e) {
				e.printStackTrace();
				forwardPath = "forward:/error.jsp";
			}
		}

		return forwardPath;
	}
}
