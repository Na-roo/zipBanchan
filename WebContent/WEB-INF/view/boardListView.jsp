<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.board.Board"%>
<%@page import="com.itwill.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
	ArrayList<Board> boardList = (ArrayList<Board>)request.getAttribute("boardList");
	ArrayList<Product> productList = (ArrayList<Product>)request.getAttribute("productList");
	ArrayList<Member> memberList = (ArrayList<Member>)request.getAttribute("memberList");
	int boardCount = (int)request.getAttribute("rowCount");
	
	int pageNumCount = (int)Math.ceil(boardCount / 10.0d);
	
	
	
%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<%@ include file="../include/head.jsp"%>

<script type="text/javascript">
	
	function searchKeyword(form) {
		var searchKeyword = document.getElementById("searchTitle");
		var subTitle = target.options[productItem.selectedIndex].value;
		var keyword = document.getElementById("keyword").value;
		
		
		this.submit();
	}
	
</script>

<body style="">
	<%@ include file="../include/top.jsp"%>

	<div id="content">

		<style>
#pos_scroll {
	position: absolute;
	top: 315px;
}
</style>
		<!-- 상단이미지 || 현재위치 -->
		<div class="atit">
			<p>고객후기</p>
			<span class="path">
				<img src="./res/ico_home.gif" alt="HOME" style="cursor: pointer;"> <b>고객센터</b> &gt; 고객후기</span>
		</div>



		<div class="indiv" style="margin: 0;">
			<!-- Start indiv -->

			<form name="frmList" action="boardListView.do" method="POST">
				<input type="hidden" name="sort" value="1"> <input
					type="hidden" name="page_num" value="10">

				<!-- 검색 : Start -->
				<div
					style="border: 1px solid #ccc; text-align: center; padding: 20px 0;">
					<div></div>
					<div style="margin-top: 20px;">
						<span>검색어</span> 
						<select name="searchTitle" class="select" style="background: #fff; height: 28px; font-size: 14px;">
							<option value="title">제목</option>
							<option value="memberId">작성자</option>
						</select> 
						<input type="text" name="keyword" value=""style="width: 230px; padding-left: 10px; border: 1px solid #ccc; height: 26px; line-height: 26px;">
						<input type="image" src="./res/btn_search.gif" onclick="searchKeyword(this)" align="absmiddle">
					</div>
				</div>
				<!-- 검색 : End -->

				

				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					style="clear: both;" class="listtablen">
					<tbody>
						<tr>
							<th width="50">번호</th>
							<th width="100">이미지</th>
							<th>상품명/후기</th>
							<th width="80">작성자</th>
							<th width="80">작성일</th>
							<th width="80">평점</th>
						</tr>
					</tbody>
				</table>

				<!-- 게시판 표시 시작 -->
				<% for (int i =0; i < boardList.size(); i ++) { %>
				<div>
					<table width="100%" cellpadding="0" cellspacing="0"
						style="border-top: none; cursor: pointer;" class="listtablen"
						>
						<tbody>
							<tr>
								<td width="50" align="center"><%= boardList.get(i).boardNo %></td>
								<td width="100" align="center" style="padding: 10px 0;">
								<a href="productDetailView.do?productNo=<%= productList.get(i).getProductNo() %>">
									<img src="./<%= productList.get(i).getProductImg() %>" width="70"/></a></td>
								<td>
									<table cellpadding="0" cellspacing="0" border="0"
										style="border: none;">
										<tbody>
										
											<tr>
												<td style="padding-top: 5px; border: none; height: auto; text-align: left; color: #333;">
													<a href="boardDetailView.do?boardNo=<%= boardList.get(i).boardNo %>">		
													<%= productList.get(i).getProductName() %>
													</a>		
												</td>
											</tr>
											<tr>
												<td style="padding-top: 5px; padding-bottom: 5px; border: none; height: auto; text-align: left;">
													<a href="boardDetailView.do?boardNo=<%= boardList.get(i).boardNo %>">
														<%= boardList.get(i).content %>
													</a>
												</td>
											</tr>
										
										</tbody>
									</table>
								</td>
								<td width="80" align="center"><%= memberList.get(i).getMemberName() %></td>
								<td width="80" align="center"><%= boardList.get(i).writeDate %></td>
								<td width="80" style="color: #744134;">
									<%
										String evalStr = "";
									switch(boardList.get(i).evalPoint) {
									case 1:
										evalStr = "★☆☆☆☆";
										break;
									case 2:
										evalStr = "★★☆☆☆";
										break;
									case 3:
										evalStr = "★★★☆☆";
										break;
									case 4:
										evalStr = "★★★★☆";
										break;
									case 5:
										evalStr = "★★★★★";
										break;
										
									}
									%>
									<%= evalStr %>
								</td>
								
							</tr>
						</tbody>
					</table>
				</div>
				<% } %>
				<!-- 게시판 표시 종료 -->



			</form>

			<div class="pagediv" style="margin-top: 20px; position: relative; text-align: center;"> 
			
			<% for (int i = 0; i < pageNumCount; i++) { %>
				<a href="boardListView.do?boardNo=<%= i+1 %>" class="navi">[<%=i+1 %>]</a>
			<% } %>

			<a href="boardWriteView.do"><img src="./res/btn_writes2.gif" style="cursor: pointer; position: absolute; top: 0; right: 0;"></a>
			</div>
		</div>
		<!-- End indiv -->
	</div>

	<%@ include file="../include/bottom.jsp"%>
</body>
</html>