<%@ page import="org.eclipse.jdt.internal.compiler.batch.Main"%>
<%@ page language="java"
	import="me.codz.bbs.dao.*,me.codz.bbs.dao.impl.*,java.util.*
	,java.text.SimpleDateFormat,java.util.List"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帖子列表_list.jsp</title>
<link rel="stylesheet" type="text/css" href="style/main.css">
<style type="text/css">
body, html {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 98%;
	overflow: hidden;
	background: #fff;
	color: #222;
	font-size: 14px;
	line-height: 180%;
}
</style>
<script>
	function mOut(obj) {
		obj.innerHTML = "&nbsp;&nbsp;猛戳这里添加新帖子&nbsp;";
	}

	function mOver(obj) {
		obj.innerHTML = "小天是我见过最单纯善良的女孩";

	}
	function go(num, count, ms, s1) {

		if (num < 1) {
			alert('当前已是最前页');
			return false;
		}
		if (num > count) {
			alert('当前已是最后页');
			return false;
		}

		var url = window.location;

		var pos = String(url).indexOf("?");

		if (pos == -1) {

			if (ms.length != 0 && s1.length != 0) {//.equals()

				window.location.replace(url + '?page=' + num + '&myselect='
						+ ms + '&search1=' + s1);

			} else {

				window.location.replace(url + '?page=' + num);
			}
		} else {
			var ui = String(url).substring(0, pos);

			if (ms.length != 0 && s1.length != 0) {

				window.location.replace(ui + '?page=' + num + '&myselect=' + ms
						+ '&search1=' + s1);

			}

			else {

				window.location.replace(ui + '?page=' + num);
			}
		}

	}
	function checksearch() {
		if (search1.value.trim() == "" || search1.value == null) {
			alert("请输入查询内容");
			return false;
		} else {
			//alert("string search1="+search1.value);
			search();
		}
	}
	function checksearch2() {
		if (search1.value.trim() == "" || search1.value == null) {
			alert("请输入查询内容");
			return false;
		} else {
			//alert("string search1="+search1.value);
			document.form1.action = "FindServlet?search1=" + search1.value;

			document.form1.submit();
		}
	}

	function search() {
		//alert('search()'+ search1.value);
		//window.location.href="detail.jsp?noteId="+search1.value;
		window.location.href = "FindServlet?search1=" + search1.value;
	}
	function checkjump() {

		if (jump.value.trim() == "" || jump.value == null) {
			alert("请输入要显示的页数");
			return false;
		}
		var re = /^[1-9]{1}[\d]*$/;

		if (!re.test(jump.value.trim())) {
			alert("请输入一个正数");
			return false;
		} else if (jump.value.trim() > 9999) {
			alert("请输入一个小于9999整数");
			return false;
		}
		window.location.href = "FindServlet?page=1&jump=" + jump.value;
		return true;

	}
	function checkint() {
		var re = /^[1-9]{1}[\d]*$/;

		if (!re.test(jump.value.trim())) {
			alert("请输入一个正数");
			return false;
		} else if (jump.value.trim() > 9999) {
			alert("请输入一个小于9999整数");
			return false;
		}
		return true;

	}
	function checksearch3() {
		if (jump.value.trim() == "" || jump.value == null) {
			alert("请输入要显示的页数");
			return false;
		} else if (checkint()) {
			document.form2.action = "FindServlet?page=1&jump=" + jump;
			document.form2.submit();
			return true;
		}
	}
</script>

</head>
<body style="overflow-y: scroll;">

	<%
		@SuppressWarnings("unchecked")
		List<Notes> list = (List<Notes>) request.getAttribute("list");
		//	System.out.println("request.getSession().getAttribute="+request.getSession().getAttribute("curPage"));
		int curPage = (Integer) request.getSession()
				.getAttribute("curPage");
		int xuhao = 0;
		int count = (Integer) request.getAttribute("count");

		if (list == null) {
			response.sendRedirect("index.jsp");
		}
		String oldsearch1 = "";
		if (request.getParameter("search1") != null) {
			oldsearch1 = request.getParameter("search1");
		}
		String selected1 = "selected";
		String selected2 = "";
		if (request.getParameter("myselect") != null) {

			if (request.getParameter("myselect").equals("1")) {
				selected1 = "";
				selected2 = "selected";

			} else {
				selected1 = "selected";
				selected2 = "";
			}
		}
	%>


	<%@include file="header.jsp"%>
	<div style="text-align: right; margin-right: 10px;">
		<div style="margin-top: -55px; margin-left: 70%; margin-right: 5px;">

			<form name="form1" id="form1" onsubmit="checksearch()">

				<select name="myselect" id="myselect">
					<option value="0" <%=selected1%>>按内容查找</option>
					<option value="1" <%=selected2%>>按用户名查找</option>
				</select> <input type="text" id="search1" name="search1" style="width: 46%;"
					value="<%=oldsearch1%>" /> <input type="button" id="button1"
					name="button1" value="查找" onclick="checksearch2()" />
			</form>
		</div>

		<marquee scrollamount="4" width="355px" direction="left"
			scrolldelay="0" behavior="scroll" loop="-1" onmouseover="this.stop()"
			onmouseout="this.start()">
			<a href="http://weibo.com/adulte" target="_blank"
				style="text-decoration: none;"> 欢迎使用BBS系统&nbsp;&nbsp;</a><img
				alt="welcome.png" src="images/welcome.png"
				style="margin-right: 10px; vertical-align: middle;"> <a
				href="post.jsp" onmouseover="mOver(this)" onmouseout="mOut(this)"
				style="text-decoration: none; color: red; align: right;">&nbsp;&nbsp;猛戳这里添加新帖子&nbsp;</a>
			<img alt="add.png" src="images/add.png"
				style="margin-right: 10px; vertical-align: middle;">

		</marquee>


	</div>
	<div class="ui-widget-header" style="text-align: center;">帖子列表</div>
	<table class="ui-widget-content" cellpadding="10" align="center"
		width=90%>

		<tr>
			<th colspan="2">序号</th>
			<th>发帖人</th>
			<th colspan="2">主题</th>
			<th>发贴时间</th>
			<th></th>
		</tr>
		<%
			Iterator<Notes> it = list.iterator();
			while (it.hasNext()) {
				Notes note = it.next();
				xuhao++;
		%>
		<tr>
			<td align="center" colspan="2"><%=xuhao%></td>

			<td align="center"><%=note.getUsers().getUserName()%></td>
			<td align="center" colspan="2"><a
				href="detail.jsp?noteId=<%=note.getNoteId()%>"> <%
 	if (note.getTitle().length() > 30) {
 %> <%=note.getTitle().substring(0, 30) + "……"%> <%
 	} else {
 %> <%=note.getTitle()%> <%
 	}
 %>
			</a></td>

			<td align="center"><%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(note.getPubTime())%></td>
			<%
				System.out.println("(int)user.getUserId1()="
							+ (int) user.getUserId1());
					System.out.println("(int)note.getUser().getUserId1()="
							+ (int) note.getUsers().getUserId1());
					if ((int) user.getUserId1() == (int) note.getUsers()
							.getUserId1()) {
			%>
			<td align="center"><input type="submit" value="Delete"
				onclick="if(confirm('Message:\nAre you sure to delete this note?'))javascript:document.location.href='doDelete.jsp?noteId=<%=note.getNoteId()%>'"></td>
			<%
				} else {
			%>
			<td align="center">&nbsp;</td>
			<%
				}
			%>
		</tr>

		<%
			}
			if (request.getAttribute("bar") != null) {
				String choose = "''";
				String find = "''";
				if (request.getParameter("myselect") != null
						&& request.getParameter("search1") != null) {
					choose = "'" + request.getParameter("myselect") + "'";
					find = "'" + request.getParameter("search1") + "'";
				}
		%>


		<tr>
			<td align="right" colspan="3"><form name="form2"
					onsubmit="return checkjump();">
					&nbsp;&nbsp;&nbsp;每页显示条数： <input type="text" id="jump" name="jump"
						style="width: 8%;" /> <input type="button" id="button2"
						name="button2" value="确定" onclick=" return checksearch3();" />
				</form></td>
			<td align="left" colspan="3"><a
				href="javascript:go(<%=1%>,<%=count%>,<%=choose%>,<%=find%>)"
				style="text-decoration: none; border: 4px double #e1e2e3; cursor: pointer;">&nbsp;首页&nbsp;</a>
				<a
				href="javascript:go(<%=curPage - 1%>,<%=count%>,<%=choose%>,<%=find%>)"
				style="text-decoration: none; border: 4px double #e1e2e3; cursor: pointer;">&nbsp;&nbsp;上一页&nbsp;&nbsp;</a><%=request.getAttribute("bar")%>
				<a
				href="javascript:go(<%=curPage + 1%>,<%=count%>,<%=choose%>,<%=find%>)"
				style="text-decoration: none; border: 4px double #e1e2e3; cursor: pointer;">&nbsp;&nbsp;下一页&nbsp;&nbsp;</a><a
				href="javascript:go(<%=count%>,<%=count%>,<%=choose%>,<%=find%>)"
				style="text-decoration: none; border: 4px double #e1e2e3; cursor: pointer;">&nbsp;尾页&nbsp;</a>
				第<%=curPage%>页/共<%=count%>页</td>

		</tr>
		<%
			}
		%>
	</table>
	<%
		if (request.getParameter("search1") != null) {
	%>
	<a href="FindServlet"><img src="images/go_back.png"
		style="left: 93%; top: 85%; position: fixed;" title="返回帖子列表"></a>
	<%
		}
	%>
	<%@include file="footer.jsp"%>

</body>
</html>