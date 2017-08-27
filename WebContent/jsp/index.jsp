<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>主页功能</title>
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="js/jquery-1.11.3.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/jquery.enplaceholder.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/base.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/sea.js"></script>
<script type="text/javascript" src="js/base(1).js"></script>
<script src="js/MD5.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-validate-1.12.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/jquery.SuperSlide.2.1.1.js"></script>

<style type="text/css">
.tabs_title span {
	cursor: pointer;
}

<style type ="text/css">
#head {
	margin: 0 auto;
	width: 1500px;
	height: 150px;
}

#dd {
	margin: 0 auto;
	width: 900px;
}

#dai {
	width: 900px;
}

#container {
	margin: 0 auto;
	margin-top: 50px;
	width: 800px;
	font-size: 25px;
}

.book {
	width: 800px;
	height: 300px;
	border: 0px solid black;
	padding: 10px;
	background-color: white;
}

.img {
	display: block;
	float: left;
	width: 200px;
	height: 240px;
}

.msg {
	width: 200px;
	float: left;
	margin-left: 10px;
}

.num, .address {
	width: 300px;
	float: left;
	vertical-align: middle;
	margin-top: 40px;
}

.operate {
	width: 100px;
	float: left;
	margin-left: 20px;
	margin-top: 40px;
}

.operate .btn {
	width: 120px;
	height: 40px;
	border-radius: 5px;
}

#confirm {
	width: 280px;
	height: 80px;
	border-radius: 10px;
	font-size: 30px;
	display: block;
	margin-left: 43%;
}

a {
	text-decoration: none;
}
</style>

<script src="js/jqBanner.js" type="text/javascript"></script>
<script src="js/TabSwitch.js" type="text/javascript"></script>
<script src="js/jquery.pagination.js" type="text/javascript"></script>
<link href="css/base(2).css" rel="stylesheet" type="text/css">
<link href="css/index(1).css" rel="stylesheet" type="text/css">
<style>
/*红包弹窗*/
.lucky .bd {
	font-size: 14px;
}

.lucky .gxn {
	color: #ff9e12;
}

.lucky .yhd {
	color: #333333;
	font-weight: bold;
}

.lucky .money {
	font-size: 24px;
	color: #ff5050;
	font-weight: bold;
}

.lucky .ts {
	font-size: 12px;
	color: #999999;
}

/*红包弹窗*/
.hb-layer {
	background-color: transparent;
	border: none;
	width: 727px;
	height: 579px;
	background: url(../front/dist/images/hb-bg.png) no-repeat center top;
	margin-left: -363px;
	margin-top: -289px;
}

.hb-main {
	width: 510px;
	margin-left: 80px;
	padding: 30px;
}

.hb-main .hd {
	position: relative;
	padding-left: 103px;
	min-height: 88px;
}

.hb-main .hd-img {
	width: 88px;
	height: 88px;
	position: absolute;
	left: 0;
	top: 0;
}

.hb-main .hb-xmname {
	padding-bottom: 3px;
	font-size: 18px;
	font-weight: bold;
}

.hb-main .hb-tg {
	font-size: 24px;
	font-weight: bold;
	color: #11a551;
}

.hb-main .hb-tg img {
	vertical-align: middle;
}

.hb-main .hb-txt {
	margin-top: 10px;
	text-align: center;
	font-size: 18px;
}

.hb-main .hb-txt span {
	color: #bc2414;
}

.hb-main .hb-img img {
	width: 100%;
	height: 163px;
	border-radius: 3px;
	margin: 15px 0 40px;
}

.hb-cqbtn {
	width: 130px;
	height: 130px;
	display: inline-block;
	position: absolute;
	left: 50%;
	bottom: 44px;
	z-index: 1002;
	border-radius: 50%;
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	color: #be8600;
	overflow: hidden;
	margin-left: -80px;
}

.hb-cqbtn span {
	position: relative;
	top: 6px;
}

#searchForm {
	width: 800px;
	margin: 10px auto;
	background: rgba(249, 249, 249, 1.00);
	padding: 0px;
}

#searchForm .input-text {
	border: 2px #CCCCCC solid;
	height: 40px;
	width: 700px;
	font-size: 16px;
}

#searchForm .input-btn {
	width: 80px;
	height: 40px;
	border: 0;
	background: rgba(239, 11, 15, 1.00);
	color: white;
	font-weight: bold;
	font-size: 16px;
}

#userlogin .input-btn:hover {
	background: rgba(126, 2, 4, 1.00);
	cursor: pointer;
}
</style>
<script charset="utf-8"
	src="js/tj.js$312439383232313736385f3236393932243930333032663362333236353466343961633364313933616263316435633836$1447643360"></script>
</head>
<style>
.header_img {
	border-radius: 100%;
}
</style>
</head>
<body>
	<!--头部-->
	<div style="font-weight: bolder;">
	<c:import url="header.jsp" />
	</div>
	<form
		action="${pageContext.request.contextPath}/searchBookByKeywords.action"
		method="post" name="searchForm" id="searchForm">
		<input type="text" name="search" class="input-text"
			placeholder="  可以通过关键字、拼音全拼或者首字母、图书编号等搜索书籍" /> <input type="submit"
			name="searchSubmit" class="input-btn" value="搜索" />
	</form>
	<div id="container">
		<c:forEach items="${requestScope.someBooks}" var="someBooks" begin="0"
			end="${requestScope.num }">
			<div class="book">
				<img src="/cover/${someBooks.cover}" class="img" />
				<div class="msg">
					<p>
						<a
							href="${pageContext.request.contextPath}/bookAllMessage.action?isbn=${someBooks.isbn}">${someBooks.title }</a>
					</p>
					<p style="font-size: 22px;">
						<br />${someBooks.author}</p>
				</div>
				<div class="num"
					style="margin-left: 28px; font-size: 20px; margin-top: 25px;">
					所属类型：${someBooks.type.type}<br /><br/>
					所在城市：${someBooks.province.province}${someBooks.city }
				</div>
			</div>
		</c:forEach>
	</div>
	<script>
		var mes = '${sessionScope.systemOfPreset}';
		if (mes == 'have') {
			alert("\n您要预定的图书已经有书了\n\n请尽快在系统消息页面查看奥!");
		}
	</script>
</body>
</html>