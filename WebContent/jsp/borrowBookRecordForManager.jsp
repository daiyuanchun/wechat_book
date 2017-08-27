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
#my{
margin: 0 auto;
width:500px;

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


</style>
<link rel="stylesheet" href="/css/bus.css" />
</head>
<body>
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
				藏书量</div>
			<div
				style="float: left; width: 100px; height: 20px; margin-left: 20px;">
				所属类别</div>
			<div
				style="float: left; width: 100px; height: 20px; margin-left: 30px;">
				所在地址</div>
		</div>
		<br />
		<c:forEach items="${requestScope.todayRecordOfUser}"
			var="todayRecordOfUser">
			<div class="book">
				<img src="/cover/${todayRecordOfUser.cover}" class="img" />
				<div class="msg">
					<p>${todayRecordOfUser.name}</p>
					<p>${todayRecordOfUser.author}</p>
				</div>
				<div class="num" style="margin-left: 100px;">${todayRecordOfUser.num}</div>
				<div class="kind" style="margin-left: -8px;">${todayRecordOfUser.type}</div>
				<div class="address" style="margin-left: 40px; width: 75px;">${todayRecordOfUser.position}</div>
			</div>
		</c:forEach>
		<br />
		<br />
		<br />
	</div>
	<div id="my">
		<input type="button" value="确  认  借  书 " class="button" name="out"
			onclick="window.open('${pageContext.request.contextPath}/jsp/pay.jsp')" />
	<br/><br/><br/><br/>
	<form action="${pageContext.request.contextPath}/selectBorrowRecordForReturnBooks.action" method="post">
	<input type="hidden" name="id" value="${requestScope.id }"/>
	<input type="hidden" name="tel" value="${requestScope.tel }"/>
	<input type="hidden" name="borrowTime" value="${requestScope.borrowTime }"/>
    <input type="submit" value="确  认  还  书  " class="button" />	
	</form>
	</div>
</body>
</html>
