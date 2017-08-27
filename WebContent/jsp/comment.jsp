<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>评论</title>
<style type="text/css">
.container {
	width: 60%;
	margin: 0 auto;
}

.in {
	display: block;
	width: 100%;
	font-size: 20px;
}

#title {
	width: 100%;
}

#title #release {
	font-size: 25px;
	border: 0;
	margin: 8px;
	background-color: white;
	display: block;
	float: right;
}

#title #msg {
	display: block;
	float: left;
	font-size: 30px;
}

#anonymous {
	display: block;
	float: left;
	font-size: 30px;
}

#anonymous-msg {
	display: block;
	float: right;
	font-size: 20px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<form
			action="${pageContext.request.contextPath}/insertCommentContext.action"
			method="post">
			<div id="title">
				<label id="msg" type="text">发表评论</label> 
				<input type="hidden" name="id" value="${requestScope.id}"/>
				<input type="hidden" name="tel" value="${requestScope.tel}" /> 
				<input type="hidden" name="isbn" value="${requestScope.isbn}" /> 
				<input type="hidden" name="type" value="${requestScope.type}">
				<input type="hidden" name="name" value="${requestScope.name}"/>
				<input type="submit" id="release" value="发布" style="color: #FF8C00;" />
			</div>
			<br />
			<textarea  style="border: 3px #CCCCCC solid; width:500px;"
			 rows="10" cols="20" class="in" name="commentContext"
				placeholder=" 说说你的使用心得，分享给想读的他们吧">
			</textarea>
			<br /> <label id="anonymous"> <input type="radio"
				name="anonymous" value="1" />匿名
			</label> <label id="anonymous-msg" style="font-size: 20px; color: #B0B0B0;">您发表的评论将不会显示任何个人信息</label>
		</form>
	</div>
	<script type="text/javascript">
		var message = '${requestScope.message}';
		if (message == 'success') {
			alert("       发布成功！");
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
