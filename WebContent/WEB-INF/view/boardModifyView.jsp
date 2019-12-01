<%@page import="com.itwill.product.Product"%>
<%@page import="com.itwill.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
	Board board = (Board)request.getAttribute("board");
	Product product = (Product)request.getAttribute("product");
	
	String evalPointStr = "";
	
	switch (board.evalPoint) {
	case 1: 
		break;
	case 2: 
		break;
	case 3: 
		break;
	case 4: 
		break;
	case 5: 
		break;
		
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<%@ include file="../include/head.jsp"%>
<script>
	function modify(form) {
		var evalPoint = 0;
		var boardNo = document.getElementById("boardNo").value;
		var productNo = document.getElementById("productNo").value;
		var title = document.getElementById("title").value;
		var content = document.getElementById("content").value;
		var memberId =	document.getElementById("memberId").value;
        var radioBtn = document.getElementsByName("evalPoint");
        
        var index = 0;
        for(var i = 0; i<radioBtn.length; i++){
            if(radioBtn[i].checked==true){
            	evalPoint = radioBtn[i].value
                break;
            }
        }

		form.submit();
	}
</script>

<body style="">
	<%@ include file="../include/top.jsp"%>

	<form name="form_review" id="form_review" method="post"	action="boardModifyAction.do">
		<table id="table_after" width="60%" cellpadding="0" cellspacing="0" border="0" style="margin: 0 auto">
			<tbody>
				<tr>
					<td style="border-style: solid; border-width: 10px; border-color: #000000" valign="top">
						<div style="width: 100%; background: #000000; border-bottom: 2px solid #DDDDDD">
							<img src="./res/popup_title_review.gif">
						</div>

						<div style="margin-left: 20px; margin-right: 20px; margin-top: 10px;">

							<div
								style="border-width: 1px; border-style: solid; border-color: #DEDEDE; margin-top: 5px;"
								class="hundred">
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tbody>
										<tr>
											<td
												style="border-width: 3px; border-style: solid; border-color: #F3F3F3; padding: 5px 5px 5px 5px">

												<table width="100%" id="form" cellpadding="5" cellspacing="0" border="0" align="center">
													<colgroup>
														<col width="80">
													</colgroup>
													<input type="hidden" id="boardNo" name="boardNo" value="<%= board.boardNo %>" >
													<input type="hidden" id="productNo" name="productNo" value="<%= product.getProductNo()%>" >
													<tbody>
														<tr>
															<td>
																<img src="./<%= product.getProductImg() %>" width="70"/>
															</td>
															<td><%= product.getProductName() %></td>
														</tr>
														<tr>
															<td colspan="2" height="1" bgcolor="#DEDEDE"
																style="padding: 0px;"></td>
														</tr>
														<tr>
															<td class="input_txt" align="right">평가</td>
															<td class="noline">
																<input type="radio" name="evalPoint" name="evalPoint" value="5" class="noline" checked="checked">★★★★★
																<input type="radio" name="evalPoint" value="4" class="noline">★★★★☆ 
																<input type="radio" name="evalPoint" value="3" class="noline">★★★☆☆ 
																<input type="radio" name="evalPoint" value="2" class="noline">★★☆☆☆
																<input type="radio" name="evalPoint" value="1" class="noline">★☆☆☆☆</td>
														</tr>
														<tr>
															<td colspan="2" height="1" bgcolor="#DEDEDE"
																style="padding: 0px;"></td>
														</tr>
														<tr>
															<td class="input_txt" id="memberId" align="right">작성자</td>
															<td><%= board.memberId %></td>
														</tr>
														<tr>
															<td colspan="2" height="1" bgcolor="#DEDEDE"
																style="padding: 0px;"></td>
														</tr>
														<tr>
															<td class="input_txt" align="right">제목</td>
															<td><input type="text" id="title" name="title" value="<%= board.title %>"
																style="width: 95%" required="" fld_esssential=""
																label="제목" value=""></td>
														</tr>
														<tr>
															<td colspan="2" height="1" bgcolor="#DEDEDE"
																style="padding: 0px;"></td>
														</tr>
														<tr>
															<td class="input_txt" align="right">내용</td>
															<td><textarea name="content" id="content"
																	style="width: 95%; height: 120px;" required=""
																	fld_esssential="" label="내용"><%= board.content %></textarea></td>
														</tr>
														<tr>
															<td colspan="2" height="1" bgcolor="#DEDEDE"
																style="padding: 0px;"></td>
														</tr>
													</tbody>
												</table>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</td>
					
				</tr>
				<td>
					<div align="center">
						<input type="image" src="./res/btn_confirm.gif" onclick="modify(this)"> 
						<input type="image" src="./res/btn_order_back.gif" onclick="history.back()" style="cursor: pointer; vertical-align: bottom;">
					</div>
				</td>
			</tbody>
		</table>
	</form>
<%@ include file="../include/bottom.jsp"%>
</body>
</html>