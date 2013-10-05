package student;

import java.io.*;
import java.sql.*;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;

public class StudentThran extends HttpServlet { // �����춯ѧ��

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("text/html;charset=GB2312");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("GB2312");
		HttpSession session = req.getSession(true);

		// ���ѧ��ID
		String stu_id = req.getParameter("id");
		// �༶
		String t_class = req.getParameter("combobox1");
		// �Ա�
		String t_sex = req.getParameter("combobox2");
		// Ŀ��༶
		String dep_target = req.getParameter("dep_target");
		// ��ѧĿ��༶
		String dep_t = req.getParameter("combobox4");
		// ����
		String t_name = req.getParameter("select_name");
		// ѧ��
		String t_id = req.getParameter("select_stuid");
		// תУԭ��
		String t_reason = req.getParameter("thran_reason");
		// תУȥ��
		String t_target = req.getParameter("thran_target");
		int success = 0;
		// ��ȡ�����еĲ���
		String action = req.getParameter("action");
		String type = req.getParameter("type");
		String act = req.getParameter("action2");
		students stu = null;

		if (!"".equals(action)) {// ��ѧ
			if ("Exit".equalsIgnoreCase(action)) {
				if ("��ѧ".equalsIgnoreCase(act)) {
					sqlBean dbb = new sqlBean();
					String ids[] = req.getParameterValues("selBigClass");
					String userid = (String) session.getAttribute("id");
					Date date = new Date();
					if (ids != null) {
						for (int t = 0; t < ids.length; t++) {
							String log = "INSERT INTO T_ZHUANXUE(S_ID,S_REASON,S_TIME,S_PLACE,S_TYPE) VALUES ('"
									+ ids[t]
									+ "','"
									+ t_reason
									+ "','"
									+date.toLocaleString()+"','"
									+ t_target + "','" + "��ѧ')";

							int m = dbb.executeInsert(log);
							String insert = "INSERT INTO T_DELETE SELECT * FROM T_STUDENT WHERE S_ID= '"
									+ ids[t] + "'";
							int n = dbb.executeInsert(insert);
							String delect = "DELETE  FROM T_STUDENT WHERE S_ID ='"
									+ ids[t] + "'";
							int o = dbb.executeInsert(delect);
						}

					}
					out.println("<SCRIPT LANGUAGE=javascript>");
					out.println("alert('��ѧ�ɹ���');");
					out.println((new StringBuilder())
							.append("window.location.href='")
							.append("thran_manage.jsp").append("'; ")
							.toString());
					out.println("</script>");
				} else if ("exit".equalsIgnoreCase(act)) {
					String search = req.getParameter("search");
					{
						String n = "";
						if ("��ѯ".equalsIgnoreCase(search)) {

							String sql = "SELECT * FROM T_STUDENT WHERE S_ID LIKE "
									+ "'%"
									+ t_id
									+ "%' and S_NAME LIKE "
									+ "'%"
									+ t_name
									+ "%'and S_DEP LIKE"
									+ "'%"
									+ t_class
									+ "%'"
									+ "and S_SEX LIKE"
									+ "'%"
									+ t_sex + "%'";

							sqlBean sq = new sqlBean();
							ResultSet rss = sq.executeQuery(sql);
							req.setAttribute("rs", rss); // ���ò��� }

							getServletContext().getRequestDispatcher(
									"/thran_manage.jsp").forward(req, res);

						}
					}
				}
			}

			else if ("retire".equalsIgnoreCase(action)) {
				// ��ѧ
				if ("��ѧ".equalsIgnoreCase(act)) {
					sqlBean dbb = new sqlBean();
					String ids[] = req.getParameterValues("selBigClass");
					String userid = (String) session.getAttribute("id");
					Date date = new Date();
					if (ids != null) {
						for (int t = 0; t < ids.length; t++) {
							String log = "INSERT INTO T_ZHUANXUE(S_ID,S_REASON,S_TIME,S_PLACE,S_TYPE) VALUES ('"
									+ ids[t]
									+ "','"
									+ t_reason
									+ "','"
									+date.toLocaleString()+"','"+ "����'"
									+ ',' + "'��ѧ')";
							int m = dbb.executeInsert(log);
							String insert = "INSERT INTO T_DELETE SELECT * FROM T_STUDENT WHERE S_ID= '"
									+ ids[t] + "'";
							int n = dbb.executeInsert(insert);
							String delect = "DELETE  FROM T_STUDENT WHERE S_ID ='"
									+ ids[t] + "'";
							int o = dbb.executeInsert(delect);
						}

					}
					out.println("<SCRIPT LANGUAGE=javascript>");
					out.println("alert('��ѧ�ɹ���');");
					out.println((new StringBuilder())
							.append("window.location.href='")
							.append("retire_manage.jsp").append("'; ")
							.toString());
					out.println("</script>");
				} else if ("retire".equalsIgnoreCase(act)) {
					String search = req.getParameter("search");
					{
						String n = "";
						if ("��ѯ".equalsIgnoreCase(search)) {

							String sql = "SELECT * FROM T_STUDENT WHERE S_ID LIKE "
									+ "'%"
									+ t_id
									+ "%' and S_NAME LIKE "
									+ "'%"
									+ t_name
									+ "%'and S_DEP LIKE"
									+ "'%"
									+ t_class
									+ "%'"
									+ "and S_SEX LIKE"
									+ "'%"
									+ t_sex + "%'";

							sqlBean sq = new sqlBean();
							ResultSet rss = sq.executeQuery(sql);
							req.setAttribute("rs", rss); // ���ò��� }

							getServletContext().getRequestDispatcher(
									"/retire_manage.jsp").forward(req, res);

						}
					}
				}
			}

			else if ("recover".equalsIgnoreCase(action)) {
				// ��ѧ
				if ("��ѧ".equalsIgnoreCase(act)) {
					sqlBean dbb = new sqlBean();
					String ids[] = req.getParameterValues("selBigClass");
					String userid = (String) session.getAttribute("id");
					if (ids != null) {
						for (int t = 0; t < ids.length; t++) {
							String log = "DELETE  FROM T_ZHUANXUE WHERE S_ID ='"
									+ ids[t] + "'";

							int m = dbb.executeInsert(log);
							String insert = "INSERT INTO T_STUDENT SELECT * FROM T_DELETE WHERE S_ID= '"
									+ ids[t] + "'";

							int n = dbb.executeInsert(insert);
							String delect = "DELETE  FROM T_DELETE WHERE S_ID ='"
									+ ids[t] + "'";

							int o = dbb.executeInsert(delect);
							
							String updat = "UPDATE T_STUDENT SET S_DEP='"
								+ dep_t + "' WHERE S_ID=" + ids[t];
							int p = dbb.executeInsert(updat);

						}

					}
					out.println("<SCRIPT LANGUAGE=javascript>");
					out.println("alert('��ѧ�ɹ���');");
					out.println((new StringBuilder())
							.append("window.location.href='")
							.append("retire_manage.jsp").append("'; ")
							.toString());
					out.println("</script>");
				} else if ("recover".equalsIgnoreCase(act)) {
					String search = req.getParameter("search");
					{
						String n = "";
						if ("��ѯ".equalsIgnoreCase(search)) {

							String sql = "SELECT * FROM T_DELETE WHERE S_NAME LIKE "
									+ "'%"
									+ t_name
									+ "%'and S_DEP LIKE"
									+ "'%"
									+ t_class
									+ "%'"
									+ "and S_SEX LIKE"
									+ "'%"
									+ t_sex + "%'";

							sqlBean sq = new sqlBean();
							ResultSet rss = sq.executeQuery(sql);
							req.setAttribute("rs", rss); // ���ò��� }

							getServletContext().getRequestDispatcher(
									"/recover_manage.jsp").forward(req, res);

						}
					}
				}
			}

			else if ("adjust".equalsIgnoreCase(action)) {
				// ����
				if ("����".equalsIgnoreCase(act)) {
					sqlBean dbb = new sqlBean();
					String ids[] = req.getParameterValues("selBigClass");
					String userid = (String) session.getAttribute("id");
					if (ids != null) {
						for (int t = 0; t < ids.length; t++) {

							String adjus_str = "UPDATE T_STUDENT SET S_DEP='"
									+ dep_target + "' WHERE S_ID=" + ids[t];
							int n = dbb.executeInsert(adjus_str);

						}
						action = null;
					}
					out.println("<SCRIPT LANGUAGE=javascript>");
					out.println("alert('����ɹ���');");
					out.println((new StringBuilder())
							.append("window.location.href='")
							.append("adjust_manage.jsp").append("'; ")
							.toString());
					out.println("</script>");
				} else if ("adjust".equalsIgnoreCase(act)) {
					String search = req.getParameter("search");
					{
						String n = "";
						if ("��ѯ".equalsIgnoreCase(search)) {

							String sql = "SELECT * FROM T_STUDENT WHERE S_NAME LIKE "
									+ "'%"
									+ t_name
									+ "%'and S_DEP LIKE"
									+ "'%"
									+ t_class + "%'";

							sqlBean sq = new sqlBean();
							ResultSet rss = sq.executeQuery(sql);
							req.setAttribute("rs", rss); // ���ò��� }
							session.setAttribute("t_class", t_class);// �༶�����session
							getServletContext().getRequestDispatcher(
									"/adjust_manage.jsp").forward(req, res);

						}
					}
				}
			}

		}

		/*
		 * String search = req.getParameter("search"); { String n = ""; if
		 * ("��ѯ".equalsIgnoreCase(search)) {
		 * 
		 * String sql = "SELECT * FROM T_STUDENT WHERE S_ID LIKE " + "'%" + t_id
		 * + "%' and S_NAME LIKE " + "'%" + t_name + "%'and S_DEP LIKE" + "'%" +
		 * t_class + "%'" + "and S_SEX LIKE" + "'%" + t_sex + "%'";
		 * 
		 * sqlBean sq = new sqlBean(); ResultSet rss = sq.executeQuery(sql);
		 * req.setAttribute("rs", rss); // ���ò��� }
		 * 
		 * getServletContext().getRequestDispatcher("/thran_manage.jsp")
		 * .forward(req, res);
		 * 
		 * } }
		 */
	}

	// ��Ӧpost����
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		doGet(req, res);

	}

}