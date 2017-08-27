<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>申请注册</title>
<style>
* {
	margin: 0;
	padding: 0;
}md


body {
	font-family: '微软雅黑', '宋体';
	background: white;
	height:2000px;
	
	}

h3 {
	margin-bottom: 120px;
}

p {
	margin-bottom: 100px;
}

#userlogin {
	width: 1000px;
	margin: 20px auto;
	margin-left: 20px;
	background: rgba(249, 249, 249, 1.00);
	padding: 100px;
}

#userlogin h3 {
	font-size: 70px;
	line-height: 100px;
}

#userlogin .input-text {
    margin-left:20px;
	border: 8px #CCCCCC solid;
	height: 180px;
	width: 900px;
	font-size: 80px;
}
#userlogin .input-text:focus{
border-color:#BCD2EE;
}

#userlogin .input-btn {
	display:block;
	width: 980px;
	height:130px;
	border: 0;
	background: rgba(239, 11, 15, 1.00);
	color: white;
	font-weight: bold;
	font-size: 60px;
	text-align:center;
	text-decoration:none;
	padding-top:80px;

}

#userlogin .input-btn:hover {
	background: rgba(126, 2, 4, 1.00);
	cursor: pointer;
}

#userlogin h1 {
	text-align: right;
	font-size: 60px;
}

#userlogin h1 a {
	color: rgba(108, 108, 108, 1.00);
	text-decoration: none;
	font-weight: normal;
	margin-right: 60px;
}

#userlogin h1 a:hover {
	color: rgba(240, 3, 7, 1.00);
}
</style>
</head>

<body>
	<form action="${pageContext.request.contextPath}/findUserByIdAndTel.action" method="post" name="userlogin" id="userlogin">
		<h3>申请注册</h3>
		<p>
			<input type="text" class="input-text" name="id" placeholder="  微信号" autofocus required />
		</p>
		<p>
			<input type="text" class="input-text" name="tel" placeholder="  手机号"   required />
		</p>
		<p>
			<input type="text" class="input-text" name="email"
				placeholder="  邮箱"   required />
		</p>
		<script type="text/javascript">
			function tologin() {
				document.userlogin.submit();
			}
		</script>
		<p>
			<a href="javascript:tologin();" class="input-btn"> &nbsp; &nbsp;申 &nbsp; &nbsp;请 &nbsp; &nbsp; 注 &nbsp; &nbsp; 册 &nbsp; &nbsp;</a>
		</p>
		<h1>
			<a href="login.jsp">立即登录</a>
		</h1>

	</form>
</body>
</html>
<script>
//取出传回来的参数error并与yes比较
var error ='<%=request.getParameter("error")%>';
var success ='<%=request.getParameter("success")%>';
if(error=='error'){
    alert("申请失败！");
}

if(success=='success'){
    alert("申请成功！");
}
</script>