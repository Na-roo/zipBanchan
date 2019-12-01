package com.itwill.jumun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwill.dispatcher.Controller;
import com.itwill.jumun.Jumun;
import com.itwill.jumun.JumunService;
import com.itwill.member.Member;

public class JumunCompleteFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		/*
		if (request.getMethod().equalsIgnoreCase("GET")) {
			forwardPath = "redirect:/WEB-INF/view/main.jsp";// 메인으로 리디렉트
		} else {
		*/
			try {
				
				HttpSession session = request.getSession();
				Member member = (Member)session.getAttribute("sMember");
				int jumunNoInfo = Integer.parseInt(request.getParameter("jumunNoInfo"));
				
				JumunService jumunService = new JumunService();
				Jumun jumun = jumunService.selectByNo(jumunNoInfo);
				
				request.setAttribute("jumun", jumun);
							
				//forwardPath = "forward:/jumunComplete.do?jumunNoInfo="+jumunNoInfo;
				forwardPath = "forward:/jumunComplete.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				forwardPath = "forward:/error.jsp";// 에러페이지로 포워드
			}
		//}
		return forwardPath;
	}

}
