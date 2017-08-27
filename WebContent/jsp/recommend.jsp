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
<script src="js/jquery-3.0.0.min.js"></script>
<link rel="stylesheet" href="/css/recommend.css" />
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
<script src="js/jquery-3.0.0.min.js"></script>
<style type="text/css">
#container {
	margin: 0 auto;
	margin-top: 50px;
	width: 900px;
	font-size: 25px;
	margin-left: 100px;
}

.title {
	width: 900px;
	height: 20px;
	padding: 20px;
}

.book {
	width: 900; px;
	height: 150px;
	border: 1px solid black;
	padding: 30px;
	background-color: beige;
}

.img {
	display: block;
	float: left;
	width: 150px;
	height: 150px;
}

.msg {
	width: 200px;
	float: left;
	margin-left: 10px;
}

.num, .kind, .address {
	width: 100px;
	float: left;
	vertical-align: middle;
	margin-top: 40px;
}
</style>
</head>
<body>
<div style="font-weight: bolder;">
	<c:import url="header.jsp" />
	</div>
	<div id="container">
		<form action="${pageContext.request.contextPath}/updateUserRecommendFrequency.action" method="post">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您可以设置推荐频率：<select name="recommendFrequency" style="font-size: 22px;">
				<c:choose>
					<c:when test="${empty sessionScope.frequency}">
						<option value="0">请选择</option>
					</c:when>
					<c:otherwise>
					<c:if test="${sessionScope.frequency eq 0}">
					<option value="${sessionScope.frequency}">关闭推荐</option>
					</c:if>
					<c:if test="${sessionScope.frequency eq 1}">
						<option value="${sessionScope.frequency}">每${sessionScope.frequency}天推荐一次</option>
					</c:if>
					<c:if test="${sessionScope.frequency eq 10}">
					<option value="${sessionScope.frequency}">每${sessionScope.frequency}天推荐一次</option>
					</c:if>
					<c:if test="${sessionScope.frequency eq 20}">
					<option value="${sessionScope.frequency}">每${sessionScope.frequency}天推荐一次</option>
					</c:if>
					<c:if test="${sessionScope.frequency eq 30}">
					<option value="${sessionScope.frequency}">每${sessionScope.frequency}天推荐一次</option>
					</c:if>
					</c:otherwise>
					</c:choose>
					<option value="1">每1天推荐一次</option>
					<option value="10">每10天推荐一次</option>
					<option value="20">每20天推荐一次</option>
					<option value="30">每30天推荐一次</option>
					<option value="0">关闭推荐</option>
			</select>
			&nbsp;&nbsp;<input type="submit" value="确认设置"  style="font-size: 23px;"/>
		</form>
		<div class="title">
			<div
				style="float: left; width: 100px; height: 20px; margin-left: 50px;">
				图书封面</div>
			<div
				style="float: left; width: 120px; height: 20px; margin-left: 100px;">
				书名/作者</div>
			<div
				style="float: left; width: 80px; height: 20px; margin-left: 65px;">
				藏书量</div>
			<div
				style="float: left; width: 100px; height: 20px; margin-left: 40px;">
				所属类别</div>
			<div
				style="float: left; width: 100px; height: 20px; margin-left: 40px;">
				所在地址</div>

		</div>
		<br />
		<c:forEach items="${sessionScope.recommendList}" var="recommendList">
			<div class="book">
				<img src="/cover/${recommendList.cover}" class="img" />
				<div class="msg">
					<p>
						<a
							href="${pageContext.request.contextPath}/bookAllMessage.action?isbn=${recommendList.isbn}">${recommendList.name}</a>
					</p>
					<p>${recommendList.author}</p>
				</div>
				<div class="num" style="margin-left: 90px;">${recommendList.number}</div>
				<div class="kind" style="margin-left: 0px;">${recommendList.type.type}</div>
				<div class="address" style="margin-left: 40px; width: 75px;">${recommendList.province.province}${recommendList.city}</div>
			</div>
			<br />
		</c:forEach>
		<br />
	</div>
	<script>
		var mes = '${sessionScope.systemOfPreset}';
		if (mes == 'have') {
			alert("\n您要预定的图书已经有书了\n\n请尽快在系统消息页面查看奥!");
		}
		var su = '${requestScope.updateSuccess}';
		if(su=='updateSuccess'){
			alert("\n设置推荐频率成功");
		}
	</script>
</body>
</html>
