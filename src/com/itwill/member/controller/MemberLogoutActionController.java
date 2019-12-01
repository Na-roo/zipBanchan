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

public class MemberLogoutActionController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		HttpSession session = request.getSession();
		session.invalidate();
		forwardPath = "forward:/main.jsp";
		return forwardPath;
	}

}
