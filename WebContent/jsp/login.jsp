<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
<style>
* {
	margin: 0;
	padding: 0;
}

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
	font-size: 70px;
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
#userlogin .user_type {
    margin-left:20px;
	border: 5px #CCCCCC solid;
	height: 60px;
	width: 60px;
	font-size: 80px;
}
#userlogin .input-text:focus{
border-color:#BCD2EE;
}

#userlogin .input-btn {
	display:block;
	width: 980px;
	height:200px;
	border: 0;
	background: rgba(239, 11, 15, 1.00);
	color: white;
	font-weight: bold;
	font-size: 60px;
	text-align:center;
	text-decoration:none;
	padding-top:10px;

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
<form action="${pageContext.request.contextPath}/selectUserForLogin.action"  method="post"  name="userlogin"  id="userlogin">
<h3>用户登录</h3>
<p><input type="text"  class="input-text" name="id" placeholder="  微信号"  required /></p>
<p><input type="text"  class="input-text" name="tel" placeholder="  手机号"  required /></p>
<p><input type="password" class="input-text" name="password" placeholder="  密码"  required/></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;用户:
<input type="radio" class="user_type" name="user_type" value="person"  checked="checked"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
管理员：<input type="radio" class="user_type" name="user_type" value="mana"/></p>
<p><input type="submit" class="input-btn" value="登录"/></p>
<h1> <a  href="beforeRegist.jsp">立即注册</a></h1>

</form>
<script type="text/javascript">
var message='${requestScope.borrowBookMessage}';
if(message=='notLogin'){
	alert("您还未登录！请立即登录");
}
</script>

</body>
</html>