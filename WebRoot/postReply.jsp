<%@ page language="java" 
	import="me.codz.bbs.dao.*,me.codz.bbs.dao.impl.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>postReply.jsp</title>
<link rel="stylesheet" type="text/css" href="style/main.css">
<style type="text/css">
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
	function checkpost() {
		if (document.form1.replyContent.value.trim() == ""
				|| document.form1.replyContent.value.trim() == null) {
			alert("回复内容不能为空");
			return false;
		}
		return true;
	}
</script>

</head>
<body style="overflow-y: scroll; overflow-x: scroll;">

	<%
		Notes note = (Notes) session.getAttribute("note");
	%>

	<%@include file="header.jsp"%>
	<div class="ui-widget-header" style="text-align: center;">回复帖子</div>
	<div class="mainDiv">


		<form name="form1" action="doReply.jsp" method="post"
			onsubmit="return checkpost()">
			<div class="col1">主题</div>
			<div class="col2">

				<%=note.getTitle()%>
				<%
					session.setAttribute("replyTitle", note.getTitle());
					session.setAttribute("noteId", note.getNoteId());
					session.setAttribute("head", user.getHead());
					session.setAttribute("replyUserName", user.getUserName());
					session.setAttribute("replyUserRegTime", user.getRegTime());
				%>

			</div>
			<div class="col1">内容</div>
			<div class="col2">
				<textarea rows="20" cols="60" name="replyContent"></textarea>
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