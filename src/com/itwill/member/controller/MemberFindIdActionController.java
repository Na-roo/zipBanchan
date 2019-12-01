package com.itwill.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.dispatcher.Controller;
import com.itwill.member.MemberService;

public class MemberFindIdActionController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		try {
		String memberName = request.getParameter("memberName");
		String memberPhone = request.getParameter("memberPhone");
		MemberService memberService = new MemberService();
		String memberId = memberService.readOneId(memberName, memberPhone);
		request.setAttribute("memberId", memberId);
		forwardPath = "forward:/memberWriteForm.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath = "forward:/main.jsp";
		}
		return forwardPath;
	}
	
}
