<%@ page language="java"  contentType="text/html; charset=UTF-8"
	import="me.codz.bbs.dao.*,
me.codz.bbs.dao.impl.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deDelete.jsp</title>
</head>

	<%
		if (request.getParameter("replyId") != null
				&& request.getParameter("noteId") != null) {
			int replyId = Integer.valueOf(request.getParameter("replyId"));
			int noteId = Integer.valueOf(request.getParameter("noteId"));

			ReplyDao replydao = new ReplysDaoImpl();

			replydao.deleteReply(replyId);
			response.sendRedirect("detail.jsp?noteId=" + noteId);
		} else if (request.getParameter("noteId") != null) {
			int noteId = Integer.valueOf(request.getParameter("noteId"));

			NotesDao notesdao = new NotesDaoImpl();
			notesdao.deleteNote(noteId);
			response.sendRedirect("FindServlet");
		}
	%>

</html>