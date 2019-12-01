package com.itwill.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.dispatcher.Controller;
import com.itwill.exception.PasswordMismatchException;
import com.itwill.exception.UserNotFoundException;
import com.itwill.member.Member;
import com.itwill.member.MemberService;

public class MemberLoginActionController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		if (request.getMethod().equalsIgnoreCase("GET")) {
			String msg="로그인이 필요한 서비스 입니다.";
			forwardPath = "redirect:/memberLoginForm.jsp?msg="+ msg;
		}
		try {
			String memberId = request.getParameter("memberId");
			String password = request.getParameter("memberPassword");
			MemberService memberService = new MemberService();
			Member loginMember = memberService.login(memberId, password);
			HttpSession session = request.getSession();
			session.setAttribute("sMember", loginMember);
			forwardPath = "forward:/main.jsp";
		} catch (UserNotFoundException e) {
			String msg1;
			try {
				msg1 = URLEncoder.encode(e.getMessage(), "UTF-8");
				forwardPath = "redirect:/memberLoginForm.do?msg1="+msg1;
			} catch (UnsupportedEncodingException e1) {	
				e1.printStackTrace();
			}
		} catch (PasswordMismatchException e) {
			String msg2;
			try {
				msg2 = URLEncoder.encode(e.getMessage(), "UTF-8");
				forwardPath = "redirect:/memberLoginForm.do?msg2="+msg2;
			} catch (UnsupportedEncodingException e1) {			
				e1.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath = "forward:/memberLoginForm.do";
		}
		return forwardPath;
	}

}
