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
<style type="text/css">
</style>
</head>
<body>
	<!--头部-->
	<div class="header" style="margin: 0 auto; width:1200px; font-size: 30px;">
		<div class="wrap clearfix">
			<div class="">
				<h1 class="logo" style="margin: 0;">
					<span></span>
				</h1>
			</div>
			<div class="client_side fl">
				<ul class="main_nav clearfix" style="font-size: 30px;">
					<c:choose>
						<c:when
							test="${empty sessionScope.person}&&${empty sessionScope.teacher }&&${empty sessionScope.company }">
							<li class="fl"><a href="">首页</a></li>
							<li class="fl" id="xmdj"><a href="javascript:void(0);">图书导航</a></li>
							<li class="fl" id="irp"><a href="javascript:void(0);">个人中心</a></li>
							<li class="fl"><a href="jsp/pay.jsp">支付平台</a></li>
							<li class="fl" id="dai"><a href="jsp/connectUs.jsp">联系我们</a></li>
						</c:when>
						<c:otherwise>
							<li class="fl" ><a
								href="${pageContext.request.contextPath}/someBooks.action">首页</a></li>
							<li class="fl" id="xmdj"><a
								href="${pageContext.request.contextPath}/searchVOBook.action">图书导航</a></li>
							<li class="fl" id="irp"><a href="${pageContext.request.contextPath}/presetAndBorrowMessage.action">个人中心</a></li>
							<li class="fl">
							<a href="${pageContext.request.contextPath}/selectHistorySearchRecord.action">推荐阅读</a>
							</li>
							<li class="fl">
							<a href="jsp/systemRemind.jsp">消息提醒</a>
							</li>
							<li class="fl"><a href="jsp/pay.jsp">支付平台</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="client_login fl">
				<c:if test="${not empty sessionScope.user }">
					<span class="ueser_box fl"><i class="photo"></i> 
					<c:choose>
					<c:when test="${empty sessionScope.user.image}">
					<img class="header_img" src="images/head-default-img.png"
						width="32" height="32"> 
					</c:when>
					<c:otherwise>
					<img class="header_img" src="/upimg/${sessionScope.user.image}"
						width="32" height="32"> 
					</c:otherwise>
					</c:choose>
					</span>
					<p class="fl ueser_cnt">
						<a href="javascript:void(0);">${sessionScope.user.id}</a>
					&nbsp;&nbsp; <a href="">退出</a>
					</p>
				</c:if>
			</div>
			<div class="client_search fl">
				
			</div>
		</div>
	</div>
	<!--end 头部-->
</body>
</html>
