<%@page import="com.itwill.cart.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
	ArrayList<Cart> cartList = (ArrayList<Cart>) request.getAttribute("cartList");
	
%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<%@ include file="../include/head.jsp"%>
<body style="">
	<%@ include file="../include/top.jsp"%>

	<div id="main">
		<div id="content">
			<style>
#pos_scroll {
	position: absolute;
	top: 315px;
}
</style>
			<script type="text/javascript">
						var nsGodo_CartAction = function () {

							function popup(url, w_name, w_width, w_height) {
								var x = (screen.availWidth - w_width) / 2;
								var y = (screen.availHeight - w_height) / 2;
								return window.open(url, w_name, "width=" + w_width + ",height=" + w_height + ",top=" + y + ",left=" + x + ",scrollbars=no");
							}

							return {
								cart_type: 'regular',
								data: [],
								pushdata: function (obj) {
									this.data.push(obj);
								},
								editOption: function (idx) {
									popup('../goods/popup_goods_cart_edit.php?idx=' + idx + '&cart_type=' + this.cart_type, 'WIN_CARTOPTION', 350, 500);
								},
								wishList: function () {

									if (this.cart_type == 'todayshop') {
										alert('투데이샵 상품은 상품보관함에 담을 수 없습니다.');
										return false;
									}

									if (!this.check()) {
										alert('보관할 상품을 선택해 주세요.');
										return false;
									}

									var f = document.frmCart;
									f.action = '../mypage/mypage_wishlist.php';
									f.mode.value = 'addItemFromCart';
									f.submit();
								},
								order: function () {

									var chks = document.getElementsByName('idxs[]'),
										total_price = 0;

									var isItemSul = false;
									var isItem = false;
									var isRegular = false;

									for (var i = 0, m = chks.length; i < m; i++) {
										if (chks[i].checked == true) {
											total_price += parseInt(this.data[i].price * this.data[i].ea);
										}
										if ($(chks[i]).attr("data-goodsno") == "469" || $(chks[i]).attr("data-goodsno") == "470" || $(chks[i]).attr("data-goodsno") == "471") {
											isItemSul = true;
										} else {
											isItem = true;
										};

										if ($(chks[i]).attr("data-goodsno") == "477" || $(chks[i]).attr("data-goodsno") == "478" || $(chks[i]).attr("data-goodsno") == "479") {
											isRegular = true;
										}
									}

									if (isItem && isItemSul) {
										open_pop_sul();
										return false;
									}

									if (isRegular) {
										alert('정기배송 상품은 장바구니에서 구매가 불가능합니다.');
										return false;
									}

									/*
									if (total_price < 20000) {
										alert('집반찬연구소의 최소 구매금액은 20,000원입니다.');
										return false;
									}
									*/
									if (!this.check()) {
										alert('주문할 상품을 선택해 주세요.');
										return false;
									}
									if (!this.adultcheck()) {
										alert('성인인증이 필요한 상품/컨텐츠 가 포함되어 있습니다.\n\n성인(본인) 인증 후 주문하기를 진행해 주세요.');
										location.href = "https://www.zipbanchan.co.kr:14027/shop/main/intro_adult.php?returnUrl=../goods/goods_cart.php&";
										return false;
									}

									var f = document.frmCart;
									f.action = (this.cart_type == 'regular') ? '../order/order.php' : '../todayshop/order.php';
									f.mode.value = 'setOrder';
									f.submit();
								},
								del: function () {

									if (!this.check()) {
										alert('삭제할 상품을 선택해 주세요.');
										return false;
									}

									var f = document.frmCart;
									f.action = (this.cart_type == 'regular') ? '../goods/goods_cart.php' : '../todayshop/today_cart.php';
									f.mode.value = 'delItems';
									f.submit();
								},
								check: function () {

									var chks = document.getElementsByName('idxs[]');
									var cnt = 0;

									for (var i = 0, m = chks.length; i < m; i++) {
										if (chks[i].checked == true) cnt++
									}

									return cnt > 0 ? true : false;

								},
								adultcheck: function () {
									var chks = document.getElementsByName('idxs[]');
									var cnt = 0;

									for (var i = 0, m = chks.length; i < m; i++) {
										if (chks[i].checked == true) {
											if (document.getElementsByName('adultpro[]')[i].value > 0) cnt++
										}
									}

									return cnt > 0 ? false : true;

								},
								recalc: function () {

									var chks = document.getElementsByName('idxs[]');

									var total_reserve = 0;
									var total_price = 0;
									var total_special_discount_amount = 0;
									var total_memberdc = 0;

									var chks_cnt = 0;

									for (var i = 0, m = chks.length; i < m; i++) {
										if (chks[i].checked == true) {
											total_price += parseInt(this.data[i].price * this.data[i].ea);
											total_special_discount_amount += parseInt(this.data[i].special_discount_amount * this.data[i].ea);
											total_memberdc += parseInt(this.data[i].memberdc * this.data[i].ea);
											total_reserve += parseInt(this.data[i].reserve);
											chks_cnt++;
										}
									}

									total_special_discount_amount += total_memberdc;

									if (document.getElementById('el-orderitem-selected')) {
										var delivery_price = "무료";
										if (total_price < 44000) {
											delivery_price = "유료";
										}
										var tprice = 44000 - total_price;
										if (tprice < 0) {
											tprice = 0;
										}
										document.getElementById('el-orderitem-total-price').innerText = comma(total_price);
										document.getElementById('el-orderitem-selected').innerText = chks_cnt;
										document.getElementById('el-orderitem-delivery-price').innerText = delivery_price;
										document.getElementById('el-orderitem-price').innerText = comma(tprice);

									} else {
										document.getElementById('el-orderitem-total-price').innerText = comma(total_price);
										document.getElementById('el-orderitem-total-reserve').innerText = comma(total_reserve);
										document.getElementById('el-orderitem-total-special_discount_amount').innerText = comma(total_special_discount_amount);
										document.getElementById('el-orderitem-total-result').innerText = comma(total_price - total_special_discount_amount);
									}
								},
								estimate: function () {
									if (!this.check()) {
										alert('선택한 상품이 없습니다.');
										return false;
									}

									var f = document.frmCart;
									var estimatePop = window.open('', 'estimatePop');
									estimatePop.focus();
									f.target = 'estimatePop';
									f.action = 'goods_estimate.php';
									f.submit();
									f.target = '';
									f.action = '';
								}
							}
						}();
						function updateQty() {
							frmCart.action = "cartUpdateAddAction.do";
							frmCart.submit();
						}
					</script>

			<!-- 상단이미지 || 현재위치 -->
			<div class="atit">
				<p>장바구니</p>
				<span class="path"><img src="./res/ico_home.gif" alt="HOME"
					style="cursor: pointer;"> 장바구니</span>
			</div>


			<div class="indiv" style="margin: 0;">
				<!-- Start indiv -->
				<p style="margin-bottom: 35px;">
					<img src="./res/order_step1.gif">
				</p>
				<p style="font-size: 17px; margin-bottom: 10px;">장바구니 담긴 상품</p>

				<form name="frmCartCase" method="post">
					<input type="hidden" name="mode" value="addItem"> <input
						type="hidden" name="goodsno" value=""> <input
						type="hidden" name="goodsCoupon" value="0"> <input
						type="hidden" name="ea" value="">
				</form>

				<form name="frmCart" method="post">
					<input type="hidden" name="mode" value="modItem">
					<style media="screen">
table.orderitem-list {
	width: 100%;
}

table.orderitem-list thead tr th {
	border-top: 2px solid #303030;
	border-bottom: 1px solid #d6d6d6;
	background: #f0f0f0;
	height: 25px;
}

table.orderitem-list tbody tr td {
	border-bottom: 1px solid #d6d6d6;
	padding: 3px;
}

table.orderitem-list tbody tr td table td {
	border: none;
}

table.orderitem-list tfoot tr td {
	border-bottom: 1px solid #efefef;
	background: #f7f7f7;
	height: 25px;
	text-align: right;
}

table.orderitem-list tfoot tr td table td {
	border: none;
}

.ttotal td {
	border: none;
	text-align: right;
	font-size: 15px;
	padding-right: 30px;
}

.ttotal th {
	font-size: 15px;
	text-align: right;
	padding-right: 25px;
	width: 200px;
	background: none;
	border: none;
}

.cover_info td {
	border: none;
	text-align: left;
	padding: 3px 10px 5px 10px;
}

.goods-list-item .goods-list-chk {
	width: 20px;
	height: 80px;
	margin-top: 15px;
	line-height: 80px;
	vertical-align: middle;
}

.goods-list-item .goods-list-chk input[type=checkbox] {
	width: 15px;
}

.goods-list-item .goods-list-img {
	width: 90px;
	text-align: left;
}

.goods-list-item .goods-list-img img {
	width: 80px;
	height: 80px;
	border: solid 1px #dbdbdb;
}

.goods-list-item .goods-list-info {
	margin-left: 10px;
	width: auto;
}

.goods-list-item .goods-list-info .goods-nm {
	color: #222222;
	font-weight: bold;
	font-size: 13px;
	margin-bottom: 5px;
	padding-right: 55px;
	box-sizing: border-box;
}

.goods-list-item .goods-list-info .goods-option {
	color: #666666;
	font-size: 12px;
	margin-bottom: 2px;
}

.goods-list-item .goods-list-info .goods-price {
	color: #666666;
	font-size: 12px;
	margin-bottom: 2px;
}

.goods-list-item .goods-list-info .goods-price .red {
	color: #f03c3c;
	font-size: 12px;
	font-weight: bold;
}

.goods-list-item .goods-list-info .goods-dc {
	color: #666666;
	font-size: 12px;
	margin-bottom: 2px;
}

.goods-list-item .goods-list-info .goods-dc .blue {
	color: #436693;
	font-size: 12px;
	font-weight: bold;
}

.goods-list-item .goods-list-info .goods-reserve {
	color: #666666;
	font-size: 12px;
	margin-bottom: 2px;
}

.goods-list-item .goods-list-info .goods-delivery {
	color: #666666;
	font-size: 12px;
	margin-bottom: 2px;
}

.goods-list-item .goods-list-info .goods-ea {
	color: #666666;
	font-size: 12px;
	margin-bottom: 2px;
}

.goods-list-item .goods-list-info .goods-nvmileage {
	color: #666666;
	font-size: 12px;
	margin-bottom: 2px;
}

.riha_slide {
	position: relative;
}

.riha_slide h2 {
	font-size: 17px;
	font-weight: normal;
}

.riha_slide .btn_slide {
	position: absolute;
	top: 50%;
	cursor: pointer;
}

.riha_slide .btn_slide_left {
	left: 20px;
}

.riha_slide .btn_slide_right {
	right: 20px;
}

.riha_slide .slide_area {
	width: 1057px;
	overflow: hidden;
	position: relative;
}

.riha_slide .slide_area ul {
	overflow: hidden;
	border-left: 1px solid #ddd;
}

.riha_slide .slide_area ul li {
	float: left;
	width: 351px;
	border: 1px solid #ddd;
	margin: 0;
	margin-left: -1px;
}

.riha_slide .slide_area ul li h4 {
	margin: 0px;
	padding-bottom: 0;
	height: 20px;
	font-size: 16px;
	font-weight: normal;
}

.riha_slide .slide_area ul li h3 {
	font-size: 16px;
	margin-top: 5px;
	font-weight: normal;
}

.riha_slide .slide_area ul li .info {
	margin-top: 20px;
}

.riha_slide .slide_area ul li .info span {
	font-size: 16px;
	color: #000;
	font-weight: bold;
}

.riha_slide .slide_area ul li .info .btn_area {
	float: right;
}

.riha_slide .slide_area ul li .info .btn_area input[type=text] {
	width: 30px;
	height: 23px;
	line-height: 23px;
	text-align: center;
	margin: 0;
	padding: 0;
	border: 1px solid #ddd;
	border-right: none;
	border-left: none;
	vertical-align: top;
	float: left;
}

.riha_slide .slide_area ul li .info .btn_area a {
	display: inline-block;
	width: 23px;
	height: 23px;
	line-height: 23px;
	text-align: center;
	border: 1px solid #ddd;
	float: left;
	background: #f5f5f5;
	font-size: 16px;
}

.riha_slide .slide_area ul li .info .btn_area input[type=button] {
	height: 25px;
	line-height: 22px;
	background: #364437;
	border: 1px solid #364437;
	color: #fff;
	padding: 0 15px;
}

.calc_order {
	overflow: hidden;
	border-top: 1px solid #333;
	margin-top: 50px;
}

.calc_order div {
	width: 367px;
	float: left;
	border-left: 1px dashed #ddd;
	margin-left: -1px;
	background: #f5f5f5;
	text-align: center;
	padding: 50px 0;
	font-size: 20px;
	color: #333;
	font-weight: bold;
	position: relative;
}

.calc_order div span.desc {
	font-size: 14px;
	font-weight: normal;
}

.calc_order div span.icon {
	display: block;
	width: 40px;
	height: 40px;
	background: #364437;
	color: #fff;
	border-radius: 50%;
	position: absolute;
	right: -20px;
	top: 57px;
	z-index: 9999;
	text-align: center;
	line-height: 35px;
	font-size: 35px;
	font-weight: normal;
}

.calc_order div:last-child {
	width: 1061px;
	text-align: right;
	padding: 10px 20px;
	margin: 0;
	border: none;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	background: #eaeaea;
	font-size: 16px;
	color: #364437;
}

.calc_order div:last-child span {
	font-weight: normal;
	color: #333;
	font-size: 14px;
}
</style>

					<div class="groobeeProductList" style="display: none;">
						<a
							href="http://www.zipbanchan.co.kr/shop/goods/goods_view.php?&amp;goodsno=560"
							class="groobeeProductA"></a> <span class="groobeeProductName">특별반찬
							4종 - 310g</span> <span class="groobeeProductCount">1</span> <span
							class="groobeeProductPrice">13,900</span> <span
							class="groobeeProductImage"><img
							src="./res/special_banchan_4.jpg" width="100"
							onerror="this.src=&#39;/shop/data/skin/mera_ws/img/common/noimg_100.gif&#39;"></span>
					</div>
					<span style="display: none;" name="wp_detection" tag="i">560</span>
					<table cellpadding="0" cellspacing="0" border="0" width="100%"
						class="listtablen">
						<colgroup>
							<col width="50">
							<col width="100">
							<col>
							<col width="60">
							<col width="80">
							<col width="50">
							<col width="80">

						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th colspan="2">상품정보</th>
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

							<script type="text/javascript">var wp_page_type = 'Cart';</script>
							<!-- // WIDERPLANET CART SCRIPT END 2017.2.28 -->

							<script type="text/javascript" charset="UTF-8"
								src="./res/kp.js.다운로드"></script>
							<script type="text/javascript">
										kakaoPixel('3696278984956819256').pageView();
										kakaoPixel('3696278984956819256').viewCart();
									</script>
							
					
							
							<% for (int i = 0; i < cartList.size(); i++) { %>
							
							<tr>
								<input type="hidden" name="adultpro[]" value="0">
								<td align="center"><input type="checkbox" name="idxs[]"
									value="0" data-goodsno="560" checked=""
									onclick="nsGodo_CartAction.recalc();"></td>
								<td align="center" style="padding: 10px 0;"><a
									href="http://www.zipbanchan.co.kr/shop/goods/goods_view.php?&amp;goodsno=560">
									<img src="./<%= productList.get(i).getProductImg() %>" width="70"
										onerror="this.src=&#39;/shop/data/skin/mera_ws/img/common/noimg_100.gif&#39;"></a>
								</td>
								<td>
									<div style="word-break: break-all; text-align: left;"><%= productList.get(i).getProductName() %></div> 

								</td>
								<td align="right" style="padding-right: 10px"><%= productList.get(i).getProductPrice() %></td>
								<td align="center">
									<table cellpadding="0" cellspacing="0" border="0">
										<tbody>
											<tr>
											
												<td style="border: none;"><input type="text"
													name="ea[0]" step="1" min="1" max="0" 
													value="<%=cartList.get(i).getCartProductQty() %>" 
													readonly
													style="text-align: right; height: 25px; line-height: 25px; border: 1px solid #ccc; width: 28px; padding-right: 10px;"
													onkeydown="onlynumber()"
													onblur="chg_cart_ea(this,&#39;set&#39;)"></td>
									<!--  
												<td style="border: none;">
													<div style="margin-left: -1px;">
														<img src="./res/btn_plus.gif"
															onclick="chg_cart_ea(frmCart[&#39;ea[0]&#39;],&#39;up&#39;,0)"
															style="cursor: pointer">
													</div> <img src="./res/btn_minus.gif"
													onclick="chg_cart_ea(frmCart[&#39;ea[0]&#39;],&#39;dn&#39;,0)"
													style="cursor: pointer; margin: -1px 0 0 -1px;">
												</td>
												
												<td style="border: none;"><input type="submit"
													value="수정"
													style="margin: 0px 0 0 2px; cursor: pointer; width: 38px; height: 30px; background: #868686; border: none; color: #fff;">
												</td>
									-->
											</tr>
										</tbody>
									</table>
								</td>
								
								
								<td align="center">
									<div id="el-default-delivery">기본배송</div>
								</td>
<!--    주석               -->

								<td align="right" style="padding-right: 10px"><%=cartList.get(i).getCartProductQty()*productList.get(i).getProductPrice()%><a
									href="cartProductDeleteAction.do?productNo=<%=productList.get(i).getProductNo()%>"
									style="font-size: 14px; float: right;">X</a>
								</td>

							</tr>
							 <% } %>
							<script>nsGodo_CartAction.pushdata({ reserve: 139, price: 13900, ea: 1, special_discount_amount: 0, memberdc: 0 });</script>

						</tbody>



						<tbody>


							<tr>
								<td colspan="10" style="text-align: left; border: none;">
									<div style="padding: 5px; padding-left: 20px;">
										<input type="checkbox" id="cart_select_all" checked=""
											onclick="chkBox(&#39;idxs[]&#39;,&#39;rev&#39;);nsGodo_CartAction.recalc();">
										<label for="cart_select_all">전체선택</label> (<span
											id="el-orderitem-selected">1</span>/1) <a
											href="javascript:void(0);"
											onclick="nsGodo_CartAction.del();return false;"
											onfocus="blur()"
											style="border: 1px solid #aaa; padding: 5px 10px; display: inline-block;">선택상품삭제</a>
									</div>
								</td>
							</tr>




							<tr>
								<td colspan="10" style="text-align: left; border: none;">


									<div class="calc_order">
										<div>
											<span class="desc">상품합계</span><br> <span
												id="el-orderitem-total-price">
												
												<%
													int totPrice = 0;												
												
													for (int i = 0; i < cartList.size(); i++) {
														totPrice += cartList.get(i).getCartProductQty() * productList.get(i).getProductPrice();
													}
												%>												
												<%=totPrice %>원</span>
										</div>
										<div>
											<span class="desc">우체국택배 / 새벽배송</span><br> <span
												id="el-orderitem-delivery-price">무료</span>
										</div>
										<div>
											<span class="desc">무료배송을 위한 추가금액</span><br> <span
												id="el-orderitem-price">0</span>원
										</div>
										<div>
											<span>*단 하루특송은 배송비가 발생합니다.</span>
										</div>
									</div>
								</td>
							</tr>

						</tbody>




					</table>



				</form>




				<table width="100%" cellpadding="0" cellspacing="0" border="0"
					style="margin-top: 30px;">
					<tbody>
						<tr>
							<td align="center"><a href="jumunForm.do" onfocus="blur()">
									<!--<img src="/shop/data/skin/mera_ws/img/common/btn_check_order.gif" border=0>-->
									<span
									style="display: inline-block; background: #364437; color: #fff; font-weight: bold; width: 200px; line-height: 45px;">주문하기</span>
							</a></td>
						</tr>
					</tbody>
				</table>
				<div align="center"></div>
				<div align="center"></div>
				<div align="center"></div>

			</div>
			<!-- End indiv -->
			<div style="height: 100px;"></div>


		</div>
		<!-- #content -->
	</div>
	<!-- #container -->

	<%@ include file="../include/bottom.jsp"%>
</body>
</html>