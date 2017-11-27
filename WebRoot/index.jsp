<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登陆BBS</title>
<link rel="stylesheet" type="text/css" href="style/main.css">
<style>
.item {
	width: 96%;
	max-width: 920px;
	margin: auto;
	padding: 2%;
	height: 100%;
	position: relative;
	left: 23%;
}

.label {
	max-width: 920px;
	margin: auto;
}

body,html {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
	background: #fff;
	color: #222;
	font-size: 14px;
	line-height: 180%;
}
</style>
<script language="JavaScript">
	function check() {

		if (checkcid() && checkcpsw()) {
			return true;
		}

		return false;
	}
	function checkcid() {
		if (form2.userId.value.trim() == "" || form2.userId.value == null) {

			document.getElementById("cid").innerHTML = "请输入用户ID";
			return false;
		}
		var re = /^[0-9]+?[0-9]*$/; //判断正整数 /^[1-9]+[0-9]*]*$/  

		if (!re.test(form2.userId.value.trim())) {
			document.getElementById("cid").innerHTML = "输入的用户ID不是数字";
			form2.userId.value = "";
			return false;
		}
		document.getElementById("cid").innerHTML = "";
		return true;
	}
	function checkcpsw() {
		if (form2.password.value == "" || form2.password.value == null) {

			document.getElementById("cpsw").innerHTML = "请输入密码";
			return false;
		}
		document.getElementById("cpsw").innerHTML = "";
		return true;
	}
</script>

<meta name="360-site-verification" content="fbe0bdb98fb4664868f7f23dcb7b7157" />

</head>
<body style="overflow-y: scroll;">
	<div class="header"></div>

	<div class="ui-widget-header"
		style="text-align: center; height: 30px; line-height: 30px; overflow: hidden;">登陆BBS</div>
	<div class="ui-widget-content">
		<form id="form2" name="form2" action="doLogin.jsp" method="post"
			onsubmit="return check()">
			<table class="item">
				<tr>
					<td><span>&nbsp;</span></td>
				<tr>
				<tr>
					<td>用户ID&nbsp;<input name="userId" id="userId"
						onblur="return checkcid();" /> <span id="cid" style="color: red;">&nbsp;</span>

					</td>
				</tr>
				<tr>
					<td><span>&nbsp;</span></td>
				<tr>
				<tr>
					<td>密&nbsp;&nbsp;码 <input name="password" type="password"
						onblur="return checkcpsw();" /> <span id="cpsw"
						style="color: red;">&nbsp;</span>
					</td>
				</tr>

				<tr>
					<td><span>&nbsp;</span></td>
				<tr>
				<tr>
					<td><input type="submit" value="确认" /> <input type="reset"
						value="重置" /> <a
						href="javascript:document.location.href='reg.jsp'"
						style="text-decoration: none;border: 4px double #e1e2e3;cursor: pointer;">&nbsp;&nbsp;新用户注册&nbsp;&nbsp;</a>
					</td>
				</tr>

			</table>
		</form>
	
	</div>

	<%@include file="footer.jsp"%>

</body>
</html>