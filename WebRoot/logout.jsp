<%@ page language="java"
	import="me.codz.bbs.model.Notes,me.codz.bbs.common.HibernateSessionFactory"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>logout.jsp</title>

</head>

<%
	Notes.PAGE_SIZE = 7;

	session.removeAttribute("user");
	session.invalidate();
	//response.sendRedirect("index.jsp");
	response.reset();
    
	HibernateSessionFactory.closeSession();
	//System.out.println("hehe3");
%>
<script type="text/javascript">
	window.location.href = "index.jsp";
</script>
</html>