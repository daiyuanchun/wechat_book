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
			<div
				style="float: left; width: 50px; height: 20px; margin-left: 40px;">
				操作</div>
		</div>
		<br/>
		<c:forEach items="${requestScope.todayRecord}" var="todayRecord">
		<div class="book">
			<img src="/cover/${todayRecord.cover}" class="img" />
			<div class="msg">
				${todayRecord.name}<br/>
				${todayRecord.author}
				
			</div>
			<div class="num" style="margin-left: 100px;">${todayRecord.num}</div>
			<div class="kind" style="margin-left: -8px;">${todayRecord.type}</div>
			<div class="address" style="margin-left: 40px; width:75px;">${todayRecord.position}</div>
			<div class="operate">
			<form action="${pageContext.request.contextPath}/deleteBorrowRecord.action" method="post">
			<input type="hidden" name="id" value="${todayRecord.wechatid}"/>
			<input type="hidden" name="tel" value="${todayRecord.tel}"/>
			<input type="hidden" name="isbn" value="${todayRecord.isbn}"/>
			<input type="hidden" name="uuid" value="${todayRecord.uuid}"/>
			<input type="submit" value="移除" style="margin-left: 20px; width:80px;font-size: 25px;"  class="btn" />
			</form>
			</div>
		</div>
		</c:forEach>
		<br />
		<form action="${pageContext.request.contextPath}/deletePresetRecord.action"  method="post">
		 <input type="submit" id="confirm" value="确认借书" />
		 </form>
	</div>
	<script type="text/javascript">
	var message='${requestScope.borrowBookMessage}';
	if(message=='no'){
		alert("您未预订此书，不能借此书！");
	}
	if(message=='beyondNum'){
		alert("一个用户一次最多可借2本书！");
	}
	</script>
	<script>
		var mes = '${sessionScope.systemOfPreset}';
		if (mes == 'have') {
			alert("\n您要预定的图书已经有书了\n\n请尽快在系统消息页面查看奥!");
		}
	</script>
</body>
</html>
