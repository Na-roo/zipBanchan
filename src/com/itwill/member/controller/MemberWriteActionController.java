package com.itwill.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.dispatcher.Controller;
import com.itwill.member.Member;
import com.itwill.member.MemberService;

public class MemberWriteActionController implements Controller {
		@Override
		public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
			String forwardPath="";
			try {
				if(request.getMethod().equalsIgnoreCase("GET")) {
					forwardPath="redirect:/memberWriteForm.jsp";
				} else {
					String memberName = request.getParameter("memberName");
					String memberId = request.getParameter("memberId");
					String memberPassword = request.getParameter("memberPassword");
					String memberAddress = request.getParameter("memberAddress");
					String memberPhone = (request.getParameter("memberPhone")+"-"+request.getParameter("memberPhone2")+"-"+request.getParameter("memberPhone3"));
					String memberEmail = (request.getParameter("memberEmail")+"@"+request.getParameter("memberEmail2"));
					MemberService memberService = new MemberService();
					boolean isSuccess = memberService.create(new Member(
							memberName, memberId, memberPassword, 
							memberAddress, memberPhone, memberEmail));
					if(isSuccess) {
						forwardPath = "forward:/main.jsp";
					} else {
						String msg = "회원 가입에 실패하셨습니다.";
						forwardPath = "forward:/memberWriteForm.jsp?msg="+msg;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				forwardPath="forward:/main.jsp";
			}
			return forwardPath;
		}
}
