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
<title>图书详情</title>
<base href="<%=basePath%>">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/book.css" />
<style>
#dai {
	margin: 0 auto;
	width: 90%;
	
}

.container1 {
	width: 90%;
	margin: 0 auto; /* 居中 */
}

.divide1 {
	background-color:;
}

.name1 {
	margin-bottom: 5px;
	font-size: 30px;
}

.msg1 {
	color: gray;
	font-size: 25px;
}

.comment1 {
	font-size: 30px;
}
</style>
</head>
<body>
	<div id="container">
		<p class="title" style="font-weight: bold; font-size: 30px;">
			<br>图书详情
		</p>
		<c:choose>
			<c:when test="${empty sessionScope.book.cover}">
				<img src="" width="200px" height="220px" class="img" />&nbsp;&nbsp;
		</c:when>
			<c:otherwise>
				<img src="/cover/${sessionScope.book.cover}" width="300px"
					height="320px" class="img" />&nbsp;&nbsp;
	    </c:otherwise>
		</c:choose>
		<p style="font-weight: bold; font-size: 20px;">${sessionScope.book.title }</p>
		<c:if test="${sessionScope.book.flag eq 1}">
			<p style="font-weight: bold; font-size: 20px;">当前状态：可借</p>
		</c:if>
		<c:if test="${sessionScope.book.flag eq 0}">
			<p style="font-weight: bold;">当前状态：已借出</p>
	</div>
	</c:if>
	<div class="buttons" style="font-weight: bold;">
		<button class="btn1">
			<a href="jsp/presetForm.jsp">在线预订</a>
		</button>
		&nbsp;
		<form
			action="${pageContext.request.contextPath}/selectRelevantBook.action"
			method="post" name="submitForm2" id="submitForm2">
			<input type="hidden" name="typeId"
				value="${sessionScope.book.typeid}" /> <input type="submit"
				value="相关书籍" class="btn2" />
		</form>
	</div>
	</div>
	<br />
	<br />
	<div id="dai">
		<ul id="myTab" class="nav nav-tabs"
			style="font-size: 30px; margin-left: 10px;">
			<li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
			<li><a href="#ios" data-toggle="tab">累积评价</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="font-size: 30px;">
			<div class="tab-pane fade in active" id="home">
				<p style="text-align: left; font-weight: bold;">图书简介</p>
				<hr>
				<ol>
					<li>出版社：${sessionScope.book.press }</li>
					<li>版本号：${sessionScope.book.version }</li>
					<li>图书作者：${sessionScope.book.author }</li>
					<li>藏书量：${sessionScope.book.number }</li>
					<div id="bb" style="height: 300px;  overflow: hidden;">
					<li>内容简介：${sessionScope.book.content }</li>
					</div>
					<div id="aa" style="height: 300px; overflow: hidden;">
					<li>序：${sessionScope.book.sequence }</li><br/>
					</div>
					<div id="cc" style="height: 300px;  overflow: hidden;">
					<li>导读：${sessionScope.book.guidance }</li><br/>
					</div>
				</ol>
				<p style="text-align: left; font-weight: bold;">图书目录</p>
				<hr>
				<div id="my" style="height: 500px; width: 800px; overflow: hidden;">
					<c:import url="/catalog/${sessionScope.book.catalog }"></c:import>
				</div>
				<a href="javascript:void(0)" id="show3"
					onclick="document.getElementById('my').style.height='';document.getElementById('hidden3').style.display='';document.getElementById('show3').style.display='none';" style="float: right;color:red;">显示全部</a>
				<a href="javascript:void(0)" id="hidden3" style="display: none;float:right;color:red;"
					onclick="document.getElementById('my').style.height='500px';document.getElementById('hidden3').style.display='none';document.getElementById('show3').style.display='';" >关闭</a>
					<br/><br/><br/>
			</div>
			<div class="tab-pane fade" id="ios">
				<c:forEach items="${sessionScope.commentList}" var="commentList">
					<div class="container1">
						<p class="name1">
							<img src="images/head-default-img.png" width="32" height="32">
							<c:if test="${commentList.anonymous eq 1}">
							匿名用户
							</c:if>
							<c:if test="${commentList.anonymous eq 0}">
							${commentList.wechatid }
							</c:if>
						</p>
						<div class="msg1">${commentList.time }&nbsp;
							类别：${commentList.type}类&nbsp; 书名：${commentList.name}</div>
						<div class="comment1">${commentList.comment }</div>
					</div>
				</c:forEach>
				<br /> <br />
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#myTab li:eq(2) a').tab('show');
		});
	</script>
	<script>
		var mes = '${sessionScope.systemOfPreset}';
		if (mes == 'have') {
			alert("\n您要预定的图书已经有书了\n\n请尽快在系统消息页面查看奥!");
		}
		var mes1 = '${sessionScope.returnBookRemind}';
		if (mes1 == 'have') {
			alert("\n还书提醒!!!!!\n\n请尽快在系统消息页面查看奥!");
		}
	</script>
</body>
</html>
