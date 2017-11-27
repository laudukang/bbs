package me.codz.bbs.dao.impl;

import me.codz.bbs.dao.NotesDao;
import me.codz.bbs.dao.UserDao;
import me.codz.bbs.model.Notes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class FindServlet extends HttpServlet {
	

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) {

		try{
		int curPage = 1;

		if (request.getParameter("page") != null) {
			curPage = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("jump") != null) {

			Notes.PAGE_SIZE = Integer.parseInt(request.getParameter("jump"));

		}

		request.getSession().setAttribute("curPage", curPage);

		NotesDao notesdao = new NotesDaoImpl();
		List<Notes> list = null;

		int count = 0;
		String sea = request.getParameter("search1");
		String choose = request.getParameter("myselect");
		if (sea != null && choose != null) {

			if (choose.equals("0")) {
				list = (List<Notes>) notesdao.getNoteSearch(sea, curPage);
				count = notesdao.getNotesLimitCount(sea).intValue();
			
			} else if (choose.equals("1")) {

				UserDao userdao = new UserDaoImpl();
				list = (List<Notes>) userdao.getUserSearch(sea, curPage);
				count = userdao.getSearchPageCount(sea).intValue();

			}
		} else {
			list = (List<Notes>) notesdao.getNoteList(curPage);
			count = notesdao.getNotesCount().intValue();
			//curPage = 1;

		}

		request.setAttribute("list", list);

		int pages;

		if (count % Notes.PAGE_SIZE == 0) {
			pages = count / Notes.PAGE_SIZE;
		} else {
			pages = count / Notes.PAGE_SIZE + 1;
		}
		request.setAttribute("count", pages);

		StringBuffer sb = new StringBuffer();
		sb.append(" ");
		for (int i = 1; i <= pages; i++) {
			if (i < curPage - 3)
				continue;
			if (i == curPage - 3&&i!=1)
				sb.append("··· ");

			if (i > curPage + 3)
				continue;

			if (i == curPage) {
				sb.append("【" + i + "】");
			} else {
				if (sea != null && choose != null) {
					sb.append("<a style='text-decoration: none;border: 4px double #e1e2e3;cursor: pointer;' href='FindServlet?page="
							+ i
							+ "&myselect="
							+ choose
							+ "&search1="
							+ sea
							+ "' >" + "&nbsp;" + i + "&nbsp;" + "</a>");
				} else
					sb.append("<a style='text-decoration: none;border: 4px double #e1e2e3;cursor: pointer;' href='FindServlet?page="
							+ i + "' >" + "&nbsp;" + i + "&nbsp;" + "</a>");
			}
			sb.append(" ");
			if (i == curPage + 3&&i!=pages)
				sb.append("··· ");
		}
		request.setAttribute("bar", sb.toString());}
		catch(Exception e){
			try {
				response.sendRedirect("index.jsp");
				return;
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				return;
			}
		}

		try {
			request.getRequestDispatcher("list.jsp").forward(request, response);
		} catch (ServletException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}

	}

}
