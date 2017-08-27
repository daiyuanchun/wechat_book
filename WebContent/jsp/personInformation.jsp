<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title></title>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
#head {
	margin: 0 auto;
	width: 1200px;
	height: 100px;
}

#dd {
	margin: 0 auto;
	width: 810px;
}

#daiyuan {
    margin: 0 auto;
	width: 1100px;
	margin-left: 150px;
}

#container{
	margin: 0 auto;
	margin-top: 50px;
	width: 1200px;
	font-size:25px;
}
.book{
	width: 1000px;
	height: 300px;
	border: 1px solid black;
	padding: 30px;
	background-color: beige;
}
.img{
	display: block;
	float: left;
	width: 200px;
	height: 240px;
}
.msg{
	width: 200px;
	float: left;
	margin-left: 10px;
}
.num,.address{
	width: 300px;
	float: left;
	vertical-align: middle;
	margin-top: 40px;
}
.operate{
	width: 100px;
	float: left;
	margin-left: 20px;
	margin-top: 40px;
}
.operate .btn{
	width: 120px;
	height: 40px;
	border-radius: 5px;
}
#confirm{
	width: 280px;
	height: 80px;
	border-radius: 10px;
	font-size: 30px;
	display: block;
	margin-left: 43%;
}
a{
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
<body >
	<div id="head"  style="font-weight: bolder;">
		<c:import url="header.jsp"></c:import>
	</div>
	<div id="daiyuan"  style="font-weight:normal;">
		<ul id="myTab" class="nav nav-tabs" style="font-size: 25px;">
			<li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
			<li><a href="#ios" data-toggle="tab">上传头像</a></li>
			<li><a href="#mes" data-toggle="tab">修改密码</a></li>
			<li><a href="#tel" data-toggle="tab">手机变更</a></li>
			<li><a href="#11" data-toggle="tab">预订订单</a></li>
			<li><a href="#22" data-toggle="tab">借书订单</a></li>
			<li><a href="#33" data-toggle="tab">借书二维码</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="font-size: 30px;">
			<div class="tab-pane fade in active" id="home">
				<p>
				<table>
					<tr>
						<td>&nbsp;&nbsp;微信号：</td>
						<td colspan="4">${sessionScope.user.id }</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;手机号：</td>
						<td colspan="4">${sessionScope.user.tel }</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;姓名：</td>
						<td colspan="4">${sessionScope.user.name }</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td>&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>
							<form
								action="${pageContext.request.contextPath}/updatePersonBasicMessage.action"
								id="provinceForm" method="post">&nbsp;&nbsp;邮箱：
						</td>
						<td colspan="4"><input type="text" name="email"
							value="${sessionScope.user.email }" 
							style="border: 3px #CCCCCC solid; width:500px;" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td>&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;城市:&nbsp;&nbsp;</td>
						<td colspan="4"><input type="hidden" name="idForProvince"
							value="${sessionScope.user.id}" /> <input type="hidden"
							name="telForProvince" value="${sessionScope.user.tel}" /> <select
							name="personProvince">
								<c:choose>
									<c:when test="${empty sessionScope.user.province}">
										<option value="0">请选择</option>
									</c:when>
									<c:otherwise>
										<option value="${sessionScope.user.province}" 
										style="border: 3px #CCCCCC solid; width:500px;">
										${sessionScope.province2}</option>
									</c:otherwise>
								</c:choose>
								<c:forEach items="${sessionScope.provinceList}"
									var="allProvince">
									<option value="${allProvince.id}" 
									style="border: 3px #CCCCCC solid; width:500px;">
									${allProvince.province}</option>
								</c:forEach>
						</select>&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td>&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;性别：&nbsp;&nbsp;</td>
						<td><c:choose>
								<c:when test="${not empty sessionScope.user.sex}">
									<select name="sex">
										<option value="${sessionScope.user.sex}" 
										style="border: 3px #CCCCCC solid; width:500px;">
										${sessionScope.user.sex }</option>
										<option value="男" style="border: 3px #CCCCCC solid; width:500px;">男</option>
										<option value="女" style="border: 3px #CCCCCC solid; width:500px;">女</option>
									</select>
								</c:when>
								<c:otherwise>
									<select name="sex">
									<option value="0" style="border: 3px #CCCCCC solid; width:500px;">请选择</option>
										<option value="男" style="border: 3px #CCCCCC solid; width:500px;">男</option>
										<option value="女" style="border: 3px #CCCCCC solid; width:500px;">女</option>
									</select>
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td>&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;专业：&nbsp;&nbsp;</td>
						<td colspan="5"><input type="text" name="major"
						style="border: 3px #CCCCCC solid; width:500px;"
						value="${sessionScope.user.major}" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td>&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;QQ：&nbsp;&nbsp;</td>
						<td colspan="5"><input type="text" name="qq" 
						 style="border: 3px #CCCCCC solid; width:500px;"
							value="${sessionScope.user.qq}" /></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td>&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td>&nbsp;&nbsp;</td>
						<td><input type="submit" value="保存信息" 
						style="border: 3px #CCCCCC solid; width:200px;"/></td>
					</tr>
				</table>
				</form>
				</p>
			</div>
			<div class="tab-pane fade" id="ios">
				<p>
				<table border="0">
					<tr>
						<td><c:choose>
								<c:when test="${empty sessionScope.user.image}">
									<img src="images/head-default-img.png" width="250px"
										height="250px" />&nbsp;&nbsp;
										</c:when>
								<c:otherwise>
									<img src="/upimg/${sessionScope.user.image}" width="250px"
										height="250px" />&nbsp;&nbsp;
										</c:otherwise>
							</c:choose></td>
						<td>&nbsp;&nbsp;
							<form
								action="${pageContext.request.contextPath}/updatePersonImage.action"
								method="post" enctype="multipart/form-data">
								<input type="hidden" name="idForImg"
									value="${sessionScope.user.id}" /> <input type="hidden"
									name="telForImg" value="${sessionScope.user.tel}" />
						</td>
						<td><input type="file" name="upimg" 
						/></td>
						<td><input type="submit" name="submit" 
						 value="上传头像" />
							</form></td>
					</tr>
				</table>
				</p>
			</div>
			<div class="tab-pane fade" id="mes">
				<p>
				<form
					action="${pageContext.request.contextPath}/updatePassword.action"
					method="post">
					<br/><br/>
					<input type="hidden" name="id" value="${sessionScope.user.id}" />
					<input type="hidden" name="tel" value="${sessionScope.user.tel}" />
					旧 密 码：<input type="text" name="password"
					 style="border: 3px #CCCCCC solid; width:500px;"/><br /> <br /> 新 密 码：<input
						type="text" name="newpassword" style="border: 3px #CCCCCC solid; width:500px;" /><br /> <br /> 确认密码：<input
						type="text" name="repassword" style="border: 3px #CCCCCC solid; width:500px;"/><br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="submit" style="border: 3px #CCCCCC solid; width:200px;"  value="修改密码">
				</form>
				</p>
			</div>
			<div class="tab-pane fade" id="tel">
				<p>
				<form action="${pageContext.request.contextPath}/updateTel.action"
					method="post">
					<input type="hidden" name="id" value="${sessionScope.user.id}" style="border: 3px #CCCCCC solid; width:500px;" />
					<input type="hidden" name="tel" value="${sessionScope.user.tel}" style="border: 3px #CCCCCC solid; width:500px;"/>
					账号密码：<input type="text" name="password" style="border: 3px #CCCCCC solid; width:500px;"/><br /> <br /> 旧手机号：<input
						type="text" name="tel" style="border: 3px #CCCCCC solid; width:500px;"/><br /> <br /> 新手机号：<input type="text"
						name="newTel" style="border: 3px #CCCCCC solid; width:500px;"/><br /> <br /> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"  value="修改手机"
						 style="border: 3px #CCCCCC solid; width:200px; float: center;"/>
				</form>
				</p>
			</div>
			<div class="tab-pane fade" id="33">
            <c:import url="myBorrowBookQrcode.jsp"></c:import>
			</div>
			<div class="tab-pane fade" id="11">
			<c:if test="${empty sessionScope.presetList}">
			 <center style="margin-top:60px;">您还没有未取书的在线预订记录！</center>
			</c:if>
			<script type="text/javascript">
			function check(){
				var r=confirm("\n     确认取消预订订单!");
				if (r==true){
					return true;
				}
				else{
					return false;
				}
			}
			</script>
				<div id="container">
					<c:forEach items="${sessionScope.presetList}"
						var="presetList">
						<div class="book">
							<img src="/cover/${presetList.cover}" class="img" />
							<div class="msg">
								<p>
									<a
										href="${pageContext.request.contextPath}/bookAllMessage.action?isbn=${presetList.isbn}">${presetList.title}</a>
								</p>
								<p style="font-size: 25px;"><br/>${presetList.author}</p>
							</div>
							<div class="num" style="margin-left: 28px; font-size: 16px;margin-top: 25px;">
							所属类型：${presetList.type}<br/><br/>
							所在城市：${presetList.position}<br/><br/>
							预定时间：<fmt:formatDate value="${presetList.presettime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							<br/><br/>
							取书时间：${presetList.gettime}
							</div>
							<div class="address" style="margin-left: 20px; width: 130px; font-size: 20px;">
							<form action="${pageContext.request.contextPath}/deleteOnePreset.action" method="post" onSubmit="return check()">
							<input type="hidden" name="isbn" value="${presetList.isbn}"/>
							<br>状态：未取书<br><br>
							<input type="submit" style="width:150px;height:50px;" name="submit" value="取消预订"/> 
							</form>
							</div>
						</div>
					</c:forEach>
					<br />
				</div>
			</div>
			<div class="tab-pane fade" id="22">
			<c:if test="${empty sessionScope.borrowList}">
			<center style="margin-top:60px;"> 您还没有未还书的借书记录！</center>
			</c:if>
				<div id="container">
					<c:forEach items="${sessionScope.borrowList}"
						var="borrowList">
						<div class="book">
							<img src="/cover/${borrowList.cover}" class="img" />
							<div class="msg">
								<p style="margin-top: 20px;">
									<a
										href="${pageContext.request.contextPath}/bookAllMessage.action?isbn=${borrowList.isbn}">${borrowList.name}</a>
								</p>
								<p style="font-size: 25px;"><br/><br/>${borrowList.author}</p>
							</div>
							<div class="num" style="margin-left: 28px; font-size: 16px;margin-top: 25px;">
							所属类型：${borrowList.type}<br/><br/>
							所在城市：${borrowList.position}<br/><br/>
							借书时间：${borrowList.borrowtime}
							<br/><br/>
							最迟还书时间：<fmt:formatDate value="${borrowList.returntime}" pattern="yyyy-MM-dd"/>
							</div>
							<div class="address" style="margin-left: 20px; width: 130px; font-size: 20px;">
							<br>状态：未还书<br><br>
							<form action="${pageContext.request.contextPath}/insertComment.action" method="post">
							<input type="hidden" name="id" value="${sessionScope.user.id}" />
							<input type="hidden" name="tel" value="${sessionScope.user.tel}" />
							<input type="hidden" name="isbn" value="${borrowList.isbn}"/>
							<input type="hidden" name="type"  value="${borrowList.type}"/>
							<input type="hidden" name="name"  value="${borrowList.name}"/>
							<input type="submit" style="width:120px;height:50px;" name="comment" value="评价"/> 
							</form>
							</div>
						</div>
					</c:forEach>
					<br />
					</div>
			</div>

		</div>
		<script>
			$(function() {
				$('#myTab li:eq(1) a').tab('show');
			});
		</script>


		<br>
	</div>
	<script>
		var mes = '${sessionScope.systemOfPreset}';
		if (mes == 'have') {
			alert("\n您要预定的图书已经有书了\n\n请尽快在系统消息页面查看奥!");
		}
	</script>
</body>
</html>
