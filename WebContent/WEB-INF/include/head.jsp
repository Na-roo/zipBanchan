<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<style>
		

		body #main_contents2 .listwrap,
		body #main_contents3 .listwrap {
			width: 1100px;
			overflow: hidden;
		}

		body #main_contents .listwrap table,
		body #main_contents2 .listwrap table,
		body #main_contents3 .listwrap table {
			margin-left: 1px;
		}

		body #main_contents2 .listwrap .innerwrap .gview1,
		body #main_contents3 .listwrap .innerwrap .gview1 {
			min-height: 431px;
			margin-left: 29px;
			margin-right: 29px;
		}

		body #main_contents2 .listwrap .innerwrap,
		body #main_contents3 .listwrap .innerwrap {
			border: solid 1px #d3d3d3;
			margin: 0 0 13px -1px;
			padding: 29px 0 0 0;
			width: 365px;
		}

		body #main_contents2 .listwrap .innerwrap .gooodimg,
		body #main_contents3 .listwrap .innerwrap .gooodimg {
			width: 100%;
			height: 298px;
			overflow: hidden;
			text-align: center;
		}

		body #main_contents2 .listwrap .innerwrap .gooodimg img,
		body #main_contents3 .listwrap .innerwrap .gooodimg img {
			width: 100%;
			height: auto;
		}

		body #main_contents .dcount,
		body #main_contents2 .dcount,
		body #main_contents3 .dcount {
			display: none;
		}

		body #main_contents .listwrap .innerwrap {
			margin: 0 0 0 -1px;
			padding-bottom: 0;
		}

		body #main_contents .listwrap .innerwrap .gooodimg {
			width: 160px;
			height: 160px;
			overflow: hidden;
			text-align: center;
			margin-right: 12px;
		}

		body #main_contents .listwrap .innerwrap .goodtxt {
			padding-top: 20px;
			box-sizing: border-box;
			width: 130px;
		}

		body #main_contents .listwrap .innerwrap .gooodimg img {
			width: 160px;
			height: auto;
		}


		body #main_contents td.number4 .innerwrap,
		body #main_contents td.number5 .innerwrap {
			border-top: 0;
		}


		body #main_contents td.number1 .innerwrap {
			width: 368px;
			height: 443px;
			box-sizing: border-box;
		}

		body #main_contents td.number2 .innerwrap,
		body #main_contents td.number3 .innerwrap,
		body #main_contents td.number4 .innerwrap,
		body #main_contents td.number5 .innerwrap {
			width: 364px;
			height: 190px;
		}

		body #main_contents td.number2 .innerwrap .gooodimg,
		body #main_contents td.number2 .innerwrap .goodtxt,
		body #main_contents td.number3 .innerwrap .gooodimg,
		body #main_contents td.number3 .innerwrap .goodtxt,
		body #main_contents td.number4 .innerwrap .gooodimg,
		body #main_contents td.number4 .innerwrap .goodtxt,
		body #main_contents td.number5 .innerwrap .gooodimg,
		body #main_contents td.number5 .innerwrap .goodtxt {
			float: left;
		}

		body #main_contents td.number1 .innerwrap .gooodimg {
			width: 310px;
			height: auto;
			overflow: hidden;
			text-align: center;
			margin-right: 0;
			margin-bottom: 10px !important;
		}

		body #main_contents td.number1 .innerwrap .goodtxt {
			padding-top: 0px;
			width: auto;
		}

		body #main_contents td.number1 .innerwrap .gooodimg img {
			width: 310px;
			height: auto;
		}

		body #main_contents .contents {
			position: relative;
		}

		body #main_contents .contents .sort1,
		body #main_contents .contents .sort2,
		body #main_contents .contents .sort3,
		body #main_contents .contents .sort4,
		body #main_contents .contents .sort5 {
			position: absolute;
			z-index: 100;
		}

		body #main_contents .contents .sort1 {
			top: 0;
			left: 0;
		}

		body #main_contents .contents .sort2 {
			top: 0;
			left: 368px;
		}

		body #main_contents .contents .sort3 {
			top: 0;
			left: 733px;
		}

		body #main_contents .contents .sort4 {
			top: 221px;
			left: 368px;
		}

		body #main_contents .contents .sort5 {
			top: 221px;
			left: 733px;
		}

		body #main_contents2 .dcmark,
		body #main_contents3 .dcmark {
			display: block;
		}

		body #main_contents4 {
			margin-bottom: 100px;
			*zoom: 1;
		}

		body #main_contents4:after {
			content: "";
			display: block;
			clear: both;
		}

		body #main_contents4 .review_wrap {
			position: relative;
			width: 1100px;
			height: 380;
			overflow: hidden;
			background: url('/shop/data/skin/mera_ws/img/main/main_back.gif') no-repeat 0 0;
			position: relative;
		}

		body #main_contents4 .review_wrap div {
			float: left;
			width: 550px;
			overflow: hidden;
		}

		body #main_contents4 .review_wrap .subjact,
		body #main_contents4 .review_wrap .con,
		body #main_contents4 .review_wrap .name {
			overflow: hidden;
			height: 22px;
			line-height: 22px;
			text-align: left;
		}

		body #main_contents4 .review_wrap .subjact a {
			font-size: 14px;
			color: #333;
			font-weight: 400;
		}

		body #main_contents4 .review_wrap .con {
			font-size: 13px;
			color: #888;
			text-overflow: ellipsis;
			white-space: nowrap;
		}

		body #main_contents4 .review_wrap .name {
			font-size: 13px;
			color: #aaa;
		}

		body #main_contents4 .review_wrap .review1 {
			width: 550px;
		}

		body #main_contents4 .review_wrap .review1 .img {
			width: 220px;
			height: 220px;
			overflow: hidden;
			margin: 30px auto 35px auto;
		}

		body #main_contents4 .review_wrap .review1 .img img {
			width: 100%;
			height: auto;
		}

		body #main_contents4 .review_wrap .review1 .subjact,
		body #main_contents4 .review_wrap .review1 .con,
		body #main_contents4 .review_wrap .review1 .name {
			margin: 0 auto;
			width: 488px;
		}

		body #main_contents4 .review_wrap .review2 {
			position: relative;
			height: 146px;
		}

		body #main_contents4 .review_wrap .review2 .img {
			margin: 30px 0 0 42px;
		}

		body #main_contents4 .review_wrap .review2 .subjact,
		body #main_contents4 .review_wrap .review3 .subjact,
		body #main_contents4 .review_wrap .review4 .subjact,
		body #main_contents4 .review_wrap .review2 .con,
		body #main_contents4 .review_wrap .review3 .con,
		body #main_contents4 .review_wrap .review4 .con,
		body #main_contents4 .review_wrap .review2 .name,
		body #main_contents4 .review_wrap .review3 .name,
		body #main_contents4 .review_wrap .review4 .name {
			position: absolute;
			left: 160px;
			width: 350px;
		}

		body #main_contents4 .review_wrap .review2 .subjact {
			top: 42px;
		}

		body #main_contents4 .review_wrap .review2 .con {
			top: 62px;
		}

		body #main_contents4 .review_wrap .review2 .name {
			top: 92px;
		}

		body #main_contents4 .review_wrap .review3 {
			position: relative;
			height: 113px;
		}

		body #main_contents4 .review_wrap .review3 .img {
			margin: 0 0 0 42px;
		}

		body #main_contents4 .review_wrap .review3 .subjact,
		body #main_contents4 .review_wrap .review4 .subjact {
			top: 9px;
		}

		body #main_contents4 .review_wrap .review3 .con,
		body #main_contents4 .review_wrap .review4 .con {
			top: 31px;
		}

		body #main_contents4 .review_wrap .review3 .name,
		body #main_contents4 .review_wrap .review4 .name {
			top: 63px;
		}

		body #main_contents4 .review_wrap .review4 {
			position: relative;
			height: 121px;
		}

		body #main_contents4 .review_wrap .review4 .img {
			margin: 0 0 0 42px;
		}

		.bestmark {
			position: absolute;
			top: 0;
			left: 0;
			z-index: 100;
		}
	</style>

	<title>3조 집반찬연구소</title>

	<script type="text/javascript" async="" src="./res/ec.js.다운로드"></script>
	<script type="text/javascript" async="" src="./res/hotjar-674634.js.다운로드"></script>
	<script type="text/javascript" async="" src="./res/f.txt"></script>
	<script type="text/javascript" async="" src="./res/analytics.js.다운로드"></script>
	<script type="text/javascript" async="" src="./res/f.txt"></script>
	<script src="./res/inferredEvents.js.다운로드" async=""></script>
	<script src="./res/370778903293933" async=""></script>
	<script async="" src="./res/fbevents.js.다운로드"></script>
	<script async="" src="./res/gtm.js.다운로드"></script>
	<script async="" charset="utf-8" src="./res/groobee.min.js.다운로드"></script>
	<script type="text/javascript" src="./res/jquery-1.10.2.min.js.다운로드"></script>
	<script type="text/javascript" src="./res/AnimationBanner.js.다운로드"></script>
	<script type="text/javascript" src="./res/AnimationBannerLoader.js.다운로드"></script>


	<!-- Groobee Script -->
	<script type="text/javascript">
		(function (a, i, u, e, o) {
			a[u] = a[u] || function () { (a[u].q = a[u].q || []).push(arguments) }; e = i.createElement("script"); e.async = 1;
			e.charset = "utf-8"; e.src = "//s3.ap-northeast-2.amazonaws.com/static.groobee.io/dist/groobee.min.js";
			o = i.getElementsByTagName("script")[0]; o.parentNode.insertBefore(e, o);
		})(window, document, "groobee");
		groobee("serviceKey", "07c48b9c71c24772833ea6ce650aa47f");
		groobee("siteType", "godomall"); // PC : godomall, 모바일 : godomall_m
	</script>
	<!-- End of Groobee Script -->
	


	<script src="./res/common.js.다운로드"></script>
	<script src="./res/godo.cart_tab.js.다운로드"></script>

	<link rel="styleSheet" href="./res/style.css">
	<link rel="styleSheet" href="./res/style(1).css">
	<link href="./res/SpoqaHanSans-kr.css" rel="stylesheet" type="text/css">
	<link href="./res/SpoqaHanSans-jp.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		body {}

		/* body > #wrap : 컨테이너 전체를 감싸는 영역 */
		#wrap {
			width: 100%;

		}

		/* body > #wrap > #container : 상단, 메인, 하단을 감싸는 영역 */
		#container {
			background: none;
			width: 100%;
		}

		/* body > #wrap > #container > #main : 측면과 본문을 감싸는 영역 */
		#main {
			width: 1100px;
			margin: 0 auto;
		}

		/* body > #wrap > #container > #main > #content : 본문 영역 */
		#content {
			width: 1100px;
			margin : 0 auto;
		}

		/* body > #wrap > #container > #main > #footer : 하단 영역 */
		#footer {
			margin-left: auto;
			margin-right: auto;

		}

		/* body > #wrap > #container > #main > #footer > #footer_wrap, #footer_top, #footer_bottom : 하단영역의 사이즈 지정 */
		#footer_wrap,
		#footer_top,
		#footer_bottom {}

		/* body > #wrap > #pos_scroll : 스크롤배너의 상단 위치를 지정 */
		#pos_scroll {
			position: absolute;
			top: 1176px;
		}

		/* body > #wrap > .scroll-banner : 좌우측스크롤배너 공통 */
		.scroll-banner {
			position: absolute;
			top: 40px;
		}

		/* body > #wrap > #scroll : 좌측스크롤배너 전용 */
		#scroll {
			left: 50%;
			margin-left: 550px;
			padding-left: 30px;
			width: 110px;
		}
	</style>
	<script src="./res/jquery-1.10.2.min.js.다운로드"></script>
	<script src="./res/jquery.banner.js.다운로드"></script>
	<script src="./res/jquery.form.min.js.다운로드"></script>
	<script src="./res/jquery.bpopup.min.js.다운로드"></script>

	<script type="text/javascript" src="./res/wcslog.js.다운로드"></script>
	<script type="text/javascript" src="./res/naverCommonInflowScript.js.다운로드" id="naver-common-inflow-script"></script>

	<!-- Google Tag Manager -->
	<script>
		dataLayer = [];
		dataLayer_products = [];
	</script>
	<script>
		(function (w, d, s, l, i) {
		w[l] = w[l] || []; w[l].push({
			'gtm.start':
				new Date().getTime(), event: 'gtm.js'
		}); var f = d.getElementsByTagName(s)[0],
			j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
				'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
		})(window, document, 'script', 'dataLayer', 'GTM-546894D');
	</script>

	<!-- End Google Tag Manager -->

	<script type="text/javascript" charset="UTF-8" src="./res/kp.js.다운로드"></script>
	<script type="text/javascript">
		kakaoPixel('3696278984956819256').pageView();
	</script>


	<script type="text/javascript">
		function BR4G41114616148() { gcode_act(); }
		if (typeof EL_GUL == 'undefined') {
			var EL_GUL = 'dgc20.acecounter.com'; var EL_GPT = '8080'; var _AIMG = new Image(); var _bn = navigator.appName; var _PR = location.protocol == "https:" ? "https://" + EL_GUL : "http://" + EL_GUL + ":" + EL_GPT; if (_bn.indexOf("Netscape") > -1 || _bn == "Mozilla") { setTimeout("_AIMG.src = _PR+'/?cookie';", 1); } else { _AIMG.src = _PR + '/?cookie'; };
			var GCODE = 'BR4G41114616148';
			document.writeln("<scr" + "ipt language='javascript' src='/shop/lib/js/acecounter_V70.js'></scr" + "ipt>");
		}
	</script>
	<script language="javascript" src="./res/acecounter_V70.js.다운로드"></script>
	<script async="" type="text/javascript" src="./res/uacid.js.다운로드"></script>

	<noscript><img src='http://dgc20.acecounter.com:8080/?uid=BR4G41114616148&je=n&' border=0 width=0
			height=0></noscript>
	<!--Facebook Pixel Code -->
	<script>!function (f, b, e, v, n, t, s) { if (f.fbq) return; n = f.fbq = function () { n.callMethod ? n.callMethod.apply(n, arguments) : n.queue.push(arguments) }; if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0'; n.queue = []; t = b.createElement(e); t.async = !0; t.src = v; s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s) }(window, document, 'script', 'https://connect.facebook.net/en_US/fbevents.js'); fbq('init', '370778903293933'); fbq('track', 'PageView');</script>
	<noscript><img height="1" width="1" style="display:none"
			src="https://www.facebook.com/tr?id=370778903293933&ev=PageView&noscript=1" /></noscript>
	<!-- End Facebook Pixel Code -->
	<script>addOnloadEvent(function () {
			var c = document.createElement('iframe');
			c.width = '100px';
			c.height = '200px';
			c.style.display = 'none';
			c.id = 'ifcr';
			newdiv = document.createElement('div');
			newdiv.id = 'divcr';
			document.body.appendChild(newdiv);
			mydiv = document.getElementById('divcr');
			mydiv.appendChild(c);
			document.getElementById('ifcr').src = '../partner/criteoscript.php?mode=get_main&type=&email=';
		});</script>
	<script src="./res/f(1).txt"></script>
	<script src="./res/f(2).txt"></script>
	<script async="" src="./res/modules.b673a4e777488c1ea895.js.다운로드"
		charset="utf-8"></script>
	<style type="text/css">
		iframe#_hjRemoteVarsFrame {
			display: none !important;
			width: 1px !important;
			height: 1px !important;
			opacity: 0 !important;
			pointer-events: none !important;
		}
	</style>
</head>