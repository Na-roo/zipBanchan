package com.itwill.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.cart.CartService;
import com.itwill.dispatcher.Controller;
import com.itwill.member.Member;
import com.itwill.member.MemberService;


public class MemberDeleteActionController implements Controller{
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		//if(request.getMethod().equalsIgnoreCase("GET")){
			//forwardPath="redirect:/main.jsp";
		//}else {
			try {
				HttpSession session = request.getSession();
				Member sMember = (Member)session.getAttribute("sMember");
				MemberService memberService = new MemberService();
				CartService cartService = new CartService();
				cartService.deleteCart(sMember.getMemberId());
				boolean deleteOK=memberService.delete(sMember.getMemberId());
				if(deleteOK){
					session.invalidate();
					forwardPath="forward:/main.jsp";
				}else{
					forwardPath="forward:/main.jsp";
				}
			}catch (Exception e) {
				e.printStackTrace();
				forwardPath="forward:/main.jsp";
			}
		//}
		return forwardPath;
	}
}
