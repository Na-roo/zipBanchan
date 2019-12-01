package com.itwill.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.board.BoardService;
import com.itwill.dispatcher.Controller;
import com.itwill.product.ProductService;

public class BoardDeleteActionController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String path = "";

		try {
			
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			int result = BoardService.instance().delete(boardNo);
			if (result > 0) {
				path = "redirect:/boardListView.do";	
			} else {
				path = "forward:/error.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			path = "forward:/error.jsp";
		}

		return path;
	}
}
