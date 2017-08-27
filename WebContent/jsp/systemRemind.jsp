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
<meta charset="utf-8" />
<title>系统提醒</title>
</head>
<body>
<br/>
<br/>
	<c:choose>
		<c:when test="${empty requestScope.booksListOfSystemRemind}">
			<p style="margin: 0 auto; width: 800px; font-size: 30px;">您暂时还没有有书提醒！</p>
		</c:when>
		<c:otherwise>
			您的有书消息提醒
	<c:forEach items="${requestScope.booksListOfSystemRemind}"
				var="booksListOfSystemRemind">
                     书名： ${booksListOfSystemRemind.title }<br>
				<br>
				<br>

			</c:forEach>
		</c:otherwise>
	</c:choose>
     <br/><br/>
	<c:choose>
		<c:when test="${empty requestScope.booksListOfSystemRemind}">
			<p style="margin: 0 auto; width: 800px; font-size: 30px;">您暂时还没有还书消息提醒！</p>
		</c:when>
		<c:otherwise>
			您的还书消息提醒
	<c:forEach items="${sessionScope.returnBookRemindList}"
				var="returnBookRemindList">
                     书名： ${returnBookRemindList.name}<br>
				<br>
				<br>

			</c:forEach>

		</c:otherwise>
	</c:choose>

	<script>
		var mes = '${sessionScope.systemOfPreset}';
		if (mes == 'have') {
			alert("\n您要预定的图书已经有书了\n\n请尽快在系统消息页面查看奥!");
		}
	</script>
</body>
</html>
