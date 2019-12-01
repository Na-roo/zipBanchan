package com.itwill.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.dispatcher.Controller;
import com.itwill.member.MemberService;

public class MemberFindPasswordActionController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		try {
			String memberId = request.getParameter("memberId");
			String memberPhone = request.getParameter("memberPhone");
			MemberService memberService = new MemberService();
			String memberPassword = memberService.readOnePassword(memberId, memberPhone);
			request.setAttribute("memberPassword", memberPassword);
			forwardPath = "/memberWriteForm.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath = "forward:/main.jsp";
		}
		return null;
	}
}
