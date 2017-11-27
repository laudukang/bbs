<%@ page language="java"
         import="me.codz.bbs.dao.UserDao,me.codz.bbs.dao.impl.UserDaoImpl,me.codz.bbs.model.Users"
         contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>doLogin.jsp</title>
</head>
<%
    int userId = Integer.valueOf(new String(request.getParameter("userId").getBytes("ISO-8859-1"), "UTF-8"));
    String password = new String(request.getParameter("password").getBytes("ISO-8859-1"), "UTF-8").trim();

    UserDao userdao = new UserDaoImpl();
    Users user = userdao.findUser(userId);

    if (null == user) {
%>

<script>
    alert("Message:\nThe userId is not existed.Please check your login ID.");

    top.location = "index.jsp";
</script>


<%
    return;
} else {
    try {
        user = userdao.findUser(userId, password);
    } catch (Exception e) {
        System.out.println("登陆出错");

        e.printStackTrace();
        return;
    }

    if (user != null) {
        session.setAttribute("user", user);
        response.sendRedirect("FindServlet");
        return;
    } else {
%>
<script>
    alert("Message:\nThe password you inputted is incorrect.\nPlease check your login password.");

    top.location = "index.jsp";
</script>
<%
        }
    }
%>

</html>