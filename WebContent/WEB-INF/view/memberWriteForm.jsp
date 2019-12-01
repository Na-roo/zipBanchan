<%@page import="com.itwill.member.MemberService"%>
<%@page import="com.itwill.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	String MSG=(String)request.getAttribute("MSG");
	if(MSG==null){
		MSG="";
	}
%>		
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<%@ include file="../include/head.jsp"%>
<body style="">
	<%@ include file="../include/top.jsp"%>
	<script>
	function idCheck(){
		var memberId = document.getElementById("memberId").value;
		if (!memberId) {
			alert("검색할 아이디를 입력하시고 중복체크를 하셔요.");
			return false;
		}else{
			var param="memberId="+memberId
			var url = "user_id_check_form.jsp?"+memberId;
			location.href=url;
		}
	} 
	
	// 아이디 중복체크 화면open
	function openIdChk(e){		
		if (document.frmMember.memberId.value == "") {
			alert("아이디를 입력하십시요.");
			document.form.memberId.focus();
			return false;
		}
		var param="?memberId="+document.frmMember.memberId.value;
		window.name = "parentForm";
		window.open("memberIdCheckForm.do"+param,
				"chkForm", "width=500,height=300,resizable = no,scrollbars = no");	
		
		
	
	}

	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
	// 다시 중복체크를 하도록 한다.
	function inputIdChk(){
		document.memberInfo.idDuplication.value ="idUncheck";
	}
	</script>

	<div id="content">

		<!-- 상단이미지 || 현재위치 -->
		<div class="atit">
			<p>회원가입</p>
		</div>


		<div class="indiv" style="margin: 0 auto; width: 1100px;">

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

			<form id="form" name="frmMember" method="post"
				action="memberWriteAction.do" onsubmit="return chkForm2(this)">
				<input type="hidden" name="mode" value="joinMember"> <input
					type="hidden" name="rncheck" value=""> <input type="hidden"
					name="dupeinfo" value=""> <input type="hidden" name="pakey"
					value=""> <input type="hidden" name="foreigner" value="">
				<input type="hidden" name="passwordSkin" value="Y">
				<!-- 비밀번호 작성 규칙 보완 스킨패치 여부 -->
				<input type="hidden" name="m_id" value=""> <input
					type="hidden" name="private1" value=""> <input
					type="hidden" name="private2" value=""> <input
					type="hidden" name="private3" value="">

				<!-- 네이버체크아웃(회원연동) -->



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
								<td><input type="text" name="memberName" value=""
									style="width: 217px; height: 30px; padding-left: 10px;"
									required="" fld_esssential="" label="이름" ></td>
							</tr>
							<tr>
								<th
									style="padding-left: 20px; color: #717071; font-weight: bold;">아이디
									<em class="star">*</em>
								</th>
								<td><input type="text" name="memberId" value="" required=""
									style="width: 217px; height: 30px; padding-left: 10px;">
									&nbsp;
									&nbsp; <input type="hidden" name="chk_id" required=""
									fld_esssential="" label="아이디중복체크"> <a
									href="" onclick="openIdChk(event)"
									style="width: 104px; height: 34px; display: inline-block; margin-left: 10px; background: #354436; color: #fff; vertical-align: middle; line-height: 34px; text-align: center;">아이디
										중복체크</a></td>
							</tr>
							
							<tr>
								<th
									style="vertical-align: top; padding-top: 23px; padding-left: 20px; color: #717071; font-weight: bold;">비밀번호
									<em class="star" style="vertical-align: top;">*</em>
								</th>
								<td><input type="password" name="newPassword" required=""
									fld_esssential="" option="regPass" label="비밀번호"
									onfocus="checkPassword(this)" onkeyup="checkPassword(this)"
									onblur="emptyPwState()"
									style="width: 217px; height: 30px; padding-left: 10px;">
									
									<div class="passwordStrenth"
										id="el-password-strength-indicator">
										<dl>
											<dt>비밀번호 안전도</dt>
											<dd id="el-password-strength-indicator-level"></dd>
										</dl>
										<p id="el-password-strength-indicator-msg"></p>
									</div> 
										<span style="display: block; width: 525px; height: 40px; padding-left: 10px; line-height: 40px; background: #f5f5f5; margin-top: 8px;">
											영문 대소문자, 숫자를 조합하여 최소 10 ~ 16자리 이하</span></td>
							</tr>
							<tr>
								<th
									style="padding-left: 20px; color: #717071; font-weight: bold;">비밀번호확인
									<em class="star">*</em>
								</th>
								<td class="memberCols2"><input type="password"
									name="memberPassword2" required="" fld_esssential="" option="regPass"
									label="비밀번호"
									style="width: 217px; height: 30px; padding-left: 10px;">
									
								</td>
							</tr>
							<tr>
								<th
									style="padding-left: 20px; color: #717071; font-weight: bold;">주소
									<em class="star">*</em>
								</th>
								<td><input type="text" name="memberAddress" value="" required=""
									style="width: 350px; height: 30px; padding-left: 10px;">
									&nbsp;
									&nbsp; </td>
							</tr>

							<tr>
								<th
									style="vertical-align: top; padding-top: 23px; padding-left: 20px; color: #717071; font-weight: bold;">핸드폰
									<em class="star" style="vertical-align: top;">*</em>
								</th>
								<td>
		 <input type="text" name="memberPhone" id="mobile0" value=""
									maxlength="4" required="" fld_esssential="" option="regNum"
									label="핸드폰"
									style="width: 92px; height: 30px; padding-left: 10px;">
									&nbsp;-&nbsp; <input type="text" name="memberPhone2" id="mobile1"
									value="" maxlength="4" required="" fld_esssential=""
									option="regNum" label="핸드폰"
									style="width: 92px; height: 30px; padding-left: 10px;">
									&nbsp;-&nbsp; <input type="text" name="memberPhone3" id="mobile2"
									value="" maxlength="4" required="" fld_esssential=""
									option="regNum" label="핸드폰"
									style="width: 90px; height: 30px; padding-left: 10px;">
									

								</td>
							</tr>
							<tr>
								<th
									style="padding-left: 20px; color: #717071; font-weight: bold;">이메일
									<em class="star">*</em>
								</th>
								<td><input type="text" name="memberEmail" value="" required=""
									style="width: 217px; height: 30px; padding-left: 10px;">
									&nbsp;@&nbsp; <input type="text" name="id2" value=""
									required=""
									style="width: 144px; height: 30px; padding-left: 10px;">
									&nbsp;<select name="memberEmail2"
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
					style="padding: 70px 0 100px 0; margin-top: 20px; text-align: center;">
					<input type="submit"
						style="width: 230px; background: #344336; color: #fff; display: inline-block; line-height: 65px; text-align: center; font-size: 20px; margin-right: 10px; cursor: pointer;"
						value="회원가입"> 
						<input type="button" 
						onclick="history.back()"
						style="width: 230px; background: #344336; color: #fff; display: inline-block; line-height: 65px; text-align: center; font-size: 20px; cursor: pointer;"
						value="이전으로">
				</div>


			</form>

			<div style="height: 100px"></div>

			<iframe id="ifrmRnCheck" name="ifrmRnCheck"
				style="width: 500px; height: 500px; display: none;"></iframe>
			<iframe id="ifrmHpauth" name="ifrmHpauth"
				style="width: 300px; height: 200px; display: none;"></iframe>
			<script>
				var sms = {
					code : 'failure',
					message : '핸드폰 인증 후 이용가능합니다.'
				};
				var recommend = {
					code : 'failure',
					message : '추천인아이디가 존재하지 않습니다.'
				};

				function checkRecommend() {
					var reco_type = $("input[name=reco_type]:checked").val();

					if (!jQuery("input[name=recommid]").val()) {
						alert('추천인아이디를 입력해주세요.');
						return false;
					}

					jQuery
							.ajax({
								method : 'POST',
								url : '/shop/member/join_recommend.php',
								async : false,
								data : {
									mode : 'check',
									recommid : jQuery("input[name=recommid]")
											.val(),
									recotype : reco_type
								},
								dataType : 'json',
								success : function(data) {
									recommend = data;
									if (recommend.code == 'success') {
										recommend.message = '정상적인 추천인아이디입니다.';
										//console.log(recommend);
										jQuery("input[name=recommid]").val(
												recommend.m_id);
										recommend.id = jQuery(
												"input[name=recommid]").val();
										$(".recomm_id").html(recommend.m_text);
										$(
												".reco_type, .reco_phone, .reco_email, .reco_desc")
												.hide();
									} else if (recommend.code == 'failure') {
										jQuery("input[name=recommid]").val('');
										recommend.message = '추천인아이디가 존재하지 않습니다.';
									}

									alert(recommend.message);
								}
							});
				}

				function checkAuthNumber() {
					if (!jQuery("input[name=auth_number]").val()) {
						alert('인증번호를 입력해주세요.');
						return false;
					}

					jQuery.ajax({
						method : 'POST',
						url : '/shop/member/join_sms.php',
						async : false,
						data : {
							mode : 'check',
							auth_number : jQuery("input[name=auth_number]")
									.val()
						},
						dataType : 'json',
						success : function(data) {
							sms = data;
							if (sms.code == 'success') {
								sms.message = '인증이 완료되었습니다.';
							} else if (data.code == 'failure') {
								sms.message = '인증번호가 일치하지 않습니다.';
							}

							alert(sms.message);
						}
					});
				}

				function sendAuthSms() {
					if (!jQuery("#mobile0").val() || !jQuery("#mobile1").val()
							|| !jQuery("#mobile2").val()) {
						alert('휴대폰 번호를 입력해주세요.');
						return false;
					}

					jQuery
							.post(
									'/shop/member/join_sms.php',
									{
										mode : 'send',
										phone : jQuery(
												"input[name='mobile[]'],select[name='mobile[]'] :selected")
												.map(function() {
													return this.value;
												}).get().join('-')
									}, function(data) {
										alert('인증번호가 발송되었습니다.');
									});
				}

				function chkAll(obj) {
					jQuery(
							"input[name=agree][value=y], input[name=private1][value=y], input[name=ex1][value=y], input[name=mailling], input[name=sms]")
							.prop('checked', obj.checked);
				}

				function select_email(obj) {
					jQuery("input[name=id2]").val(obj.value).trigger('blur');
				}

				function chkId() {
					var form = document.frmMember;
					var pattern = /([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)\.([0-9a-zA-Z_-]+)/;

					if (!chkText(form.memberId, form.memberId.value, "아이디를 입력해주세요"))
						return;

					//if (!chkPatten(form.m_id,form.m_id.getAttribute('option'),"아이디는 4자 이상 16자 이하의 영문자,숫자 조합만 가능합니다")) return;
					ifrmHidden.location.href = "indb.php?mode=chkId&m_id="
							+ form.m_id.value;
				}

				function chkEmail() {
					var form = document.frmMember;
					if (!chkText(form.email, form.email.value, "이메일을 입력해주세요"))
						return;
					if (!chkPatten(form.email, form.email
							.getAttribute('option'), "정상적인 이메일 주소를 입력해주세요"))
						return;
					ifrmHidden.location.href = "indb.php?mode=chkEmail&email="
							+ form.email.value + "&m_id=" + form.m_id.value;
				}

				function chkNickname() {
					var form = document.frmMember;
					if (!chkText(form.nickname, form.nickname.value,
							"닉네임을 입력해주세요"))
						return;
					ifrmHidden.location.href = "indb.php?mode=chkNickname&nickname="
							+ form.nickname.value + "&m_id=" + form.m_id.value;
				}

				function chkBirth(obj) {
					var birth = document.getElementsByName(obj.name)[0].value;
					var di = document.getElementsByName(obj.name)[1].value;
					var objBirth = document.getElementsByName('birth[]');

					if (di.substring(0, 1) == 1 || di.substring(0, 1) == 2)
						var dy = "19";
					else
						var dy = "20";

					obj.form.birth_year.value = (birth) ? dy
							+ birth.substring(0, 2) : "";
					objBirth[0].value = birth.substring(2, 4);
					objBirth[1].value = birth.substring(4, 6);
				}

				function openPasswordField() {
					if (navigator.appName.indexOf("Microsoft") > -1) {
						_ID('pwLayer01').style.display = 'block';
						_ID('pwLayer02').style.display = 'block';
					} else {
						_ID('pwLayer01').style.display = 'table-row';
						_ID('pwLayer02').style.display = 'table-row';
					}
				}

				function checkPassword(el) {

					if (el.value) {

						var param = {
							form : document.frmMember,
							fields : [ 'm_id', 'birth_year', 'phone[]',
									'birth[]', 'mobile[]', 'email' ]
						}

						nsGodo_PasswordStrength.appendBlacklist(param);
						nsGodo_PasswordStrength.appendBlacklist(param);

						var result = nsGodo_PasswordStrength.check(el);

						_ID('el-password-strength-indicator-msg').innerText = result.msg;
						_ID('el-password-strength-indicator-level').className = 'lv'
								+ result.level;
						_ID('el-password-strength-indicator-level').innerText = result.levelText;
						_ID('el-password-strength-indicator').style.display = 'block';

					} else {
						emptyPwState();
					}

				}

				function emptyPwState() {
					_ID('el-password-strength-indicator').style.display = "none";
				}

				function chkForm2(f) {
					if (chkRadioSelect(f, 'agree', 'y',
							'[회원가입 이용약관]에 동의를 하셔야 회원가입이 가능합니다.') === false)
						return false;
					if (chkRadioSelect(f, 'private1', 'y',
							'[개인정보취급방침]에 동의를 하셔야 회원가입이 가능합니다.') === false)
						return false;
					if (sms.code != 'success') {
						alert(sms.message);
						return false;
					}
					if (recommend.code == 'success'
							&& recommend.id != jQuery("input[name=recommid]")
									.val()) {
						alert('추천인아이디를 확인해주세요.');
						return false;
					}

					if (document.getElementById('avoidDbl'))
						btn = document.getElementById('avoidDbl').innerHTML;

					if (chkForm(f) === false) {
						return false;
					}

					// 만14세 미만 회원가입 가능여부 생년월일로 체크
					var under14Code = '';
					var under14Status = '';
					if (under14Code == 'needBirthCheck') {
						var birthDay = '';
						if (typeof (f['birth_year']) != 'undefined'
								&& typeof (f['birth[]'][0]) != 'undefined'
								&& typeof (f['birth[]'][0]) != 'undefined') {
							bY = '0000' + f['birth_year'].value;
							bM = '00' + f['birth[]'][0].value;
							bD = '00' + f['birth[]'][1].value;
							birthDay = bY.substring(bY.length - 4)
									+ bM.substring(bM.length - 2)
									+ bD.substring(bD.length - 2);
						}
						if (chkUnder14(birthDay, under14Status, under14Code) === false) {
							if (document.getElementById('avoidDbl'))
								document.getElementById('avoidDbl').innerHTML = btn;
							return false;
						}
					}

					return true;
				}

				function goIDCheckIpin() {

					return;
				}

				jQuery(function() {
					jQuery("input[name=id1],input[name=id2]").blur(
							function() {
								jQuery("input[name=m_id]").val(
										jQuery("input[name=id1]").val()
												+ '@'
												+ jQuery("input[name=id2]")
														.val());
							});
				});

				/* 비밀번호변경 토글 */
				jQuery(function() {
					jQuery(".prv-btn").click(function() {
						jQuery("#pwLayer01").toggle();
						jQuery("#pwLayer02").toggle();
					});

					jQuery("input[name=recommid1],input[name=recommid2]")
							.change(
									function() {
										recommid = jQuery(
												"input[name=recommid1],input[name=recommid2]")
												.map(function() {
													return this.value;
												});
										console.log(recommid);
										jQuery("input[name=recommid]").val(
												recommid.get().join('@'));
									});

					jQuery(
							"input[name=recommid3],input[name=recommid4],input[name=recommid5]")
							.change(
									function() {
										recommid = jQuery(
												"input[name=recommid3],input[name=recommid4],input[name=recommid5]")
												.map(function() {
													return this.value;
												});
										console.log(recommid);
										jQuery("input[name=recommid]").val(
												recommid.get().join('-'));
									});
				});
			</script>

		</div>
		<!-- End indiv -->

	</div>

	<%@ include file="../include/bottom.jsp"%>
</body>
</html>