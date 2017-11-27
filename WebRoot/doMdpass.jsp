<%@ page language="java"
	import="me.codz.bbs.dao.*,me.codz.bbs.model.*,me.codz.bbs.dao.impl.*,java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>doMdpass.jsp</title>
<link rel="stylesheet" type="text/css" href="style/main.css">

</head>

<%
	Users user = (Users) session.getAttribute("user");

	int userId = user.getUserId1();
	//System.out.println("user.getUserId()=" + userId);
	String password = request.getParameter("password");

	user.setPassword(password);
	session.setAttribute(password, password);

	UserDaoImpl userdao = new UserDaoImpl();

	int updatepswsucess = userdao.mdUserPassword(userId, password);
	if (updatepswsucess == 1) {
		//System.out.println("update password success");
%>

<script>
	alert("Messega:\nCongratulation!\Your password has modified successfully.\nPress OK to return list.jsp");
	top.location = "FindServlet?page=1";
</script>

<%
	} else {
		//System.out.println("update password fail");
%>
<script>
	alert("Warning:\nSorry,something went wrong.\n");

	top.location = "FindServlet";
</script>
<%
	}
%>
</html>