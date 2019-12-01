package com.itwill.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.dispatcher.Controller;
import com.itwill.member.Member;

public class MemberMypageController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("sMember");
		if(member == null) {
			String msg="로그인이 필요한 서비스 입니다.";
			forwardPath="redirect:/member_login_form.jsp?msg="+ msg;
		}else {
			try {
				forwardPath="forward:/memberMypage.jsp";
			}catch (Exception e) {
				e.printStackTrace();
				forwardPath="forward:/main.jsp";
			}
		}
		return forwardPath;

	}
}
