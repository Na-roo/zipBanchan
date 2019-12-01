package com.itwill.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.dispatcher.Controller;

public class ZipbanchanMainController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String forwardPath = "";
		forwardPath="forward:/main.jsp";
		return forwardPath;
	}

}
