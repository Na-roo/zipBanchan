package com.itwill.board.controller;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.board.Board;
import com.itwill.board.BoardService;
import com.itwill.dispatcher.Controller;
import com.itwill.product.Product;
import com.itwill.product.ProductService;

public class BoardWriteActionController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String path = "";

		try {
			
			int productNo = Integer.parseInt(request.getParameter("productNo"));
			int evalPoint = Integer.parseInt(request.getParameter("evalPoint"));
			String memberId = request.getParameter("memberId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Board board = new Board(title, null, evalPoint, content,memberId,productNo);
			
			int result = BoardService.instance().insert(board);

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