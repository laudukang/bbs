<%@ page language="java" import="java.util.Date,java.text.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Language" content="zh-CN" />

<title>footer.jsp</title>
<link rel="stylesheet" type="text/css" href="style/main.css">


<script language="JavaScript">
	var timerID = null;
	var timerRunning = false;

	function showtime() {
		var now = new Date();
		var hours = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		var timeValue = (1900 + now.getYear()) + "年" + (now.getMonth() + 1)
				+ "月" + now.getDate() + "日" + ((hours >= 12) ? " 下午 " : " 上午 ");
		timeValue += ((hours > 12) ? hours - 12 : hours);
		timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
		timeValue += ((seconds < 10) ? ":0" : ":") + seconds;

		time.innerHTML = timeValue;
		timerID = setTimeout("showtime()", 1000);
		timerRunning = true;
	}
</script>

</head>

<body onload="showtime();">

	<div class="ui-widget-header"
		style="width: 100%; text-align: center; bottom: 0px; position: absolute;valign:middle;">
		<b>&copy;</b> 2014 Seven Plus One Corporation. All rights reserved.
		&nbsp;&nbsp;<span id="time"></span>&nbsp;&nbsp;Power by <a  href="http://about.me/laudukang" target="_blank">laudukang</a>

	</div>
</body>
</html>