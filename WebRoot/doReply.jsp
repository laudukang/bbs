<%@ page language="java" 
	import="me.codz.bbs.model.*,me.codz.bbs.dao.*,me.codz.bbs.dao.impl.*,java.util.Date,
	java.sql.Timestamp,java.text.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>doReply.jsp</title>
</head>

	<%
		String replyTitle = (String) session.getAttribute("replyTitle");
		

		String replyContent = new String( request.getParameter("replyContent")
		.getBytes("ISO-8859-1"),"UTF-8");
		String head = (String) session.getAttribute("head");
		String replyUserName = (String) session
		.getAttribute("replyUserName");
		Timestamp replyUserRegTime = (Timestamp) session
		.getAttribute("replyUserRegTime");

		//System.out.println("replyContent=" + replyContent);

		int noteId = (Integer) session.getAttribute("noteId");
		//System.out.println("reply noteId=" + noteId);

		Replys reply = new Replys();

		Users user = (Users) session.getAttribute("user");
		Notes notes=new Notes();
		notes.setNoteId(noteId);
		reply.setReplyUserId(user.getUserId1());
		reply.setNotes(notes);
		reply.setReplyContent(replyContent);
		reply.setReplyTitle(replyTitle);
		reply.setHead(head);
		reply.setReplyTime(Timestamp.valueOf(new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss").format(new Date())));
		reply.setReplyUserName(replyUserName);
		reply.setReplyUserRegTime(replyUserRegTime);
	
		ReplyDao replyDao = new ReplysDaoImpl();
		replyDao.addReply(reply);
		
		response.sendRedirect( "detail.jsp?noteId=" + noteId);
	%>

</html>