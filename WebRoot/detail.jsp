<%@ page language="java"
	import="me.codz.bbs.dao.*,me.codz.bbs.dao.impl.*,java.text.SimpleDateFormat,java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帖子内容_detail.jsp</title>
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

#tex {
	border: 0px;
	resize: none;
	outline: none;
	font-family: serif;
	font-size: 100%;
	background: #eeeeee;
	color: #333333;
}

#goTopBtn {
	POSITION: fixed;
	TEXT-ALIGN: center;
	LINE-HEIGHT: 50px;
	WIDTH: 50px;
	BOTTOM: 50px;
	HEIGHT: 33px;
	FONT-SIZE: 12px;
	CURSOR: pointer;
	RIGHT: 50px;
	_position: absolute;
	_right: auto
}
</style>
<script>
	function mOut(obj) {
		obj.innerHTML = "&nbsp;&nbsp;猛戳这里回复当前帖子&nbsp;";
	}

	function mOver(obj) {
		obj.innerHTML = "小天是我见过最单纯善良的女孩";
	}
</script>
</head>
<body style="overflow-y: scroll;">

	<%
		int noteId = Integer.parseInt((String)request.getParameter("noteId"));
			NotesDao notesdao1 = new NotesDaoImpl();
			Notes note = notesdao1.getNoteById(noteId);
			if(note==null){
	%>
	<script>
		top.location = "FindServlet";
	</script>
	<%
		}
		session.setAttribute("note", note);
		String numnoteId = "num" + noteId;
		int num = 0;
		if (null != application.getAttribute(numnoteId)) {
			num = (Integer) application.getAttribute(numnoteId);
		}
		num++;
		application.setAttribute(numnoteId, num);
	%>
	<a id="v" name="v"></a>

	<%@include file="header.jsp"%>

	<div style="text-align: right; margin-top: -29px;">


		<marquee scrollamount="4" width="355px" direction="left"
			scrolldelay="0" behavior="scroll" loop="-1" onmouseover="this.stop()"
			onmouseout="this.start()">
			<a href="http://weibo.com/adulte" target="_blank"
				style="text-decoration: none;"> 欢迎使用BBS系统&nbsp;&nbsp;</a><img
				alt="welcome.png" src="images/welcome.png"
				style="margin-right: 10px; vertical-align: middle;"> <a
				href="postReply.jsp" onmouseover="mOver(this)"
				onmouseout="mOut(this)"
				style="text-decoration: none; color: red; align: right;">&nbsp;&nbsp;猛戳这里回复当前帖子&nbsp;</a>
			<img alt="add.png" src="images/add.png"
				style="margin-right: 10px; vertical-align: middle;">

		</marquee>

	</div>
	<div class="ui-widget-header" style="text-align: center;">帖子内容</div>
	<div class="col1">发帖人</div>
	<div style="margin-top: 10px; margin-left: 30%; float: center;">主题</div>
	<div style="margin-top: -25px; margin-right: 20%; float: right;">内容</div>
	<div class="clear"></div>

	<div class="ui-widget-content">
		<br>
		<div style="text-align: left; margin-left: 3%;">
			&nbsp;&nbsp;&nbsp;<img
				src="images/head/<%=(String)(note.getUsers().getHead())%>" /> <br>&nbsp;&nbsp;
			用户名ID：<%=note.getUsers().getUserId1()%><br /> &nbsp;&nbsp;&nbsp;用户名：<%=note.getUsers().getUserName()%><br />
			&nbsp;&nbsp;&nbsp;注册时间：
			<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(note
					.getUsers().getRegTime())%>

		</div>
		<div
			style="margin-top: -25px; margin-left: 25%; float: center; width: 30%;"><%=note.getTitle()%></div>
		<div
			style="float: right; margin-left: 60%; margin-right: 3%; margin-top: -130px; text-align: left;">
			<textarea rows="13" cols="70" disabled id="tex"><%=note.getContent()%></textarea>
		</div>
		<div style="text-align: right; margin-right: 20px;">
			累计查看：&nbsp;<%=num%>&nbsp;次&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(note
					.getPubTime())%>&nbsp;&nbsp;#1 楼

		</div>
		<br>
	</div>
	<div class="clear"></div>

	<%
		ReplyDao replysdao = new ReplysDaoImpl();

		List<Replys> list = replysdao.getReplyById(noteId);

		if (!list.isEmpty()) {

			Iterator<Replys> it = list.iterator();
			int i = 0;
			int floor = 2;
	%>
	<div class="ui-widget-content">
		<%
			while (it.hasNext()) {
					Replys reply = it.next();
		%>
		<br>
		<hr>
		<div style="text-align: left; margin-left: 3%;">
			&nbsp;&nbsp;&nbsp;<img src="images/head/<%=reply.getHead()%>" /> <br />&nbsp;&nbsp;
			用户名ID：<%=reply.getReplyUserId()%><br /> &nbsp;&nbsp;&nbsp;用户名：<%=reply.getReplyUserName()%><br />
			&nbsp;&nbsp;&nbsp;注册时间：
			<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.format(reply.getReplyUserRegTime())%>

		</div>
		<div
			style="margin-top: -25px; margin-left: 25%; float: center; width: 30%;"><%=reply.getReplyTitle()%></div>
		<div
			style="float: right; margin-left: 60%; margin-right: 3%; margin-top: -130px; text-align: left;">
			<textarea rows="13" cols="70" disabled id="tex"><%=reply.getReplyContent()%></textarea>
		</div>

		<div style="text-align: right; margin-right: 20px;">

			<%
				if (user.getUserId1() - reply.getReplyUserId() == 0) {
			%>
			<input type="submit" value="Delete my Reply"
				onclick="if(confirm('Message:\nAre you sure to delete my reply?'))javascript:document.location.href='doDelete.jsp?replyId=<%=reply.getReplyId()%>&noteId=<%=note.getNoteId()%>'">
			<%
				} else {
			%>
			&nbsp;
			<%
				}
			%>

			<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.format(reply.getReplyTime())%>
			&nbsp;&nbsp;#<%=floor%>&nbsp;楼
		</div>
		<div class="clear"></div>

		<%
			floor++;
				}
		%>
		<br> <br>
	</div>
	<%
		}
	%>
	<br>
	<br>
	<br>
	<br>


	<a href="FindServlet"><img src="images/go_back.png"
		style="left: 87%; top: 85%; position: fixed;" title="返回帖子列表"></a>

	<a href="#v"><img src="images/top.png" class="top"
		style="left: 93%; top: 85%; position: fixed;"></a>

	<%@include file="footer.jsp"%>
</body>
</html>