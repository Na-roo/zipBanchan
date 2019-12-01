package com.itwill.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.board.Board;
import com.itwill.board.BoardService;
import com.itwill.dispatcher.Controller;
import com.itwill.product.Product;
import com.itwill.product.ProductService;

public class BoardModifyViewController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String path = "";

		try {
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			Board board = BoardService.instance().select(boardNo);
			Product product = new ProductService().findByNo(board.productNo);
			request.setAttribute("board", board);
			request.setAttribute("product", product);
			path = "forward:/boardModifyView.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			path = "forward:/error.jsp";
		}
		
		return path;
	}
}