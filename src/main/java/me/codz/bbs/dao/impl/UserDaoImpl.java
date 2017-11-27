package me.codz.bbs.dao.impl;

import me.codz.bbs.common.HibernateSessionFactory;
import me.codz.bbs.dao.UserDao;
import me.codz.bbs.model.Notes;
import me.codz.bbs.model.Users;
import org.hibernate.CacheMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class UserDaoImpl implements UserDao {

    @Override
    public void addUser(Users user) {

        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateSessionFactory.getSession();
            tx = session.beginTransaction();

            session.save(user);
            tx.commit();

        } catch (Exception e) {
            System.out.print("注册一个用户失败");
            e.printStackTrace();
        }/*
         * finally {if(session!=null) HibernateSessionFactory.closeSession(); }
		 */

    }

    @SuppressWarnings("unchecked")
    @Override
    public Users findUser(int userId) {
        Iterator<Users> it;
        Users user = null;
        try {
            Session session = HibernateSessionFactory.getSession();
            session.setCacheMode(CacheMode.NORMAL);

            Query query = session.createQuery("from Users where userId1=:userId1");
            query.setInteger("userId1", userId);
            List<Users> list = query.list();
            if (!list.isEmpty()) {
                it = list.iterator();
                user = it.next();
            }
            // HibernateSessionFactory.closeSession();
        } catch (Exception e) {
            System.out.print("根据ID查找一个用户失败");
            e.printStackTrace();
        }

        return user;

    }

    @Override
    public Users findUser(int userId, String password) {
        Iterator<Users> it = null;
        Users user = null;
        try {
            Session session = HibernateSessionFactory.getSession();
            Query query = session
                    .createQuery("from Users where userId1=:userId1 and password=:password");
            query.setInteger("userId1", userId);
            query.setString("password", password);
            @SuppressWarnings("unchecked")
            List<Users> list = query.list();
            if (!list.isEmpty()) {
                it = list.iterator();
                user = (Users) it.next();
            }
            // HibernateSessionFactory.closeSession();
        } catch (Exception e) {
            System.out.print("根据ID/password查找一个用户失败");
            e.printStackTrace();
        }

        return user;

    }

    public int mdUserPassword(int userId, String newpassword) {
        try {
            Session session = HibernateSessionFactory.getSession();
            Users user = (Users) session.get(Users.class, userId);
            user.setPassword(newpassword);
            Transaction tx = session.beginTransaction();
            session.update(user);
            tx.commit();
            // HibernateSessionFactory.closeSession();
        } catch (Exception e) {
            System.out.print("修改用户登陆密码失败");
            e.printStackTrace();
        }

        return 1;

        // String hql = "update Users set password = " + newpassword
        // + " where userId1=" + userId;
        // Session session = HibernateSessionFactory.getSession();
        // Query query = session.createQuery(hql);
        // Transaction tx = session.beginTransaction();
        // int i = query.executeUpdate();
        // tx.commit();
        //
        // session.flush();
        // HibernateSessionFactory.closeSession();
        // return i;

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Notes> getUserSearch(String search, int page) {
        List<Notes> list = new ArrayList<Notes>();
        try {
            StringBuffer hql = new StringBuffer();
            hql.append("select nt from Notes nt join nt.users us where us.userName like '%");
            hql.append(search);
            hql.append("%'");

            Session session = HibernateSessionFactory.getSession();

            Query query = session.createQuery(hql.toString());
            query.setFirstResult((page - 1) * Notes.PAGE_SIZE);
            query.setMaxResults(Notes.PAGE_SIZE);

            list = (List<Notes>) query.list();

            // HibernateSessionFactory.closeSession();
        } catch (Exception e) {
            System.out.print("搜索用户失败（查找功能）");
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public Number getSearchPageCount(String search) {
        Number num = null;
        try {
            StringBuffer hql = new StringBuffer();
            hql.append("select count(*) from Notes nt join nt.users us where us.userName like '%");
            hql.append(search);
            hql.append("%'");

            Session session = HibernateSessionFactory.getSession();
            Query query = session.createQuery(hql.toString());
            num = (Number) query.uniqueResult();
            // HibernateSessionFactory.closeSession();
        } catch (Exception e) {
            System.out.print("获取搜索到用户的总数失败（查找功能）");
            e.printStackTrace();
        }
        return num;
    }

}
