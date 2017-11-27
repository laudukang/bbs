package me.codz.bbs.dao.impl;

import me.codz.bbs.dao.UserDao;
import me.codz.bbs.model.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class DoLoginServlet extends HttpServlet {

    //DoLoginServlet未能缩短第一次用户登录时间，用回doLogin.jsp处理登录信息
    //2014年8月4日20:44:17


    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("DoLoginServlet dopost init");
        int userId = Integer.valueOf(new String(req.getParameter("userId")
                .getBytes("ISO-8859-1"), "UTF-8"));

        String password = new String(req.getParameter("password").getBytes(
                "ISO-8859-1"), "UTF-8").trim();
        UserDao userdao = new UserDaoImpl();
        Users user = userdao.findUser(userId, password);

        if (user != null) {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("FindServlet");

        } else {
            user = userdao.findUser(userId);

            if (null == user) {

                resp.getWriter()
                        .println(
                                "<script language='javascript'>alert('Message:\\nThe userId is not existed.\nPress OK to return index.jsp');top.location = 'index.jsp';</script>");
            } else {

                resp.getWriter()
                        .println(
                                "<script language='javascript'>alert('Message:\\nThe password you inputted is incorrect.\\nPress OK to return index.jsp');top.location = 'index.jsp';</script>");
            }
        }

    }

}
