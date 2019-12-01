<%@page import="com.itwill.product.ProductService"%>
<%@ page import="com.itwill.product.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

ProductService productService=new ProductService();
ArrayList<Product> categoryList=(ArrayList<Product>)request.getAttribute("categoryList");
ArrayList<Product> productList=(ArrayList<Product>)request.getAttribute("productList");

if(productList!=null){
	categoryList = productList;
}
%>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../include/head.jsp"%>
<body style="">
	<%@ include file="../include/top.jsp"%>
	<div id="main">
		<div id="content">
			<style>
#main, #content {
	width: 100% !important;
}

#pos_scroll {
	position: absolute;
	top: 840px;
}

.listTopImg {
	position: relative;
	width: 100%;
	height: 220px;
	overflow: hidden;
}

.listTopImg img {
	position: absolute;
	top: 0;
	left: 50%;
	margin-left: -1000px;
}
</style>

<script type="text/javascript">
	function productsortAction() {
		productSer
	}			
</script>

			<div class="listTopImg">
				<img src="./res/c2627f04d18ceede.jpg">
			</div>


			<div class="indiv" style="width: 1100px; margin: 0 auto;">
				<!-- Start indiv -->

				<form name="frmOption_578">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="578"> <input
						type="hidden" name="ea" value="1">
				</form>

				<form name="frmOption_559">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="559"> <input
						type="hidden" name="ea" value="1">
				</form>

				<form name="frmOption_17">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="17"> <input
						type="hidden" name="ea" value="1">

				</form>

				<form name="frmOption_260">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="260"> <input
						type="hidden" name="ea" value="1">

				</form>

				<form name="frmOption_20">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="20"> <input
						type="hidden" name="ea" value="1">

				</form>

				<form name="frmOption_159">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="159"> <input
						type="hidden" name="ea" value="1">

				</form>

				<form name="frmOption_265">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="265"> <input
						type="hidden" name="ea" value="1">

				</form>

				<form name="frmOption_19">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="19"> <input
						type="hidden" name="ea" value="1">

				</form>

				<form name="frmOption_21">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="21"> <input
						type="hidden" name="ea" value="1">

				</form>

				<form name="frmOption_160">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="160"> <input
						type="hidden" name="ea" value="1">

				</form>

				<form name="frmOption_23">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="23"> <input
						type="hidden" name="ea" value="1">

				</form>

				<form name="frmOption_313">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value="313"> <input
						type="hidden" name="ea" value="1">

				</form>
				<form name="frmList">
					<input type="hidden" name="category" value="001001"> <input
						type="hidden" name="sort" value="goods_link.sort2"> <input
						type="hidden" name="page_num" value="18">

					<!-- 상단 카테고리 메뉴 -->
					<!-- 추천상품 -->




					<style>
body .pprice, body .pprice:hover {
	color: #c45c5a;
	font-size: 20px;
	font-family: "Noto Sans KR", 'Nanum Gothic', sans-serif;
}

.dcmark p {
	padding-right: 0;
	text-align: center;
}
</style>

					<!-- 품절상품 마스크 -->
					<div id="el-goods-soldout-image-mask"
						style="display: none; position: absolute; top: 0; left: 0; background: url(../data/goods/icon/custom/soldout_overlay) no-repeat center center;">
					</div>

<UL class="prdList">


					<div class="totals">
						<p>
							총 <b><%=categoryList.size() -1%></b>개의 상품이 있습니다.
						</p>
						
						
						
						<div>
							
							<a href="productListView.do?categoryNo=<%=categoryList.get(0).getCategoryNo() %>&columnName=p_price&sortOrder=asc">낮은가격순</a>
							<a href="productListView.do?categoryNo=<%=categoryList.get(0).getCategoryNo() %>&columnName=p_price&sortOrder=desc">높은가격순</a> 
							<a href="productListView.do?categoryNo=<%=categoryList.get(0).getCategoryNo() %>&columnName=p_name&sortOrder=asc">상품명순</a>
							
						
						</div>
					</div>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td style="padding: 15px 0">
									<style>
body .pprice, body .pprice:hover {
	color: #c45c5a;
	font-size: 20px;
	font-family: "Noto Sans KR", 'Nanum Gothic', sans-serif;
}

.dcmark p {
	padding-right: 0;
	text-align: center;
}
</style> <!-- 상품 리스트 -->
				
								
									<div class="listwrap">
										<table border="0" cellpadding="0" cellspacing="0"
										

											style= margin-left: auto; margin-right: auto; display: block;">
											<tbody>
						
												<tr>
							
							
				<%for(int i=1; i<categoryList.size();i++){ 
					if (i==1||i%3==1){
						%><tr><%
	
					}%>
					
						  
												
				
				
													<td align="center" valign="top" class="number1">

														<div class="innerwrap">
                                             <!-- 할인율 -->
                                             <div class="gview1">
                                                <div class="gooodimg"style="margin-left: auto; margin-right: auto; display: block;">
												
												
												<a href="productDetailView.do?productNo=<%=categoryList.get(i).getProductNo() %>">
												
                                                   <img
                                                      src=<%=categoryList.get(i).getProductImg()%> width="70" 
                                                      class=""
                                                      >
                                                      
												</a>
                                                      
                                                </div>
                                                <div class="goodtxt"
                                                   style="text-align: left; word-break: break-all;">
                                                   <div style="margin-bottom: 10px;">
                                                      <a
                                                       href="productDetailView.do?productNo=<%=categoryList.get(i).getProductNo() %>"
                                                         style="font-size: 14px; color: #888;"><%=categoryList.get(i).getProductName() %></a>
                                                   </div>
                                                   
                                                   <div style="padding-bottom: 20px;">
                                                      <a
                                                         href="productDetailView.do?productNo=<%=categoryList.get(i).getProductNo() %>"
                                                         class="pprice"><b style="font-weight: 600;"><%=categoryList.get(i).getProductQty() %></b><span
                                                         style="font-size: 16px; font-weight: 700;">원</span></a>
                                                   </div>
                                                </div>
                           
																


	</div>
	</div>
	</td>
			   <% 
			     if(i%3==0){
			    	 %></tr><%
			     } 
				%>	   
					
					<%} %>
				
			
				


												</tr>
											</tbody>
										</table>
									</div> <!-- 품절상품 마스크 -->
									<div id="el-goods-soldout-image-mask"
										style="display: none; position: absolute; top: 0; left: 0; background: url(../data/goods/icon/custom/soldout_overlay) no-repeat center center;">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>

</html>