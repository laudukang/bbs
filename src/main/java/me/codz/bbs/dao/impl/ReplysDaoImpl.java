package me.codz.bbs.dao.impl;

import me.codz.bbs.common.HibernateSessionFactory;
import me.codz.bbs.dao.ReplyDao;
import me.codz.bbs.model.Replys;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class ReplysDaoImpl implements ReplyDao {

    @Override
    public void addReply(Replys reply) {

        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateSessionFactory.getSession();
            tx = session.beginTransaction();

            session.save(reply);
            tx.commit();

        } catch (Exception e) {
            System.out.println("添加一条回复失败");
            e.printStackTrace();
        } /*
         * finally {if(session!=null) HibernateSessionFactory.closeSession(); }
		 */

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Replys> getReplyById(int noteId) {
        List<Replys> list = new ArrayList<Replys>();
        try {
            Session session = HibernateSessionFactory.getSession();

            Query query = session.createQuery("from Replys where noteId=:noteId");
            query.setInteger("noteId", noteId);

            list = (List<Replys>) query.list();

            // HibernateSessionFactory.closeSession();
        } catch (Exception e) {
            System.out.println("获取一条回复内容失败");
            e.printStackTrace();
        }

        return list;

    }

    @Override
    public void deleteReply(int replyId) {

        try {
            Session session = HibernateSessionFactory.getSession();
            Transaction tx = session.beginTransaction();

            Replys replys = (Replys) session.get(Replys.class, replyId);
            session.delete(replys);
            tx.commit();

            // session.flush();

            // HibernateSessionFactory.closeSession();
        } catch (Exception e) {
            System.out.println("删除一条回复内容失败");
            e.printStackTrace();
        }

    }

}
