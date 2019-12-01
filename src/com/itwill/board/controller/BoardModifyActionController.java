package com.itwill.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.board.Board;
import com.itwill.board.BoardService;
import com.itwill.dispatcher.Controller;

public class BoardModifyActionController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String path = "";
		
		try {

			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
	        int evalPoint = Integer.parseInt(request.getParameter("evalPoint"));
	        String memberId = request.getParameter("memberId");
	        int productNo = Integer.parseInt(request.getParameter("productNo"));
	        
	        int result = BoardService.instance().update(new Board(boardNo, title, null, evalPoint, content, memberId, productNo));
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