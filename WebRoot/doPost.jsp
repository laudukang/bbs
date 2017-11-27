<%@ page language="java" 
	import="me.codz.bbs.model.*,me.codz.bbs.dao.*,me.codz.bbs.dao.impl.*,
	java.util.Date,java.sql.Timestamp,java.text.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>doPost.jsp</title>
</head>

	<%
		String title=new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
		String content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
		Notes note=new Notes();
		note.setContent(content);
		note.setTitle(title);
		note.setUsers((Users)session.getAttribute("user"));
		note.setPubTime(Timestamp.valueOf(new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss").format(new Date())));
		NotesDao noteDao=new NotesDaoImpl();
		
		noteDao.addNote(note);
		response.sendRedirect("FindServlet");
		
	%>

</html>