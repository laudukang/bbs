<%@ page language="java" 
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reg.jsp</title>
<link rel="stylesheet" type="text/css" href="style/main.css">
<style type="text/css">
.item {
	width: 96%;
	max-width: 920px;
	margin: auto;
	padding: 2%;
	height: 100%;
	position: relative;
	left: 15%;
}

.label {
	max-width: 920px;
	margin: auto;
}

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
	function regsubmit() {
		if (checkcid() && checkcname() && checksecret() && checkresecret()
				&& checkcsex() && checkchead()) {
			return true;
		}
		return false;
	}

	function checkcid() {
		if (regForm.userId.value.trim() == "" || regForm.userId.value == null) {

			document.getElementById("cid").innerHTML = "请输入用户ID";
			return false;
		}
		var re = /^[0-9]+?[0-9]*$/; //判断正整数 /^[1-9]+[0-9]*]*$/  

		if (!re.test(regForm.userId.value.trim())) {
			document.getElementById("cid").innerHTML = "输入的用户ID不是数字";
			regForm.userId.value = "";
			return false;
		}
		document.getElementById("cid").innerHTML = "";
		return true;
	}
	function checkcname() {
		if (regForm.userName.value.trim() == ""
				|| regForm.userName.value == null) {

			document.getElementById("cname").innerHTML = "请输入用户名";
			return false;
		}
		document.getElementById("cname").innerHTML = "";
		return true;
	}

	function checksecret() {
		if (regForm.password.value.trim() == ""
				|| regForm.password.value == null) {
			document.getElementById("psw").innerHTML = "请输入密码";
			return false;
		}
		document.getElementById("psw").innerHTML = "";
		return true;
	}

	function checkresecret() {
		if (regForm.password.value.trim() == ""
				|| regForm.password.value == null) {
			document.getElementById("psw").innerHTML = "请输入密码";
			return false;
		}
		if (!(regForm.password.value == regForm.password2.value)) {
			//document.write("oldpassword.value=333");
			//alert("两次输入的密码不一致！");
			document.getElementById("errorpsw").innerHTML = "两次输入的密码不一致";
			//password.focus();
			return false;
		}
		document.getElementById("psw").innerHTML = "";
		document.getElementById("errorpsw").innerHTML = "";
		return true;
	}
	function checkcsex() {
		//alert("regForm.gender.value=" + regForm.gender[0].checked );
		if (!regForm.gender[0].checked&&!regForm.gender[1].checked) {

			document.getElementById("csex").innerHTML = "请选择性别";
			return false;
		}
		document.getElementById("csex").innerHTML = "";
		return true;
	}
	function checkchead() {
		if (!regForm.head[0].checked&&!regForm.head[1].checked&&!regForm.head[2].checked){

			document.getElementById("chead").innerHTML = "请选择头像";
			return false;
		}
		document.getElementById("chead").innerHTML = "";
		return true;
	}
</script>
</head>
<body style="overflow-y: scroll;">
	<div class="header"></div>
	<div class="ui-widget-header"
		style="text-align: center; height: 30px; line-height: 30px; overflow: hidden;">注册</div>

	<div class="ui-widget-content">
		<form action="doReg.jsp" name="regForm" onsubmit="return regsubmit()"
			method="post">
			<table class="item">
				<tr>
					<td>用户ID&nbsp;&nbsp;<input type="text" maxlength="20"
						size="40" name="userId" onblur="return checkcid();" /><span
						style="color: red;">&nbsp;*</span> (20位以内的数字)<span id="cid"
						style="color: red;"></span>
					</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>用户名&nbsp;&nbsp;<input type="text" maxlength="20" size="40"
						name="userName" onblur="return checkcname();" /><span
						style="color: red;">&nbsp;*</span> (20位以内的数字或字母或其他符号)<span
						id="cname" style="color: red;"></span>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;码&nbsp;&nbsp;<input type="password"
						maxlength="20" size="40" name="password"
						onblur="return checksecret();" /><span style="color: red;">&nbsp;*</span>
						(20位以内的数字或字母或其他符号) <span id="psw" style="color: red;"></span>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>重复密码<input type="password" maxlength="20" size="40"
						name="password2" onblur="return checkresecret();" /><span
						style="color: red;">&nbsp;*</span> <span id="errorpsw"
						style="color: red;"></span>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>性&nbsp;&nbsp;别 &nbsp;<label for="female"><input
							type="radio" name="gender" value="1" id="female" />
							&nbsp;女&nbsp;&nbsp;&nbsp;&nbsp;</label><label for="male"><input
							type="radio" name="gender" value="2" id="male" />&nbsp;男</label><span
						style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;*</span> <span
						id="csex" style="color: red;"></span>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>头&nbsp;&nbsp;像&nbsp;&nbsp;<input type="radio" name="head"
						id="head1" value="1.gif" /><label for="head1"> &nbsp;<img
							src="images/head/1.gif" title="请选择您的头像" /></label> <input type="radio"
						name="head" id="head2" value="2.gif" /><label for="head2">
							&nbsp;<img src="images/head/2.gif" title="请选择您的头像" />
					</label> <input type="radio" name="head" id="head3" value="3.gif" /><label
						for="head3"> &nbsp;<img src="images/head/3.gif"
							title="请选择您的头像" /></label><span style="color: red;">&nbsp;*</span> <span
						id="chead" style="color: red;"></span>
					</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><input type="submit" value="确认" /> <input type="reset"
						value="重置" /></td>
				</tr>

			</table>
		</form>

	</div>
	<a href="index.jsp"><img src="images/go_back.png"
		style="left: 90%; top: 85%; position: fixed;" title="返回到登陆"></a>
	<%@include file="footer.jsp"%>
</body>
</html>