<%@ page language="java" import="me.codz.bbs.model.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header.jsp</title>
</head>
<%
	Users user = null;
	if (null != session.getAttribute("user"))
		{user = (Users) session.getAttribute("user");
		}
	else
		response.sendRedirect("index.jsp");
%>
<body>
	<div class="header" title="欢迎使用，O(∩_∩)O~">
		<div class="welcomePanel" style="margin-top: 15px;">
			<%
				if (null != user) {
			%>
			欢迎&nbsp;&nbsp;<span class="userName"><%=user.getUserName()%> </span>&nbsp;
			回来&nbsp;<img alt="welcome.png" src="images/welcome.png" style="margin-right:10px;vertical-align:middle; ">
			
			|&nbsp;<a href="mdpass.jsp" style="text-decoration: none;">修改密码&nbsp;|&nbsp;
			</a><a href="logout.jsp" style="text-decoration: none;">退出&nbsp;&nbsp;</a>
			<%
				}
			%>

		</div>

	</div>
</body>
</html>