<%@page import="com.itwill.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Product product = (Product) request.getAttribute("product");
%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<%@ include file="../include/head.jsp"%>
<body style="">
<%@ include file="../include/top.jsp"%>
<div id="content">
<script src="./res/countdown.js.다운로드"></script>
<style type="text/css">
.btn_nowbuy {
	letter-spacing: 0.1em;
	display: inline-block;
	height: 60px;
	line-height: 60px;
	text-align: center;
	color: #fff;
	width: 100%;
	box-sizing: border-box;
	font-size: 17px;
	font-weight: 500;
	background: #354436;
	padding: 0;
	margin: 0 auto;
}
/* goods_spec list */
#goods_spec table {
	width: 100%;
}
#goods_spec .sub {
	border-bottom: 1px solid #ccc;
	margin: 35px 0 10px 0;
}
#goods_spec th, #goods_spec td {
	padding: 7px 0;
}
#goods_spec th {
	width: 105px;
	text-align: left;
	font-weight: normal;
	font-size: 13px;
	color: #777;
}
#goods_spec td {
	text-align: left;
}
#pos_scroll {
	position: absolute;
	top: 315px;
}
.godo-tooltip-related {
	background: #000000;
	color: #ffffff;
}
body #side {
	width: 220px !important;
}
body #content {
	width: 880px !important;
}
</style>
<script type="text/javascript">
			function resizeFrameHeight(onm, height) {
				document.getElementById(onm).height = height;
			}

			function resizeFrameWidth(onm, width) {
				document.getElementById(onm).width = width;
			}

			var productno =
		<%=product.getProductNo()%>
			;
			var productPrice =
		<%=product.getProductPrice()%>
			;
			var price = new Array();
			var reserve = new Array();
			var consumer = new Array();
			var memberdc = new Array();
			var realprice = new Array();
			var couponprice = new Array();
			var special_discount_amount = new Array();
			var coupon = new Array();
			var cemoney = new Array();
			var opt1img = new Array();
			var opt2icon = new Array();
			var opt2kind = "select";
			var oldborder = "";

			/* 필수 옵션 분리형 스크립트 start */
			var opt = new Array();
			opt[0] = new Array("('1차옵션을 먼저 선택해주세요','')");
			function subOption(obj) {
				var el = document.getElementsByName('opt[]');
				var sub = opt[obj.selectedIndex];
				while (el[1].length > 0)
					el[1].options[el[1].options.length - 1] = null;
				for (i = 0; i < sub.length; i++) {
					var div = sub[i].replace("')", "").split("','");
					eval("el[1].options[i] = new Option" + sub[i]);
					if (div[2] == "soldout") {
						el[1].options[i].style.color = "#808080";
						el[1].options[i].setAttribute('disabled', 'disabled');
					}
				}
				el[1].selectedIndex = el[1].preSelIndex = 0;
				if (el[0].selectedIndex == 0)
					chkOption(el[1]);

				if (el[0].selectedIndex != '0') {
					var txt = document.getElementsByName('opt_txt[]');
					var vidx = el[0].selectedIndex - 1;
					var v = el[0][el[0].selectedIndex].value;
					txt[0].value = v + '|' + vidx;
					subOption_fashion();
				}
			}
			/* 필수 옵션 분리형 스크립트 end */

			function chkOptimg() {
				var opt = document.getElementsByName('opt[]');
				var key = opt[0].selectedIndex;
				var opt1 = opt[0][key].value;
				var ropt = opt1.split('|');
				chgOptimg(ropt[0])
			}

			function chgOptimg(opt1) {
				if (opt1img[opt1]) {
					objImg.src = (/^http(s)?:\/\//.test(opt1img[opt1])) ? opt1img[opt1]
							: "../data/goods/" + opt1img[opt1];
				} else {
					objImg.src = (/^http(s)?:\/\//
							.test('http://zipbanchan.godohosting.com/800X800px/set/august_matboki_banchan_3.jpg')) ? 'http://zipbanchan.godohosting.com/800X800px/set/august_matboki_banchan_3.jpg'
							: "../data/goods/http://zipbanchan.godohosting.com/800X800px/set/august_matboki_banchan_3.jpg";
				}

			}

			function chkOption(obj) {
				if (!selectDisabled(obj))
					return false;
			}

			function buyableMember(buyable) // 회원 전용 구매 상품 - 일반결제
			{
				if (buyable == 'buyable2') {
					if (confirm("회원 전용 구매 상품입니다. 로그인 화면으로 이동합니다.")) {
						var returnUrl = "%2Fshop%2Fgoods%2Fgoods_view.php%3Fgoodsno%3D578%26category%3D001001";
						location.href = "../member/login.php?returnUrl="
								+ returnUrl;
					} else {
						return;
					}
				} else if (buyable == 'buyable3') {
					alert("특정 회원 전용 구매 상품입니다.");
				}
			}

			function act(target) {
				var form = document.frmView;
				form.action = target + ".php";

				var opt_cnt = 0, data;

				nsGodo_MultiOption.clearField();

				for ( var k in nsGodo_MultiOption.data) {
					data = nsGodo_MultiOption.data[k];
					if (data && typeof data == 'object') {
						nsGodo_MultiOption.addField(data, opt_cnt);
						opt_cnt++;
					}
				}

				if (opt_cnt > 0) {
					form.submit();
				} else {
					if (chkGoodsForm(form))
						form.submit();
				}

				return;
			}

			function chgImg(obj) {
				var objImg = document.getElementById('objImg');
				if (obj.getAttribute("ssrc"))
					objImg.src = obj.src.replace(/\/t\/[^$]*$/g, '/')
							+ obj.getAttribute("ssrc");
				else
					objImg.src = obj.src.replace("/t/", "/");
			}
			
			function cartbtn() {
				if(<%=member%>==null) {
					window.alert("로그인이 필요한 서비스 입니다.");
					return;
				}
				window.alert('장바구니에 상품이 담겼습니다.');
				return;
			}
					
			function wishbtn() {
				if(<%=member%>==null) {
					window.alert('로그인이 필요한 서비스 입니다.');
					return;
				}
				window.alert('찜목록에 상품이 추가되었습니다.');
				return;
			}

		</script>
		
		<div class="atit" style="border: none; margin-top: 10px;">
			<p>&nbsp;</p>
			<span>
				<a href="main.do">
					<img src="./res/ico_home.gif" alt="HOME">
				</a>
			</span>
		</div>

		<div class="indiv" style="margin: 0;">
			<!-- Start indiv -->

			<!-- Groobee Selector Script -->
			<div class="groobeeProductDetail" style="display: none;">
				<span class="groobeeProductName"> <%=product.getProductName()%></span>
				<span class="groobeeProductPrice"> <%=product.getProductPrice()%></span>
				<span class="groobeeProductCode"> <%=product.getProductNo()%></span>
				<span class="groobeeProductImage"> <img
					src="./res/august_matboki_banchan_3.jpg" id="objImg"
					onerror="this.src='/shop/data/skin/mera_ws/img/common/noimg_100.gif'">
				</span> <span class="groobeeProductCategory"> <%=product.getCategoryNo()%></span>
			</div>
			<!-- End of Groobee Selector Script -->


			<!-- 상품 이미지 -->
			<div style="margin: 0px auto 0px auto; overflow: hidden;">
				<div style="width: 50%; float: left;">
					<div style="padding-bottom: 10px;" class="detailimg">
						<span>
							<img src="./<%=product.getProductImg()%>" width="300" id="objImg">
							<!--디테일뷰수정-->
						</span>
					</div>

				</div>

				<!-- 상품 스펙 리스트 -->
				<div id="goods_spec" style="width: 50%; float: left;">
					<!--디테일뷰수정-->
					<!--디테일뷰수정-->
					<form name="frmView" method="post" onsubmit="return false">
						<input type="hidden" name="mode" value="addItem">
						<input type="hidden" name="goodsno" value="578">
						<input type="hidden" name="goodsCoupon" value="0">
						<input type="hidden" id="sale_price" value="<%=product.getProductPrice()%>">
						<input type="hidden" id="special_discount_amount" value="0">
						<div style="padding-bottom: 25px; border-bottom: 1px solid #333;" align="left">
							<b style="font-size: 32px; font-weight: 500;"> <%=product.getProductName()%></b>
						</div>

						<table border="0" cellpadding="0" cellspacing="0" class="top">
							<tbody>
								<tr>
									<td height="2"></td>
								</tr>
								<tr>
									<th>판매가격</th>
									<td><b><span id="price"
											style="font-size: 30px; font-weight: bold;"><%=product.getProductPrice()%>원</span></b></td>
								</tr>
								<tr>
									<th style="vertical-align: top;">배송정보</th>
									<td style="font-size: 14px; color: #555; font-weight: 400;">하루특송
										: 서울 전지역<br>우체국택배 : 전국(도서지역 일부제외)<br>새벽배송 : 서울/경기지역
										대부분<br>(자세한 사항은 배송안내를 참조하세요)<br> <!--<span style="color:#c45c5a;">[화·수·목·금·토]</span>수령 가능한 상품입니다.-->
									</td>
								</tr>

								<tr>
									<th style="vertical-align: top;">배송비</th>
									<td style="font-size: 14px; color: #777;"><b
										style="color: #333; font-weight: 400; margin-top: 5px; display: block;">44,000원
											이상 구매시<br>우체국택배 무료, 새벽배송 무료<br>하루특송 2,900원
									</b> <b style="color: #555; font-weight: 400;"> <!--우체국택배 : 2,900원<br/>새벽배송 : 3,200원<br/>-->(여러
											카테고리 상품을 주문해도 배송비는 한 번만 부과됩니다.)<br>

									</b></td>
								</tr>


								<tr>
									<th>구매</th>
									<td>
										<div style="float: left;">
											<input type="text" name="ea" value="1" class="line"
												style="text-align: right; height: 29px; line-height: 29px; width: 46px; padding-right: 10px; border: 1px solid #ccc;"
												step="1" min="1" max="0"
												onblur="chg_cart_ea(frmView.ea,'set');chg_item_add_carc();">
										</div>
										<div style="float: left; margin-left: -1px;">
											<div>
												<img src="./res/btn_plus2.gif"
													onclick="chg_cart_ea(frmView.ea,'up');chg_item_add_carc();"
													style="cursor: pointer">
											</div>
											<div style="margin-top: -1px;">
												<img src="./res/btn_minus2.gif"
													onclick="chg_cart_ea(frmView.ea,'dn');chg_item_add_carc();"
													style="cursor: pointer">
											</div>
										</div>

										<div style="padding-left: 10px; float: left;" class="stxt">
										</div>
									</td>
								</tr>
							</tbody>
						</table>

						<div id="item_add_list">
							<ul>

							</ul>
						</div>



						<!-- 추가 옵션 입력형 -->
						<!-- 필수 옵션 일체형 -->
						<!-- 필수 옵션 분리형 -->

						<!-- 추가 옵션 -->
						<table border="0" cellpadding="0" cellspacing="0" class="sub">
						</table>

						<style type="text/css">
							.goods-multi-option {}
							.goods-multi-option table {}
							.goods-multi-option table td {}
						</style>
						<div id="el-multi-option-display" class="goods-multi-option">
							<table border="0" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="">
									<col width="50">
									<col width="80">
								</colgroup>
							</table>

							<div
								style="font-size: 15px; text-align: right; margin-bottom: 20px; font-weight: 500;">
								총 상품금액 &nbsp; <span
									style="color: #c45c5a; font-size: 30px; font-weight: bold;"
									id="el-multi-option-total-price"><%=product.getProductPrice()%>원</span>
							</div>
						</div>
						<!-- / -->


						<!-- 각종 버튼 -->
						<div>
							<%if (member==null) {%>
							<a href="memberLoginForm.do" id="cartBtn" onclick="cartbtn()">
								<img src="./res/btn_cart.gif">
							</a>
							<% }else if(member!=null) { %>
							<a href="cartUpdateAddAction.do?productNo=<%=product.getProductNo()%>" id="cartBtn" onclick="cartbtn()">
								<img src="./res/btn_cart.gif">
							</a>
							<%} %>
							
							<%if (member==null) {%>
							<a href="memberLoginForm.do" id="wishBtn" onclick="wishbtn()">
								<img src="./res/btn_wish_m_un.gif">
							</a>
							<% }else if(member!=null) { %>
							<a href="" id="wishBtn" onclick="wishbtn()">
								<img src="./res/btn_wish_m_un.gif">
							</a>
							<%} %>
							
						</div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>

					</form>
				</div>
			</div>

			<div style="clear: both; margin-top: 5px; display: block;">

				<div style="clear: both; margin-top: 5px; display: block;">
					<a id="dtab1"></a>
					<div class="detail_tab" stlye="margin: 0 auto">
						<ul>
							<li>상세설명</a></li>
						</ul>
					</div>
					<div id="contents" style="width: 100%; overflow: hidden;">
						<article id="product_detail">
							<h1 class="mt30">
								국내산<br>식재료를 사용합니다.<br>
							</h1>
							<div class="description">
								<img src="./<%=product.getProductImg()%>" width="auto"> <br>
								<br> 집반찬연구소는 국내산 식재료를 사용합니다.<br> 국내산 식재료를 선호하는 이유는 농가나
								업체에 직접 찾아가 식재료의 상태와 보관,<br> 관리 과정을 눈으로 확인할 수 있기 때문입니다.<br>
								물론, 수급 상황에 따라 국내산 식재료를 사용하지 못할 때도 있습니다.<br> 하지만 최대한 국내산
								식재료와 천연재료만을 사용해 자연의 본질적인 맛을 느끼실 수 있도록 최선을 다할 것입니다.<br> 안전한
								먹거리에 대한 걱정은 접어두셔도 좋습니다.
							</div>
						</article>
					</div>

				</div>
			</div>
		</div>


	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>