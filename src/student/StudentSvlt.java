package student;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;



public class StudentSvlt extends HttpServlet { // 用于新建，删除，更新学生

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("gb2312");

		
		// 获得学生ID
		String stu_id = req.getParameter("id");
		// 班级
		String t_class = req.getParameter("combobox1");
		// 性别
		String t_sex = req.getParameter("combobox2");
		// 姓名
		String t_name = req.getParameter("select_name");
		// 学号
		String t_id = req.getParameter("select_stuid");
		int success = 0;
		// 获取请求中的参数
		String action = req.getParameter("action");
		String type = req.getParameter("type");
		students stu = null;
		// String message = "";
		// 如果请求中包含新建学生参数
		if (!"".equals(action)) {
			if ("new".equalsIgnoreCase(action)) {

				// 调用新建学生方法
				doNew(req, res);

			}
			// 如果请求中包含修改学生参数
			if ("update".equalsIgnoreCase(action)) {
				try {
					// 调用修改学生信息方法
					doUpdate(req, res, stu_id);
				} catch (SQLException e) {
				}
			}
			// 如果请求中包含删除学生参数
			if ("delete".equalsIgnoreCase(action)) {
				try {
					// 调用删除学生方法
					doDelete(req, res, stu_id);
				} catch (SQLException e) {
				}

			}
			
			// 如果请求中包含删除多个
			if ("del".equalsIgnoreCase(action)) {
				PrintWriter out = res.getWriter();
				String ids[] = req.getParameterValues("selBigClass");
				sqlBean dbb= new sqlBean();
				if (ids != null)
				{
					for (int t = 0; t < ids.length; t++)
					{
						String update = (new StringBuilder()).append("delete from T_STUDENT").append(" where S_ID = '").append(ids[t]).append("'").toString();
						int m=dbb.executeInsert(update);
						
					}

				}
				
				

				// 调用删除学生方法
				getServletContext().getRequestDispatcher("/stu_filet.jsp")
						.forward(req, res);

			}
		}

		// String type = req.getParameter("type");
		if (!type.equals("")) {
			//button判断用户要进行的操作 增删改查 导入
			if (type.equals("searchServlet")) {

				String sql = "SELECT * FROM T_STUDENT WHERE S_ID LIKE " + "'%"
						+ t_id + "%' and S_NAME LIKE " + "'%" + t_name
						+ "%'and S_DEP LIKE" + "'%" + t_class + "%'"
						+ "and S_SEX LIKE" + "'%" + t_sex + "%'";

				sqlBean sq = new sqlBean();
				ResultSet rss = sq.executeQuery(sql);
				req.setAttribute("rs", rss); // 设置参数

				getServletContext().getRequestDispatcher(
						"/stu_file.jsp?t_class=" + t_class).forward(req, res);

			}

			else if (type.equals("editServlet")) {

				// 调用修改学生方法
				getServletContext().getRequestDispatcher("/update_stu.jsp?id="+stu_id)
						.forward(req, res);

			} else if (type.equals("addServlet")) {

				// 调用新建学生方法
				getServletContext().getRequestDispatcher(
						"/add_student.jsp?dep=" + t_class).forward(req, res);

			}

//			else if (type.equals("delServlet")) {
//				PrintWriter out = res.getWriter();
//				String ids[] = req.getParameterValues("selBigClass");
//				sqlBean dbb= new sqlBean();
//				if (ids != null)
//				{
//					for (int t = 0; t < ids.length; t++)
//					{
//						String update = (new StringBuilder()).append("delete from T_STUDENT").append(" where S_ID = '").append(ids[t]).append("'").toString();
//						dbb.executeQuery(update);
//						
//					}
//
//				}
//				out.println("<SCRIPT LANGUAGE=javascript>");
//				out.println("alert('删除成功！');");
//				out.println("</script>");
//				
//
//				// 调用删除学生方法
//				getServletContext().getRequestDispatcher("/del_student.jsp?stud_id="+stu_id)
//						.forward(req, res);
//
//			}

			else if (type.equals("impServlet")) {

				// 调用导入学生方法
				
				
				
				
				getServletContext().getRequestDispatcher("/upload.jsp")
						.forward(req, res);

			} else {
				getServletContext().getRequestDispatcher("/stu_file.jsp")
						.forward(req, res);
			}
		}
		/*
		 * String search = req.getParameter("search"); { String n="";
		 * if("查询".equalsIgnoreCase(search)){
		 * 
		 * String sql="SELECT * FROM T_STUDENT WHERE S_ID LIKE "+"'%"+t_id+
		 * "%' and S_NAME LIKE "
		 * +"'%"+t_name+"%'and S_DEP LIKE"+"'%"+t_class+"%'"
		 * +"and S_SEX LIKE"+"'%"+t_sex+"%'";
		 * 
		 * sqlBean sq=new sqlBean(); ResultSet rss=sq.executeQuery(sql);
		 * req.setAttribute("rs",rss); //设置参数 }
		 * 
		 * getServletContext().getRequestDispatcher("/stu_file.jsp").forward(req,
		 * res);
		 * 
		 * }
		 */

	}

	/// 新建学生方法定义
	public void doNew(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		students stu = new students();

		String id = req.getParameter("id");
		String sid = req.getParameter("s_id");
		String name = req.getParameter("name");
		String entry_time = req.getParameter("enter");
		String birth = req.getParameter("birth");
		String password = req.getParameter("password");
		String dep = req.getParameter("dep");
		String sex = req.getParameter("sex");
		String minzu = req.getParameter("minzu");
		String jiguan = req.getParameter("jiguan");
		String hukou = req.getParameter("hukou");
		String health = req.getParameter("health");
		String phone = req.getParameter("phone");
		String addre = req.getParameter("addre");

		boolean b1 = isTrue(req, res, id, name, password);
		if (b1 == false)
			return;
		boolean b2 = hasLogin(req, res, id);
		if (b2 == false)
			return;
		if (b1 == true && b2 == true) {
			stu.setId(id);
			stu.setS_id(sid);
			stu.setName(name);
			stu.setEntry_time(entry_time);
			stu.setBirth(birth);
			stu.setPassword(password);
			stu.setDep(dep);
			stu.setSex(sex);
			stu.setMinzu(minzu);
			stu.setJiguan(jiguan);
			stu.setHukou(hukou);
			stu.setHealth(health);
			stu.setPhone(phone);
			stu.setAddress(addre);
			stu.addStudent();

		}
		// 并将新建学生存储在request上下文中，然后转向getStudent.jsp页面
	//	 sendBean(req, res, stu, "/stu_file.jsp");
		getServletContext().getRequestDispatcher("/stu_file.jsp").forward(req,res);
	//	res.sendRedirect("/stu_ok.jsp?para=1"); 
	}

	// 更新学生信息方法
	public void doUpdate(HttpServletRequest req, HttpServletResponse res,
			String id) throws ServletException, IOException, SQLException {
		students stu = new students();

		String iid = req.getParameter("id");
		String sid = req.getParameter("s_id");
		String name = req.getParameter("name");
		String entry_time = req.getParameter("enter");
		String birth = req.getParameter("birth");
		String password = req.getParameter("password");
		String dep = req.getParameter("dep");
		String sex = req.getParameter("sex");
		String minzu = req.getParameter("minzu");
		String jiguan = req.getParameter("jiguan");
		String hukou = req.getParameter("hukou");
		String health = req.getParameter("health");
		String phone = req.getParameter("phone");
		String addre = req.getParameter("addre");
		;
		boolean b = isTrue(req, res, iid, name, password);
		if (b == false)
			return;
		if (b == true) {

			stu.setId(iid);
			stu.setS_id(sid);
			stu.setName(name);
			stu.setEntry_time(entry_time);
			stu.setBirth(birth);
			stu.setPassword(password);
			stu.setDep(dep);
			stu.setSex(sex);
			stu.setMinzu(minzu);
			stu.setJiguan(jiguan);
			stu.setHukou(hukou);
			stu.setHealth(health);
			stu.setPhone(phone);
			stu.setAddress(addre);

			stu.updateStudent(); // 更新学生信息
		}
		// 并将修改后的学生信息存储在request上下文中，然后转向getStudent.jsp页面
		// sendBean(req, res, stu, "/getStudent.jsp");

		//res.getWriter().print("<script>alert('You are uploading the illegal file type');</script>");
		getServletContext().getRequestDispatcher("/stu_file.jsp").forward(req,
				res);
	}

	// 删除学生方法
	public void doDelete(HttpServletRequest req, HttpServletResponse res,
			String id) throws ServletException, IOException, SQLException {
		int num = 0;
		students stu = new students();
		num = stu.deleteStudent(id);
		if (num != 1) {
			doError(req, res,
					"StudentSvlt: Delete unsuccessful. Rows affected: " + num);
		} else {
			// res.sendRedirect("stu_file.jsp");
			getServletContext().getRequestDispatcher("/stu_file.jsp").forward(
					req, res);
		}

	}

	// 将查询后的结果集存储在session中
	public void sendResultSet(HttpServletRequest req, HttpServletResponse res,
			java.sql.ResultSet rs, String target) throws ServletException,
			IOException {
		req.setAttribute("rs", rs);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(req, res);
	}

	// 保存学生信息的JavaBean到request上下文中
	public void sendBean(HttpServletRequest req, HttpServletResponse res,
			students stu, String target) throws ServletException, IOException {
		req.setAttribute("stu", stu);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(req, res);
	}

	// 错误处理方法
	public void doError(HttpServletRequest req, HttpServletResponse res,
			String str) throws ServletException, IOException {

		req.setAttribute("problem", str);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/errorpage.jsp");
		rd.forward(req, res);
	}

	// 判断学生是否被注册过
	public boolean hasLogin(HttpServletRequest req, HttpServletResponse res,
			String id) throws ServletException, IOException {
		boolean f = true;
		String message = "对不起，该学生号已经被注册过了!";
		students stu = new students();
		f = stu.hasLogin(id);
		if (f == false) {
			doError(req, res, message);
		}
		return f;
	}

	// 判断学生注册是否成功
	public boolean isTrue(HttpServletRequest req, HttpServletResponse res,
			String id, String name, String password) throws ServletException,
			IOException {
		boolean f = true;
		String message = "";
		if (id == null || id.equals("")) {
			f = false;
			message = "错误，学生号不能为空！";
			doError(req, res, message);
			return f;
		}

		if (name == null || name.equals("")) {
			f = false;
			message = "学生姓名不能为空，请重新填写！";
			doError(req, res, message);
			return f;
		}

		if (password == null || password.equals("")) {
			f = false;
			message = "密码不能为空，请重新填写！";
			doError(req, res, message);
			return f;
		}

		return f;

	}

	// 响应post请求
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		doGet(req, res);

	}

}