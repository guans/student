package student;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;



public class StudentSvlt extends HttpServlet { // �����½���ɾ��������ѧ��

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("gb2312");

		
		// ���ѧ��ID
		String stu_id = req.getParameter("id");
		// �༶
		String t_class = req.getParameter("combobox1");
		// �Ա�
		String t_sex = req.getParameter("combobox2");
		// ����
		String t_name = req.getParameter("select_name");
		// ѧ��
		String t_id = req.getParameter("select_stuid");
		int success = 0;
		// ��ȡ�����еĲ���
		String action = req.getParameter("action");
		String type = req.getParameter("type");
		students stu = null;
		// String message = "";
		// ��������а����½�ѧ������
		if (!"".equals(action)) {
			if ("new".equalsIgnoreCase(action)) {

				// �����½�ѧ������
				doNew(req, res);

			}
			// ��������а����޸�ѧ������
			if ("update".equalsIgnoreCase(action)) {
				try {
					// �����޸�ѧ����Ϣ����
					doUpdate(req, res, stu_id);
				} catch (SQLException e) {
				}
			}
			// ��������а���ɾ��ѧ������
			if ("delete".equalsIgnoreCase(action)) {
				try {
					// ����ɾ��ѧ������
					doDelete(req, res, stu_id);
				} catch (SQLException e) {
				}

			}
			
			// ��������а���ɾ�����
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
				
				

				// ����ɾ��ѧ������
				getServletContext().getRequestDispatcher("/stu_filet.jsp")
						.forward(req, res);

			}
		}

		// String type = req.getParameter("type");
		if (!type.equals("")) {
			//button�ж��û�Ҫ���еĲ��� ��ɾ�Ĳ� ����
			if (type.equals("searchServlet")) {

				String sql = "SELECT * FROM T_STUDENT WHERE S_ID LIKE " + "'%"
						+ t_id + "%' and S_NAME LIKE " + "'%" + t_name
						+ "%'and S_DEP LIKE" + "'%" + t_class + "%'"
						+ "and S_SEX LIKE" + "'%" + t_sex + "%'";

				sqlBean sq = new sqlBean();
				ResultSet rss = sq.executeQuery(sql);
				req.setAttribute("rs", rss); // ���ò���

				getServletContext().getRequestDispatcher(
						"/stu_file.jsp?t_class=" + t_class).forward(req, res);

			}

			else if (type.equals("editServlet")) {

				// �����޸�ѧ������
				getServletContext().getRequestDispatcher("/update_stu.jsp?id="+stu_id)
						.forward(req, res);

			} else if (type.equals("addServlet")) {

				// �����½�ѧ������
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
//				out.println("alert('ɾ���ɹ���');");
//				out.println("</script>");
//				
//
//				// ����ɾ��ѧ������
//				getServletContext().getRequestDispatcher("/del_student.jsp?stud_id="+stu_id)
//						.forward(req, res);
//
//			}

			else if (type.equals("impServlet")) {

				// ���õ���ѧ������
				
				
				
				
				getServletContext().getRequestDispatcher("/upload.jsp")
						.forward(req, res);

			} else {
				getServletContext().getRequestDispatcher("/stu_file.jsp")
						.forward(req, res);
			}
		}
		/*
		 * String search = req.getParameter("search"); { String n="";
		 * if("��ѯ".equalsIgnoreCase(search)){
		 * 
		 * String sql="SELECT * FROM T_STUDENT WHERE S_ID LIKE "+"'%"+t_id+
		 * "%' and S_NAME LIKE "
		 * +"'%"+t_name+"%'and S_DEP LIKE"+"'%"+t_class+"%'"
		 * +"and S_SEX LIKE"+"'%"+t_sex+"%'";
		 * 
		 * sqlBean sq=new sqlBean(); ResultSet rss=sq.executeQuery(sql);
		 * req.setAttribute("rs",rss); //���ò��� }
		 * 
		 * getServletContext().getRequestDispatcher("/stu_file.jsp").forward(req,
		 * res);
		 * 
		 * }
		 */

	}

	/// �½�ѧ����������
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
		// �����½�ѧ���洢��request�������У�Ȼ��ת��getStudent.jspҳ��
	//	 sendBean(req, res, stu, "/stu_file.jsp");
		getServletContext().getRequestDispatcher("/stu_file.jsp").forward(req,res);
	//	res.sendRedirect("/stu_ok.jsp?para=1"); 
	}

	// ����ѧ����Ϣ����
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

			stu.updateStudent(); // ����ѧ����Ϣ
		}
		// �����޸ĺ��ѧ����Ϣ�洢��request�������У�Ȼ��ת��getStudent.jspҳ��
		// sendBean(req, res, stu, "/getStudent.jsp");

		//res.getWriter().print("<script>alert('You are uploading the illegal file type');</script>");
		getServletContext().getRequestDispatcher("/stu_file.jsp").forward(req,
				res);
	}

	// ɾ��ѧ������
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

	// ����ѯ��Ľ�����洢��session��
	public void sendResultSet(HttpServletRequest req, HttpServletResponse res,
			java.sql.ResultSet rs, String target) throws ServletException,
			IOException {
		req.setAttribute("rs", rs);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(req, res);
	}

	// ����ѧ����Ϣ��JavaBean��request��������
	public void sendBean(HttpServletRequest req, HttpServletResponse res,
			students stu, String target) throws ServletException, IOException {
		req.setAttribute("stu", stu);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(req, res);
	}

	// ��������
	public void doError(HttpServletRequest req, HttpServletResponse res,
			String str) throws ServletException, IOException {

		req.setAttribute("problem", str);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/errorpage.jsp");
		rd.forward(req, res);
	}

	// �ж�ѧ���Ƿ�ע���
	public boolean hasLogin(HttpServletRequest req, HttpServletResponse res,
			String id) throws ServletException, IOException {
		boolean f = true;
		String message = "�Բ��𣬸�ѧ�����Ѿ���ע�����!";
		students stu = new students();
		f = stu.hasLogin(id);
		if (f == false) {
			doError(req, res, message);
		}
		return f;
	}

	// �ж�ѧ��ע���Ƿ�ɹ�
	public boolean isTrue(HttpServletRequest req, HttpServletResponse res,
			String id, String name, String password) throws ServletException,
			IOException {
		boolean f = true;
		String message = "";
		if (id == null || id.equals("")) {
			f = false;
			message = "����ѧ���Ų���Ϊ�գ�";
			doError(req, res, message);
			return f;
		}

		if (name == null || name.equals("")) {
			f = false;
			message = "ѧ����������Ϊ�գ���������д��";
			doError(req, res, message);
			return f;
		}

		if (password == null || password.equals("")) {
			f = false;
			message = "���벻��Ϊ�գ���������д��";
			doError(req, res, message);
			return f;
		}

		return f;

	}

	// ��Ӧpost����
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		doGet(req, res);

	}

}