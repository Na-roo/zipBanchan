package com.itwill.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.dispatcher.Controller;

public class MemberFindPasswordFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		forwardPath = "forward:/memberWriteForm.jsp";
		return forwardPath;
	}
}
