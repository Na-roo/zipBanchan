<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<%@ include file="../include/head.jsp"%>
<script type="text/javascript">
	function location() {
		location.href="memberMypage.do";
	}
</script>
	<style rel="stylesheet" type="text/css">
.mypagediv .bold {
	font-weight: bold;
}

.mypagediv .mydtit {
	height: 25px;
	line-height: 25px;
}

.mplist {
	padding-bottom: 50px;
}

.mplist .mpsubtit {
	color: #636363;
	font-size: 14px;
}

.mplist .pink {
	color: #c45c5a;
}

.mplist .size14 {
	font-size: 14px;
}

.mplist .right {
	text-align: right;
}

.mplist .blue {
	color: #5385e0;
}

.mplist .w93 {
	width: 93px;
}

.mplist .w108 {
	width: 108px;
}

.mplist .ordlink button {
	background: #fff;
	border: 1px solid #C1C1C3;
	color: #707070;
	font-size: 11px;
	height: 20px;
}

.mplist .ordtitle {
	height: 20px;
	margin-bottom: 15px;
}

.mplist .ordtitle:after {
	content: "";
	display: block;
	clear: both;
	margin-bottom: 15px;
}

.mplist .ordment {
	float: left;
}

.mplist .ordlink {
	float: right;
}

.mplist table.ordlisttbl {
	width: 100%;
	border-top: 1px solid #333;
	font-size: 13px;
}

.mplist table.ordlisttbl caption {
	display: none;
}

.mplist table.ordlisttbl th {
	background: #f8f8f8;
	height: 39px;
	border-bottom: 1px solid #ccc;
	font-weight: 400;
}

.mplist table.ordlisttbl th:first-child {
	
}

.mplist table.ordlisttbl td {
	color: #777;
	height: 39px;
	border-bottom: 1px solid #ccc;
	text-align: center;
}

.mplist table.ordlisttbl td:first-child {
	
}

.mplist table.ordlatelytbl {
	margin-top: 15px;
	width: 100%;
	border-top: 1px solid #333;
	font-size: 13px;
}

.mplist table.ordlatelytbl caption {
	display: none;
}

.mplist table.ordlatelytbl th {
	background: #f8f8f8;
	height: 39px;
	border-bottom: 1px solid #ccc;
	font-weight: 400;
}

.mplist table.ordlatelytbl th:first-child {
	
}

.mplist table.ordlatelytbl td {
	color: #777;
	height: 39px;
	border-bottom: 1px solid #ccc;
	text-align: center;
}

.mplist table.ordlatelytbl td.right {
	text-align: right;
	padding-right: 14px;
}

.mplist table.slidetbl {
	width: 100%;
	margin-top: 15px;
	border-top: 1px solid #333;
	font-size: 13px;
	height: 200px;
}

.mplist table.slidetbl td.prev {
	vertical-align: top;
}

.mplist table.slidetbl td.prev .slidebtn {
	margin: 89px 0 0 10px;
}

.mplist table.slidetbl td.next {
	vertical-align: top;
}

.mplist table.slidetbl td.next .slidebtn {
	margin: 89px 10px 0 0;
}

.slidediv {
	margin-top: 30px;
}

.slidediv .rsize {
	width: 100px;
	height: 100px;
}

.sleft {
	text-align: left;
}

.stitle {
	text-align: left;
	padding: 5px 0px 2px 10px;
	max-width: 100px;
	word-break: break-all;
}

.sprice {
	text-align: left;
	padding-left: 10px;
	color: #C94C00;
	font-weight: bold;
}

.sdefault {
	text-align: left;
	padding-left: 10px;
}

#scrolling_latelySlide {
	margin-left: -10px;
}

.gray {
	color: #b5a5b5;
}

.gsnm {
	max-width: 100px;
	max-height: 20px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.nodata {
	text-align: center;
}

.nodata_div {
	height: 220px;
	border-top: 2px solid #303030;
	border-bottom: 1px solid #e5e5e5;
	text-align: center;
	line-height: 220px;
	color: #555;
	font-size: 12px;
}
</style>
<body style="">
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<div class="mypagediv">
			<!-- 상단이미지 || 현재위치 -->
			<div class="atit">
				<p>마이페이지</p>
				<span class="path"><img src="./res/ico_home.gif" alt="HOME"
					style="cursor: pointer;"> <b>마이페이지</b>
					</span>
			</div>

			<!-- 회원 정보 수정 버튼 -->
			<div>
				<button type="button" onclick="location.href=&quot;/zipbanchan/memberModifyForm.do&quot;"
									class="w93" style="cursor: pointer;">회원 정보 수정</button>
				<br><br>
			</div>
			
			<!-- 회원 탈퇴 버튼 -->
			<div>
				<button type="button" onclick="location.href=&quot;/zipbanchan/memberDeleteAction.do&quot;"
									class="w93" style="cursor: pointer;">회원 탈퇴</button>
				<br><br>
			</div>
			
			
			<!-- 최근 주문 정보 -->
			<div class="mplist">
				<div class="ordtitle">
					<span class="ordment"><span class="b_cate">최근 주문 정보</span></span> 
						<span class="ordlink">
							<button type="button" onclick="location.href=&quot;/shop/mypage/mypage_orderlist.php?&amp;&quot;"
									class="w93" style="cursor: pointer;">전체 주문 보기</button></span>
				</div>
				<div class="ordlistdiv" style="margin-bottom: 30px;">
					<form name="frmOrderList" method="post">
						<input type="hidden" name="mode"> <input type="hidden"
							name="ordno">
						<table class="ordlatelytbl" cellpadding="0" cellspacing="0"
							summary="최근 3건의 주문 정보">
							<caption>최근 3건의 주문 정보</caption>
							<colgroup>
								<col width="*">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="col">주문일시</th>
									<th scope="col">주문번호</th>
									<th scope="col">결제방법</th>
									<th scope="col">주문금액</th>
									<th scope="col">취소금액</th>
									<th scope="col">상세보기</th>
								</tr>
								<tr onmouseover="this.style.background=&quot;#F7F7F7&quot;"
									onmouseout="this.style.background=&quot;#fff&quot;"
									style="background: rgb(255, 255, 255);">
									<td scope="row">2019-08-07 17:23:49</td>
									<td><a
										href="http://www.zipbanchan.co.kr/shop/mypage/mypage_orderview.php?&amp;ordno=1565165608840"
										style="color: #777;">1565165608840</a></td>
									<td>가상계좌</td>
									<td class="right">31,700</td>
									<td class="right">0</td>
									<td><a
										href="http://www.zipbanchan.co.kr/shop/mypage/mypage_orderview.php?&amp;ordno=1565165608840"><img
											src="./res/btn_detailview.gif"></a></td>
								</tr>
								<tr onmouseover="this.style.background=&quot;#F7F7F7&quot;"
									onmouseout="this.style.background=&quot;#fff&quot;"
									style="background: rgb(255, 255, 255);">
									<td scope="row">2019-08-05 00:42:00</td>
									<td><a
										href="http://www.zipbanchan.co.kr/shop/mypage/mypage_orderview.php?&amp;ordno=1564933277894"
										style="color: #777;">1564933277894</a></td>
									<td>가상계좌</td>
									<td class="right">18,900</td>
									<td class="right">0</td>
									<td><a
										href="http://www.zipbanchan.co.kr/shop/mypage/mypage_orderview.php?&amp;ordno=1564933277894"><img
											src="./res/btn_detailview.gif"></a></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<!-- 최근 주문 정보 -->

			<!-- 1:1 문의내역 -->
			<div class="mplist">
				<div class="ordtitle">
					<span class="ordment"><span class="b_cate">1:1 문의내역</span></span> <span
						class="ordlink"><button type="button"
							onclick="location.href=&quot;https://www.zipbanchan.co.kr:14027/shop/mypage/mypage_qna.php?&amp;&quot;"
							class="w93" style="cursor: pointer;">1:1 문의게시판</button></span>
				</div>
				<div class="ordlistdiv" style="margin-bottom: 30px;">
					<input type="hidden" name="cntqna" id="cntqna" value="0">
					<table class="ordlatelytbl" cellpadding="0" cellspacing="0"
						summary="최근 3건의 1:1문의">
						<caption>최근 3건의 1:1문의</caption>
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="*">
							<col width="12%">
							<col width="12%">
						</colgroup>
						<tbody>
							<tr>
								<th>번호</th>
								<th>질문유형</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
							<tr>
								<td colspan="5" class="nodata">1:1 문의 내역이 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 1:1 문의내역 -->
		</div>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>