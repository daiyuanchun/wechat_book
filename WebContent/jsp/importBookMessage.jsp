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
<title>图书信息管理</title>
<link href="cityselect/cityLayout.css" type="text/css" rel="stylesheet">
<script src="jquery/jquery-1.9.1.min.js"></script>
<script src="cityselect/cityselect.js"></script>

<style type="text/css">
#dai {
	margin: 0 auto;
	width: 800px;
}

#fieldset {
	width: 630px;
}

#fieldset_div {
	margin-left: 34px;
}

#submit {
	margin-left: 40px;
	width: 80px;
	background-color: cornflowerblue;
}

#reset {
	margin-left: 35px;
	width: 80px;
	background-color: cornflowerblue;
}

#button_div {
	width: 300px;
	margin-top: 20px;
	margin-left: 450px;
}
</style>
</head>
<body>
	<div id="dai">
		<form action="${pageContext.request.contextPath}/importBooks.action"
			method="post" enctype="multipart/form-data">
			<table width="730" id="table1">
				<tr>
					<td align="right">ISBN编号：</td>
					<td><input type="text" name="isbn" /></td>
					<td align="right">书名：</td>
					<td colspan="4" align="left"><input type="text" name="name"
						size="61" /></td>
				</tr>
				<tr>
					<td align="right">拼音全拼：</td>
					<td colspan="6"><input type="text" name="allname" size="99" /></td>
				</tr>
				<tr>
					<td align="right">标题：</td>
					<td colspan="6"><input type="text" name="title" size="99" /></td>

				</tr>
				<tr>
					<td align="right">作者：</td>
					<td><input type="text" name="author" /></td>
					<td align="right">出版社：</td>
					<td><input type="text" name="press" /></td>
					<td align="right">版本号：</td>
					<td><input type="text" name="version" size="22" /></td>
				</tr>
				<tr>
					<td align="right">图书类别：</td>
					<td><select name="typeId">
							<c:forEach items="${sessionScope.typeList}" var="allType">
								<option value="${allType.id}">${allType.type}</option>
							</c:forEach>
					</select></td>
					<td align="right">所属省份：</td>
					<td><select name="provinceId">
							<c:forEach items="${sessionScope.provinceList}" var="allProvince">
								<option value="${allProvince.id}">${allProvince.province}</option>
							</c:forEach>
					</select></td>
					<td>所属城市：</td>
					<td><input type="text" name="city" /></td>
					<td>是否为省会：</td>
					<td><select name="cityId">
					<option value="1">是省会</option>
					<option value="0">不是省会</option>
					</select></td>
				</tr>
				<tr>
					<td align="right">序言：</td>
					<td colspan="6"><textarea cols="83" rows="5" name="sequence"></textarea>
					</td>
				</tr>

				<tr>
					<td align="right">内容简介：</td>
					<td colspan="6"><textarea cols="83" rows="5" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td align="right">导读：</td>
					<td colspan="6"><textarea cols="83" rows="5" name="guidance"></textarea>
					</td>
				</tr>
				
				<tr>
					<td align="right" colspan="2">请选择目录文件：</td>
					<td colspan="5"><input type="file" name="catalog" /></td>
				</tr>
				<tr>
					<td align="right" colspan="2">请选择封面图片：</td>
					<td colspan="5"><input type="file" name="cover" /></td>
				</tr>
				<tr>
					<td align="right" colspan="2">请选择缩图图片：</td>
					<td colspan="5"><input type="file" name="miniature" /></td>
				</tr>
				<tr>
					<td align="right" colspan="2">请选择二维码图片：</td>
					<td colspan="5"><input type="file" name="QRCode" /></td>
				</tr>
			</table>
			<div id="fieldset_div">
				<fieldset id="fieldset">
					<legend>
						<font face="微软雅黑" size="1" color="dimgray">图书借阅信息</font>
					</legend>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>藏书量：</label><input
						type="text" name="number" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label>是否被借出：</label><input type="radio" name="flag" value="0"
						 />是 <input type="radio" name="flag" value="1" />否
				</fieldset>
			</div>
			<div id="button_div">
				<input type="submit" value="提交" id="submit" />
			</div>
		</form>
	</div>
</body>
</html>
