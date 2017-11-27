<%@ page language="java" import="me.codz.bbs.dao.*,me.codz.bbs.dao.impl.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加新帖子_post.jsp</title>
<link rel="stylesheet" type="text/css" href="style/main.css">
<style type="text/css">
body, html {
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
	function checkpost() {
		if (document.form1.title.value.trim() == ""
				|| document.form1.title.value.trim() == null
				|| document.form1.content.value.trim() == ""
				|| document.form1.content.value.trim() == null) {
			alert("请输入主题或内容");
			return false;
		}
		if (document.form1.title.value.length >50){alert("主题过长");
		return false;}
		
		return true;
	}
</script>

</head>
<body style="overflow-y: scroll;overflow-x: scroll;">

	<%@include file="header.jsp"%>
	<div class="ui-widget-header" style="text-align: center;">新留言</div>
	<div class="mainDiv">


		<form name="form1" action="doPost.jsp" method="post"
			onsubmit="return checkpost()">
			<div class="col1">主题</div>
			<div class="col2">
				<input name="title" size="56" />（50字以内）<!-- 68.8 -->
			</div>
			<div class="col1">内容</div>
			<div class="col2">
				<textarea rows="20" cols="60" name="content"></textarea>
				<br />
			</div>
			<div class="col2">
				<input type="submit" value="确定" /> <input type="reset" value="重置" />
			</div>
		</form>
	</div>
<a href="FindServlet"><img src="images/go_back.png"
		style="left: 90%; top: 85%; position: fixed;" title="返回帖子列表"></a>
	<%@include file="footer.jsp"%>
</body>
</html>