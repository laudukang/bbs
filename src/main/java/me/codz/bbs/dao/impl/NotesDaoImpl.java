package me.codz.bbs.dao.impl;

import me.codz.bbs.common.HibernateSessionFactory;
import me.codz.bbs.dao.NotesDao;
import me.codz.bbs.model.Notes;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class NotesDaoImpl implements NotesDao {

    @Override
    public void addNote(Notes note) {

        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateSessionFactory.getSession();
            tx = session.beginTransaction();

            session.save(note);
            tx.commit();

        } catch (Exception e) {
            System.out.println("添加一个新帖子失败");
            e.printStackTrace();
        } /*
         * finally { if (session != null)
		 * HibernateSessionFactory.closeSession(); }
		 */
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Notes> getAllNotes() {
        List<Notes> list = new ArrayList<Notes>();
        String hql = "from Notes order by pubTime desc";
        try {
            Session session = HibernateSessionFactory.getSession();
            Query query = session.createQuery(hql);

            list = (List<Notes>) query.list();
        } catch (Exception e) {
            System.out.println("获取帖子列表失败(无分页)");
            e.printStackTrace();
        }
        // HibernateSessionFactory.closeSession();
        return list;

    }

    @Override
    public Notes getNoteById(int noteId) {

        Iterator<Notes> it = null;
        Notes notes = new Notes();

        try {
            Session session = HibernateSessionFactory.getSession();

            Query query = session.createQuery("from Notes where noteId=:noteId");
            query.setInteger("noteId", noteId);
            @SuppressWarnings("unchecked")
            List<Notes> list = (List<Notes>) query.list();
            it = list.iterator();
            notes = it.next();
            // HibernateSessionFactory.closeSession();
        } catch (Exception e) {
            System.out.println("获取帖子详情失败");
            e.printStackTrace();
        }

        return notes;

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Notes> getNoteList(int page) {

        String hql = "from Notes order by pubTime desc";
        List<Notes> list = new ArrayList<Notes>();
        try {
            Session session = HibernateSessionFactory.getSession();

            Query query = session.createQuery(hql);
            query.setFirstResult((page - 1) * Notes.PAGE_SIZE);
            query.setMaxResults(Notes.PAGE_SIZE);
            list = (List<Notes>) query.list();
            // HibernateSessionFactory.closeSession();
        } catch (Exception e) {
            System.out.println("获取帖子列表失败(分页)");
            e.printStackTrace();
        }
        return list;

    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Notes> getNoteSearch(String search, int page) {
        List<Notes> list = new ArrayList<Notes>();
        try {
            Session session = HibernateSessionFactory.getSession();

            StringBuffer hql = new StringBuffer();
            hql.append("select distinct nt from Notes nt join nt.replyses re where re.replyContent like '%");
            hql.append(search);
            hql.append("%' or nt.noteId like '");
            hql.append(search);
            hql.append("' or nt.content like '%");
            hql.append(search);
            hql.append("%' or nt.user.userId1 like '");
            hql.append(search);
            hql.append("'");

            Query query = session.createQuery(hql.toString());
            query.setFirstResult((page - 1) * Notes.PAGE_SIZE);
            query.setMaxResults(Notes.PAGE_SIZE);

            list = (List<Notes>) query.list();
            // HibernateSessionFactory.closeSession();
        } catch (Exception e) {
            System.out.println("查找帖子内容getNoteSearch(分页)失败");
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public void deleteNote(int noteId) {
        Session session = null;
        try {
            session = HibernateSessionFactory.getSession();
            Transaction tx = session.beginTransaction();

            Notes notes = (Notes) session.get(Notes.class, noteId);
            // System.out.println("noteId=" + notes.getTitle());
            session.delete(notes);
            tx.commit();

        } catch (Exception ex) {
            System.out.println("删除帖子失败");
            ex.printStackTrace();

        } /*
		 * finally { if (session != null)
		 * HibernateSessionFactory.closeSession(); }
		 */

    }

    @Override
    public Number getNotesCount() {
        Number num = null;
        try {
            String hql = "select count(*) from Notes";
            Session session = HibernateSessionFactory.getSession();
            Query query = session.createQuery(hql);
            num = (Number) query.uniqueResult();
            // HibernateSessionFactory.closeSession();
        } catch (Exception ex) {
            System.out.println("获取帖子总数失败");
            ex.printStackTrace();

        }
        return num;

    }

    public Number getNotesLimitCount(String search) {
        Number num = null;
        try {
            StringBuffer hql = new StringBuffer();
            hql.append("select count(distinct nt) from Notes nt join nt.replyses re where re.replyContent like '%");
            hql.append(search);
            hql.append("%' or nt.noteId like '");
            hql.append(search);
            hql.append("' or nt.content like '%");
            hql.append(search);
            hql.append("%' or nt.user.userId1 like '");
            hql.append(search);
            hql.append("'");

            Session session = HibernateSessionFactory.getSession();
            Query query = session.createQuery(hql.toString());
            num = (Number) query.uniqueResult();
            // HibernateSessionFactory.closeSession();
        } catch (Exception ex) {
            System.out.println("获取查找到的帖子总数失败");
            ex.printStackTrace();

        }
        return num;
    }
}
