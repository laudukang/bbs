<%@ page language="java"  import="me.codz.bbs.model.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mdpass.jsp</title>
<link rel="stylesheet" type="text/css" href="style/main.css">
<style type="text/css">
.item {
	width: 96%;
	max-width: 920px;
	margin: auto;
	padding: 2%;
	height: 100%;
	position: relative;
	left: 20%;
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
	

	function validate_required(field, alerttxt) {
		with (field) {
			if (value == null || value == "") {
				alert(alerttxt);
				return false;
			} else {
				return true;
			}
		}
	}

	function validate_form(thisform,userps) {
		with (thisform) {
			if (!validate_required(oldpassword, "请输入原密码！")) {
			
				oldpassword.focus();
				return false;
			}
			if (!validate_required(password, "请输入新密码！")) {
				password.focus();
				return false;
			}
			if (!validate_required(password2, "请再次输入新密码！")) {
				password2.focus();
				return false;
			}

			if (!(oldpassword.value==userps)) {

				alert("原密码输入错误！");
				return false;
			}
			if (!(password.value==password2.value)) {

				alert("两次输入的新密码不一致！");
				return false;
			}
			
			
			return true;
		}

	}
	function sb(var1){
		if(var1==0)
			document.getElementById("sure")==1;
		return 1;
		
		 
	}
</script>
</head>

<body style="overflow:hidden">
	<%@include file="header.jsp"%>
	<%
		int sure = 0;
	%>
	<div class="ui-widget-header"
		style="text-align: center; height: 30px; line-height: 30px; ">修改密码</div>

	<div class="ui-widget-content">
		<form action="doMdpass.jsp" name="form2" id="form2"
			onsubmit="return validate_form(this,<%=user.getPassword()%>);"
			method="post">
			<table class="item">

				<tr>
					<td>原密码&nbsp;&nbsp;<input type="password" maxlength="20"
						size="40" name="oldpassword" id="oldpassword" />
					</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;码&nbsp;&nbsp;<input type="password"
						maxlength="20" size="40" name="password" id="password" />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>重复密码<input type="password" maxlength="20" size="40"
						name="password2" id="password2" />
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

	<a href="FindServlet"><img src="images/go_back.png"
		style="left: 90%; top: 85%; position: fixed;" title="返回帖子列表"></a>

	<%@include file="footer.jsp"%>

</body>
</html>