<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>图书导航</title>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.enplaceholder.js" type="text/javascript" charset="utf-8"></script>
<script src="js/base.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/sea.js"></script>
<script type="text/javascript" src="js/base(1).js"></script>
<script src="js/MD5.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-validate-1.12.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/validate-common.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/check_reg.js"></script>
<script src="js/jquery.pagination.js" type="text/javascript"></script>
<script type="text/javascript">

	$(
			function() {
				var typeId = $("#typeId").val();
				if ($("#industryUL li a[value='" + typeId + "']").size() > 0) {
					$("#industryUL li a").removeClass("active");
					$("#industryUL li a[value='" + typeId + "']").addClass(
							"active");
				};
				var provinceId = $("#provinceId").val();
				if ($("#locationUL li a[value='" + provinceId + "']").size() > 0) {
					$("#locationUL li a").removeClass("active");
					$("#locationUL li a[value='" + provinceId + "']").addClass(
							"active");
				}
				;
				var cityId = $("#cityId").val();
				if ($("#cityUL li a[value='" + cityId + "']").size() > 0) {
					$("#cityUL li a").removeClass("active");
					$("#cityUL li a[value='" + cityId + "']").addClass(
							"active");
				}
				;

				//注册事件-项目领域
				$("#industryUL li a").click(
						function() {
							var typeId = $(this).attr("value");
							if ($("#industryUL li a[value='" + typeId + "']").size() > 0) {
								$("#industryUL li a").removeClass("active");
								$("#industryUL li a[value='" + typeId + "']").addClass("active");
								$("#typeId").val(typeId);
								$("#searchform").submit();
							}
						});
				$("#locationUL li a").click(
						function() {
							var provinceId = $(this).attr("value");
							if ($("#locationUL li a[value='" + provinceId + "']").size() > 0) {
								$("#locationUL li a").removeClass("active");
								$("#locationUL li a[value='" + provinceId + "']").addClass("active");
								$("#provinceId").val(provinceId);
								$("#searchform").submit();
							}
						});
				//注册事件-融资阶段
				$("#cityUL li a").click(
						function() {
							var cityId = $(this).attr("value");
							if ($("#cityUL li a[value='" + cityId + "']").size() > 0) {
								$("#cityUL li a").removeClass("active");
								$("#cityUL li a[value='" + cityId + "']").addClass("active");
								$("#cityId").val(cityId);
								$("#searchform").submit();
							}
						});

			})
</script>
<style type="text/css">
#dai{
margin: 0 auto;
width:900px;
}
.content{
margin: 0 auto;
width:1100px;
}
</style>
</head>

<body id="dai" >
<div style="font-weight: bolder;">
<!--头部-->
<c:import url="header.jsp"/>
</div>
<!--end 头部-->
	<div class="content"  style="width:1000px;">
		<!--内容区-->
		<div class="srh-wp-box" style="width:1100px;">
			<div class="wrap">
				<form action="${pageContext.request.contextPath}/searchVOBook.action" id="searchform" name="searchform" method="post">
					<input type="hidden" id="page" name="page" value="1">
					<div class="screen-box">
						<div class="sl-wrap clearfix">
							<div class="sl-key" style="font-size:25px;">所属学科类型：</div>
							<div class="sl-value">
								<div class="sl-v-list">
									<ul class="valueList" id="industryUL" style="font-size:22px;">
										<input id="typeId" type="hidden" name="typeId" value="${empty param.typeId?-1:param.typeId}"/>
										<li><a value="-1" title="不限" class="active" href="javascript:void(0);">不限</a></li>
										<c:forEach items="${requestScope.typeList}" var="type">
										<li><a value="${type.id}" title="${type.type}" href="javascript:void(0);">${type.type}</a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="sl-ext" style="font-size:22px;">
								<span><em>更多</em><i class="icon"></i></span>
							</div>
						</div>
						<div class="sl-wrap clearfix">
							<div class="sl-key" style="font-size:25px;">
								所&nbsp;属&nbsp;&nbsp;&nbsp;省&nbsp;&nbsp;份：</div>
							<div class="sl-value">
								<div class="sl-v-list">
									<ul class="valueList" id="locationUL" style="font-size:22px;">
										 <input type="hidden" name="provinceId" id="provinceId"  value="${empty param.provinceId?-1:param.provinceId}"> 
										<li><a value="-1" title="不限" class="active" href="javascript:void(0);">不限</a></li>
										<c:forEach items="${requestScope.provinceList}" var="province">
										<li><a value="${province.id}" title="${province.province}" href="javascript:void(0);">${province.province}</a></li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="sl-ext" style="font-size:22px;">
								<span><em>更多</em><i class="icon"></i></span>
							</div>
						</div>
						<div class="sl-wrap clearfix">
							<div class="sl-key" style="font-size:25px;">所&nbsp;属&nbsp;&nbsp;&nbsp;城&nbsp;&nbsp;市：</div>
							<div class="sl-value">
								<div class="sl-v-list">
									<ul class="valueList" id="cityUL" style="font-size:22px;">
										<input type="hidden" name="cityId" id="cityId" value="${empty param.cityId?-1:param.cityId}">
										<li><a value="-1" title="不限" class="active" href="javascript:void(0);">不限</a></li>
										<li><a value="1" title="是省会" href="javascript:void(0);">是省会</a></li>
										<li><a value="0" title="不是省会" href="javascript:void(0);">不是省会</a></li>
									</ul>
								</div>
							</div>
						</div>
				</form>
				 <div class="tab">
					<c:choose>
						<c:when test="${empty requestScope.bookList }">
							<center><h1><font style="font-size: 24px;font-family:幼圆 ;">查询无结果</font></h1></center>
						</c:when>
						<c:otherwise>
							<ul class="tabs-list clearfix">
							<c:forEach items="${requestScope.bookList }" var="book">
								<li>
									<div class="hd">
										<p class="phot">
										<!--  <a href="infofindbyid.do?id=${book.title}">  -->
										<a href="jsp/bookMessage.jsp"><img  border="0" src="/cover/${book.cover}" width="100px"  height="375px" /></a>
										</p>
									</div>
									<div class="bd">
										<p class="name" style="font-size: 25px;">
											<a href="${pageContext.request.contextPath}/bookAllMessage.action?isbn=${book.isbn}">${book.title}</a>
											
										</p>
										<p class="tits" style="font-size: 20px;">作者：<a>${book.author}</a></p>
										<p class="weal" style="font-size: 20px;">
										
					                     <a javascript:void(0);="" class="one">藏书量：${book.number}</a>
										</p>
										<p class="link" style="font-size: 20px;">
										  <a javascript:void(0);="">图书类型：${book.type.type}</a>
										</p>
										<p class="link" style="font-size: 20px;">
										<a javascript:void(0);="">所处位置：${book.province.province}${book.city}</a>
									    </p>
									</div>
								</li>
							</c:forEach>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="paging">
				<div class="paging-box">
					<script type="text/javascript">
						function topage(page){
							$("#page").val(page);
							$("#searchform").submit();
						}
					</script>
					<ul>
						<c:choose>
							<c:when test="${requestScope.page eq 1 }">
								<li style="font-size:25px;"><a title="上一页" href="javascript:void(0);">&lt;&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li style="font-size:25px;"><a title="上一页" href="javascript:topage(${requestScope.page-1});">&lt;&lt;</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="index" begin="1" end="${requestScope.pageCount}">
							<c:choose>
								<c:when test="${index eq requestScope.page }">
									<li style="font-size:25px;"><a class="active" href="javascript:void(0);">${index}</a></li>
								</c:when>
								<c:otherwise>
									<li style="font-size:25px;"><a href="javascript:topage(${index});">${index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${requestScope.page eq requestScope.pageCount }">
								<li style="font-size:25px;"><a title="下一页" href="javascript:void(0);">&gt;&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li style="font-size:25px;"><a title="下一页" href="javascript:topage(${requestScope.page+1});">&gt;&gt;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
				<!--end 分页-->

			</div>
		</div>
		<!--srh-wp-box End-->
		<!--end 内容区-->
	</div>

	<!--底部-->
	<script>
		var mes = '${sessionScope.systemOfPreset}';
		if (mes == 'have') {
			alert("\n您要预定的图书已经有书了\n\n请尽快在系统消息页面查看奥!");
		}
	</script>
</body>
</html>
