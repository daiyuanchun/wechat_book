<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8" />
<title></title>
<base href="<%=basePath%>">
<script src="js/jquery-3.0.0.min.js"></script>
<style type="text/css">
#my {
	margin: 0 auto;
	width: 500px;
}

.button {
	margin: 0 auto;
	width: 500px;
	height: 80px;
	text-align: center;
	font-size: 30px;
	color: white;
	background: red;
}
#daiyuanchun{
margin: 0 auto;
width:500px;
margin-top:400px;
font-size: 40px;
font-weight: bolder;
}
</style>
<link rel="stylesheet" href="/css/bus.css" />
</head>
<body>
	<c:choose>
	<c:when test="${requestScope.length eq 0}">
	<div id="daiyuanchun">用户不需要支付逾期金额！</div>
	</c:when>
	<c:otherwise>
		<div id="container">
			<div class="title">

				<div
					style="float: left; width: 100px; height: 20px; margin-left: 20px;">
					图书封面</div>
				<div
					style="float: left; width: 120px; height: 20px; margin-left: 20px;">
					书名/作者</div>
				<div
					style="float: left; width: 80px; height: 20px; margin-left: 180px;">
					借书时间</div>
				<div
					style="float: left; width: 100px; height: 20px; margin-left: 20px;">
					还书时间</div>
				<div
					style="float: left; width: 100px; height: 20px; margin-left: 30px;">
					应付金额</div>
			</div>
			<br />
			<c:forEach items="${requestScope.borrowRecordForReturnBooks}"
				var="borrowRecordForReturnBooks">
				<div class="book">
					<img src="/cover/${borrowRecordForReturnBooks.cover}" class="img" />
					<div class="msg">
						<p>${borrowRecordForReturnBooks.name}</p>
						<p>${borrowRecordForReturnBooks.author}</p>
					</div>
					<div class="num" style="margin-left: 100px;">${borrowRecordForReturnBooks.borrowtime}</div>
					<div class="kind" style="margin-left: -8px;">${borrowRecordForReturnBooks.realtime}</div>
					<div class="address" style="margin-left: 40px; width: 75px;">${borrowRecordForReturnBooks.pay}</div>
				</div>
			</c:forEach>
			<br /> <br /> <br />
		</div>
		<div id="my">
			<input type="button" value="用户支付完成" class="button" name="out"
				onclick="window.open('${pageContext.request.contextPath}/jsp/pay.jsp')" />
			<br /> <br /> <br /> <br />
		</div>
	</c:otherwise>
	</c:choose>
</body>
</html>
