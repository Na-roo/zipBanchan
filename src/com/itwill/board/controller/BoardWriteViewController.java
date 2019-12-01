package com.itwill.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.dispatcher.Controller;
import com.itwill.product.ProductService;

public class BoardWriteViewController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String path = "";

		try {
			request.setAttribute("productList", new ProductService().findByAll());
			path = "forward:/boardWriteView.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			path = "forward:/error.jsp";
		}

		return path;
	}
}