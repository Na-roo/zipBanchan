<%@page import="com.itwill.member.Member"%>
<%@page import="com.itwill.product.Product"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.itwill.cart.Cart"%>
<%@page import="com.itwill.cart.CartDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<%
	
ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
ArrayList<Cart> cartList = (ArrayList<Cart>) request.getAttribute("cartList");
session.setAttribute("cartList", cartList);


 
%>

<%@ include file="../include/head.jsp"%>
<body style="">
	 <%@ include file="../include/top.jsp"%>  

	<div id="content">

		<script type="text/javascript">
		function jumunComplete() {
			window.location.href = 'jumunAction.do';
			//frmOrder.action = 'jumunAction.do';
			//frmOrder.method = 'POST';
			//frmOrder.submit();
		}
		function historyback(){
			window.location.href = 'cartForm.do';
			
		}
		
		</script>
		
		<script id="delivery"></script>
		<script src="./res/jquery-ui.js.다운로드"></script>

		<!-- 상단이미지 || 현재위치 -->
		<div class="atit">
			<p>주문서작성</p>
			<span class="path"><img src="./res/ico_home.gif" alt="HOME"
				style="cursor: pointer;"> 주문서작성</span>
		</div>


		<div class="indiv" style="margin: 0">
			<!-- Start indiv -->
			<p style="margin-bottom: 35px;">
				<img src="./res/order_step2.gif">
			</p>
			<p style="font-size: 17px; margin-bottom: 10px; font-weight: 500;">주문할
				상품</p>

			
			<div class="groobeeProductList" style="display: none;">
				<a
					href="http://www.zipbanchan.co.kr/shop/goods/goods_view.php?&amp;goodsno="
					class=""></a> <span class="groobeeProductName">특별반찬
					4종 - 310g</span> <span class="groobeeProductCount">1</span> <span
					class="groobeeProductPrice">13,900</span> <span
					class="groobeeProductImage"><img
					src="./res/special_banchan_4.jpg" width="100"
					onerror="this.src='/shop/data/skin/mera_ws/img/common/noimg_100.gif'"></span>
			</div>
			<span style="display: none;" name="wp_detection" tag="i">560</span>
			<div class="groobeeProductList" style="display: none;">
				<a
					href="http://www.zipbanchan.co.kr/shop/goods/goods_view.php?&amp;goodsno=578"
					class="groobeeProductA"></a> <span class="groobeeProductName">8월
					제철 맛보기반찬 3종 - 500g</span> <span class="groobeeProductCount">1</span> <span
					class="groobeeProductPrice">14,900</span> <span
					class="groobeeProductImage"><img
					src="./res/august_matboki_banchan_3.jpg" width="100"
					onerror="this.src='/shop/data/skin/mera_ws/img/common/noimg_100.gif'"></span>
			</div>
			<span style="display: none;" name="wp_detection" tag="i">578</span>
			<table cellpadding="0" cellspacing="0" border="0" width="100%"
				class="listtablen">
				<colgroup>
					<col width="100">
					<col>
					<col width="60">
					<col width="80">
					<col width="50">
					<col width="80">

				</colgroup>
				<thead>
					<tr>
						<th colspan="2">상품정보</th>
						<th>적립금</th>
						<th>판매가</th>
						<th>수량</th>
						<th>배송비</th>
						<th>합계</th>

					</tr>
				</thead>
				<tbody class="new_cart_list">

					<!-- Groobee Cart & Order Selector Script -->

					<!-- End of Groobee Cart & Order Selector Script -->


					<!-- WIDERPLANET CART SCRIPT START 2017.2.28 -->
					
					<% for (int i = 0; i < cartList.size(); i++) { %>

					<script type="text/javascript">
						var wp_page_type = 'Cart';
					</script>
					<!-- // WIDERPLANET CART SCRIPT END 2017.2.28 -->

					<script type="text/javascript" charset="UTF-8"
						src="./res/kp.js.다운로드"></script>
					<script type="text/javascript">
						kakaoPixel('3696278984956819256').pageView();
						kakaoPixel('3696278984956819256').viewCart();
					</script>
					
					
					<tr>
						<input type="hidden" name="adultpro[]" value="0">
						<td align="center" style="padding: 10px 0;"><a
							href="http://www.zipbanchan.co.kr/shop/goods/goods_view.php?&amp;goodsno=560"><img
								src="<%= productList.get(i).getProductImg() %>" width="70" 
								onerror="this.src='/shop/data/skin/mera_ws/img/common/noimg_100.gif'"></a>
						</td>
						<td>
							<div style="word-break: break-all; text-align: left;"><%=productList.get(i).getProductName() %></div>
						</td>
						<td align="center"></td>
						<td align="right" style="padding-right: 10px"><%= productList.get(i).getProductPrice()%></td>
						<td align="center"><%= cartList.get(i).getCartProductQty() %></td>
						<td align="center">
							<div id="el-default-delivery">기본배송</div>
						</td>


						<td align="right" style="padding-right: 10px"><%=productList.get(i).getProductPrice()*cartList.get(i).getCartProductQty()%></td>

					</tr>
					<% } %>
					<!-- Groobee Cart & Order Selector Script -->

					<!-- End of Groobee Cart & Order Selector Script -->


					<!-- WIDERPLANET CART SCRIPT START 2017.2.28 -->
					
					
					
					<!--  




					<script type="text/javascript">
						var wp_page_type = 'Cart';
					</script>
					<!-- // WIDERPLANET CART SCRIPT END 2017.2.28 -->
					<!--  
					<script type="text/javascript" charset="UTF-8"
						src="./res/kp.js.다운로드"></script>
					<script type="text/javascript">
						kakaoPixel('3696278984956819256').pageView();
						kakaoPixel('3696278984956819256').viewCart();
					</script>
					<tr>
						<input type="hidden" name="adultpro[]" value="0">
						<td align="center" style="padding: 10px 0;"><a
							href="http://www.zipbanchan.co.kr/shop/goods/goods_view.php?&amp;goodsno=578"><img
								src="./res/august_matboki_banchan_3.jpg" width="70"
								onerror="this.src='/shop/data/skin/mera_ws/img/common/noimg_100.gif'"></a>
						</td>
						<td>
							<div style="word-break: break-all; text-align: left;">8월 제철
								맛보기반찬 3종 - 500g</div>
						</td>
						<td align="center">149원</td>
						<td align="right" style="padding-right: 10px">14,900원</td>
						<td align="center">1개</td>
						<td align="center">
							<div id="el-default-delivery">기본배송</div>
						</td>
						


						<td align="right" style="padding-right: 10px">14,900원</td>.
						

					</tr>
					-->
			
			
			

				</tbody>







				<tfoot>
					<tr>
						<td colspan="10" style="border-bottom: none;">

							<table style="display: block; float: right;"
								class="ttotal total_order_list">
								<tbody>
									<tr>
										<th nowrap="">총 상품금액</th>
										<td><span id="el-orderitem-total-price">
											<%
													int totPrice = 0;												
												
													for (int i = 0; i < cartList.size(); i++) {
														totPrice += cartList.get(i).getCartProductQty() * productList.get(i).getProductPrice();
													}
												%>				
										<%=totPrice %>원
										<%
										request.setAttribute("totPrice", totPrice);
										%>
										</span></td>
									</tr>
									<tr style="display: none">
										<th>
											<!--  -->받으실예상적립금 <!--  -->
										</th>
										<td><span id="el-orderitem-total-reserve">288</span>원</td>
									</tr>
								</tbody>
							</table>

						</td>
					</tr>
				</tfoot>
			</table>

			<form id="frmOrder" name="frmOrder" action="" method="post"
				onsubmit="return chkForm2(this)">
				<input type="hidden" name="ordno" value="1565165035617"> <input
					type="hidden" name="couponVersion" id="couponVersion" value="0">
				<input type="hidden" name="item_apply_coupon[]"> <input
					type="hidden" name="item_apply_coupon[]">

				<div id="apply_coupon"></div>

				<!-- 01 주문자정보 -->
				<p
					style="font-size: 17px; margin-bottom: 10px; margin-top: 40px; font-weight: 500;">주문자
					정보</p>
				<div class="order_info">
					<dl>
						<dt>주문하시는 분</dt>
						<dd>
							<input type="text" name="nameOrder" value="<%=member.getMemberName()%>"
								class="input_w296" readonly="" style="border: 0" required=""
								readonlycheck="" readonly=""
								msgr="주문하시는분의 이름을 적어주세요">
						</dd>
					</dl>
					<dl style="display: none;">
						<dt>주소</dt>
						<dd>
							서울 강서구 화곡동 371-42
							<div style="padding-top: 5px; font: 12px dotum; color: #999;">서울
								강서구 월정로32길 49 (화곡동, 창대빌라)</div>
						</dd>
					</dl>
					<dl style="display: none;">
						<dt>전화번호</dt>
						<dd>
							<input type="text" name="phoneOrder[]" class="input_w76" value=""
								size="3" maxlength="3">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input type="text" name="phoneOrder[]" class="input_w76" value=""
								size="4" maxlength="4">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input type="text" name="phoneOrder[]" class="input_w76" value=""
								size="4" maxlength="4">
						</dd>
					</dl>
					
					<dl>
						<dt>핸드폰번호</dt>
						<dd>
							<input type="text" name="mobileOrder[]" class="input_w296"
								value="<%=member.getMemberPhone() %>" required="" readonlycheck="" readonly=""
								label="주문자 핸드폰번호">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!--  
							<input type="" name="mobileOrder[]" class="input_w76"
								value="" size="4" maxlength="4" option="regNum" required=""
								label="주문자 핸드폰번호">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input type="text" name="mobileOrder[]" class="input_w76"
								value="" size="4" maxlength="4" option="regNum" required=""
								label="주문자 핸드폰번호">
						-->
						</dd>
					</dl>
					
					<dl>
						<dt>이메일</dt>
						<dd>
							<input type="text" name="email" value="<%= member.getMemberEmail() %>"
								class="input_w296" required="" readonlycheck="" readonly="" option="regEmail">
						</dd>
					</dl>
				</div>
				<!-- .order_info -->

				<!-- 02 배송정보 -->
				<p style="font-size: 17px; margin-bottom: 10px; font-weight: 500;">
					배송정보 <span style="color: #555; font-size: 13px;"><b
						style="color: #777; font-weight: normal;">*</b> 필수입력사항</span>
				</p>
				<div class="order_info delivery">

					<dl>
						<dt>
							배송 받으실분<span class="dot">*</span>
						</dt>
						<dd>
							<input type="text" name="j_receiver_name"
								class="input_w336 dark_gray" value="김경호" required=""
								>
						</dd>
					</dl>
					<dl>
						<dt>
							배송지 주소<span class="dot">*</span>
						</dt>
						<dd>
							<!--
			<div class="delivery_info">
				<p>새벽배송, 하루특송을 원하시는 분은 도로명 주소를 이용해주세요</p>
				<h5>(도로명주소 입력 후 지번주소로 변환되어도 안심하세요. 정상적인 과정입니다.)</h5>
			</div>
		-->
							<!--  
							<input type="text" name="zonecode" id="zonecode" size="5"
								class="line order_add dark_gray" readonly="" value="07762"
								readonlycheck=""> <input type="text" name="zipcode[]"
								id="zipcode0" size="3" class="line ta_center ti_0 dark_gray"
								readonly="" value="157" required="" readonlycheck=""> -
							<input type="text" name="zipcode[]" id="zipcode1" size="3"
								class="line ta_center ti_0 dark_gray" readonly="" value="884"
								required="" readonlycheck="">
								-->

							<div class="mt_10">
								<input type="text" name="j_receiver_address" id="address"
									class="lineBig dark_gray" value="아이티윌">
							</div>


						</dd>
					</dl>


					<!--  
					<dl>
						<dt>
							휴대폰<span class="dot">*</span>
						</dt>
						<dd>
							<input type="text" name="mobileReceiver[]"
								class="input_w76 dark_gray" value="010" size="3" maxlength="3"
								option="regNum" required="" label="수령자 핸드폰번호" readonlycheck=""
								readonly="">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp; <input
								type="text" name="mobileReceiver[]" class="input_w76 dark_gray"
								value="0000" size="4" maxlength="4" option="regNum" required=""
								label="수령자 핸드폰번호" readonlycheck="" readonly="">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input type="text" name="mobileReceiver[]"
								class="input_w76 dark_gray" value="0000" size="4" maxlength="4"
								option="regNum" required="" label="수령자 핸드폰번호" readonlycheck=""
								readonly="">
						</dd>
					</dl>
					-->

				</div>
				<!-- .order_info -->

				<!-- 04 결제금액 -->
				<p style="font-size: 17px; margin-bottom: 10px; font-weight: 500;">결제
					금액</p>
				<div class="order_info p_0 mb_0">
					<div class="order_total">
						<div class="order_total_left">
							<ul>
								<li>상품합계금액
									<p id="paper_goodsprice"><%=totPrice%></p>
								</li>
								<li>배송비
									<div id="paper_delivery_msg1">
										<div id="paper_delivery" style="display: inline;"></div>
										0원
									</div>
									<div id="paper_delivery_msg2" style="display: none;"></div>
									<div id="paper_delivery_msg_extra" class="small red"
										style="display: none;"></div>
								</li>
								<li>회원 할인
									<div id="memberdc">0원</div>
								</li>
								<li>적립금
									<div class="emoney_txt">0</div>
								</li>
								<li>예치금
									<div class="point_txt">0</div>
								</li>
								<li>쿠폰 할인
									<div class="coupon_txt">0</div>
								</li>
							</ul>
						</div>
						<!-- .order_total_left -->

						<div class="order_total_right">
							<h2>총 결제 금액</h2>
							<span>=</span>
							<div id="paper_settlement" class="paper_settlement"><%=totPrice%></div>
							<span>원</span>
						</div>
						<!-- .order_total_right -->
					</div>
					<!-- .order_total -->
				</div>
				<!-- .order_info -->

				<div align="center" style="padding-bottom: 210px;">
					
				<%
				session.setAttribute("totPrice", totPrice);
				%>
						<img src="./res/btn_order_pay.gif"  onclick="jumunComplete()"
						style="vertical-align: top; border: none;">&nbsp; 
						<img src="./res/btn_order_back.gif" onclick="history.back()"
						style="cursor: pointer; vertical-align: top;">
					
				</div>

			</form>

		</div>
		<!-- End indiv -->
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>