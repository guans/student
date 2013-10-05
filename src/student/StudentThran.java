package student;

import java.io.*;
import java.sql.*;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;

public class StudentThran extends HttpServlet { // 用于异动学生

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("text/html;charset=GB2312");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("GB2312");
		HttpSession session = req.getSession(true);

		// 获得学生ID
		String stu_id = req.getParameter("id");
		// 班级
		String t_class = req.getParameter("combobox1");
		// 性别
		String t_sex = req.getParameter("combobox2");
		// 目标班级
		String dep_target = req.getParameter("dep_target");
		// 复学目标班级
		String dep_t = req.getParameter("combobox4");
		// 姓名
		String t_name = req.getParameter("select_name");
		// 学号
		String t_id = req.getParameter("select_stuid");
		// 转校原因
		String t_reason = req.getParameter("thran_reason");
		// 转校去向
		String t_target = req.getParameter("thran_target");
		int success = 0;
		// 获取请求中的参数
		String action = req.getParameter("action");
		String type = req.getParameter("type");
		String act = req.getParameter("action2");
		students stu = null;

		if (!"".equals(action)) {// 退学
			if ("Exit".equalsIgnoreCase(action)) {
				if ("退学".equalsIgnoreCase(act)) {
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
									+ t_target + "','" + "退学')";

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
					out.println("alert('退学成功！');");
					out.println((new StringBuilder())
							.append("window.location.href='")
							.append("thran_manage.jsp").append("'; ")
							.toString());
					out.println("</script>");
				} else if ("exit".equalsIgnoreCase(act)) {
					String search = req.getParameter("search");
					{
						String n = "";
						if ("查询".equalsIgnoreCase(search)) {

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
							req.setAttribute("rs", rss); // 设置参数 }

							getServletContext().getRequestDispatcher(
									"/thran_manage.jsp").forward(req, res);

						}
					}
				}
			}

			else if ("retire".equalsIgnoreCase(action)) {
				// 休学
				if ("休学".equalsIgnoreCase(act)) {
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
									+date.toLocaleString()+"','"+ "不明'"
									+ ',' + "'休学')";
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
					out.println("alert('休学成功！');");
					out.println((new StringBuilder())
							.append("window.location.href='")
							.append("retire_manage.jsp").append("'; ")
							.toString());
					out.println("</script>");
				} else if ("retire".equalsIgnoreCase(act)) {
					String search = req.getParameter("search");
					{
						String n = "";
						if ("查询".equalsIgnoreCase(search)) {

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
							req.setAttribute("rs", rss); // 设置参数 }

							getServletContext().getRequestDispatcher(
									"/retire_manage.jsp").forward(req, res);

						}
					}
				}
			}

			else if ("recover".equalsIgnoreCase(action)) {
				// 复学
				if ("复学".equalsIgnoreCase(act)) {
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
					out.println("alert('复学成功！');");
					out.println((new StringBuilder())
							.append("window.location.href='")
							.append("retire_manage.jsp").append("'; ")
							.toString());
					out.println("</script>");
				} else if ("recover".equalsIgnoreCase(act)) {
					String search = req.getParameter("search");
					{
						String n = "";
						if ("查询".equalsIgnoreCase(search)) {

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
							req.setAttribute("rs", rss); // 设置参数 }

							getServletContext().getRequestDispatcher(
									"/recover_manage.jsp").forward(req, res);

						}
					}
				}
			}

			else if ("adjust".equalsIgnoreCase(action)) {
				// 调班
				if ("调班".equalsIgnoreCase(act)) {
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
					out.println("alert('调班成功！');");
					out.println((new StringBuilder())
							.append("window.location.href='")
							.append("adjust_manage.jsp").append("'; ")
							.toString());
					out.println("</script>");
				} else if ("adjust".equalsIgnoreCase(act)) {
					String search = req.getParameter("search");
					{
						String n = "";
						if ("查询".equalsIgnoreCase(search)) {

							String sql = "SELECT * FROM T_STUDENT WHERE S_NAME LIKE "
									+ "'%"
									+ t_name
									+ "%'and S_DEP LIKE"
									+ "'%"
									+ t_class + "%'";

							sqlBean sq = new sqlBean();
							ResultSet rss = sq.executeQuery(sql);
							req.setAttribute("rs", rss); // 设置参数 }
							session.setAttribute("t_class", t_class);// 班级存放于session
							getServletContext().getRequestDispatcher(
									"/adjust_manage.jsp").forward(req, res);

						}
					}
				}
			}

		}

		/*
		 * String search = req.getParameter("search"); { String n = ""; if
		 * ("查询".equalsIgnoreCase(search)) {
		 * 
		 * String sql = "SELECT * FROM T_STUDENT WHERE S_ID LIKE " + "'%" + t_id
		 * + "%' and S_NAME LIKE " + "'%" + t_name + "%'and S_DEP LIKE" + "'%" +
		 * t_class + "%'" + "and S_SEX LIKE" + "'%" + t_sex + "%'";
		 * 
		 * sqlBean sq = new sqlBean(); ResultSet rss = sq.executeQuery(sql);
		 * req.setAttribute("rs", rss); // 设置参数 }
		 * 
		 * getServletContext().getRequestDispatcher("/thran_manage.jsp")
		 * .forward(req, res);
		 * 
		 * } }
		 */
	}

	// 响应post请求
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		doGet(req, res);

	}

}