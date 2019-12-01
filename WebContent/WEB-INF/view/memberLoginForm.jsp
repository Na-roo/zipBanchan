
<%@page import="com.itwill.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<%@ include file="../include/head.jsp"%>
<body style="">
	<%@ include file="../include/top.jsp"%>
	<div class="indiv" style="margin: 0 auto; width: 1100px;">
		<!-- Start indiv -->
		<%
			String msg1 = request.getParameter("msg1");
			
			if(msg1!=null) {
				out.println("<script>");
				out.println("window.alert('"+msg1+"');");
				out.println("</script>");
			}
		%>
		
		<%
		String msg2 = request.getParameter("msg2");
		
		if(msg2!=null){
				out.println("<script>");
				out.println("window.alert('"+msg2+"');");
			    out.println("</script>");
		}
		%>
		
		<div class="hundred logborder">
			<div class="innertit">
				<p>로그인</p>
				<span>로그인이 필요한 서비스입니다. 회원이 아니시면 회원가입을 해주세요.</span> <br> <span
					style="color: #f0301b; font-weight: 500; text-align: left !important;">아이디와 비밀번호를 
					입력해주세요.</span>
			
			</div>
			<form method="post" action="memberLoginAction.do" id="form"
				name="form">
				<div class="idsave">
					<p style="margin-bottom: 7px;">
						<input type="text" name="memberId" onfocus="this.value='';" value="" placeholder="아이디" class="txtborder">
						
					</p>
					<p style="margin-bottom: 10px;">
						<input type="password" name="memberPassword" onfocus="this.value='';"	value="" placeholder="비밀번호" class="txtborder">
						
					</p>
					<p>
						<input type="image" src="./res/btn_login.gif">
					</p>
					<p style="text-align: left; width: 400px; margin: 5px auto;">
						<input type="checkbox" name="" value="">아이디저장
					</p>
				</div>
			</form>

			<div class="snslogin">
				<button
					style="background: url('/shop/data/skin/mera_ws/img/login_sns_facebook_wide.gif') no-repeat; border: none; width: 400px; height: 50px; font-size: 0; cursor: pointer; text-indent: -9999px; display: block;"
					onclick="popup('http://socialmember.godo.co.kr/facebook_api.php?action=login&amp;scope=public_profile%2Cemail%2Cuser_birthday&amp;display=popup&amp;redirect_uri=https%3A%2F%2Fwww.zipbanchan.co.kr%3A14027%2Fshop%2Fmember%2Fsocial_member.php%3FMODE%3Dlogin%26SOCIAL_CODE%3DFACEBOOK%26return_url%3Dhttps%25253A%25252F%25252Fwww.zipbanchan.co.kr%25253A14027%25252Fshop%25252Fmain%25252Findex.php%25253Fgclid%25253DEAIaIQobChMIsKL9r4Xw4wIVDT5gCh0QkAAwEAAYAiAAEgKcWfD_BwE', 400, 300);">FACEBOOK</button>
				<!--button style="background: url('/shop/data/skin/mera_ws/img/login_sns_kakao_wide.gif') no-repeat; border: none; width: 400px; height: 50px; font-size: 0; cursor: pointer; text-indent: -9999px; display: block;" onclick="popup('https://kauth.kakao.com/oauth/authorize?client_id=5673ccd3a8a59a5abb27f2bc1aa333af&redirect_uri=&response_type=code&state=', 400, 300);">카카오톡</button-->
				<button
					style="background: url('/shop/data/skin/mera_ws/img/login_sns_naver_wide.gif') no-repeat; border: none; width: 400px; height: 50px; font-size: 0; cursor: pointer; text-indent: -9999px; display: block;"
					onclick="popup('https://nid.naver.com/oauth2.0/authorize?response_type=code&amp;client_id=pmLML3GgohzOqew1wliv&amp;redirect_uri=https%3A%2F%2Fwww.zipbanchan.co.kr%3A14027%2Fshop%2Fmember%2Fsocial_member.php%3FMODE%3Dlogin%26SOCIAL_CODE%3DNAVER&amp;state=RAMDOM_STATE', 400, 300);">네이버</button>
			</div>

			<div class="joinfind">
				<a href="/zipbanchan/memberWriteForm.do;" onfocus="blur()">아이디찾기</a>
				&nbsp;<span style="color: #aaa; font-size: 11px;">｜</span>&nbsp; <a
					href="/zipbanchan/memberWriteForm.do;" onfocus="blur()">비밀번호찾기</a>
				&nbsp;<span style="color: #aaa; font-size: 11px;">｜</span>&nbsp; <a
					href="/zipbanchan/memberWriteForm.do" onfocus="blur()">회원가입</a>
			</div>
		</div>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>