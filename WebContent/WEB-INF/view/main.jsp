<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<%@ include file="../include/head.jsp"%>
<body style="">
<%@ include file="../include/top.jsp"%>
<style>
#new_arrival .listwrap .innerwrap {
	padding: 30px 0;
}
/*슬라이드 몸통 */
.slide {
	text-align: center;
	position: relative;
	width: 100%;
	margin: 0 auto;
	display: block;
	height: 480px;
}

.slide_ul {
	display: block;
	width: 100%
}

.slide_ul>li {
	position: absolute;
	top: 0;
	left: 0;
	list-style: none;
	z-index: 10;
	display: block;
	width: 100%;
}

.slide_ul>li a {
	display: block;
	width: 100%;
	height: 480px;
	text-align: center;
}

.show {
	display: block;
}

/* 하단 동그라미 버튼 CSS*/
.slide_btn>li {
	float: left;
	margin: 0 5px 5px 0;
}

.slide_btn>li>a {
	display: block;
	width: 14px;
	height: 14px;
	background: url(/shop/data/skin/mera_ws/img/main/spr.png) -24px -125px;
	text-indent: -999em;
}

.slide_btn>li>a.active {
	background-position: 0 -126px;
}

.slide_btn {
	z-index: 100;
	position: absolute;
	left: 50%;
	bottom: 0;
	margin-left: -25px;
}

.slide_btn:after {
	content: '';
	display: block;
	clear: both;
}

.slide_btn {
	*zoom: 1;
}

/* 메인비주얼 이미지 변경  */
.visu1 {
	background:
		url(http://zipbanchan.godohosting.com/banner/banner_main/banner_main_1.jpg)
		repeat-x center top;
}

.visu2 {
	background:
		url(http://zipbanchan.godohosting.com/banner/banner_main/banner_main_2.jpg)
		repeat-x center top;
}

.visu3 {
	background:
		url(http://zipbanchan.godohosting.com/banner/banner_main/banner_main_3.jpg)
		repeat-x center top;
}
</style>

	<div class="slide">
		<ul class="slide_ul">
			<li style="display: none;">
				<a href="#" class="visu1"></a>
			</li>
			<li style="display: none;">
				<a href="#" class="visu2"></a>
			</li>
			<li style="display: block;">
				<a href="#" class="visu3"></a>
			</li>
		</ul>
	</div>

<%@ include file="../include/bottom.jsp"%>
</body>
</html>