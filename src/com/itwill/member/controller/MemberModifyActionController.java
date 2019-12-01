package com.itwill.member.controller;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.dispatcher.Controller;
import com.itwill.member.Member;
import com.itwill.member.MemberService;

public class MemberModifyActionController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		try {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("sMember");
		if(member == null) {
			String msg="로그인이 필요한 서비스 입니다.";
			forwardPath="redirect:/memberLoginForm.jsp?msg="+ msg;
		} else {
			String memberName = request.getParameter("memberName");
			String memberPassword = request.getParameter("newPassword");
			String memberAddress = request.getParameter("memberAddress");
			String memberPhone = request.getParameter("memberPhone")+"-"+request.getParameter("memberPhone2")+"-"+request.getParameter("memberPhone3");
			String memberEmail = request.getParameter("memberEmail")+"@"+request.getParameter("memberEmail2");
			MemberService memberService = new MemberService();
			Member updateMember = new Member(memberName, member.getMemberId(), memberPassword, memberAddress, memberPhone, memberEmail);
			boolean isSuccess = memberService.update(updateMember);
			session.setAttribute("sMember", updateMember);
			if(isSuccess) {
				forwardPath="forward:/memberMypage.jsp";
			} else {
				forwardPath="forward:/main.jsp";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath="forward:/main.jsp";
		}
		return forwardPath;
	}
}
