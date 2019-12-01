<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<%@ include file="../include/head.jsp"%>

<style type="text/css">
div.passwordStrenth {
	background-color: #FFFFFF;
	border: 1px #CCCCCC solid;
	padding: 10px;
	width: 263px;
	display: none;
	position: absolute;
}

div.passwordStrenth p {
	margin: 0;
	padding: 5px 0 0 0;
	font-size: 11px;
	font-family: dotum;
	color: #616161;
}

div.passwordStrenth dl {
	margin: 0;
	padding: 0 6px 0 0;
	color: #373737;
	font-weight: bold;
	font-size: 11px;
	font-family: dotum;
}

div.passwordStrenth dl dt, div.passwordStrenth dl dd {
	display: inline;
	font-size: 11px;
	font-family: dotum;
	margin: 0;
	height: 15px;
	line-height: 15px;
}

div.passwordStrenth dl dt {
	color: #363636;
	font-weight: bold;
	width: 95px;
}

div.passwordStrenth dl dd {
	text-indent: 0px;
	font-size: 12px;
	width: 110px;
	background: url('/shop/data/skin/mera_ws/img/common/password_level.gif')
		no-repeat top left;
}

div.passwordStrenth dl dd.lv0 {
	color: #F52D00;
	background-position: 20px 0;
}

div.passwordStrenth dl dd.lv1 {
	color: #F52D00;
	background-position: 20px -29px;
}

div.passwordStrenth dl dd.lv2 {
	color: #F52D00;
	background-position: 20px -44px;
}

div.passwordStrenth dl dd.lv3 {
	color: #F52D00;
	background-position: 20px -59px;
}

div.passwordStrenth dl dd.lv4 {
	color: #F52D00;
	background-position: 20px -59px;
}
</style>

			<style>
.memberCols1 {
	width: 100px;
	text-align: right;
	padding-right: 10px;
	font: bold 8pt 돋움;
	color: #5D5D5D;
	letter-spacing: -1px;
}

.memberCols2 {
	text-align: left;
	padding-left: 10px;
}

.memberCols3 {
	width: 95px;
	font: 8pt 돋움;
	color: #5D5D5D;
	letter-spacing: -1px;
}

.scroll {
	scrollbar-face-color: #FFFFFF;
	scrollbar-shadow-color: #AFAFAF;
	scrollbar-highlight-color: #AFAFAF;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #F7F7F7;
	scrollbar-arrow-color: #838383;
}

#boxScroll {
	width: 96%;
	height: 130px;
	overflow: auto;
	background-color: #ffffff;
	color: #585858;
	font: 9pt 돋움;
	border: 1px #dddddd solid;
	overflow-x: hidden;
	text-align: left;
	margin: auto;
}

#pwdManual {
	border: 2px solid #BFBFBF;
	display: none;
	position: absolute;
	width: 410px;
	background: #ffffff;
	margin-top: 10px;
}

#pwdManual p {
	background: #F1F1F1
		url('/shop/data/skin/mera_ws/img/common/blt_tip_gr.gif') no-repeat
		10px center;
	margin: 0;
	padding: 12px 10px 12px 50px;
	color: #373737;
	font-weight: bold;
}

#pwdManual p.close {
	background: none;
	padding: 0px 10px 5px 0;
	margin: 0;
	text-align: right;
}

#pwdManual ul {
	list-style: none;
	margin: 0;
	padding: 15px;
}

#pwdManual ul li {
	color: #6E6E6E;
	font-size: 11px;
	line-height: 17px;
	letter-spacing: -1px;
}

#ipinManual {
	border: 2px solid #BFBFBF;
	display: none;
	position: absolute;
	width: 560px;
	z-index: 999;
}

#ipinManual .ipinmTop {
	background-color: #F1F1F1;
	color: #373737;
	font-weight: bold;
	padding: 7px;
}

#ipinManual .ipinmBottom {
	background-color: #FFFFFF;
	padding: 10px 0px;
}

#ipinManual .ipinmBottom .ipinmbText {
	color: #6E6E6E;
	font-size: 11px;
	line-height: 17px;
	margin-left: 20px;
}

#ipinManual .ipinmBottom .ipinmbText a {
	color: #6E6E6E;
	font-size: 11px;
	font-weight: bold;
	line-height: 17px;
}

#ipinManual .ipinmBottom .ipinmbDotted {
	border-top: 1px dotted #C0C0C0;
	margin: 10px 20px;
}

#ipinManual .ipinmBottom .ipinmbSolid {
	border-top: 1px solid #C0C0C0;
	margin: 10px 20px;
}

#ipinManual .ipinmBottom .ipinmbTerm {
	margin: 10px 20px;
}

#ipinManual .ipinmBottom .ipinmbButton {
	margin: 15px 10px 5px 10px;
	text-align: center;
}

#form * {
	/*font-family: 'Spoqa Han Sans';*/
	
}

.h4 {
	font-weight: bold;
}

.h4 span {
	font-weight: normal;
	color: #777 !important;
}

.star {
	color: #777 !important;
}

table.intable th {
	color: #777;
}

input[type=text] {
	border-color: #d5d4d3 !important;
}
</style>
<body style="">
	<%@ include file="../include/top.jsp"%>
	<%
		String[] phone = member.getMemberPhone().split("-");
		String[] email = member.getMemberEmail().split("@");
	%>
	<div id="content">
		<!-- 상단이미지 || 현재위치 -->
		<div class="atit">
			<p>회원정보수정</p>
			<span class="path"><img src="./res/ico_home.gif" alt="HOME"
				style="cursor: pointer;"> <b>회원정보수정</b></span>
		</div>

		<div class="indiv" style="margin: 0 auto; width: 1100px;">
			<form id="form" name="frmMember" method="post"
				action="memberModifyAction.do"
				onsubmit="return chkForm2(this)">
				<input type="hidden" name="mode" value="modMember"> <input
					type="hidden" name="rncheck" value="none"> <input
					type="hidden" name="dupeinfo" value=""> <input
					type="hidden" name="pakey" value=""> <input type="hidden"
					name="foreigner" value=""> <input type="hidden"
					name="passwordSkin" value="Y">
				<!-- 비밀번호 작성 규칙 보완 스킨패치 여부 -->
				<input type="hidden" name="m_id" value="hellsprit@naver.com">
				<input type="hidden" name="private1" value="y">

				<div style="height: 30px"></div>
				<div
					style="border-bottom: 1px solid #ccc; padding-bottom: 65px; margin-bottom: 40px;">
					<p class="h4">
						회원정보입력 <span><em class="star">*</em> 필수입력사항</span>
					</p>

					<table width="100%" cellpadding="0" cellspacing="0" border="0"
						class="intable">
						<tbody>
							<tr>
								<th
									style="padding-left: 20px; color: #717071; font-weight: bold;">이름
									<em class="star">*</em>
								</th>
								<td><input type="text" name="memberName" value="<%= member.getMemberName() %>"
									style="width: 217px; height: 30px; padding-left: 10px;"
									required="" fld_esssential="" label="이름"></td>
							</tr>
							<tr>
								<th
									style="padding-left: 20px; color: #717071; font-weight: bold;">아이디
									<em class="star">*</em>
								</th>
								<td><span class="eng"><b><%= member.getMemberId() %></b></span></td>
							</tr>
							<tr>
								<th
									style="padding-left: 20px; color: #717071; font-weight: bold;">비밀번호
									<em class="star">*</em>
								</th>
								<!-- 비밀번호 버튼 -->
								<td>
									<div id="pwLayer02" style="display: block;">
										<!-- 비밀번호 변경 -->
										<table cellpadding="0" cellspacing="0" border="0">
											<tbody>
												<tr>
													<td class="memberCols3">새 비밀번호</td>
													<td><input type="password" name="newPassword"
														id="newPassword" onfocus="checkPassword(this)"
														onkeyup="checkPassword(this)" onblur="emptyPwState()"
														label="새 비밀번호" option="regPass" maxlength="16">
														<div class="passwordStrenth"
															id="el-password-strength-indicator">
															<dl>
																<dt>비밀번호 안전도</dt>
																<dd id="el-password-strength-indicator-level"></dd>
															</dl>
															<p id="el-password-strength-indicator-msg"></p>
														</div> <span style="font: 8pt 돋움; color: #007FC8">새로 변경할
															비밀번호를 입력해 주세요.</span></td>
												</tr>
												
											</tbody>
										</table>
									</div></td>
							</tr>

							<tr>
								<th
									style="padding-left: 20px; color: #717071; font-weight: bold;">주소
									<em class="star">*</em>
								</th>
								<td><input type="text" name="memberAddress" value="<%= member.getMemberAddress() %>" required=""
									style="width: 350px; height: 30px; padding-left: 10px;">
									&nbsp;
									&nbsp; </td>
							</tr>
								
							<tr>
								<th style="vertical-align: top; padding-top: 23px; padding-left: 20px; color: #717071; font-weight: bold;">
									핸드폰
								<em class="star" style="vertical-align: top;">*</em>
								</th>
								<td>
	 							<input type="text" name="memberPhone" id="mobile0" value="<%= phone[0] %>" maxlength="4" required="" option="regNum" label="핸드폰"
									style="width: 92px; height: 30px; padding-left: 10px;"> &nbsp;-&nbsp; 
								<input type="text" name="memberPhone2" id="mobile1" value="<%= phone[1] %>" maxlength="4" required="" option="regNum" label="핸드폰"
									style="width: 92px; height: 30px; padding-left: 10px;"> &nbsp;-&nbsp; 
								<input type="text" name="memberPhone3" id="mobile2" value="<%= phone[2] %>" maxlength="4" required="" option="regNum" label="핸드폰"
									style="width: 90px; height: 30px; padding-left: 10px;">
								</td>
							</tr>
							<tr>
								<th
									style="padding-left: 20px; color: #717071; font-weight: bold;">이메일
									<em class="star">*</em>
								</th>
								<td><input type="text" name="memberEmail" value="<%= email[0] %>" required=""
									style="width: 217px; height: 30px; padding-left: 10px;">
									&nbsp;@&nbsp; <input type="text" name="memberEmail2" value="<%= email[1] %>"
									required=""
									style="width: 144px; height: 30px; padding-left: 10px;">
									&nbsp;<select name="memberName2"
									style="width: 110px; height: 34px; border: 1px solid #d5d4d3; border-radius: 0; background: #f4f4f4; vertical-align: middle"
									onchange="select_email(this);">
										<option value="">이메일 선택</option>
										<option value="sannamchon.co.kr">sannamchon.co.kr</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="gmail.com">gmail.com</option>
								</select> &nbsp; </td>
							</tr>
						</tbody>
					</table>

				</div>

				<div id="avoidDbl"
					style="padding: 70px 0 100px 0; border-top: 1px solid #ccc; margin-top: 70px; text-align: center;">
					<input type="submit" onclick="isSuccess();"
						style="width: 230px; background: #344336; color: #fff; display: inline-block; line-height: 65px; text-align: center; font-size: 20px; margin-right: 10px; cursor: pointer;"
						value="정보수정"> <input type="button" border="0"
						onclick="history.back()"
						style="width: 230px; background: #344336; color: #fff; display: inline-block; line-height: 65px; text-align: center; font-size: 20px; cursor: pointer;"
						value="이전으로">
				</div>
			</form>
		</div>
		<!-- End indiv -->
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>