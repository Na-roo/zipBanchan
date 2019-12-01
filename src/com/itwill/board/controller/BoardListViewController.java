package com.itwill.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.board.Board;
import com.itwill.board.BoardService;
import com.itwill.dispatcher.Controller;
import com.itwill.member.Member;
import com.itwill.member.MemberService;
import com.itwill.product.Product;
import com.itwill.product.ProductService;

public class BoardListViewController implements Controller {
	
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String path = "";
		
		try {
			
			String boardNo = request.getParameter("boardNo");
			String searchTitle = request.getParameter("searchTitle");
			String keyword = request.getParameter("keyword");
			ArrayList<Board> boardList = null;
			
			if (searchTitle != null) {
				if (searchTitle.equals("title")) {
					boardList = BoardService.instance().selectAsBoardWriteByTitle(keyword);
				} else if (searchTitle.equals("memberId")) {
					boardList = BoardService.instance().selectAsBoardWriteByMemberId(keyword);
				}	
			} else {
					
				int startPage = 1;
				int endPage = 10;
				if (boardNo != null) {
					startPage = (Integer.parseInt(boardNo) - 1) * 10 + 1;
					endPage = (Integer.parseInt(boardNo) - 1) * 10 + 10;
				} 
				
				boardList = BoardService.instance().selectAsPaging(startPage, endPage);	
			}
			
			
			ArrayList<Product> productList = new ArrayList<>();
			ArrayList<Member> memberList = new ArrayList<>();
			
			ProductService productService = new ProductService();
			MemberService memberService = new MemberService();
			
			for (Board board : boardList) {
				productList.add(productService.findByNo(board.productNo));
				memberList.add(memberService.readOne(board.memberId));
			}
			
			int rowCount = BoardService.instance().selectTotalCount();
			
			request.setAttribute("boardList", boardList);
			request.setAttribute("productList", productList);
			request.setAttribute("memberList", memberList);
			request.setAttribute("rowCount", rowCount);
			path = "forward:/boardListView.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			path = "forward:/error.jsp";
		}

		return path;
	}
}
