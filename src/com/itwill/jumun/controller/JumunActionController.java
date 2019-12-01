package com.itwill.jumun.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.cart.Cart;
import com.itwill.cart.CartService;
import com.itwill.dispatcher.Controller;
import com.itwill.jumun.Jumun;
import com.itwill.jumun.JumunService;
import com.itwill.member.Member;

public class JumunActionController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";

		
//		if (request.getMethod().equalsIgnoreCase("GET")) {
//			forwardPath = "redirect:/WEB-INF/view/main.jsp";
//		} else {
			try {
				HttpSession session = request.getSession();
				Member member = (Member)session.getAttribute("sMember");
				ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
				int totPrice = (int)session.getAttribute("totPrice");

				JumunService jumunService = new JumunService();

//				int j_no = Integer.parseInt(request.getParameter("j_no"));
//				String j_date = request.getParameter("j_date");
//				int j_qty = Integer.parseInt(request.getParameter("j_qty"));
				int j_qty = cartList.size();
				int j_price = totPrice;
				String j_receiver_name = request.getParameter("j_receiver_name");
				String j_receiver_address = request.getParameter("j_receiver_address");
				

//				Jumun jumun = new Jumun(j_no,j_date,j_qty,j_price,j_receiver_name,j_receiver_address,m_Id);				
				Jumun jumun = new Jumun(j_qty,j_price,"김경호","아이티윌",member.getMemberId());				
						
			
				int updateOK = jumunService.create(jumun);
				if(updateOK == 1){
//					forwardPath ="forward:/jumunComplete.do?jumunNoInfo="+jumunNoInfo;
					int jumunNoInfo = jumunService.findByLastNo();
					request.setAttribute("jumun", jumun);
					request.setAttribute("jumunNo", jumunNoInfo);
					CartService cartService = new CartService();
					cartService.deleteCart(member.getMemberId());
					forwardPath ="forward:/jumunComplete.jsp";//?jumunNoInfo="+jumunNoInfo;
					
				}else {
					forwardPath = "forward:/www.naver.com"; //다시설정하기
				}

			}catch (Exception e ) {
				e.printStackTrace();
				forwardPath = "forward:/jumunComplete.jsp?jumunNoInfo=1111111111";//다시설정하기
			}
//		}
			return forwardPath;
	}
}
