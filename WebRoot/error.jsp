<%@ page language="java" isErrorPage="true" import="java.io.PrintWriter"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>We are sorry for there are some errors occurred</title>
</head>
<body style="background: blue; color: #ffffff; vertical-align: center;">
	<div align="center">
		<br> <br>
		<h1>We are sorry for there are some errors occurred.</h1>
		<hr>
		<h2>The error details are listed as follows:</h2>

		<p>
		<h3><%=exception.toString()%></h3>
		<h3>
			<%
				exception.printStackTrace(new PrintWriter(out));
			%>
		</h3>
		<br> <br> <a href="javascript: history.back();"><img
			src="images/go_back.png"
			style="left: 90%; top: 5%; position: fixed;"
			title="返回"></a> <br> <br>
	</div>
</body>
</html>