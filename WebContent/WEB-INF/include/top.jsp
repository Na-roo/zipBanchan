<%@page import="com.itwill.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% Member member = (Member)session.getAttribute("sMember");

%>
<script type="text/javascript">
	function ck() {
		alert("로그인이 필요한 서비스 입니다.");
	}
	
	
	
</script>				
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<div id="header">
	<a name="top"></a>
	<div id="header_main">
		<div id="tlogo">
			<div class="top_logo" style="margin-left:350px;">
				<a href="main.do">
				<img src="./res/logo_382.gif" width="191px"></a>
			</div>

			<div class="tarea3">
				<ul>
					<li>
					<%if(member==null) { %>
						<a href="memberLoginForm.do">로그인</a>
					<%}else { %>
						<a href="memberLogoutAction.do">로그아웃</a>
					<%} %>		
					</li>
					<li>
					<%if(member==null) { %>
						<a href="memberWriteForm.do">회원가입</a>
					<%}else { %>
						<a href="memberModifyForm.do">회원수정</a>
					<%} %>
					</li>
					<li>
					<%if(member==null) { %>
						<a href="memberLoginForm.do" onclick="ck()">마이페이지</a>
					<%}else { %>
						<a href="memberMypage.do">마이페이지</a>
					<%} %>
					</li>
					<li>
					<%if(member==null) { %>
						<a href="memberLoginForm.do" onclick="ck()">장바구니</a>
						<%}else { %>
						 <a href="cartForm.do">장바구니</a>
							<%} %>
					</li>
					<li>
						<a href="boardListView.do">고객후기</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div id="header_main_2">
		<div class="inner">
			<ul>
				<li class="sm11">
					<a href="productListView.do?categoryNo=100">마른반찬</a>
				</li>
				
				<li class="sm12">
					<a href="productListView.do?categoryNo=200">조림</a>
				</li>
				
				<li class="sm13">
					<a href="productListView.do?categoryNo=300">무침</a>
				</li>
				
				<li class="sm14">
					<a href="productListView.do?categoryNo=400">전/생선/곡류/양념</a>
				</li>
				
				<li class="sm15">
					<a href="productListView.do?categoryNo=500">볶음</a>
				</li>
				
				<li class="sm16">
					<a href="productListView.do?categoryNo=600">국/찌개/탕</a>
				</li>
				<li class="sm17 bnone">
					<a href="productListView.do?categoryNo=700">메인요리</a>
				</li>
				
				<li class="sm18 bnone">
					<a href="productListView.do?categoryNo=800">김치/절임/젓갈</a>
				</li>
			</ul>
		</div>
	</div>
</div>