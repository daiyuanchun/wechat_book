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
<title>相关书籍</title>
<base href="<%=basePath%>">
<style type="text/css">
#daiyuanchun1 {
	margin: 0 auto;
	width: 900px;
	height: 80px;
}

#daiyuanchun2 {
	margin: 0 auto;
	margin-top: 50px;
	width: 800px;
	font-size: 25px;
}

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

.book {
	width: 900px;
	height: 300px;
	border: 0px solid black;
	padding: 30px;
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
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
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
<script src="js/validate-common.min.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="js/check_reg.js"></script>
</head>
<body>
	<div id="daiyuanchun1">
		<c:import url="header.jsp" />
	</div>
	<div id="daiyuanchun2">
		<c:forEach items="${requestScope.relevantBookList }"
			var="relevantBookList" begin="0" end="${requestScope.num }">
			<div class="book">
				<img src="/cover/${relevantBookList.cover}" class="img" />
				<div class="msg">
					<p>
						<a
							href="${pageContext.request.contextPath}/bookAllMessage.action?isbn=${relevantBookList.isbn}">${relevantBookList.title }</a>
					</p>
					<p style="font-size: 25px;">
						<br />${relevantBookList.author}</p>
				</div>
				<div class="num"
					style="margin-left: 28px; font-size: 16px; margin-top: 25px;">
					藏书量：${relevantBookList.number }<br />
					<br /> 图书类型：${relevantBookList.type.type}<br />
					<br />
					所在位置：${relevantBookList.province.province}${relevantBookList.city}
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