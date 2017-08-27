<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>在线预订</title>

<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="jqueryui/style.css">

<style type="text/css">
#dai {
	margin: 0 auto;
	width: 800px;
	font-size: 20px;
}

.getBookTimeInput {
	width: 300px;
	height: 40px;
	font-size: 16px;
}

.submitForm {
	width: 120px;
	height: 50px;
	text-align: center;
	font-size: 18px;
	color: white;
	background: red;
}
</style>
<script>
	$(function() {
		$("#datepicker").datepicker();
		$("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
	});
</script>
</head>
<body>

	<div id="dai">
		<c:choose>
			<c:when test="${requestScope.message eq 0}">
				<br />
				<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您好，不巧暂时没有藏书了，您可以点击"接收系统提醒"按钮<br />
				<br />
		&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;（当有用户归还书籍后,系统自动给您推送信息提醒）<br />
				<br />
				<form
					action="${pageContext.request.contextPath}/insertSystemPresetRemind.action"
					method="post">
					<input type="hidden" name="isbn" value="${sessionScope.book.isbn }" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit"
						style="width: 180px; height: 50px; font-size: 20px;"
						value="接收系统提醒" />
				</form>
			</c:when>
			<c:otherwise>


				<form
					action="${pageContext.request.contextPath}/insertPreset.action"
					method="post" onSubmit="return check()">
					<table>
					<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr><tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>书&nbsp;&nbsp;的&nbsp;&nbsp;&nbsp;ISBN&nbsp;编&nbsp;号：</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.book.isbn }
								<input type="hidden" name="isbn"
								value="${sessionScope.book.isbn }" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;的&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.book.title}
								<input type="hidden" name="title"
								value="${sessionScope.book.title}" /> <input type="hidden"
								name="cover" value="${sessionScope.book.cover}" /> <input
								type="hidden" name="position"
								value="${sessionScope.book.province.province}${sessionScope.book.city}" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>预订用户的&nbsp;微信号：</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.user.id } <input
								type="hidden" name="type" value="${sessionScope.book.type.type}" />
								<input type="hidden" name="author"
								value="${sessionScope.book.author}" /> <input type="hidden"
								name="id" value="${sessionScope.user.id}" /> <input
								type="hidden" name="tel" value="${sessionScope.user.tel}" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>您当前的&nbsp;手机号为： </td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.user.tel }</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>请输入您的登录密码：</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"
								name="password" class="getBookTimeInput" id="password"
								placeholder="  登录密码"  style="border: 3px #CCCCCC solid; width:500px;"/></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>请输入您的身份证号：</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
								name="idCard" class="getBookTimeInput" id="idCard"
								placeholder="  本人的身份证号" style="border: 3px #CCCCCC solid; width:500px;"/></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>请输入您的真实姓名：</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
								name="name" class="getBookTimeInput" id="name"
								placeholder="  本人的真实姓名" style="border: 3px #CCCCCC solid; width:500px;"/></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>请&nbsp;指&nbsp;定&nbsp;取&nbsp;书&nbsp;时&nbsp;间：</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
								name="getTime" class="getBookTimeInput" id="datepicker"
								placeholder="  请指定取书时间"  style="border: 3px #CCCCCC solid; width:500px;" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><input type="submit" class="submitForm" value="确定预订" /></td>
						</tr>
					</table>

				</form>
			</c:otherwise>
		</c:choose>
	</div>
	<script>
		var success = '${requestScope.success}';
		if (success == 'success') {
			alert("设置消息提醒成功!");
		}
		var message = '${requestScope.presetMessage}';
		if (message == 'success') {
			alert("预订成功！");
		}
		if (message == 'error') {
			alert("预订失败！系统检测到你的身份信息有误！");
		}
		if (message == 'passwordError') {
			alert("密码错误！");
		}
	</script>
	<script type="text/javascript" language="javascript">
		function check() {
			var password = document.getElementById("password").value;
			var idCard = document.getElementById("idCard").value;
			var name = document.getElementById("name").value;
			var datepicker = document.getElementById("datepicker").value;
			if (password.length == 0) {
				alert("请输入密码！");
			}
			if (idCard.length == 0) {
				alert("请输入身份证号！");
			}
			if (name.length == 0) {
				alert("请输入姓名！");
			}
			if (datepicker.length == 0) {
				alert("请输入取书时间！");
			}
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

