<%@ page language="java" 
	import="me.codz.bbs.model.*,me.codz.bbs.dao.*,me.codz.bbs.dao.impl.*,
	java.util.Date,java.text.*,java.sql.Timestamp"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>doReg.jsp</title>


</head>

	<%
		request.setCharacterEncoding("utf-8");

		Integer userId = Integer.valueOf(request.getParameter("userId"));
		//System.out.println("userId=" + userId);

		UserDao userdao = new UserDaoImpl();
		Users user = userdao.findUser(userId);
		//	System.out.println("before if=" + user);
		if (null == user) {
			String userName = request.getParameter("userName").trim();
			String password = request.getParameter("password").trim();
			Short gender = Short.valueOf(request.getParameter("gender"));
			String head = request.getParameter("head");

			user = new Users();

			user.setUserId1(userId);
			user.setUserName(userName);
			user.setPassword(password);
			user.setHead(head);
			user.setGender(gender);
			user.setRegTime(Timestamp.valueOf(new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss").format(new Date())));

			UserDao userDao = new UserDaoImpl();
			userDao.addUser(user);
	%>
	<script>
		alert("Messega:\nCongratulation!\nYour account has registered successfully.\nPress OK to return index.jsp");

		top.location = "index.jsp";
	</script>
	<%
		}
		else{
	%>


	<script>
		alert("Messega:\nThe userId you submitted has existed.\nPress OK to return reg.jsp");

		top.location = "reg.jsp";
	</script>
	<%} %>

</html>