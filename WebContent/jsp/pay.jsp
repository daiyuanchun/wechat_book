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
<title>微信支付</title>
<style type="text/css">
#yuan{
margin: 0 auto;
width:800px;
margin-top:200px;
text-align: center;
font-size: 80px;
font-weight: bolder;
}
#dai{
margin: 0 auto;
width:800px;
margin-top: 100px;
}

</style>
</head>
<body>
<div id="yuan">
<p>交100元押金</p>
</div>
<div id="dai">
<img  src="/borrowQrcode/pay.png" width="800px" height="800px"/>
</div>

</body>
</html>
